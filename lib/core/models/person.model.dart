// Ceci est une classe Person représentant chaque personne sur l'application

import 'package:chat_app/core/models/message.model.dart';


class Person {

  int id;
  String name;
  String? avatar;
  List<Message>? messages = [];

  Person({required this.id, required this.name, this.avatar, this.messages});

}