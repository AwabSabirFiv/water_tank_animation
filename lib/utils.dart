List mlDisplay= <Map<String, dynamic>>[
  {
    "name": "100 mL",
     "amount": 100,
  },
  {
    "name": "200 mL",
    "amount": 200,
  },
  {
    "name": "500 mL",
    "amount": 500,
  },
  {
    "name": "1000 mL",
    "amount": 1000,
  },
];

List ozDisplay= [
  {
    "name": "8 Oz",
    "amount": 8.0,
  },
  {
    "name": "16 Oz",
    "amount": 16.0,
  },
  {
    "name": "24 Oz",
    "amount": 24.0,
  },
  {
    "name": "32 Oz",
    "amount": 32.0,
  },
];

extension RulerConvert on double {
  double get mlToOz => this / 29.5735;
  double get ozToMl => this * 29.5735;
}


