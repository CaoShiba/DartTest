abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class Spacecraft extends Describable {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate);

  Spacecraft.unlaunched(String name) : this(name, null);

  @override
  void describe() {
    print('Spacecraft: $name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate!).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void main() {
  var testClass1 = Spacecraft('cly', DateTime(2003, 1, 11));
  testClass1.describeWithEmphasis();
  var testClass2 = Spacecraft.unlaunched('cly');
  testClass2.describeWithEmphasis();
}