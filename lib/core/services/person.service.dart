// Ceci est un service qui permet de récupérer les personnes depuis une source de données

import 'package:chat_app/core/models/message.model.dart';
import 'package:chat_app/core/models/person.model.dart';


class PersonService {

  // Pour le moment on travaille avec de fausses données
  static List<Person> findAll() {

    List<String> peoples = [
      'Alliance',
      'Faveur',
      'Parfaite',
      'Promesse',
      'Maman',
      'Bobby',
      'Elodie',
      'Amy',
      'Hailey',
      'Nyxia',
      'John'
    ];

    List<String> messages = [
      'Bonjour tu vas bien?',
      'Waouh c\'est beau...🔥',
      'Salut Parfaite !',
      'Promesse t\'es intelligente hein😎',
      'Bonjour Maman ca va ?',
      'T\'as vu Bobby ? C\'est un bon Chien ...',
      'Cc',
      'Salut toi !',
      'Hailisha...😊',
      'Ohhh Nyxia...',
      'Yoo Bro ! C\'est comment ?'
    ];

    // On génère 10 personnes
    return [
      for (int i=1; i<=peoples.length; i++)
        Person(
          id: i, 
          name: peoples[i], 
          avatar: 'assets/$i.png', 
          messages: [
            Message(
              id: i+1, 
              message: messages[i], 
              heure: i<10 ? '00:2$i' : '00:i'
            )
          ]
        ),
      
    ];

  }

}