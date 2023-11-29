import 'dart:io';

void main(List<String> args) {
  Converter converter = Converter();
  converter.vyborDeistviya();
}

class Converter {
  double dollar = 90;
  double euro = 100;
  double rub = 1.1;
  double tenge = 0.19;
  String? userAnswer;

  void vyborDeistviya() {
    print("Курсы валют");
    print("\$Доллар - $dollar\n€Евро - $euro\n₽Рубль - $rub\n₸Тенге - $tenge");
    print("Выберите действие");
    print("1) Хотите обменять другую валюту на сом?");
    print("2) Хотите обменять сом на другую валюту?");

    userAnswer = stdin.readLineSync();
    if (userAnswer == "1") {
      vybor1(
          dollar: dollar - 2,
          euro: euro - 3,
          rub: rub - 0.02,
          tenge: tenge - 0.01);
    } else if (userAnswer == "2") {
      vybor2(
        dollar: dollar,
        euro: euro,
        rub: rub,
        tenge: tenge,
      );
    } else {
      print("Неправильный ввод. Введите 1 или 2");
      vyborDeistviya();
    }
  }
}

void vybor1({
  required double dollar,
  required double euro,
  required double rub,
  required double tenge,
}) {
  String userAnswer;

  print("Выберите валюту:");
  print("1) USD\n2) EUR\n3) RUB\n4) KZT");

  userAnswer = stdin.readLineSync()!;
  userAnswer = userAnswer.toUpperCase();

  if (userAnswer != "") {
    if (userAnswer == "USD" ||
        userAnswer == "EUR" ||
        userAnswer == "RUB" ||
        userAnswer == "KZT") {
      print("Сколько $userAnswer хотите обменять на сом?");
      double kurs;
      switch (userAnswer) {
        case "USD":
          kurs = dollar;
          break;
        case "EUR":
          kurs = euro;
          break;
        case "RUB":
          kurs = rub;
          break;
        case "KZT":
          kurs = tenge;
          break;

        default:
          kurs = -1;
      }

      double? userAnswer2 = double.tryParse(stdin.readLineSync()!);
      print(
          "Обмен $userAnswer2 $userAnswer на ${(userAnswer2 ?? 0) * kurs} сом");
    } else {
      print("Введите название валюты правильно");
      vybor2(
        dollar: dollar,
        euro: euro,
        rub: rub,
        tenge: tenge,
      );
    }
  } else {
    print("Вы ничего не ввели");
    vybor2(
      dollar: dollar,
      euro: euro,
      rub: rub,
      tenge: tenge,
    );
  }
}

void vybor2({
  required double dollar,
  required double euro,
  required double rub,
  required double tenge,
}) {
  String userAnswer;

  print("Выберите валюту:");
  print("1) USD\n2) EUR\n3) RUB\n4) KZT");

  userAnswer = stdin.readLineSync()!;
  userAnswer = userAnswer.toUpperCase();

  if (userAnswer != "") {
    if (userAnswer == "USD" ||
        userAnswer == "EUR" ||
        userAnswer == "RUB" ||
        userAnswer == "KZT") {
      print("Сколько $userAnswer хотите купить?");
      double kurs;
      switch (userAnswer) {
        case "USD":
          kurs = dollar;
          break;
        case "EUR":
          kurs = euro;
          break;
        case "RUB":
          kurs = rub;
          break;
        case "KZT":
          kurs = tenge;
          break;

        default:
          kurs = -1;
      }

      double? userAnswer2 = double.tryParse(stdin.readLineSync()!);
      print(
          "Обмен ${(userAnswer2 ?? 0) * kurs} сомов на $userAnswer2 $userAnswer");
    } else {
      print("Введите название валюты правильно");
      vybor2(dollar: dollar, euro: euro, rub: rub, tenge: tenge);
    }
  } else {
    print("Вы ничего не ввели");
    vybor2(dollar: dollar, euro: euro, rub: rub, tenge: tenge);
  }
}
