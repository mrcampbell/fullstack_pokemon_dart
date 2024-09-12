import 'dart:io';

void saveImage(String url, String quality, String filetype, String cardID) async {
  downloadImage("$url/$quality.$filetype", "/Users/mike/Projects/dart/fullstack_pokemon/deps/card-images/$cardID.$filetype");
}

void downloadImage(String url, String outputPath) async {
  // if (urls.isEmpty) {
  //   throw ArgumentError('The list of URLs cannot be empty.');
  // }
 
  // final directory = Directory(outputDirectory);
  // if (!directory.existsSync()) {
  //   throw ArgumentError('The output directory does not exist.');
  // }
 

  final response = await HttpClient().getUrl(Uri.parse(url));
  final file = File(outputPath);
  final downloadedImage = await response.close();
  await downloadedImage.pipe(file.openWrite());
}