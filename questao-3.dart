import 'dart:io';

/*
3. Faça um programa que cadastre 12 produtos. Para cada produto devem ser cadastrados
os seguintes dados: código, descrição e preço. Use um método de ordenação e em Seguida
calcule e mostre quantas comparações devem ser feitas para encontrar um produto pelo
código:
  a) usando busca sequencial;
  b) usando busca binária.
*/

void main() {
  Store store = Store('Loja', []);
  Product product;
  int code;
  String description;
  double price;

  for (var i = 0; i < 5; i++) {
    print("Digite o código do ${i + 1}° produto:");
    code = int.parse(stdin.readLineSync()!);
    print("Digite a descrição do ${i + 1}° produto:");
    description = stdin.readLineSync()!;
    print("Digite o preço do ${i + 1}° produto:");
    price = double.parse(stdin.readLineSync()!);

    product = Product(code, description, price);
    store.registerProduct(product);
  }

  store.list();

  print('Digite o código do produto para busca sequencial:');
  code = int.parse(stdin.readLineSync()!);
  store.sequentialSearch(code);

  print('Digite o código do produto para busca binária:');
  code = int.parse(stdin.readLineSync()!);
  store.binarySearch(code);

  
}

class Product {
  int code;
  String description;
  double price;

  Product(this.code, this.description, this.price);

  void describe() {
    print('Code: $code, Description: $description, Price: $price');
  }
}

class Store {
  String name;
  List<Product> products;

  Store(this.name, this.products);

  void registerProduct(Product product) {
    products.add(product);
  }

  void list() {
    for (var i = 0; i < products.length; i++) {
      products[i].describe();
    }
  }

  void sequentialSearch(int code) {
    int comparisons = 0;
    for (var i = 0; i < products.length; i++) {
      comparisons++;
      if (products[i].code == code) {
        print('Sequential search comparisons: $comparisons');
        return;
      }
    }
  }

  void binarySearch(int code) {
    int comparisons = 0;
    int start = 0;
    int end = products.length - 1;
    int middle = 0;

    while (start <= end) {
      comparisons++;
      middle = ((start + end) / 2).floor();
      if (products[middle].code == code) {
        print('Binary search comparisons: $comparisons');
        return;
      } else if (products[middle].code < code) {
        start = middle + 1;
      } else {
        end = middle - 1;
      }
    }
  }

}