import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/news_model.dart';
import '../services/generic_service.dart';

class BlogApi {
  final GenericService<NewsModel> _service;
  BlogApi(this._service);

  Handler get handler {
    Router router = Router();

    router.get('/blog/news', (Request req) {
      List<NewsModel> news = _service.findAll();
      List<Map<String, dynamic>> newsJson =
          news.map((n) => n.toJson()).toList();
      return Response.ok(jsonEncode(newsJson));
    });

    router.post('/blog/news', (Request req) async {
      var body = await req.readAsString();
      final json = jsonDecode(body);
      _service.save(NewsModel.fromJson(json));
      return Response(201);
    });

    router.put('/blog/news', (Request req) {
      // _service.save('');
      String? id = req.url.queryParameters['id'];
      return Response.ok('News');
    });

    router.delete('/blog/news', (Request req) {
      _service.delete(1);
      String? id = req.url.queryParameters['id'];
      return Response.ok('News');
    });

    return router;
  }
}
