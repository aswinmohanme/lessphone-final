// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_app.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomAppAdapter extends TypeAdapter<CustomApp> {
  @override
  final int typeId = 1;

  @override
  CustomApp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomApp(
      name: fields[0] as String,
      packageName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CustomApp obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.packageName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomAppAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
