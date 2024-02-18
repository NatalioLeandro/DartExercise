import 'dart:io';

/* 4. Faça um programa que cadastre 15 números, não permitindo números repetidos.
Ordene-os em seguida, verifique se um número digitado pelo usuário está no vetor. Caso
encontre, verifique se está em uma posição par ou ímpar do vetor.
a) usando busca sequencial;
b) usando busca binária;
*/

void main() {
  var numbers = Numbers();

  for (var i = 0; i < 15; i++) {
    print("Digite o número ${i + 1}:");
    numbers.registerNumber(int.parse(stdin.readLineSync()!));
  }

  print("========================== Executando ==========================");
  print("");
  print("=== Listando números ===");
  print("");
  numbers.listNumbers();
  print("");
  print("Digite um número para buscar:");
  var number = int.parse(stdin.readLineSync()!);
  print("");
  print("=== Busca sequencial ===");
  print("");
  numbers.sequentialSearch(number);
  print("");
  print("=== Busca binária ===");
  print("");
  numbers.binarySearch(number);
  print("");
  print("========================== Finalizado ==========================");
}

class Numbers {
  List<int> numbers = [];

  void registerNumber(int number) {
    if (!numbers.contains(number)) {
      numbers.add(number);
    }
  }

  void listNumbers() {
    numbers.sort();
    print(numbers);
  }

  void sequentialSearch(int number) {
    var index = numbers.indexOf(number);
    if (index != -1) {
      print('O número $number está na posição $index');
      if (index % 2 == 0) {
        print('O número $number está na posição par');
      } else {
        print('O número $number está na posição ímpar');
      }
    } else {
      print('O número $number não está na lista');
    }
  }

  void binarySearch(int number) {
    numbers.sort();
    var start = 0;
    var end = numbers.length - 1;
    var middle = 0;
    var index = -1;

    while (start <= end) {
      middle = ((start + end) / 2).floor();
      if (numbers[middle] == number) {
        index = middle;
        break;
      } else if (numbers[middle] < number) {
        start = middle + 1;
      } else {
        end = middle - 1;
      }
    }

    if (index != -1) {
      print('O número $number está na posição $index');
      if (index % 2 == 0) {
        print('O número $number está na posição par');
      } else {
        print('O número $number está na posição ímpar');
      }
    } else {
      print('O número $number não está na lista');
    }
  }

}