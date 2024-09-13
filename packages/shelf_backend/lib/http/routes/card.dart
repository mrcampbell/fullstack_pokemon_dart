import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:postgres/messages.dart';
import 'package:shelf_backend/cards_client/src/card.dart';
import 'package:shelf_backend/cards_client/src/card_image.dart';
import 'package:shelf_backend/cards_client/src/cards_client_base.dart';
import 'package:shelf_backend/db/card.dart';
import 'package:shelf_backend/http/context.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

void addRoutes(Router router, Context ctx) {
  router.get('/card/<id>/data', (Request request, String id)  async {
    final payload = await getCachedCard(ctx, id);
    ctx.logger.d('Returning card data $payload');
    // todo: 404 if not found
    return Response.ok(payload!.toString(), headers: {'Content-Type': 'application/json'});
  });

  router.get('/card/<id>/image', (Request request, String id) async {
    final card = await getCachedCard(ctx, id);
    ctx.logger.i(card!.name);
    final image = await getCachedCardImage(ctx, card!);
    return Response.ok(image, headers: {'Content-Type': 'image/png'});
  });
}

Future<Card?> getCachedCard(Context ctx, String id) async {
  try {
    final Card cachedCard = await readCardFromDB(ctx, id);
    print(cachedCard);
    return cachedCard;
  } catch (e) {
    ctx.logger.e(e);
    if (e.runtimeType == NoDataMessage) {
      ctx.logger.d('No cached card found');
      final payload = await getCardJSON(id);
      ctx.logger.d('Fetched card data $payload');
      await cacheCard(ctx.db, id, payload);
      return Card.fromJson(payload);
    }
  }
  return null;
}

Future<Uint8List?> getCachedCardImage(Context ctx, Card card) async {
  try {
    Uint8List image = await loadImage(card.id!);
    return image;
  } on PathNotFoundException {
    ctx.logger.d('No cached card image found');
    await saveImage(card.image!, 'high', card.id!);
    Uint8List image = await loadImage(card.id!);
    return image;
  }
}