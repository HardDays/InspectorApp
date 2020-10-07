// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InstructionAdapter extends TypeAdapter<Instruction> {
  @override
  final int typeId = 2;

  @override
  Instruction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Instruction(
      id: fields[0] as int,
      instructionNum: fields[1] as String,
      instructionDate: fields[2] as String,
      reportDate: fields[3] as String,
      checkDate: fields[4] as String,
      checkType: fields[5] as CheckType,
      instructionStatus: fields[7] as InstructionStatus,
      instructionChecks: (fields[8] as List)?.cast<InstructionCheck>(),
      normativeActs: (fields[9] as List)?.cast<NormativeAct>(),
      instructionCreator: fields[6] as User,
    );
  }

  @override
  void write(BinaryWriter writer, Instruction obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.instructionNum)
      ..writeByte(2)
      ..write(obj.instructionDate)
      ..writeByte(3)
      ..write(obj.reportDate)
      ..writeByte(4)
      ..write(obj.checkDate)
      ..writeByte(5)
      ..write(obj.checkType)
      ..writeByte(6)
      ..write(obj.instructionCreator)
      ..writeByte(7)
      ..write(obj.instructionStatus)
      ..writeByte(8)
      ..write(obj.instructionChecks)
      ..writeByte(9)
      ..write(obj.normativeActs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstructionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
