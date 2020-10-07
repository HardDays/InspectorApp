// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckStatusAdapter extends TypeAdapter<CheckStatus> {
  @override
  final int typeId = 4;

  @override
  CheckStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckStatus(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CheckStatus obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
