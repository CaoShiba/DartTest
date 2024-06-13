mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}
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
}

class PilotedCraft extends Spacecraft with Piloted {
  // ···
  PilotedCraft(super.name, DateTime super.launchDate);
}

void main(){
  var test_class1 =PilotedCraft('cly',DateTime(2003,1,11));
  test_class1.describe();
  test_class1.describeCrew();
}