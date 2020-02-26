import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dicee',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
} // statefull permets d'actualiser la page si une variable contenu dans
// le widget varie

class _DicePageState extends State<DicePage> {
  // integrer les variable ici
  int leftDiceNumber = 1; // variable de type int
  int rightDiceNumber = 5; // variable de type int

  void changeDiceFace() {
    setState(() {
      leftDiceNumber= Random().nextInt(6)+1;
      rightDiceNumber=Random().nextInt(6)+1;
    });
  } // function pour changer la face des dés

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            // permets au container fils de prendre toute la place allouer
            child: FlatButton(
              // ou RiseButton toujours associé a onPressed , et d'autre fonction
              onPressed: () {
                // VoidcalleBox permet d'ajouter une action quand le boutton est préssé
                setState(() {
                  // permet de reactualiser le widget statefull avec les valeurs de variable qui change
                  leftDiceNumber = Random().nextInt(6) + 1;
                  rightDiceNumber = Random().nextInt(6) + 1; // Random() fonction aléatoire de nombre de 0 a Max fixé
                  //  avec .nextInt(Valeur Max) on ajoute 1  car l image 0 n existe pas
                  print(
                      'diceleft=$leftDiceNumber'); // print permet d ecrire dans la console la valeur de la variable
                }); // on peux alléger le code en appelant une fonction créee plus haut changediceface(); cf en bas
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
            flex: 1,
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
               changeDiceFace();  // on appelle la fonction changeDiceFace qui change la valeur de la variable de façon aléatoire
                print(' diceright=$rightDiceNumber');
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
