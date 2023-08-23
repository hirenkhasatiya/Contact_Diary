import 'dart:io';

class Contact {
  String name;
  String number;
  String email;

  File? image;

  Contact({
    required this.name,
    required this.number,
    required this.email,
    this.image,
  });
}
