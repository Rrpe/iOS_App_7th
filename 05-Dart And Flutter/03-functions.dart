void main() {
  getCurrentDateTime();

  var hourDifference = -7;
  getCurrentDateTimeWithDifference(hourDifference);

  printGreetingNamed();
  printGreetingNamed(personName: "Rich");
  printGreetingNamed(personName: "Mary", clientId: 001);
}

void printGreetingNamed({String personName = 'Stranger', int clientId = 999}) {
  if (personName.contains('Stranger')) {
    print('Employee: $clientId, Stranger danger!');
  } else {
    print('Employee: $clientId, Hello $personName');
  }
}

void getCurrentDateTime() {
  var currentTime = DateTime.now();
  print('Current time: $currentTime');
}

void getCurrentDateTimeWithDifference(int hourDifference) {
  var timeNow = DateTime.now();
  var timeDifference = timeNow.add(Duration(hours: hourDifference));

  print('Current time: $timeNow');
  print('Time with Difference: $timeDifference');
}
