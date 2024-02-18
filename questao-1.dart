import 'dart:io';

/* 1. Faça um programa que cadastre o nome e o salário de 5 funcionários.
Usando três métodos de ordenação diferentes, liste todos os dados dos funcionários*/

void main() {

  var department = Department('RH', []);  

  String name;
  double salary;

  for (var i = 0; i < 5; i++) {
    print("Digite o nome do funcionário ${i + 1}:");
    name = stdin.readLineSync()!;
    print("Digite o salário do funcionário ${i + 1}:");
    salary = double.parse(stdin.readLineSync()!);
    department.registerEmployee(Employee(name, salary));
  }

  print("========================== Executando ==========================");
  print("");
  print("=== Listando por salário ===");
  print("");
  department.listBySalary();
  print("");
  print("=== Listando por salário decrescente ===");
  print("");
  department.listBySalaryDesc();
  print("");
  print("=== Listando por nome ===");
  print("");
  department.listByName();
  print("");
  print("========================== Finalizado ==========================");

}

class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void describe() {
    print('Name: $name, Salary: $salary');
  }
}

class Department {
  String name;
  List<Employee> employees;

  Department(this.name, this.employees);

  void registerEmployee(Employee employee) {
    employees.add(employee);
  }

  // a ) Listar em ordem crescente
  void listBySalary() {
    employees.sort((a, b) => a.salary.compareTo(b.salary));
    for (var employee in employees) {
      employee.describe();
    }
  }

  // b ) Listar em ordem decrescente
  void listBySalaryDesc() {
    employees.sort((a, b) => b.salary.compareTo(a.salary));
    for (var employee in employees) {
      employee.describe();
    }
  }

  // c ) Listar em ordem alfabética
  void listByName() {
    employees.sort((a, b) => a.name.compareTo(b.name));
    for (var employee in employees) {
      employee.describe();
    }
  }
}