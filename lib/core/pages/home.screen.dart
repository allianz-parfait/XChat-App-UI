import 'package:chat_app/core/models/person.model.dart';
import 'package:chat_app/core/pages/chat.details.screen.dart';
import 'package:chat_app/core/services/person.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // La liste des personnes qui seront affichés dans les discussions.
  List<Person> peoples = PersonService.findAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Le AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, // Couleur de fond blanc sur le AppBar
        centerTitle: false, // Indique si le titre de l'AppBar doit être centré ou non.
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Romain,',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 12,
                fontFamily: "Helvetica Neue"
              ),
            ),
            Text(
              'XChat message',
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontFamily: "Helvetica Neue"
              ),
            ),
          ]
        ),

        // On donne des actions à notre AppBar
        actions: [
          // On met l'icone dans un Padding
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_square,
                color: Colors.grey,
              )
            ),
          )
        ],
      ),


      /*
        Le Body

        SingleChildScrollView est un widget qui permet de faire défiler (scroll) un seul enfant dans 
        une vue lorsque son contenu dépasse la taille de l'écran.

        Ici, Le widget principal est un SingleChildScrollView, qui permet de faire défiler
        verticalement l'ensemble du contenu de la page.
      */
      body: SingleChildScrollView(
        // À l'intérieur, un Column est utilisé pour organiser les widgets verticalement.
        child: Column(
          children: [
            /*
              Ensuite, un Container est placé dans cette colonne pour contenir la liste horizontale 
              des personnes.
              Donne un cadre à la liste horizontale, ici avec une hauteur fixe de 100 pixels.
            */
            SizedBox(
              height: 100,
              // c'est ici que la liste est générée dynamiquement. Ce widget crée des éléments en 
              // fonction de la taille de la liste (itemCount: peoples.length).
              child: ListView.builder(
                // On prend la taille de la liste des personnes
                itemCount: peoples.length,
                // Permet au ListView de se réduire pour prendre seulement l'espace nécessaire. 
                // Cela évite qu'il prenne tout l'espace disponible.
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                // Fait défiler la liste horizontalement (par défaut, une ListView défile verticalement).
                scrollDirection: Axis.horizontal,
                
                // Cette fonction est appelée pour chaque élément de la liste, avec i correspondant
                // à l'indice de l'élément.
                itemBuilder: (context, int i) {
                  // Le Padding ajoute un espacement autour de chaque élément pour qu'il ne soit pas collé aux autres.
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    // Column : organise les éléments verticalement, avec une image en haut et un texte en dessous.
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container : contient l'image circulaire représentant chaque personne.
                        Container(
                          // height et width définit la taille du cercle.
                          height: 56,
                          width: 60,
                          // Stylise le Container avec un fond gris clair et une image
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            image: DecorationImage(
                              // Charge une image locale de l'application à partir des fichiers assets,
                              // en utilisant l'indice i+1 pour changer d'image pour chaque personne.
                              image: AssetImage(
                                'assets/${i+1}.png'
                              ),
                              /*
                                Dans ce contexte, l'attribut scale: 10 de l'objet DecorationImage sert
                                à redimensionner l'image affichée dans le Container.
                                Ca signifie que l'image sera réduite de 10 fois par rapport à sa
                                taille originale. Cela la rend plus petite à l'écran.
                              */
                              scale: 10
                            ),
                            shape: BoxShape.circle // rend le conteneur circulaire.
                          ),
                        ),
                        const SizedBox(height: 5), // ajoute un espacement entre l'image et le texte.

                        // affiche le nom de la personne correspondant à l'index i de la liste peoples. 
                        Text(
                          peoples[i].name
                        ),
                      ],
                    ),
                  );
                } ,
              ),
            ),

            // Divider est l'équivalent d'un hr en HTML
            const Divider(
              color: Color.fromARGB(255, 223, 217, 217), // On donne une couleur grise claire à notre hr
            ),

            // La liste des Discussions
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: peoples.length,
              // Pour chaque item (discussion), on crée ce widget
              itemBuilder: (context, int index) {
                  // On donne un padding au Container de l'item courant pour les espacer
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        // L'action à effectuer quand on clique sur un item (une discussion)
                        onTap: () {
                          Navigator.push(
                            context,

                            MaterialPageRoute<void>(
                              // fullscreenDialog: true,
                              builder: (BuildContext context) => const ChatDetailsScreen(),
                            )
                          );
                        },
                        leading: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          // On met un padding sur l'image pour qu'elle ne soit pas collé au cercle
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              'assets/${index + 10}.png'
                            ),
                          ),
                        ),

                        // Les noms des contacts (les personnes)
                        title: Text(
                          peoples[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        // Subtitle sera le message de discussion en dessous du nom de la personne
                        subtitle: const Text(
                          "Blablablablabla🔥...",
                        ),

                        trailing: Column(
                          children: [
                            
                            // L'heure de réception du message
                            const Text(
                              '00.21',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey
                              ),
                            ),

                            // On met un espace vertical entre l'heure de réception et la Row contenant les deux icones
                            const SizedBox(height: 5),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Comme Icone, on donne une icone "Epingle"
                                const Icon(
                                  CupertinoIcons.pin_fill,
                                  size: 15,
                                  color: Colors.grey
                                ),
                                
                                // On met un espace horizontal entre l'épingle et l'icone bleu
                                const SizedBox(width: 5),

                                // L'indicateur Bleu de "message-recu"
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue
                                  ),
                                  // Le nombre de messages reçus
                                  child: const Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                    ),
                  );
              }
            ),
          ],
        ),
      ),
    );
  }
}