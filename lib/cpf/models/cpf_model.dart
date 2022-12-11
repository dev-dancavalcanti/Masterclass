class CpfModel {
  late final String cpf;
  late List<int> number;

  void cleanCpf(String value) {
    var cleanCpf = value.replaceAll('.', '');
    cleanCpf = cleanCpf.replaceAll('-', '');
    var numbers = cleanCpf.split('').map((e) => int.parse(e)).toList();
    number = numbers;
  }

  int generateResultByDigit(int decrematedNumber) {
    var buff = 0;
    var result = 0;

    for (var i = decrematedNumber; i >= 2; i--) {
      final numbers = number[buff];
      result += numbers * i;
      buff++;
    }
    result = result * 10 % 11;

    if (result >= 10) {
      return result = 0;
    }

    return result;
  }

  bool checkDigits(int digit1, int digit2, List<int> value) {
    return digit1 == value[9] && digit2 == value[10];
  }

  Future<bool> isValid(value) async {
    cleanCpf(value);
    var digit1 = generateResultByDigit(10);
    var digit2 = generateResultByDigit(11);

    return checkDigits(digit1, digit2, number);
  }
}
