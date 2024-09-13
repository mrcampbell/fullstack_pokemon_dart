import 'package:postgres/messages.dart';
import 'package:shelf_backend/cards_client/src/cards_client_base.dart';
import 'package:shelf_backend/db/card.dart';
import 'package:shelf_backend/http/context.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

void addRoutes(Router router, Context ctx) {
  router.get('/card/<id>/data', (Request request, String id)  async {
    final payload = await getCachedCard(ctx, id);
    ctx.logger.d('Returning card data $payload');
    return Response.ok(payload, headers: {'Content-Type': 'application/json'});
  });

  // router.get('/card/<id>/image', (Request request, String id) async {
  //   final card = await (id);
  //   return Response.ok(card.toJson());
  // });
}

Future<String> getCachedCard(Context ctx, String id) async {
  try {
    final cachedCard = await getCachedCardJSON(ctx, id);
    return cachedCard;
  } catch (e) {
    ctx.logger.e(e);
    if (e.runtimeType == NoDataMessage) {
      ctx.logger.d('No cached card found');
      final payload = await getCardJSON(id);
      await cacheCard(ctx.db, id, payload);
      return payload.toString();
    }
  }
  return "n/a";
}