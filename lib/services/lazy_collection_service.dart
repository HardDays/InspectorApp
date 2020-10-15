
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/persistance_service.dart';

abstract class LazyCollectionService<T> {
  final _maxCount = 500;
  final _persistanceService = ObjectDbPersistanceService();

  final Future<List<T>> Function(int, int) _loader;
  final ObjectDbCollectionService _dbService;

  bool _loaded = false;

  LazyCollectionService(this._dbService, this._loader);

  Future init() async {
    await _dbService.init();
  }

  bool isLoaded() {

  }

  Future preload(Function notifier(int)) async {
    try {
      _dbService.clear();

      int count = 0;
      int attempts = 10000;
      while (true) {
        final res = await _loader(count, count + _maxCount);
        await _dbService.append(res);

        count += res.length;
        attempts--;
        notifier(count);
        if (res.isEmpty || attempts < 0) {
          break;
        }
      } 
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<T>> all() async {
    if (!_loaded) {
      try {
        final res = await _loader(0, _maxCount);
        await _dbService.save(res);
        _loaded = true;
        return res;
      } catch (ex) {
        return _dbService.all();
      }
    } else {
      return _dbService.all();
    }
  }
}