void main() {
  // if-else
  int age = 20;
  if (age >= 19) {
    print('Adult');
  } else {
    print('Kids');
  }

  // for loop
  for (int i = 0; i < 5; i++) {
    print('Now i = $i');
  }

  // while loop
  int count = 0;
  while (count < 5) {
    print('Now count : $count');
  }

  // switch-case
  String grade = 'A';
  switch (grade) {
    case 'A':
      print('AAA');
      break;
    case 'B':
      print("BBB");
      break;
    case 'C':
      print("CCC");
      break;
    default:
      print('Another');
  }
}
