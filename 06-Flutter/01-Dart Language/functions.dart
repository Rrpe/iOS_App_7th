// 함수 선언

int add(int a, int b) {
  return a + b;
}

// 옵셔널 파라미터
void greet(String name, [String? title]) {
  if (title != null) {
    print('Hello, $title, $name');
  } else {
    print('Hello, $name');
  }
}

// 이름이 있는 파라미터
void printPerson({required String name, int age = 0, String? occupation}) {
  print('Name: $name, Age: $age');
  if (occupation != null) {
    print('Occupation: $occupation');
  }
}

void main() {
  print('Add: ${add(10, 20)}');
  greet('John Doe');
  greet('Hello', 'Mr');

  printPerson(name: 'John Doe', age: 30);
  printPerson(name: 'Jane Doe', occupation: "Software Engineer");
}
