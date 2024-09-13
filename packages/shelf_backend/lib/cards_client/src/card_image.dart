import 'dart:io';
import 'dart:typed_data';

void saveImage(String url, String quality, String cardID) async {
  downloadImage("$url/$quality.png", "/Users/mike/Projects/dart/fullstack_pokemon/deps/card-images/$cardID.png");
}

void downloadImage(String url, String outputPath) async {
  final response = await HttpClient().getUrl(Uri.parse(url));
  final file = File(outputPath);
  final downloadedImage = await response.close();
  await downloadedImage.pipe(file.openWrite());
}

Future<Uint8List> loadImage(String cardID) {
  final file = File("/Users/mike/Projects/dart/fullstack_pokemon/deps/card-images/$cardID.png");
  if (file.existsSync()) {
    print("Image exists");
  } else {
    print("Image does not exist");
  }

  return file.readAsBytes();
}