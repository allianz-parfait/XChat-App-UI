// Cet écran est l'écran d'accueil

import 'package:chat_app/core/pages/home.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}


// Comme 
class _LandingScreenState extends State<LandingScreen> {

  // late signifie que la variable sera initialisée plus tard, mais avant d'être utilisée.
  // Cela est utile pour éviter d'initialiser la variable dans le constructeur ou de donner une valeur
  // par défaut immédiatement.
  late bool isFinished;


  /*
    La méthode initState() est utilisée dans les widgets Stateful de Flutter pour initialiser des états.
    Dans cette méthode, isFinished est initialisé à false, ce qui signifie que le bouton n'a pas encore
    terminé son action de swipe.
  */
  @override
  void initState() {
    isFinished = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // On crée un layout qui n'aura qu'un body et un appbar.
    return Scaffold(
      /*
        Propriété de Scaffold qui permet au corps principal de la page (le body de l'écran) de
        s'étendre derrière la barre d'application (AppBar). Cela signifie que le contenu de la page
        peut apparaître derrière l'AppBar, ce qui permet par exemple de rendre un arrière-plan
        (comme une image ou une couleur) visible sous l'AppBar.
      */
      extendBodyBehindAppBar: true,
      // On crée un Appbar
      appBar: AppBar(
        /*
          L'utilisation de elevation: 0 dans le widget AppBar en Flutter permet de supprimer l'ombre
          (ou l'élévation) par défaut de la barre d'application. Par défaut, l'AppBar a une ombre qui
          donne un effet de profondeur, ce qui peut ne pas être souhaitable dans certaines conceptions
          d'interface utilisateur.
        */
        elevation: 0,
        // Cette option dans le widget AppBar rend la barre d'application complètement transparente.
        backgroundColor: Colors.transparent,
      ),

      // Le widget Stack en Flutter est utilisé pour superposer plusieurs widgets les uns sur les
      // autres. Chaque widget à l'intérieur du Stack est positionné par rapport à celui qui est en
      // dessous.
      //  Les Widgets peuvent aussi etre placé de manière absolue grace à au Widget 'Positioned'
      body: Stack(
        /*
          La propriété 'alignment' dans le widget Stack permet de définir comment les widgets enfants
          non positionnés doivent être alignés dans la zone disponible du Stack. L'alignement est
          utilisé lorsque les enfants du Stack ne sont pas encapsulés dans des widgets Positioned, ce
          qui signifie qu'ils ne sont pas positionnés de manière absolue.

          'Alignment.bottomCenter' : Aligne les enfants non positionnés en bas du Stack, centrés horizontalement.
        */
        alignment: Alignment.bottomCenter,
        children: [
          // On crée un container qui contiendra l'image de fond.
          Container(
            /*
              'MediaQuery' est une classe en Flutter qui fournit des informations sur les dimensions
              et les caractéristiques de l'écran ou de la fenêtre dans laquelle l'application est affichée.
              'of(context)' : C'est une méthode qui retourne un objet MediaQueryData basé sur le
              contexte donné. Le contexte est généralement l'endroit où le widget est construit
              'size.width' : Cela retourne la largeur de l'écran ou de la fenêtre en pixels.
            */
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              // Classe utilisée pour spécifier une image dans la décoration d'un widget, comme un
              // Container, un BoxDecoration, ou un Card. Elle permet de définir comment l'image
              // doit être affichée, en ajustant son comportement et son apparence.
              image: DecorationImage(
                // Classe utilisée pour charger des images stockées localement dans ton application,
                // à partir du répertoire des assets
                image: AssetImage(
                  'assets/background.png'
                ),
                // 'BoxFit' contrôle comment l'image doit être ajustée pour s'adapter à la taille du conteneur.
                // 'cover' : L'image couvre toute la zone, en conservant son ratio d'aspect. L'image peut être coupée.
                fit: BoxFit.cover
              )
            ),
          ),

          // On crée un autre Container qui sera en bas
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            // Cette propriété définit la largeur du widget pour qu'elle prenne toute la largeur disponible.
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
              )
            ),

            // On donne un padding à notre Colonne
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              // On donne une Colonne comme enfant à notre Container
              child: Column(
                children: [
                  const Text(
                    "Express yourself with XChat",
                    // On centre le texte
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600
                    ),
                  ),

                  // On crée un espace blanc entre les deux textes
                  const SizedBox(height: 20),

                  const Text(
                    "Chat using avatar emojis gives a different impression, dare to try it ?",
                    // On centre le texte
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300
                    ),
                  ),

                  // On crée un espace blanc entre les deux textes
                  const SizedBox(height: 20),
                  
                  // Le bouton Swipe qu'on a installé (SwipeButtonView)
                  SwipeableButtonView(
                    // Cette propriété contrôle si l'action du bouton est terminée ou non. Elle est
                    // liée à l'état isFinished que nous avons initialisé dans initState().
                    isFinished: isFinished,

                    // Cette fonction est appelée lorsque le bouton a complètement terminé l'action de
                    // swipe. Dans ce cas, on utilise Navigator.push() pour rediriger l'utilisateur
                    // vers un nouvel écran (HomeScreen).
                    onFinish: () {
                      Navigator.push(
                        context,
                        // MaterialPageRoute est une classe qui permet de gérer la navigation entre 
                        // deux pages (ou écrans) en utilisant les principes de conception de 
                        // Material Design. C'est est un type spécifique de route qui fournit une
                        // transition animée conforme aux standards de Material Design
                        // (comme un effet de glissement entre les écrans).
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomeScreen(),
                        )
                      );
                    },
                    
                    /*
                      Cette fonction est appelée pendant le processus de swipe. Lorsque l'utilisateur
                      commence à glisser, on met à jour l'état en appelant setState() pour changer la 
                      valeur de isFinished à true.

                      setState() est utilisé pour informer Flutter que l'interface utilisateur doit
                      être reconstruite avec la nouvelle valeur de isFinished.
                    */
                    onWaitingProcess: () {
                      setState(() {
                        isFinished = true;
                      });
                    }, 
                    activeColor: Colors.blue,
                    buttonWidget: Container(
                      child: const Icon(
                        CupertinoIcons.chevron_right_2,
                        color: Colors.grey,
                      ),
                    ), 
                    buttonText: "Swipe to Start"
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}