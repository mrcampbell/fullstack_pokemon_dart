import 'package:cards_client/cards_client.dart';
import 'package:cards_client/src/card.dart';
import 'package:cards_client/src/card_image.dart';

void main() {
  getCard('swsh3-136').then((Card card) async {
    saveImage(card.image!, "high", "png", card.id!);
  });
  // searchCard('pika');
}
