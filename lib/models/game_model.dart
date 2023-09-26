import 'package:hive/hive.dart';

part 'game_model.g.dart';
/// 1
@HiveType(typeId: 1)
class GameModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String thumbnail;
  @HiveField(3)
  final String shortDescription;
  @HiveField(4)
  final String gameUrl;
  @HiveField(5)
  final String genre;
  @HiveField(6)
  final String platform;
  @HiveField(7)
  final String publisher;
  @HiveField(8)
  final String developer;
  @HiveField(9)
  final String releaseDate;
  @HiveField(10)
  final String freetogameProfileUrl;

  GameModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      thumbnail: json["thumbnail"] as String? ?? "",
      shortDescription: json["short_description"] as String? ?? "",
      gameUrl: json["game_url"] as String? ?? "",
      genre: json["genre"] as String? ?? "",
      platform: json["platform"] as String? ?? "",
      publisher: json["publisher"] as String? ?? "",
      developer: json["developer"] as String? ?? "",
      releaseDate: json["release_date"] as String? ?? "",
      freetogameProfileUrl: json["freetogame_profile_url"] as String? ?? "",
    );
  }
}
/// 2
// class CurrencyModel {
//   int id;
//   String cardType;
//   String cardNumber;
//   String bankName;
//   num moneyAmount;
//   String cardCurrency;
//   String expireDate;
//   String iconImage;
//   CurrencyColors colors;
//
//   CurrencyModel({
//     required this.id,
//     required this.cardType,
//     required this.cardNumber,
//     required this.bankName,
//     required this.moneyAmount,
//     required this.cardCurrency,
//     required this.expireDate,
//     required this.iconImage,
//     required this.colors,
//   });
//
//   factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
//     id: json["id"] as int? ?? 0,
//     cardType: json["card_type"] as String? ?? '',
//     cardNumber: json["card_number"] as String? ?? '',
//     bankName: json["bank_name"] as String? ?? '',
//     moneyAmount: json["money_amount"] as num? ?? 0,
//     cardCurrency: json["card_currency"] as String? ?? '',
//     expireDate: json["expire_date"] as String? ?? '',
//     iconImage: json["icon_image"] as String? ?? '',
//     colors: CurrencyColors.fromJson(json["colors"] as Map<String,dynamic>? ?? {}),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "card_type": cardType,
//     "card_number": cardNumber,
//     "bank_name": bankName,
//     "money_amount": moneyAmount,
//     "card_currency": cardCurrency,
//     "expire_date": expireDate,
//     "icon_image": iconImage,
//     "colors": colors.toJson(),
//   };
// }
// class CurrencyColors {
//   String colorA;
//   String colorB;
//
//   CurrencyColors({
//     required this.colorA,
//     required this.colorB,
//   });
//
//   factory CurrencyColors.fromJson(Map<String, dynamic> json) => CurrencyColors(
//     colorA: json["color_a"] ?? '',
//     colorB: json["color_b"] ?? '',
//   );
//
//   Map<String, dynamic> toJson() => {
//     "color_a": colorA,
//     "color_b": colorB,
//   };
// }