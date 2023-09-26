import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../models/game_model.dart';
import '../about_screen.dart';

class ContactSearchView extends SearchDelegate {
  ContactSearchView({required this.suggestionList});

  final List<GameModel> suggestionList;


  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, query);
        },
      );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<GameModel> suggestions = suggestionList.where((searchResult) {
      final result = searchResult.title.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: List.generate(
        suggestions.length,
        (index) => GestureDetector(
          child: ZoomTapAnimation(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AboutScreen(gamesData: suggestions[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            suggestions[index].thumbnail,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          suggestions[index].title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          onTap: () {
            query = suggestions[index].title;
            // close(context, query);
          },
        ),
      ),
    );
  }
}
