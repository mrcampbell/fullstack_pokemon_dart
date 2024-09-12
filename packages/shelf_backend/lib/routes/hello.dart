
import 'package:postgres/postgres.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';


void addRoutes(Router app, Connection connection) {
  app.get('/hello', (Request request) {
    return Response.ok('hello-world');
  });
}
