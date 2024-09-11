import 'dart:convert';

import 'package:cards_client/src/card.dart';
import 'package:http/http.dart' as http;

Future<Card> getCard(String id) async {
  var response = await http.get(Uri.parse('http://localhost:3000/v2/en/cards/$id'));
  var payload = json.decode(response.body);
  var card = Card.fromJson(payload);
  print("fetched card: $card");
  return card;
}