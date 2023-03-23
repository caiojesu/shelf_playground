import '../models/news_model.dart';
import 'generic_service.dart';
import '../utils/list_extension.dart';

class NewsService implements GenericService<NewsModel> {
  List<NewsModel> _fakeDB = [];
  @override
  bool delete(int id) {
    _fakeDB.removeWhere((element) => element.id == id);
    return true;
  }

  @override
  List<NewsModel> findAll() {
    return _fakeDB;
  }

  @override
  NewsModel findOne(int id) {
    return _fakeDB.firstWhere((element) => element.id == id);
  }

  @override
  bool save(NewsModel value) {
    NewsModel? model = _fakeDB.firstWhereOrNull(
      (element) => element.id == value.id,
    );
    if (model == null) {
      _fakeDB.add(value);
    } else {
      int index = _fakeDB.indexOf(model);
      _fakeDB.insert(index, value);
    }
    return true;
  }
}
