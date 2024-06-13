class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}class MockSpaceship implements Spacecraft {
  @override
  String name;
  
  @override
  DateTime? launchDate;

  MockSpaceship(this.name, this.launchDate);
  
  MockSpaceship.unlaunched(String name): this(name, null);
 
  @override
  int? get launchYear => launchDate?.year;

  @override
  void describe() {
    print('MockSpaceship: $name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate!).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void main(){
  var testClass1 = MockSpaceship('cly', DateTime(2003, 1, 11));
  testClass1.describe();

  var testClass2 = MockSpaceship.unlaunched('cly');
  testClass2.describe();
}