void main() {
  // 조건이 충족 되었는지 확인하기
  bool isFootball = true;

  // if-else statement: 조건이 참이면 if 블록 실행, 거짓이면 else 블록 실행
  if (isFootball) {
    print('Go football');
  } else {
    print('Go Sports!');
  }

  bool isTrue = true;

  // while loop: 조건이 참일 때 실행
  while (isTrue) {
    print('Hello');
    isTrue = false;
  }

  // do-while loop: 조건이 참이든 거짓이든 한 번은 실행
  do {
    print('Hello 2');
  } while (isTrue);

  // switch statement: 다양한 조건을 비교할 때 사용
  int myValue = 2;

  switch (myValue) {
    case 1:
      print('Monday');
    case 2:
      print('Tuesday');
    default:
      print('Error: Value not defined?');
  }

  // 슬래시, 별, 쉼표, 세미콜론 등이 상수 변수인 경우...
  const slash = '/';
  const star = '*';
  const plus = '+';
  const minus = '-';

  String charCode = '1';

  switch (charCode) {
    case slash || star || plus || minus:
      print('Mathematical operator');
    default:
      print('Unknown');
  }

  int numValue = 5;

  switch (numValue) {
    // 0부터 9까지의 숫자인 경우, 비교 연산자와 논리 연산자를 사용할 수 있음
    case >= 0 && <= 9:
      print('Single digit number');
    default:
      print('Unknown');
  }
}
