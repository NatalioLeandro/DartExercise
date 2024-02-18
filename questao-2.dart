import 'dart:io';

/*2. Faça um programa que cadastre 10 números, ordene-os e em seguida encontre e
mostre:
  a) o menor número e quantas vezes ele aparece no vetor;
  b) o maior número e quantas vezes ele aparece no vetor.
*/

void main() {
  List<int> numbers = [];
  int number;

  for (var i = 0; i < 10; i++) {
    print("Digite o ${i + 1}° número:");
    number = int.parse(stdin.readLineSync()!);
    numbers.add(number);
  }

  numbers.sort(); // Ordena a lista

  print("Menor número: ${numbers.first}");
  print("Quantidade de vezes que o menor número aparece: ${numbers.where((element) => element == numbers.first).length}");
  print("Maior número: ${numbers.last}");
  print("Quantidade de vezes que o maior número aparece: ${numbers.where((element) => element == numbers.last).length}");
}