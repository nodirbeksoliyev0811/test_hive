import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_hive/ui/home/saved_screen.dart';
import 'package:test_hive/ui/home/widgets/search_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/network/api_provider.dart';
import '../../data/network/api_repository.dart';
import '../../models/game_model.dart';
import 'about_screen.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  final GameRepository gameRepository =
      GameRepository(apiProvider: ApiProvider());

  List<String> images = [];
  List<GameModel> model = [];

  void init() async {
    model = await gameRepository.fetchGames();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedScreen(gamesData: model),
                  ),
                );
              },
              icon: const Icon(
                Icons.file_download_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () async {
                await showSearch(
                  context: context,
                  delegate: ContactSearchView(
                    suggestionList: model,
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.yellow,
        title: const Text(
          "Games",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<GameModel>>(
        future: gameRepository.fetchGames(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<GameModel>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(
                color: Colors.black,
                backgroundColor: Colors.yellow,
              ),
            );
          } else if (snapshot.hasData) {
            List<GameModel> currencies = snapshot.data!;
            images = currencies.map((currency) => currency.thumbnail).toList();
            return currencies.isNotEmpty
                ? Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 60,
                            offset: const Offset(0, 5),
                            spreadRadius: 30,
                            color: Colors.yellow.withOpacity(0.8),
                          ),
                        ]),
                        child: SizedBox(
                          height: 180,
                          width: 400,
                          child: CarouselSlider(
                            items: images.map((url) {
                              return ZoomTapAnimation(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AboutScreen(
                                          gamesData:
                                              currencies[images.indexOf(url)]),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(url),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 200,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 3,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "All Games",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: currencies.length,
                          itemBuilder: (context, index) {
                            GameModel currency = currencies[index];
                            return ListTile(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AboutScreen(gamesData: currency),
                                  ),
                                );
                              },
                              title: Text(
                                currency.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currency.shortDescription,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: const Icon(Icons.arrow_right,
                                  color: Colors.black),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.not_interested_outlined,
                        color: Colors.red,
                        size: 70,
                      ),
                      Center(
                        child: Text("Not Fount !!!"),
                      ),
                    ],
                  );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return const Center(
              child: Text("No data available"),
            );
          }
        },
      ),
    );
  }
}
