import 'dart:io';

void main() async {
  final dir = Directory('lib');
  final files = await dir.list(recursive: true).toList();
  for (var file in files) {
    if (file is File && file.path.endsWith('.dart')) {
      String content = await file.readAsString();
      if (content.contains(r"\'")) {
        content = content.replaceAll(r"\'", "'");
        await file.writeAsString(content);
        print("Fixed ${file.path}");
      }
    }
  }
}
