import 'dart:ui';

class Animal {
  final int id;
  final String name;
  final Color color;

  const Animal({
    required this.id,
    required this.name,
    required this.color,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
    id: json['id'],
    name: json['name'],
    color: json['color'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'color': color,
  };
}

final allAnimals = <Animal>[
  Animal(
    id: 0,
    name: '',
    color: Color(0xFFFFFFFF),
  ),
  Animal(
    id: 1,
    name: 'Blue',
    color: Color(0xFF003BFF),
  ),
  Animal(
    id: 2,
    name: 'Yellow',
    color: Color(0xFFFFF400),
  ),
  Animal(
    id: 3,
    name: 'Green',
    color: Color(0xFF0EFF00),
  ),
  Animal(
    id: 4,
    name: 'Black',
    color: Color(0xFF000000),
  ),
  Animal(
    id: 5,
    name: 'Red',
    color: Color(0xFFFF0000),
  ),
];