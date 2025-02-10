void main() {
  getCurrentDateTime();

  var hourDifference = -7;
  getCurrentDateTimeWithDifference(hourDifference);
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
