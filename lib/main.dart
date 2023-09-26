import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:test_hive/ui/home/games_screen.dart';

import 'models/game_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir =
  await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox("myBox");
  Hive.registerAdapter(GameModelAdapter());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: false,
      ),
      home: const GamesScreen(),
    );
  }
}

