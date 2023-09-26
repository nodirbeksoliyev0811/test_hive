// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameModelAdapter extends TypeAdapter<GameModel> {
  @override
  final int typeId = 1;

  @override
  GameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameModel(
      id: fields[0] as int,
      title: fields[1] as String,
      thumbnail: fields[2] as String,
      shortDescription: fields[3] as String,
      gameUrl: fields[4] as String,
      genre: fields[5] as String,
      platform: fields[6] as String,
      publisher: fields[7] as String,
      developer: fields[8] as String,
      releaseDate: fields[9] as String,
      freetogameProfileUrl: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GameModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.shortDescription)
      ..writeByte(4)
      ..write(obj.gameUrl)
      ..writeByte(5)
      ..write(obj.genre)
      ..writeByte(6)
      ..write(obj.platform)
      ..writeByte(7)
      ..write(obj.publisher)
      ..writeByte(8)
      ..write(obj.developer)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.freetogameProfileUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
