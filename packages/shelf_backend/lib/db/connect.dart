import 'package:postgres/postgres.dart';

Future<Connection> connectToPostgres() async {
   final conn = await Connection.open(
    Endpoint(
      host: 'localhost',
      database: 'pokemon_tcg',
      username: 'postgres',
      password: 'postgres',
      port: 5432,
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );
  return conn;
}
