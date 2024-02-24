import 'package:flutter/material.dart';

import 'connexion.dart';
import 'inscription.dart';

class ConnctInscription extends StatefulWidget {
  const ConnctInscription({super.key});

  @override
  State<ConnctInscription> createState() => _ConnctInscriptionState();
}

class _ConnctInscriptionState extends State<ConnctInscription> {
  bool visible = true;
  toogle() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: visible ? Connexion(visible: toogle) : Inscription(visible: toogle),
    );
  }
}
