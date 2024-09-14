import 'package:shelf_backend/db/migrations/1_card_cache.dart' as migration_1;
import 'package:shelf_backend/db/migrations/2_collections.dart' as migration_2;
import 'package:shelf_backend/http/context.dart';

Future<void> migrate(Context ctx) async {
  try {
  await migration_1.applyMigration(ctx.db);
  await migration_2.applyMigration(ctx.db);

  } catch (e) {
    print('Migration failed: $e');
  }
}