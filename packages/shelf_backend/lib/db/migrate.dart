import 'package:postgres/postgres.dart';
import 'package:shelf_backend/db/migrations/1_card_cache.dart' as migration_1;

Future<void> migrate(Connection connection) async {
  try {

  await migration_1.applyMigration(connection);
  } catch (e) {
    print('Migration failed: $e');
  }
}