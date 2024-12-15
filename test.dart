import 'dart:math';

// Bài 1:
List<List<int>> addMa(List<List<int>> matrix1, List<List<int>> matrix2) {
  if (matrix1.length != matrix2.length ||
      matrix1[0].length != matrix2[0].length) {
    throw Exception("Hai ma trận phải có cùng kích thước.");
  }
  int m = matrix1.length;
  int n = matrix1[0].length;

  List<List<int>> result = List.generate(m, (_) => List.filled(n, 0));
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      result[i][j] = matrix1[i][j] + matrix2[i][j];
    }
  }
  return result;
}

// Bài 2:
int? findDi(List<List<int>> matrix) {
  int n = matrix.length;
  if (matrix[0].length != n) {
    return null;
  }
  if (n % 2 == 0) {
    return null;
  }
  return matrix[n ~/ 2][n ~/ 2];
}

// Bài 3:
enum FoodType { diet, fat, vegan }

enum Origin { Asian, Europe, Africa }

class Food {
  final int id;
  final String name;
  final FoodType type;
  final double price;

  Food(
      {required this.id,
      required this.name,
      required this.type,
      required this.price});
}

class Supplier {
  final int id;
  final String name;
  final Origin origin;
  final List<Food> foods;

  Supplier(
      {required this.id,
      required this.name,
      required this.origin,
      required this.foods});

  List<Food> findDiByOrigin(Origin origin) {
    return foods.where((food) => this.origin == origin).toList();
  }

  double calculateVe() {
    return foods
        .where((food) => food.type == FoodType.vegan)
        .fold(0.0, (sum, food) => sum + food.price);
  }
}

// Bài 4:
String catAndMouse(int a, int b, int c) {
  int distanceA = (a - b).abs();
  int distanceB = (c - b).abs();

  if (distanceA < distanceB) {
    return "CAT_A";
  } else if (distanceA > distanceB) {
    return "CAT_B";
  } else {
    return "The mouse has escaped";
  }
}

void main() {
  // Bài 1:
  List<List<int>> matrix1 = [
    [1, 2],
    [3, 4]
  ];
  List<List<int>> matrix2 = [
    [5, 6],
    [7, 8]
  ];
  print("Tổng hai ma trận: ");
  print(addMa(matrix1, matrix2));

  // Bài 2:
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  print("Giao bởi hai đường chéo: ");
  print(findDi(matrix));

  // Bài 3:
  Food food1 = Food(id: 1, name: "Rice", type: FoodType.vegan, price: 10.0);
  Food food2 = Food(id: 2, name: "Chicken", type: FoodType.fat, price: 20.0);
  Supplier supplier = Supplier(
      id: 1, name: "Supplier1", origin: Origin.Asian, foods: [food1, food2]);
  print("Danh sách đồ ăn theo nguồn gốc: ");
  print(supplier.findDiByOrigin(Origin.Asian));
  print("Tổng giá đồ ăn chay: ");
  print(supplier.calculateVe());

  // Bài 4:
  print("Kết quả mèo và chuột: ");
  print(catAndMouse(-5, 2, 10));
  print(catAndMouse(3, 5, 5));
}
