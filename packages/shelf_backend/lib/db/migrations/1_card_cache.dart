
import 'package:postgres/postgres.dart';

Future<void> applyMigration(Connection connection) async {
  await connection.execute('''
    CREATE TABLE IF NOT EXISTS card_cache(
      card_id TEXT NOT NULL PRIMARY KEY,
      card_data JSONB NOT NULL
    );
  ''');

  await connection.execute('''
    CREATE INDEX IF NOT EXISTS card_cache_card_id_index ON card_cache(card_id);
  ''');
}