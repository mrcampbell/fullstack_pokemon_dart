import 'package:shelf_backend/db/connect.dart';
import 'package:shelf_backend/db/migrate.dart';
import 'package:shelf_backend/routes/hello.dart' as hello_router;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

Future<void> serve() async {
  var app = Router();
  var conn = await connectToPostgres();

  migrate(conn);
  hello_router.addRoutes(app, conn);
  

  var server = await io.serve(app.call, 'localhost', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}

