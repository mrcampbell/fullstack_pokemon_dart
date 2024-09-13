import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shelf_backend/cards_client/src/card.dart';
import 'package:shelf_backend/cards_client/src/card_summary.dart';

Future<Card> getCard(String id) async {
  var response = await http.get(Uri.parse('http://localhost:3000/v2/en/cards/$id'));
  var payload = json.decode(response.body);
  // todo: check for contents
  var card = Card.fromJson(payload);
  print("fetched card: $card");
  return card;
}

Future<Map<String, dynamic>> getCardJSON(String id) async {
  var response = await http.get(Uri.parse('http://localhost:3000/v2/en/cards/$id'));
  return json.decode(response.body);
}

Future<List<CardSummary>> searchCard(String term) async {
  var response = await http.get(Uri.parse('http://localhost:3000/v2/en/cards?name=$term'));
  var payload = json.decode(response.body);
  // todo: check for contents
  var cards = payload.map<CardSummary>((card) => CardSummary.fromJson(card)).toList();
  print("fetched cards: $cards");
  return cards;
}
