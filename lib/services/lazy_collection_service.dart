
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';

abstract class LazyCollectionService<T> {
  final Function _loader;
  final ObjectDbCollectionService _dbService;

  bool _loaded = false;

  LazyCollectionService(this._dbService, this._loader);

  Future init() async {
    await _dbService.init();
  }

  Future<List<T>> all() async {
    if (!_loaded) {
      try {
        final res = await _loader();
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