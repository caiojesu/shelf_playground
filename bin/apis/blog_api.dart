import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/generic_service.dart';

class BlogApi {
  final GenericService _service;
  BlogApi(this._service);

  Handler get handler {
    Router router = Router();

    router.get('/blog/news', (Request req) {
      _service.findAll();
      return Response.ok('News');
    });

    router.post('/blog/news', (Request req) {
      // _service.save('');
      return Response.ok('News');
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
