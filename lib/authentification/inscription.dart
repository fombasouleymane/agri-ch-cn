import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Page/politiqueEtConfidentiatite.dart';
import '../constants/cons.dart';
import '../widget/champTemplate.dart';
import 'connexion.dart';

class SecteurActivite {
  String name;
  bool isClick = false;

  SecteurActivite({required this.name});
}

class Inscription extends StatefulWidget {
  final Function visible;

  Inscription({required this.visible});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;
  String langue = 'ADJA';
  bool isClickSecteur = false;
  bool yoruba = false;
  bool fon = false;
  bool adja = true;
  bool ottamari = false;
  List<SecteurActivite> secteurVal = [
    SecteurActivite(name: 'Soja'),
    SecteurActivite(name: 'Maïs'),
    SecteurActivite(name: 'Arachide'),
    SecteurActivite(name: 'Sorgho'),
    SecteurActivite(name: 'Harico'),
    SecteurActivite(name: 'Riz'),
    SecteurActivite(name: 'Autre'),
  ];
  List<String> _secteurController = [];

  // Fonction qui montre que l'utilisateurs a faire un choix
  bool isSelect() {
    for (var i = 0; i < secteurVal.length; i++) {
      if (secteurVal[i].isClick) {
        return true;
      }
    }
    return false;
  }

  // Ajouter dans le secteurs
  void addSecteur(String value) {
    bool isContain = false;
    for (var i = 0; i < _secteurController.length; i++) {
      if (_secteurController[i] == value) {
        isContain = true;
      }
    }
    if (!isContain) {
      _secteurController.add(value);
    }
  }

  // Enlever du secteur
  void removeSecteur(String value) {
    _secteurController.remove(value);
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ComponentTextFormField _nomController = ComponentTextFormField(
      icon: Icons.account_circle_outlined,
      placehoder: 'Nom....',
      isPassword: false,
      isEmail: false);
  ComponentTextFormField _prenomController = ComponentTextFormField(
      icon: Icons.account_circle_outlined,
      placehoder: 'Prenom...',
      isPassword: false,
      isEmail: false);
  ComponentTextFormField _communeController = ComponentTextFormField(
      icon: Icons.location_city,
      placehoder: 'Abomey Calavi',
      isPassword: false,
      isEmail: false);
  ComponentTextFormField _passwordController = ComponentTextFormField(
      icon: Icons.password_outlined,
      placehoder: '*********',
      isPassword: true,
      isEmail: false);
  ComponentTextFormField _passwordConfirmeController = ComponentTextFormField(
      icon: Icons.password_outlined,
      placehoder: 'confirme mot de passe',
      isPassword: true,
      isEmail: false);
  TextEditingController _numeroController = TextEditingController();

  //Claener
  void cleanerMe() {
    _nomController.cleaner();
    _prenomController.cleaner();
    _passwordController.cleaner();
    _passwordConfirmeController.cleaner();
  }

  //initialiser la langue
  void initLangue() {
    yoruba = false;
    fon = false;
    adja = false;
    ottamari = false;
  }

  List<Pays> pays = [
    Pays(nomPays: "Bénin", imgpath: 'images/benin.png', indicateur: '+229'),
    Pays(
        nomPays: "Burkina faso",
        imgpath: 'images/burkina.png',
        indicateur: '+226'),
    Pays(
        nomPays: "Côte d'ivoire",
        imgpath: 'images/cotedivore.png',
        indicateur: '+225'),
    Pays(nomPays: "Mali", imgpath: 'images/mali.png', indicateur: '+223'),
    Pays(nomPays: "Niger", imgpath: 'images/niger.png', indicateur: '+227'),
    Pays(nomPays: "Togo", imgpath: 'images/togo.png', indicateur: '+228'),
  ];

  String paysValue = 'Bénin';
  String indicateurPays = '+229';
  String imgPays = 'images/benin.png';

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.centerRight,
                      stops: [
                    0.1,
                    0.5,
                    0.9
                  ],
                      colors: [
                    Color.fromARGB(255, 0, 206, 92),
                    Color.fromARGB(255, 197, 255, 104).withOpacity(.5),
                    Colors.white
                  ])),
              child: Opacity(
                opacity: _opacity.value,
                child: Transform.scale(
                  scale: _transform.value,
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color:
                              const Color.fromRGBO(0, 0, 0, 1).withOpacity(.1),
                          blurRadius: 90,
                        ),
                      ],
                    ),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 200,
                                height: 100,
                                child: Image.asset(
                                  "images/agri.png",
                                  fit: BoxFit.fitWidth,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18, top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ADJA
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    initLangue();
                                    adja = true;
                                    langue = 'ADJA';
                                  });
                                },
                                child: Container(
                                  width: size.width * .17,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: adja
                                          ? PRIMARY_COLOR
                                          : Colors.grey.withOpacity(.1)),
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ADJA',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kadwa(
                                            color: adja ? Colors.white : null,
                                            fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //Fon
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    initLangue();
                                    fon = true;
                                    langue = 'FON';
                                  });
                                },
                                child: Container(
                                  width: size.width * .17,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: fon
                                          ? PRIMARY_COLOR
                                          : Colors.grey.withOpacity(.1)),
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'FON',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kadwa(
                                            color: fon ? Colors.white : null,
                                            fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //Ottamari
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    initLangue();
                                    ottamari = true;
                                    langue = 'OTTAMARI';
                                  });
                                },
                                child: Container(
                                  width: size.width * .17,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: ottamari
                                          ? PRIMARY_COLOR
                                          : Colors.grey.withOpacity(.1)),
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'OTTAMARI',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kadwa(
                                            color:
                                                ottamari ? Colors.white : null,
                                            fontSize: 6),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Yoruba
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    initLangue();
                                    yoruba = true;
                                    langue = 'YORUBA';
                                    //jouerAudio();
                                  });
                                },
                                child: Container(
                                  width: size.width * .17,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: yoruba
                                          ? PRIMARY_COLOR
                                          : Colors.grey.withOpacity(.1)),
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'YORUBA',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kadwa(
                                            color: yoruba ? Colors.white : null,
                                            fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 8, bottom: 8, right: 18),
                          child: _nomController.textformfield(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 8, bottom: 8, right: 18),
                          child: _prenomController.textformfield(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 8, bottom: 8, right: 18),
                          child: _communeController.textformfield(context),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 8, bottom: 8, right: 18),
                          child: Container(
                            height: 50,
                            width: size.width / 1.22,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: size.width / 30),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.05),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.kadwa(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(.8)),
                              keyboardType: TextInputType.phone,
                              controller: _numeroController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: InkWell(
                                  onTap: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        content: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .6,
                                          height: 200,
                                          child: ListView.builder(
                                            itemCount: pays.length,
                                            itemBuilder: (context, index) =>
                                                ListTile(
                                              onTap: () {
                                                setState(() {
                                                  paysValue =
                                                      pays[index].nomPays;
                                                  indicateurPays =
                                                      pays[index].indicateur;
                                                  imgPays = pays[index].imgpath;
                                                });
                                                Navigator.pop(context);
                                              },
                                              leading: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    pays[index].imgpath),
                                              ),
                                              title: Text(pays[index].nomPays),
                                              subtitle:
                                                  Text(pays[index].indicateur),
                                              dense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ).then((returnVal) {});
                                  },
                                  child: Container(
                                    width: 70,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(imgPays)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          indicateurPays,
                                          style: GoogleFonts.kadwa(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                hintMaxLines: 1,
                                hintText: ' XXXXXXXX',
                                hintStyle: GoogleFonts.kadwa(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(.5)),
                              ),
                            ),
                          ),
                        ),
                        // Secteur
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 8, bottom: 8, right: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Secteurs',
                                    style: GoogleFonts.kadwa(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(.5)),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isClickSecteur = !isClickSecteur;
                                        });
                                      },
                                      icon: isClickSecteur
                                          ? Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: PRIMARY_COLOR,
                                            )
                                          : Icon(
                                              Icons.arrow_drop_up_sharp,
                                              color: PRIMARY_COLOR,
                                            ))
                                ],
                              ),
                              isClickSecteur
                                  ? SizedBox(
                                      height: 7,
                                    )
                                  : SizedBox(),
                              isClickSecteur
                                  ? Column(
                                      children: secteurVal
                                          .map((e) => Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Row(
                                                  children: [
                                                    Checkbox(
                                                      value: e.isClick,
                                                      onChanged: (value) {
                                                        if (value != null) {
                                                          setState(() {
                                                            e.isClick = value;
                                                            if (e.isClick) {
                                                              addSecteur(
                                                                  e.name);
                                                            } else {
                                                              removeSecteur(
                                                                  e.name);
                                                            }
                                                          });
                                                        }
                                                      },
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      e.name,
                                                      style: GoogleFonts.kadwa(
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                        // Mot de passe
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 8, bottom: 8, right: 18),
                          child: _passwordController.textformfield(context),
                        ),
                        // Confirmer le mot de passe
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 8, bottom: 8, right: 18),
                          child: _passwordConfirmeController
                              .textformfield(context),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 8, bottom: 8, right: 18),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PolitiqueEtConfidantialite(),
                                  ));
                            },
                            child: Text(
                              'Politique de confidentialité',
                              style: GoogleFonts.kadwa(
                                color: PRIMARY_COLOR,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            component2(
                              'S\'inscription',
                              2.6,
                              () async {
                                if (_passwordController.val.length < 8 ||
                                    _passwordController.val.isEmpty) {
                                  _showSnackBar(
                                      "Mots de passe doit depassé 8 caractère");
                                } else if (_passwordController.val !=
                                    _passwordConfirmeController.val) {
                                  _showSnackBar(
                                      "Mot de pass et sa confirmation ne sont pas identique");
                                } else if (_numeroController == '') {
                                  _showSnackBar("Veillez entrer un numero");
                                } else {
                                  inscription();
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Se connecter à mon compte',
                                style: GoogleFonts.kadwa(
                                  color: PRIMARY_COLOR,
                                  fontSize: 15,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    widget.visible();
                                  },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, top: 8, bottom: 8, right: 18),
        child: Container(
          height: 50,
          width: size.width * .8,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.1, 0.5],
                  colors: [PRIMARY_COLOR, PRIMARY_COLOR.withOpacity(.5)])),
          child: Text(
            string,
            style: GoogleFonts.kadwa(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: PRIMARY_COLOR,
        content: Text(message),
      ),
    );
  }

  void inscription() async {
    //widget.visible();
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _numeroController.value.text + "@gmail.com",
        password: _passwordController.value.text,
        //nummero: _numeroController.value,
      );
      _showSnackBar("Inscription effectuer avec succés");
      await FirebaseFirestore.instance
          .collection('utilisateurs')
          .doc(userCredential.user!.uid)
          .set({
        'nom': _nomController.value.text,
        'prenom': _prenomController.value.text,
        'commune': _communeController.value.text,
        'numero': _numeroController.text,
        'secteur': _secteurController,
        'langue': langue,
        'passe': _passwordController.value.text
      });
      widget.visible();
    } catch (e) {
      print(
          e); // Gérer les erreurs d'inscription, par exemple afficher un message d'erreur à l'utilisateur
      _showSnackBar("Une erreur s'est produite lors de l'inscription::: $e");
    }
  }
/*Future <void> jouerAudio() async {
    String audioPath = '';

    switch (langue) {
      case 'ADJA':
        audioPath = 'images/ADJA.mp3';
        break;
      case 'FON':
        audioPath = 'images/FON.mp3';
        break;
      case 'OTTAMARI':
        audioPath = 'images/OTAMARI.mp3';
        break;
      case 'YORUBA':
        audioPath = 'images/YORUBA.mp3';
        break;
      default:
        return;
    }

    await audioPlayer.stop();

    int result = await audioPlayer.play(audioPath, isLocal: true);

    if (result == 1) {
      print('Audio a commencé à jouer');
    } else {
      print('Erreur lors du démarrage de la lecture audio');
    }
  }*/
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
