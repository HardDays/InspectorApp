// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction_check.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InstructionCheckAdapter extends TypeAdapter<InstructionCheck> {
  @override
  final int typeId = 6;

  @override
  InstructionCheck read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InstructionCheck(
      id: fields[0] as int,
      checkSubject: fields[1] as String,
      diggRequest: fields[2] as bool,
      checkStatus: fields[3] as CheckStatus,
      checkParticipants: (fields[4] as List)?.cast<CheckParticipant>(),
    );
  }

  @override
  void write(BinaryWriter writer, InstructionCheck obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.checkSubject)
      ..writeByte(2)
      ..write(obj.diggRequest)
      ..writeByte(3)
      ..write(obj.checkStatus)
      ..writeByte(4)
      ..write(obj.checkParticipants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstructionCheckAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
