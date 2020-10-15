
import 'package:inspector/model/area.dart';
import 'package:inspector/model/dict_metadata.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/services/api/dictionary_service.dart';
import 'package:inspector/services/sqlite/sqlite_collection_service.dart';
import 'package:synchronized/synchronized.dart';

import 'package:inspector/services/objectdb/objectdb_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/persistance_service.dart';

class DictionaryService {
  final _maxCount = 500;
  final lock = Lock();

  static const _areas = 'areas';
  static const _streets = 'streets';
  static const _districts = 'districts';
  static const _addresses = 'addresses';

  final Map<String, SqliteCollectionService> _dbServices = {
    _areas: SqliteCollectionService(_areas, (json)=> Area.fromJson(json)),
    _streets: SqliteCollectionService(_streets, (json)=> Street.fromJson(json)),
    _districts: SqliteCollectionService(_districts, (json)=> District.fromJson(json)),
    _addresses: SqliteCollectionService(_addresses, (json)=> Address.fromJson(json, stringified: true)),
  };

  final Map<String, Future<List> Function(int, int)> _loaders = {
    _areas: ApiDictionaryService().getAreas,
    _streets: ApiDictionaryService().getStreets,
    _districts: ApiDictionaryService().getDistricts,
    _addresses: ApiDictionaryService().getAddresses,
  };

  final _persistanceService = ObjectDbPersistanceService();

  bool canceled = false;

  Future<bool> isLoaded() async {
    final metadata = await _persistanceService.getDictMetadata();
    
    for (final key in _loaders.keys) {
      if (!metadata.loaded.containsKey(key)) {
        return false;
      }
    }

    return metadata.loadetAt != null;
  }

  Future preload(Function(String, int) notifier) async {
    await lock.synchronized(() async {
      try {
        final metadata = await _persistanceService.getDictMetadata();
        for (final key in _loaders.keys) {
          if (!metadata.loaded.containsKey(key)) {
            final service = _dbServices[key];
            await service.init();
            await service.clear();

            int count = 0;
            int attempts = 10000;
            while (true) {
              final res = await _loaders[key](count, count + _maxCount);
              print('$key $count ... ');
              await service.append(res);

              count += res.length;
              attempts--;

              notifier(key, count);

              if (res.isEmpty || attempts < 0) {
                break;
              }
              if (canceled) {
                canceled = false;
                return;
              }
            } 
            
            metadata.loaded[key] = true;
            await _persistanceService.saveDictMetadata(metadata);
          }
        }

        await _persistanceService.saveDictMetadata(
          DictMetadata(
            loaded: metadata.loaded, 
            loadetAt: DateTime.now(),
          ),
        );
      } catch (ex) {
        print(ex);
      }
    });
  }

  Future<List<Address>> getAddresses() async {
    return await _dbServices[_addresses].all();
  }

   Future<List<Area>> getAreas() async {
    return await _dbServices[_areas].all();
  }

  // Future<List<T>> all() async {
  //   if (!_loaded) {
  //     try {
  //       final res = await _loader(0, _maxCount);
  //       await _dbService.save(res);
  //       _loaded = true;
  //       return res;
  //     } catch (ex) {
  //       return _dbService.all();
  //     }
  //   } else {
  //     return _dbService.all();
  //   }
  // }
}