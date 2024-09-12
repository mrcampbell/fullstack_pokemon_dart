
import 'package:postgres/postgres.dart';

Future<void> applyMigration(Connection connection) async {
  await connection.execute('''
    CREATE TABLE IF NOT EXISTS card_cache(
      card_id TEXT NOT NULL,
      card_data JSONB NOT NULL
    );
  ''');
}