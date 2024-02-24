import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/cons.dart';
import 'Acceuil.dart';
import 'commentaire.dart';

class Innov extends StatefulWidget {
  const Innov({super.key});

  @override
  State<Innov> createState() => _InnovState();
}

class _InnovState extends State<Innov> {
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Innovation',
          style: GoogleFonts.kadwa(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
                          'L\'Innovation',
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
                  /* Container(
                    height: 120,
                    width: size.width * .35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/basket_of_fruits2.png"),
                      ),
                    ),
                  ), */
                ],
              ),
            ),
          ),
          Column(
            children: actulite.map((e) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/logo.jpg"),
                    ),
                    title: Text(
                      "ALAGBE Faïd",
                      style: GoogleFonts.kadwa(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    dense: true,
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
                                  e.favorie = !e.favorie;
                                });
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
}
