import 'package:postgres/messages.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf_backend/http/context.dart';

Future<String> getCachedCardJSON(Context ctx, String id) async {
  final result = await ctx.db.execute(
      r'SELECT card_data FROM card_cache WHERE card_id = $1',
      parameters: [id]);
  if (result.isEmpty) {
    throw NoDataMessage();
  }
  final cardData = result[0][0].toString();
  if (cardData.isEmpty) {
    throw NoDataMessage();
  }
  return cardData;
}

Future<void> cacheCard(Connection connection, String id, String payload) async {
  await connection.execute(
      r'INSERT INTO card_cache (card_id, card_data) VALUES ($1, $2)',
      parameters: [id, payload]);
}