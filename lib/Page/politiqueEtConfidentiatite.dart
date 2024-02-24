import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/cons.dart';

class PolitiqueEtConfidantialite extends StatefulWidget {
  const PolitiqueEtConfidantialite({super.key});

  @override
  State<PolitiqueEtConfidantialite> createState() =>
      _PolitiqueEtConfidantialiteState();
}
/*
class _PolitiqueEtConfidantialiteState
    extends State<PolitiqueEtConfidantialite> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Politiquede confidentialité',
          style: GoogleFonts.kadwa(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 18,
          right: 18,
          top: 8,
          bottom: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              child: Text(
                'Politique de confidentialité',
                style: GoogleFonts.kadwa(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: size.width,
              child: Text(
                "Il existe de nombreuses variantes de passages du Lorem Ipsum disponibles, mais la majorité ont subi des altérations sous une forme ou une autre, par injection d'humour ou par des mots aléatoires qui ne semblent même pas légèrement crédibles. Si vous comptez utiliser un passage du Lorem Ipsum, vous devez vous assurer qu'il n'y a rien d'embarrassant caché au milieu du texte. Tous les générateurs Lorem Ipsum sur Internet ont tendance à répéter des morceaux prédéfinis si nécessaire, ce qui en fait le premier véritable générateur sur Internet. Il utilise un dictionnaire de plus de 200 mots latins, combiné à une poignée de structures de phrases modèles, pour générer du Lorem Ipsum qui semble raisonnable. Le Lorem Ipsum généré est donc toujours exempt de répétitions, d'humour injecté, de mots non caractéristiques, etc.",
                style: GoogleFonts.kadwa(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

class _PolitiqueEtConfidantialiteState extends State<PolitiqueEtConfidantialite>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;
  bool isClick = false;
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Politiquede confidentialité',
          style: GoogleFonts.kadwa(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
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
                    Colors.greenAccent,
                    const Color.fromARGB(255, 104, 255, 109).withOpacity(.5),
                    Colors.white
                  ])),
              child: Opacity(
                opacity: _opacity.value,
                child: Transform.scale(
                  scale: _transform.value,
                  child: Container(
                    width: size.width * .9,
                    height: size.width * 1.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 90,
                        ),
                      ],
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 200,
                                  height: 100,
                                  child: Image.asset(
                                    "images/agri.png",
                                    fit: BoxFit.fitWidth,
                                  )),
                              Container(
                                width: size.width,
                                child: Text(
                                  "Il existe de nombreuses variantes de passages du Lorem Ipsum disponibles, mais la majorité ont subi des altérations sous une forme ou une autre, par injection d'humour ou par des mots aléatoires qui ne semblent même pas légèrement crédibles. Si vous comptez utiliser un passage du Lorem Ipsum, vous devez vous assurer qu'il n'y a rien d'embarrassant caché au milieu du texte. Tous les générateurs Lorem Ipsum sur Internet ont tendance à répéter des morceaux prédéfinis si nécessaire, ce qui en fait le premier véritable générateur sur Internet. Il utilise un dictionnaire de plus de 200 mots latins, combiné à une poignée de structures de phrases modèles, pour générer du Lorem Ipsum qui semble raisonnable. Le Lorem Ipsum généré est donc toujours exempt de répétitions, d'humour injecté, de mots non caractéristiques, etc.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.kadwa(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: isClick,
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() {
                                          isClick = !isClick;
                                        });
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'J\'ai lu et j\'ai approuvé',
                                    style: GoogleFonts.kadwa(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              component2('Valider', 1, () {
                                if (isClick) {
                                  print('Yes valider');
                                } else {
                                  _showSnackBar(
                                      'Veillez crochez l\'option lu et approuvé');
                                }
                              }),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
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
      child: Container(
        height: size.width / 8,
        width: size.width / width,
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
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  /* signin() {
    setState(() {
      inlogin = true;
      AuthService().signInWithGoogle();
    });
  }
 */

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: PRIMARY_COLOR,
        content: Text(message),
      ),
    );
  }
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
