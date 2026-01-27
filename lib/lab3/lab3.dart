import 'dart:async';
import 'dart:convert';

void main() async {
  print('===== EXERCISE 1: Product Model & Repository =====');
  await exercise1();

  print('\n===== EXERCISE 2: User Repository with JSON =====');
  await exercise2();

  print('\n===== EXERCISE 3: Async + Microtask Debugging =====');
  exercise3();

  // Delay to ensure async logs finish before next exercise
  await Future.delayed(Duration(milliseconds: 200));

  print('\n===== EXERCISE 4: Stream Transformation =====');
  await exercise4();

  print('\n===== EXERCISE 5: Factory Constructors & Cache =====');
  exercise5();
}

// EXERCISE 1 – Product Model & Repository


class Product {
  final int id;
  final String name;
  final double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() => 'Product(id: $id, name: $name, price: $price)';
}

class ProductRepository {
  final List<Product> _products = [
    Product(1, 'Laptop', 1500),
    Product(2, 'Phone', 800),
  ];

  final StreamController<Product> _controller =
  StreamController<Product>.broadcast();

  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(milliseconds: 300));
    return _products;
  }

  Stream<Product> liveAdded() => _controller.stream;

  void addProduct(Product product) {
    _products.add(product);
    _controller.add(product);
  }
}

Future<void> exercise1() async {
  final repo = ProductRepository();

  // Listen to stream
  repo.liveAdded().listen((product) {
    print('Live added product: $product');
  });

  // Get all products
  final products = await repo.getAll();
  print('All products:');
  products.forEach(print);

  // Add new product
  repo.addProduct(Product(3, 'Tablet', 600));
}

//////////////////////////////////////////////////
// EXERCISE 2 – User Repository with JSON
//////////////////////////////////////////////////

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  String toString() => 'User(name: $name, email: $email)';
}

Future<List<User>> fetchUsers() async {
  await Future.delayed(Duration(milliseconds: 300));

  String fakeJson = '''
  [
    {"name": "Alice", "email": "alice@example.com"},
    {"name": "Bob", "email": "bob@example.com"}
  ]
  ''';

  final List decoded = jsonDecode(fakeJson);
  return decoded.map((e) => User.fromJson(e)).toList();
}

Future<void> exercise2() async {
  final users = await fetchUsers();
  users.forEach(print);
}


// EXERCISE 3 – Async + Microtask Debugging


void exercise3() {
  print('Start');

  scheduleMicrotask(() {
    print('Microtask 1');
  });

  Future(() {
    print('Future 1');
  });

  scheduleMicrotask(() {
    print('Microtask 2');
  });

  print('End');

}

// EXERCISE 4 – Stream Transformation


Future<void> exercise4() async {
  final stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  final transformedStream = stream
      .map((number) => number * number) // square
      .where((number) => number % 2 == 0); // even only

  await for (var value in transformedStream) {
    print('Stream value: $value');
  }
}


// EXERCISE 5 – Factory Constructors & Cache


class Settings {
  static final Settings _instance = Settings._internal();

  Settings._internal();

  factory Settings() {
    return _instance;
  }
}

void exercise5() {
  final a = Settings();
  final b = Settings();

  print('Are both instances identical? ${identical(a, b)}');
}
