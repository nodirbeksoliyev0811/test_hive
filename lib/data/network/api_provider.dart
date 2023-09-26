import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/game_model.dart';
import '../../models/universal_response.dart';

class ApiProvider {
  Future<UniversalResponse> getAllCurrencies() async {
    Uri uri = Uri.parse("https://www.freetogame.com/api/games");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => GameModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");

    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }
}
