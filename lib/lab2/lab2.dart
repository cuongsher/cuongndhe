void exercise1() {
  // Declare basic data types
  int age = 20;
  double height = 1.72;
  String name = 'Dart Student';
  bool isLearningDart = true;

  // Print values using string interpolation
  print('Name: $name');
  print('Age: $age');
  print('Height: ${height}m');
  print('Learning Dart: $isLearningDart');
}
void exercise2() {
  // List of integers
  List<int> numbers = [1, 2, 3, 4];
  numbers.add(5);
  numbers.remove(2);

  print('List: $numbers');
  print('First element: ${numbers[0]}');

  // Operators
  int a = 10;
  int b = 5;
  print('a + b = ${a + b}');
  print('a > b && b > 0 = ${a > b && b > 0}');
  print('a == b ? ${a == b ? "Equal" : "Not equal"}');

  // Set (unique values)
  Set<String> fruits = {'Apple', 'Banana', 'Apple'};
  fruits.add('Orange');
  print('Set: $fruits');

  // Map (key-value)
  Map<String, int> scores = {
    'Math': 90,
    'English': 85,
  };
  scores['Science'] = 88;

  print('Map: $scores');
  print('Math score: ${scores['Math']}');
}
void exercise3() {
  int score = 75;

  // if / else
  if (score >= 80) {
    print('Grade: A');
  } else if (score >= 60) {
    print('Grade: B');
  } else {
    print('Grade: C');
  }

  // switch case
  int day = 3;
  switch (day) {
    case 1:
      print('Monday');
      break;
    case 2:
      print('Tuesday');
      break;
    case 3:
      print('Wednesday');
      break;
    default:
      print('Unknown day');
  }

  // Loops
  List<int> nums = [1, 2, 3];

  for (int i = 0; i < nums.length; i++) {
    print('for loop: ${nums[i]}');
  }

  for (var n in nums) {
    print('for-in loop: $n');
  }

  nums.forEach((n) => print('forEach: $n'));

  // Functions
  print('Sum: ${add(3, 4)}');
  print('Multiply: ${multiply(3, 4)}');
}
// Normal function
int add(int a, int b) {
  return a + b;
}
// Arrow function
int multiply(int a, int b) => a * b;


void exercise4() {
  Car car = Car('Toyota');
  Car car2 = Car.named('Honda');

  ElectricCar eCar = ElectricCar('Tesla');

  print(car.describe());
  print(car2.describe());
  print(eCar.describe());
}

// Base class
class Car {
  String brand;

  // Constructor
  Car(this.brand);

  // Named constructor
  Car.named(this.brand);

  String describe() {
    return 'This is a car of brand $brand';
  }
}

// Subclass with override
class ElectricCar extends Car {
  ElectricCar(String brand) : super(brand);

  @override
  String describe() {
    return 'This is an electric car of brand $brand';
  }
}

Future<void> exercise5() async {
  // Async & Future
  print('Loading...');
  String result = await loadData();
  print(result);

  // Null safety
  String? nullableName;
  print(nullableName ?? 'Name is null');

  nullableName = 'Dart';
  print(nullableName!); // force unwrap

  // Stream
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4]);

  numberStream.listen((value) {
    print('Stream value: $value');
  });
}

// Simulate async loading
Future<String> loadData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded successfully';
}
