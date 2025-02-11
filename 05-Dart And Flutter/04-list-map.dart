void main() {
  List<String> months = [
    'January',
    'February',
    'March',
  ];

  months.add('April');

  months.forEach(print);

  print(months[0]);

  print(months.length);

  List<int> numbers = [1, 2, 3, 4, 5];

  numbers.insert(2, 10);
  print(numbers);
  numbers.remove(4);
  print(numbers);
  numbers.removeAt(2);
  print(numbers);
  // 조건에 따라 필터링
  List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  print(evenNumbers); // 2 출력

  // 각 요소를 제곱하여 새로운 리스트 생성
  List<int> squaredNumbers = numbers.map((number) => number * number).toList();
  print(squaredNumbers); // 1, 4, 9, 25 출력
}
