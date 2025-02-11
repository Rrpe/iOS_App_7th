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

  // 영화 정보를 담는 Map 생성
  Map<String, dynamic> filmStarWars = {
    'title': 'Star Wars',
    'year': 1977,
  };

  Map<String, dynamic> filmEmpire = {
    'title': 'The Empire Strikes Back',
    'year': 1980,
  };

  Map<String, dynamic> filmJedi = {
    'title': 'The Return of the Jedi',
    'year': 1983,
  };

  List listFilms = [filmStarWars, filmEmpire, filmJedi];

  Map<String, dynamic> currentFilm = listFilms[0];

  var currentFilmTitle = currentFilm['title'];
  print(currentFilmTitle);

  // Map basics
  Map<int, String> mapMonths = {
    1: 'January',
    2: 'February',
    3: 'March',
  };

  mapMonths[4] = 'April';
  mapMonths.forEach((key, value) {
    print('$key: $value');
  });

  // 특정 키에 해당하는 값 출력
  print(mapMonths[1]); // January 출력
}
