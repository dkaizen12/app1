import 'package:flutter/material.dart';

class _Elevated extends StatefulWidget {
  @override
  State<_Elevated> createState() => _MyWidgetState(); //le stateful ne fait que créer l'Etat avec create
} //c'est par là que commence un statefulwidget
	
class _MyWidgetState extends State<_Elevated> {
  //et c'est ici que l'on va coder notre widget dynamique
  var title = "Handler";
  var valeur = "Level 1";
  var valeur1 = "Rand E";
  void onclick() {//la fonction qui crée la modification quand on clique sur l'elevatedbutton
    setState(() {//setstate fonction de changement toujours la mettre quand tu veux faire une modification
    //stateful sur l'application
      valeur = "Donjon caché";
    });
  }

  void onclick1(String valeur2) {
    setState(() {
      valeur1 = valeur2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ), //appBar appelle le widget AppBar pour tous les éléments qui seront sur l'en-tête
      //on va essayer de manipuler de Raisedbutton actuellement ElevatedButton
      body: Column(
        children: [
          ElevatedButton(//Utiliser pour la dynamique de nos sites, elles appellent très souvent
          //des fonctions par closures pour un changement sur notre application 
            onPressed: () {//onPressed c'est là où l'on mettre l'appel de la fonction qui fait le changement
              onclick();//appel de fonction définie au début du state
            },
            child: Text(//texte qui apparait sur le bouton
              "cliquez-moi",
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          Text(valeur, style: TextStyle(color: Colors.blueAccent)),//text alternatif à modifier grâce à la fonction onclick c’est-à-dire quand on click c’est le texte qui va s’afficher
          ElevatedButton(
            onPressed: () {
              onclick1(" Solo leveling");
            },
            child: Text("cliquez-moi", style: TextStyle(color: Colors.red),
            ),
          ),
          Text(valeur1,style: TextStyle(color: Colors.red))
        ],
      ),
    );
  }
}
