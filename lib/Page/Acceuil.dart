import 'dart:async';

import 'package:agribenin/Page/commentaire.dart';
import 'package:agribenin/authentification/inscriptionConnexion.dart';
import 'package:agribenin/constants/cons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:video_player/video_player.dart';
import 'compte.dart';
import 'messagerie.dart';
import 'prevision.dart';

class Post {
  String img;
  bool favorie;
  bool istext;
  String description;
  Post(
      {required this.img,
      required this.favorie,
      required this.istext,
      required this.description});
}

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int currentIndex = 0;
  var composants = [Accueil(), Innov(), Messagerie(), Compte()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: composants[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: GoogleFonts.kadwa(),
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedLabelStyle:
            GoogleFonts.kadwa(fontWeight: FontWeight.bold, color: Colors.white),
        items: [
          BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.notifications_none,
                    color: PRIMARY_COLOR,
                  )),
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              label: "Alerte"),
          BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: PRIMARY_COLOR,
                  )),
              icon: Icon(
                Icons.calendar_month_outlined,
                color: Colors.white,
              ),
              label: "Innov"),
          BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.wechat_rounded,
                    color: PRIMARY_COLOR,
                  )),
              icon: Icon(
                Icons.wechat_rounded,
                color: Colors.white,
              ),
              label: "Message"),
          BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: PRIMARY_COLOR,
                  )),
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              label: "Compte"),
        ],
      ),
    );
  }
}

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  VideoPlayerController? videoController;
  int val = 0;
  List<String> trailer = [
    'Bonjour',
    'Je suis vraiment content',
    'Je suis au top',
    'Je suis moi meme',
    'I love you'
  ];

  List<Post> actulite = [
    Post(
        img: '1',
        favorie: false,
        istext: false,
        description:
            "Il existe de nombreuses variantes de passages du Lorem Ipsum disponibles, mais la majorité ont subi des altérations sous une forme ou une autre, par injection d'humour ou par des mots aléatoires qui ne semblent même pas légèrement crédibles. Si vous comptez utiliser un passage du Lorem Ipsum, vous devez vous assurer qu'il n'y a rien d'embarrassant caché au milieu du texte. Tous les générateurs Lorem Ipsum sur Internet ont tendance à répéter des morceaux prédéfinis si nécessaire, ce qui en fait le premier véritable générateur sur Internet. Il utilise un dictionnaire de plus de 200 mots latins, combiné à une poignée de structures de phrases modèles, pour générer du Lorem Ipsum qui semble raisonnable. Le Lorem Ipsum généré est donc toujours exempt de répétitions, d'humour injecté, de mots non caractéristiques, etc."),
    Post(
        img: '2',
        favorie: false,
        istext: false,
        description:
            "Contrairement à la croyance populaire, le Lorem Ipsum n’est pas simplement un texte aléatoire. Il a ses racines dans un morceau de littérature latine classique datant de 45 avant JC, soit plus de 2000 ans."),
    Post(
        img: '3',
        favorie: false,
        istext: false,
        description:
            "C'est un fait établi depuis longtemps qu'un lecteur sera distrait par le contenu lisible d'une page lorsqu'il examinera sa mise en page. L'intérêt d'utiliser le Lorem Ipsum est qu'il a une distribution de lettres plus ou moins normale, par opposition à l'utilisation de « Contenu ici, contenu ici », ce qui donne l'impression qu'il s'agit d'un anglais lisible. De nombreux logiciels de publication assistée par ordinateur et éditeurs de pages Web utilisent désormais Lorem Ipsum comme modèle de texte par défaut, et une recherche sur « lorem ipsum » permettra de découvrir de nombreux sites Web encore à leurs balbutiements. Différentes versions ont évolué au fil des années, parfois par accident, parfois volontairement (humour injecté, etc.)."),
    Post(
        img: '4',
        favorie: false,
        istext: false,
        description:
            "Le morceau standard de Lorem Ipsum utilisé depuis les années 1500 est reproduit ci-dessous pour ceux que cela intéresse."),
    Post(
        img: '5',
        favorie: false,
        istext: false,
        description:
            "Mais je dois vous expliquer comment est née toute cette idée erronée consistant à dénoncer le plaisir et à louer la douleur et je vais vous donner un compte rendu complet du système et exposer les enseignements réels du grand explorateur de la vérité, le maître bâtisseur de personne ne rejette, n'aime ou n'évite le plaisir lui-même, parce que c'est du plaisir, mais parce que ceux qui ne savent pas rechercher le plaisir de manière rationnelle subissent des conséquences extrêmement douloureuses. obtenir la douleur par elle-même, parce qu'elle est douleur, mais parce qu'il arrive parfois des circonstances dans lesquelles le travail et la douleur peuvent lui procurer un grand plaisir. Pour prendre un exemple trivial, lequel d'entre nous entreprend jamais un exercice physique laborieux, sauf pour en tirer quelque avantage ? Mais qui a le droit de critiquer un homme qui choisit de jouir d'un plaisir qui n'entraîne aucune conséquence gênante, ou celui qui évite une douleur qui ne produit aucun plaisir ?"),
  ];

  String description = "";
  bool isPlay = false;
  void isPlayStart() {
    isPlay = false;
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      setState(() {
        isPlay = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    videoController = VideoPlayerController.asset("images/video.mp4")
      ..initialize().then((_) {
        setState(() {});
        videoController!.pause();
        videoController!.setVolume(1);
        Timer.periodic(Duration(seconds: 2), (Timer timer) {
          setState(() {
            isPlay = false;
          });
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/logo.jpg")),
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
          ],
        ),
        title: Text(
          'Bienvenue ALAGBE',
          style: GoogleFonts.kadwa(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                logout();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConnctInscription(),
                    ));
              },
              icon: Icon(
                Icons.logout_rounded,
                color: PRIMARY_COLOR,
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
            child: Container(
              width: size.width,
              height: 150,
              decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: size.width - 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AgriConnect',
                          style: GoogleFonts.kadwa(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '100% Agriculture',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kadwa(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*  Container(
                    height: 120,
                    width: size.width * .35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/basket_of_fruits1.png"),
                      ),
                    ),
                  ), */
                ],
              ),
            ),
          ),
          // Video
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/agri.png"),
                ),
                title: Text(
                  "Agri Connect",
                  style: GoogleFonts.kadwa(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                dense: true,
                /* trailing: InkWell(
                  onTap: () {},
                  child: Icon(Icons.more_vert),
                ), */
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.only(left: 18, right: 18),
                child: InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: Text(
                    description,
                    style: GoogleFonts.kadwa(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: size.width,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    videoController == null
                        ? Center(
                            child: LoadingAnimationWidget.discreteCircle(
                              color: Colors.red,
                              size: 100,
                            ),
                          )
                        : videoController!.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: videoController!.value.aspectRatio,
                                child: VideoPlayer(videoController!),
                              )
                            : Center(
                                child: LoadingAnimationWidget.fallingDot(
                                  color: PRIMARY_COLOR,
                                  size: 100,
                                ),
                              ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          videoController!.value.isPlaying
                              ? videoController!.pause()
                              : videoController!.play();
                          isPlayStart();
                        });
                      },
                      child: videoController!.value.isPlaying
                          ? !isPlay
                              ? Container(
                                  height: 200,
                                  width: size.width,
                                  child: Center(
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          border: Border.all(
                                            width: 2,
                                            color: PRIMARY_COLOR,
                                          )),
                                      child: Icon(
                                        Icons.pause,
                                        size: 50,
                                        color: PRIMARY_COLOR,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 200,
                                  width: size.width,
                                )
                          : Container(
                              height: 200,
                              width: size.width,
                              color: PRIMARY_COLOR.withOpacity(.2),
                              child: Center(
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      border: Border.all(
                                        width: 2,
                                        color: PRIMARY_COLOR,
                                      )),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                    color: PRIMARY_COLOR,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                width: size.width,
                padding: EdgeInsets.only(left: 8, right: 18),
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.visibility,
                          ),
                        ),
                        Text(
                          '325',
                          style: GoogleFonts.kadwa(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Commentaire(
                                      title: 'Agri Connect',
                                      imagePost: 'images/f1.png',
                                      image: 'images/agri.png',
                                      duree: '2 jours',
                                      description: description),
                                ));
                          },
                          icon: Icon(
                            Icons.comment_outlined,
                          ),
                        ),
                        Text(
                          '525',
                          style: GoogleFonts.kadwa(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.download,
                          ),
                        ),
                        Text(
                          '32',
                          style: GoogleFonts.kadwa(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      'Il y a 2 jours',
                      style: GoogleFonts.kadwa(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 5,
              ),
            ],
          ),
          // Fin Video
          Column(
            children: actulite.map((e) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/agri.png"),
                    ),
                    title: Text(
                      "Agri Connect",
                      style: GoogleFonts.kadwa(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    dense: true,
                    /* trailing: InkWell(
                      onTap: () {},
                      child: Icon(Icons.more_vert),
                    ), */
                  ),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.only(left: 18, right: 18),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          e.istext = !e.istext;
                          print(e.istext);
                        });
                      },
                      child: Text(
                        e.description.length <= 100
                            ? e.description
                            : e.istext == false
                                ? e.description.substring(0, 99) +
                                    "... " +
                                    "Voir plus"
                                : e.description,
                        style: GoogleFonts.kadwa(fontSize: 13),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: size.width,
                    decoration: BoxDecoration(),
                    child: Image.asset('images/f${e.img}.png',
                        fit: BoxFit.contain),
                  ),
                  Container(
                    height: 60,
                    width: size.width,
                    padding: EdgeInsets.only(left: 8, right: 18),
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    e.favorie = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility,
                                )),
                            Text(
                              '325',
                              style: GoogleFonts.kadwa(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Commentaire(
                                        title: 'Agri Connect',
                                        imagePost: 'images/f${e.img}.png',
                                        image: 'images/agri.png',
                                        duree: '2 jours',
                                        description: e.description,
                                      ),
                                    ));
                              },
                              icon: Icon(
                                Icons.comment_outlined,
                              ),
                            ),
                            Text(
                              '525',
                              style: GoogleFonts.kadwa(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.download,
                              ),
                            ),
                            Text(
                              '32',
                              style: GoogleFonts.kadwa(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text(
                          'Il y a 2 jours',
                          style: GoogleFonts.kadwa(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 5,
                  ),
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('Utilisateur déconnecté avec succès');
      _showSnackBar("Déconnecté avec succès");
    } catch (e) {
      print('Erreur lors de la déconnexion de l\'utilisateur : $e');
    }
  }
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: PRIMARY_COLOR,
        content: Center(child: Text(message,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
