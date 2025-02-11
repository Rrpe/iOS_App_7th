import 'dart:convert';

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

  // Map advanced
  Map<String, int> scores = {
    'Alice': 90,
    'Bob': 80,
    'Charlie': 95,
  };

  print(scores.containsKey('Alice'));

  print(scores.containsValue(80));

  scores.remove('Bob');
  print(scores);

  Map<String, int> updatedScores =
      scores.map((key, value) => MapEntry(key, value + 5));
  print(updatedScores);

  Map<String, dynamic> data = {
    'name': 'John',
    'age': 30,
    'city': 'Seoul',
  };

  // 키 존재 여부 확인
  if (data.containsKey('name')) {
    print('Name: ${data['name']}');
  }

  // 값 존재 여부 확인
  if (data.containsValue(30)) {
    print('Age: ${data['age']}');
  }

  Map<String, dynamic> user = {
    'id': 1,
    'info': {
      'name': 'Alice',
      'contacts': [
        {'type': 'email', 'value': 'alice@email.com'},
        {'type': 'phone', 'value': '123-456-7890'}
      ]
    }
  };

  // Map을 JSON 문자열로 변환
  String userJson = jsonEncode(user);
  print(userJson);

  // JSON 문자열을 Map으로 변환
  Map<String, dynamic> parsed = jsonDecode(userJson);
  print(parsed['info']['contacts'][0]['value']); // alice@email.com 출력
}
