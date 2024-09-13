
import 'package:postgres/postgres.dart';
import 'package:shelf_backend/http/context.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';


void addRoutes(Router router, Context context) {
  router.get('/hello', (Request request) {
    return Response.ok('hello-world');
  });
}
