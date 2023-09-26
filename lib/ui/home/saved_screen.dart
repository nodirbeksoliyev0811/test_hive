import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../models/game_model.dart';
import 'about_screen.dart';
import 'games_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key, required this.gamesData});

  final List<GameModel> gamesData;

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final _myBox = Hive.box("myBox");

  @override
  Widget build(BuildContext context) {
    GameModel model = widget.gamesData.first;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const GamesScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Saved Games",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _myBox.isNotEmpty?ListView.builder(
        itemCount: _myBox.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(20),
          child: ZoomTapAnimation(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutScreen(
                    gamesData: model,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          _myBox.getAt(index),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(
                      _myBox.getAt(index),
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _myBox.delete(index);
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ):const Text("")
    );
  }
}
