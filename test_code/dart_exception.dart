import 'dart:io';

Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}

void main() async {
  var flybyObjects = ['object4', 'object5', 'object6'];
  await describeFlybyObjects(flybyObjects);
}