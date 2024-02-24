import 'package:agribenin/authentification/inscriptionConnexion.dart';
import 'package:agribenin/authentification/modification.dart';
import 'package:agribenin/constants/cons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Compte extends StatefulWidget {
  const Compte({super.key});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Compte',
          style: GoogleFonts.kadwa(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            width: size.width,
            height: 210,
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: 150,
                  /* decoration:
                      BoxDecoration(border: Border.all(color: PRIMARY_COLOR)), */
                  child: Image.asset(
                    'images/agri.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                            image: DecorationImage(
                              image: AssetImage("images/logo.jpg"),
                            ),
                          ),
                        ),
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: size.width - 200),
                          padding: EdgeInsets.only(bottom: 15, left: 10),
                          child: Text(
                            "ALAGBE Faïd Adéshinan",
                            style: GoogleFonts.kadwa(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Modification(),
                                        ));
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          // Pays
          ListTile(
            leading: CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  Icons.villa_outlined,
                  color: Colors.white,
                )),
            title: Text(
              'Pays',
              style: GoogleFonts.kadwa(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Bénin',
              style: GoogleFonts.kadwa(
                fontSize: 13,
              ),
            ),
            dense: true,
          ),
          SizedBox(
            height: 10,
          ),
          // Commune
          ListTile(
            leading: CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  Icons.location_city,
                  color: Colors.white,
                )),
            title: Text(
              'Communes',
              style: GoogleFonts.kadwa(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Abomey-Calavi',
              style: GoogleFonts.kadwa(
                fontSize: 13,
              ),
            ),
            dense: true,
          ),
          SizedBox(
            height: 10,
          ),
          // Numero
          ListTile(
            leading: CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                )),
            title: Text(
              'Numero',
              style: GoogleFonts.kadwa(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '+22945789621',
              style: GoogleFonts.kadwa(
                fontSize: 13,
              ),
            ),
            dense: true,
          ),
          SizedBox(
            height: 10,
          ),
          //Langue
          ListTile(
            leading: CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  Icons.language,
                  color: Colors.white,
                )),
            title: Text(
              'Langue',
              style: GoogleFonts.kadwa(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Yoruba',
              style: GoogleFonts.kadwa(
                fontSize: 13,
              ),
            ),
            dense: true,
          ),
          SizedBox(
            height: 10,
          ),
          /* ListTile(
            leading: CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  Icons.agriculture,
                  color: Colors.white,
                )),
            title: Text(
              'Secteur',
              style: GoogleFonts.kadwa(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Aviculuture',
              style: GoogleFonts.kadwa(
                fontSize: 13,
              ),
            ),
            dense: true,
          ),
          SizedBox(
            height: 10,
          ), */
          ListTile(
            leading: CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  Icons.swap_vert_circle_outlined,
                  color: Colors.white,
                )),
            title: Text(
              'Secteurs/Fillières',
              style: GoogleFonts.kadwa(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Soja, Arachide, mais',
              style: GoogleFonts.kadwa(
                fontSize: 13,
              ),
            ),
            dense: true,
          ),
          SizedBox(
            height: 10,
          ),

          Divider(),
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConnctInscription(),
                  ));
            },
            leading: CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
            title: Text(
              'Se deonnecter',
              style: GoogleFonts.kadwa(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            dense: true,
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    'Supprimer mon compte',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  content: Text(
                    'Êtes-vous sûre de vouloire supprimer se compte ?\nUne fois supprimer vous ne pouvez plus la recupérer.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 35,
                            width: size.width * .25,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: PRIMARY_COLOR,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 7, right: 7),
                                  child: Text(
                                    'Annuler',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConnctInscription(),
                              ),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: size.width * .25,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.red,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 7),
                                      child: Text(
                                        'Supprimer',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ).then((returnVal) {});
            },
            leading: CircleAvatar(
                backgroundColor: PRIMARY_COLOR,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                )),
            title: Text(
              'Supprimer mon compte',
              style: GoogleFonts.kadwa(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            dense: true,
          ),
        ],
      ),
    );
  }
}
