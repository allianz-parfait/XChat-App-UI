import 'package:chat_app/core/pages/landing.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
  La classe MyApp dans Flutter est généralement la classe racine d'une application. Elle sert à 
  configurer et initialiser toute l'application. C'est un point de départ qui contient des informations
  importantes pour le rendu, les thèmes, les routes et les paramètres globaux de l'application.
*/
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      

      // Par défaut au lancement de l'application, ce sera notre page 'LandingScreen' qui sera affiché
      // On importe donc 'LandingScreen' pour afficher la page d'accueil
      home: LandingScreen(),
    );
  }
}

