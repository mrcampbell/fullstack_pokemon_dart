import 'package:http/http.dart' as http;

void getCard(String id) async {
  var response = await http.get(Uri.parse('http://localhost:3000/v2/en/cards/swsh3-136'));
  print(response.body);
}