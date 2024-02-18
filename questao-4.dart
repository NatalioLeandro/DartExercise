import 'dart:io';

/*4. Faça um programa que cadastre 8 alunos. Para cada aluno devem ser cadastrados:
nome, nota 1 e nota 2. Primeiro, liste todos os alunos cadastrados ordenando-os pela média
ponderada das notas, tendo a primeira nota peso 2 e a segunda peso 3. Em seguida,
ordene os alunos, de forma crescente, pela nota 1, e liste-os. Finalmente, considerando que
para ser aprovado o aluno deve ter no mínimo média 7, liste, em ordem alfabética, os
alunos reprovados.*/

void main() {

  Class class1 = Class('Turma 1', []);
  Student student;
  String name;
  double grade1;
  double grade2;

  for (var i = 0; i < 3; i++) {
    print("Digite o nome do ${i + 1}° aluno:");
    name = stdin.readLineSync()!;
    print("Digite a nota 1 do ${i + 1}° aluno:");
    grade1 = double.parse(stdin.readLineSync()!);
    print("Digite a nota 2 do ${i + 1}° aluno:");
    grade2 = double.parse(stdin.readLineSync()!);

    student = Student(name, grade1, grade2);
    class1.registerStudent(student);
  }

  print('Listagem de alunos ordenados pela média ponderada das notas:');
  class1.getByAverage();
  print('Listagem de alunos ordenados pela nota 1:');
  class1.getByGrade1();
  print('Listagem de alunos reprovados:');
  class1.reprove();

}

class Student {
  String name;
  double grade1;
  double grade2;

  Student(this.name, this.grade1, this.grade2);

  void describe() {
    print('Name: $name, Grade 1: $grade1, Grade 2: $grade2');
  }
}

class Class {
  String name;
  List<Student> students;

  Class(this.name, this.students);

  void registerStudent(Student student) {
    students.add(student);
  }

  void list() {
    students.forEach((student) => student.describe());
  }

  void getByAverage() {
    students.sort((a, b) {
      double averageA = (a.grade1 * 2 + a.grade2 * 3) / 5;
      double averageB = (b.grade1 * 2 + b.grade2 * 3) / 5;
      return averageB.compareTo(averageA);
    });
    students.forEach((student) => student.describe());
  }

  void getByGrade1() {
    students.sort((a, b) => a.grade1.compareTo(b.grade1));
    students.forEach((student) => student.describe());
  }

  void reprove() {
    students.sort((a, b) => a.name.compareTo(b.name));
    students.forEach((student) {
      double average = (student.grade1 * 2 + student.grade2 * 3) / 5;
      if (average < 7) {
        student.describe();
      }
    });
  }
}



  