import 'dart:io';
import 'dart:math';

class Product {
  int? productId;
  String? productName;
  double? productPrice;
  int? productQuantity;
  int? reorderLevel;

  List<Map<String, dynamic>> products = [];

  addProduct() {
    while (true) {
      stdout.write('Enter product ID: ');
      productId = int.parse(stdin.readLineSync()!);
      stdout.write('Enter product name: ');
      productName = stdin.readLineSync()!;
      stdout.write('Enter product price: ');
      productPrice = double.parse(stdin.readLineSync()!);
      stdout.write('Enter product quantity: ');
      productQuantity = int.parse(stdin.readLineSync()!);
      stdout.write('Enter reorder level: ');
      reorderLevel = int.parse(stdin.readLineSync()!);

      products.add({
        'productId': productId,
        'productName': productName,
        'productPrice': productPrice,
        'productQuantity': productQuantity,
        'reorderLevel': reorderLevel,
      });

      print('Product added successfully!');

      stdout.write('Do you want to add another product? (y/n): ');
      String choice = stdin.readLineSync()!;
      if (choice.toLowerCase() != 'y') {
        break;
      }
    }
  }

  removeProduct() {
    stdout.write('Enter product ID to remove: ');
    int idToRemove = int.parse(stdin.readLineSync()!);
    
    if (!products.any((product) => product['productId'] == idToRemove)) {
      print('Product with ID $idToRemove not found.');
      return;
    }
    products.removeWhere((product) => product['productId'] == idToRemove);
    print('Product with ID $idToRemove removed successfully!');
  }
}

void main() {
  Product product = Product();
  product.addProduct();
  product.removeProduct();
}
