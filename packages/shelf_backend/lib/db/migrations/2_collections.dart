import 'package:postgres/postgres.dart';

Future<void> applyMigration(Connection connection) async {
  await connection.execute('''
    CREATE TABLE IF NOT EXISTS collections (
      id TEXT NOT NULL PRIMARY KEY,
      name TEXT NOT NULL,
      card_ids TEXT[] NOT NULL DEFAULT '{}'
    );
  ''');
}