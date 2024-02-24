import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:video_player/video_player.dart';
import '../constants/cons.dart';
import '../widget/smsWidget.dart';

class Messagerie extends StatefulWidget {
  const Messagerie({super.key});

  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  File? photopapierpath;
  String? photopapiername;
  String? photopapierdata;
  ImagePicker imagePicker = ImagePicker();

  // Pour choisi une image
  Future<void> getImagePapier() async {
    var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (getimage != null) {
      setState(() {
        photopapierpath = File(getimage.path);
        photopapiername = getimage.path.split('/').last;
        photopapierdata = base64Encode(photopapierpath!.readAsBytesSync());

        //

        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width * .6,
              height: 200,
              child: Image.file(
                photopapierpath!,
                fit: BoxFit.contain,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Annuler".toUpperCase(),
                            style: GoogleFonts.kadwa(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Envoyer".toUpperCase(),
                            style: GoogleFonts.kadwa(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ).then((returnVal) {});
      });
    }
  }

  // Pour faire la camera
  Future<void> getCameraPapier() async {
    var getimage = await imagePicker.pickImage(source: ImageSource.camera);
    if (getimage != null) {
      setState(() {
        photopapierpath = File(getimage.path);
        photopapiername = getimage.path.split('/').last;
        photopapierdata = base64Encode(photopapierpath!.readAsBytesSync());
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width * .6,
              height: 200,
              child: Image.file(
                photopapierpath!,
                fit: BoxFit.contain,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Annuler".toUpperCase(),
                            style: GoogleFonts.kadwa(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Envoyer".toUpperCase(),
                            style: GoogleFonts.kadwa(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ).then((returnVal) {});
      });
    }
  }

  // Pour choisi la video
  VideoPlayerController? videoController;
  String? videoPath;
  File? pathVideo;
  Future<void> videoPicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'mkv', 'avi'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        videoPath = result.files.first.path;
        pathVideo = File(result.files.first.path!);
        videoController = VideoPlayerController.file(pathVideo!)
          ..initialize().then((_) {
            setState(() {});
            videoController!.play();
            videoController!.setVolume(1);
          });
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content:
                Container(height: 200, child: VideoPlayer(videoController!)),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Annuler".toUpperCase(),
                            style: GoogleFonts.kadwa(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Envoyer".toUpperCase(),
                            style: GoogleFonts.kadwa(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ).then((returnVal) {});
        print(videoPath);
      });
      print(
          "video: $videoPath"); // Vous devez utiliser la variable $pdfassurancePath pour voir le chemin du fichier.
    }
  }

  // Pour les audios
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecord = false;
  bool isPlayRecord = false;
  String audioPath = '';
  bool isOneRecord = false;
  @override
  void initState() {
    // TODO: implement initState
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    audioRecord.dispose();
    super.dispose();
  }

  Future<void> commencerRecord() async {
    try {
      //
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecord = true;
          /* Timer.periodic(Duration(seconds: 2), (timer) {
            setState(() {});
          }); */
        });
      }
    } catch (e) {
      print('Error lors d\'enregistrement : $e');
    }
  }

  Future<void> arreteRecord() async {
    try {
      //
      if (await audioRecord.hasPermission()) {
        String? path = await audioRecord.stop();
        setState(() {
          isRecord = false;
          audioPath = path!;
        });
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Container(
              child: ListTile(
                onTap: () {
                  isPlayRecord ? pauseRecord() : playRecord();
                  setState(() {});
                },
                leading: CircleAvatar(
                  backgroundColor: PRIMARY_COLOR,
                  child: isPlayRecord
                      ? Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                ),
                title: Text(
                  isPlayRecord ? 'lecture...' : 'pause',
                  style: GoogleFonts.kadwa(
                    fontSize: 15,
                  ),
                ),
                dense: true,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Annuler".toUpperCase(),
                            style: GoogleFonts.kadwa(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Envoyer".toUpperCase(),
                            style: GoogleFonts.kadwa(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ).then((returnVal) {});
      }
    } catch (e) {
      print('Error lors d\'arret : $e');
    }
  }

  Future<void> playRecord() async {
    isPlayRecord = true;
    try {
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print('Erreu de lecture : $e');
    }
  }

  Future<void> pauseRecord() async {
    isPlayRecord = false;
    try {
      await audioPlayer.pause();
    } catch (e) {
      print('Erreu de lecture : $e');
    }
  }

  TextEditingController sms = TextEditingController();
  List<String> messageListe = [
    'Bonjour Boss',
    'Je me porte à merveille',
    'La journée à été tres sublime',
    'La vie est comme ça',
    'Nickel',
  ];

  bool isSend = false;
  bool search = true;

  int idConnecter = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Message',
          style: GoogleFonts.kadwa(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'images/fond.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 70,
            child: Container(
              width: size.width,
              height: size.height,
              child: ListView.builder(
                itemCount: messageListe.length,
                itemBuilder: (context, index) => WidgetSMS(
                  sender: idConnecter == Random().nextInt(3) ? true : false,
                  sms: '${messageListe[index]}',
                  name: "ALAGBE",
                  prename: "Faïd",
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: Container(
                            width: size.width * .6,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        getCameraPapier();
                                        setState(() {});
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.pink[600],
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Camera',
                                            style: GoogleFonts.kadwa(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        getImagePapier();
                                        setState(() {});
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.green,
                                            child: Icon(
                                              Icons.image,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Image',
                                            style: GoogleFonts.kadwa(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        videoPicker();
                                        setState(() {});
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.blue[600],
                                            child: Icon(
                                              Icons.video_camera_back,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Video',
                                            style: GoogleFonts.kadwa(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).then((returnVal) {});
                    },
                    child: Icon(
                      Icons.link,
                      color: PRIMARY_COLOR,
                    ),
                  ),
                  Container(
                    width: size.width - 160,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: size.width / 30, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: sms,
                      style: TextStyle(color: Colors.black.withOpacity(.8)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintMaxLines: 1,
                        hintText: 'Ecrire un message',
                        hintStyle: GoogleFonts.kadwa(
                            fontSize: 14, color: Colors.black.withOpacity(.5)),
                      ),
                      maxLines: 4,
                      minLines: 1,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (sms.text.isEmpty || sms.text.startsWith(" ")) {
                        print('null');
                      } else {
                        ajouterSms(sms.text);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: PRIMARY_COLOR,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onLongPress: () {
                      print('OK presse');
                    },
                    onTap: () {
                      isRecord ? arreteRecord() : commencerRecord();
                      print('tap');
                    },
                    child: isRecord
                        ? CircleAvatar(
                            backgroundColor: PRIMARY_COLOR,
                            child: Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.mic,
                              color: PRIMARY_COLOR,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void ajouterSms(String value) {
    setState(() {
      messageListe.add(value);
      sms.clear();
    });
  }
}
/*

Center(
        child: Text(
          'Pas de message pour le moment',
          style: GoogleFonts.kadwa(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
        ),
      ),

 */
