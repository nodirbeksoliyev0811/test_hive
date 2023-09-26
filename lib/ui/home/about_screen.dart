import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/game_model.dart';
import 'games_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key, required this.gamesData});

  final GameModel gamesData;

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final _myBox = Hive.box("myBox");
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {});
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const GamesScreen(),
                ));
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        title: const Text(
          "Datails",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              color = Colors.black38;
              _myBox.add(widget.gamesData.thumbnail);
              // _myBox.add(widget.gamesData.title);
              setState(() {});
            },
            icon: Icon(
              Icons.save,
              color: color,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.gamesData.thumbnail,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.gamesData.title,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Company: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 21),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.gamesData.developer,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Genre: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 21),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.gamesData.genre,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Support platforms: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 21),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.gamesData.platform,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Release date: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 21),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.gamesData.releaseDate,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Description: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 21),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.gamesData.shortDescription,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Link to downlod: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 21),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse(widget.gamesData.gameUrl);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Text(
                      widget.gamesData.gameUrl,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
