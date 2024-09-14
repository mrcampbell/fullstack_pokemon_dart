
import 'package:postgres/postgres.dart';
import 'package:shelf_backend/http/context.dart';
import 'package:shelf_backend/src/collection.dart';

Future<void> getCollection(Context ctx, String id) async {
  final results = await ctx.db.execute(Sql.named('SELECT * FROM collections WHERE id = @id'), parameters: {'id': id});
  if (results.isEmpty) {
    throw Exception('Collection not found');
  }

  ctx.logger.d(results.first.toColumnMap());
}

Future<void> createCollection(Context ctx, Collection collection) async {
  await ctx.db.execute(
    'INSERT INTO collections (id, name, card_ids) VALUES (@id, @name, @card_ids)', 
    parameters: {'id': collection.id, 'name': collection.name, 'card_ids': collection.cardIDs});
}