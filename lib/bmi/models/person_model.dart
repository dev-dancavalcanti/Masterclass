class Person {
  final double peso;
  final double altura;

  Person({
    required this.peso,
    required this.altura,
  });

  factory Person.empty() => Person(peso: 0, altura: 0);

  Person copyWith({
    double? peso,
    double? altura,
  }) {
    return Person(
      peso: peso ?? this.peso,
      altura: altura ?? this.altura,
    );
  }

  double getBMI() => peso / (altura * altura);
}
