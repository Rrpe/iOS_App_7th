const numDays = 7;

class DaysLeftInWeek {
  int currentDay = 0;

  DaysLeftInWeek() {
    currentDay = DateTime.now().weekday;
  }

  int howManyDaysLeft() {
    return numDays - currentDay;
  }
}

void main() {
  var daysLeft = DaysLeftInWeek();

  print('There are ${daysLeft.howManyDaysLeft()} days left in the week');
}
