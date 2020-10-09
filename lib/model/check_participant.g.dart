// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_participant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckParticipantAdapter extends TypeAdapter<CheckParticipant> {
  @override
  final int typeId = 7;

  @override
  CheckParticipant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckParticipant(
      id: fields[0] as int,
      code: fields[1] as String,
      surname: fields[2] as String,
      name: fields[3] as String,
      middleName: fields[4] as String,
      position: fields[5] as String,
      responsible: fields[6] as bool,
      checkParticipantBranch: fields[7] as CheckParticipantBranch,
    );
  }

  @override
  void write(BinaryWriter writer, CheckParticipant obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.surname)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.middleName)
      ..writeByte(5)
      ..write(obj.position)
      ..writeByte(6)
      ..write(obj.responsible)
      ..writeByte(7)
      ..write(obj.checkParticipantBranch);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckParticipantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
