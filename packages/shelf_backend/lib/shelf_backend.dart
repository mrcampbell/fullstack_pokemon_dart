import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;


void addRoutes(Router app) {
  app.get('/hello', (Request request) {
    return Response.ok('hello-world');
  });

  app.get('/user/<user>', (Request request, String user) {
    return Response.ok('hello $user');
  });
}


Future<void> serve() async {
  var app = Router();
  addRoutes(app);

  var server = await io.serve(app, 'localhost', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}
