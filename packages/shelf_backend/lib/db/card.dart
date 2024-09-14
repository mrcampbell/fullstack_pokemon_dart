import 'package:postgres/messages.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf_backend/cards_client/src/card.dart';
import 'package:shelf_backend/http/context.dart';

Future<Card> readCardFromDB(Context ctx, String id) async {
  final result = await ctx.db.execute(
      r'SELECT card_data FROM card_cache WHERE card_id = $1',
      parameters: [id]);
  if (result.isEmpty) {
    throw NoDataMessage();
  }
  final Map<String, dynamic> cardData = result[0][0] as Map<String, dynamic>;
  final Card card = Card.fromJson(cardData);
  return card;
}

Future<void> cacheCard(Connection connection, String id, Map<String, dynamic> payload) async {
  await connection.execute(
      r'INSERT INTO card_cache (card_id, card_data) VALUES ($1, $2)',
      parameters: [id, payload]);
}