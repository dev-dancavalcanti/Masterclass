Map<String, dynamic> mapAtividades() {
  return {
    "mockup": [
      {
        "titleApp": "Mockups",
        "title": "Tinder",
        "number": 1,
        "onTap": "/tinder"
      },
      {"title": "Under Control", "number": 2, "onTap": "/underControl"},
    ],
    "animacao": [
      {
        "titleApp": "Animacao",
        "title": "Button Animation Explicit ",
        "number": 1,
        "onTap": "/buttonExp"
      },
      {"title": "Tile Animation Explicit", "number": 2, "onTap": "/tileExp"},
      {
        "title": "Button Animation Implicit",
        "number": 3,
        "onTap": "/buttonImp"
      },
      {"title": "Tile Animation Implicit", "number": 4, "onTap": "/tileImp"},
    ],
    "cpf": [
      {
        "titleApp": "CPF",
        "title": "CPF Validator",
        "number": 1,
        "onTap": "/cpfValidator"
      },
    ]
  };
}
