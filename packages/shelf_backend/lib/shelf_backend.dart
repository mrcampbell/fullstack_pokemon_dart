import 'package:logger/logger.dart';
import 'package:shelf_backend/db/collection.dart';
import 'package:shelf_backend/db/connect.dart';
import 'package:shelf_backend/db/migrations/migrate.dart';
import 'package:shelf_backend/http/context.dart';
import 'package:shelf_backend/http/routes/hello.dart' as hello_router;
import 'package:shelf_backend/http/routes/card.dart' as card_router;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

Future<void> serve() async {
  var app = Router();
  var conn = await connectToPostgres();
  var logger = Logger(printer: PrettyPrinter(), filter: null, output: null, level: Level.debug);
  logger.i("Connected to Postgres");

  final ctx = Context(conn, logger);
  migrate(ctx);

  await getCollection(ctx, "1");


  hello_router.addRoutes(app, ctx);
  card_router.addRoutes(app, ctx);

  var server = await io.serve(app.call, 'localhost', 8080);
  logger.d('Serving at http://${server.address.host}:${server.port}');
}

