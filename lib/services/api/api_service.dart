import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';

class ApiService {

  final api = ApiProvider();

  dynamic _parse(Function parser) {
    try {
      return parser(); 
    } catch (ex) {
      throw ParseException();
    }
  }

  // instructions

  Future<List<Instruction>> getInstructions() async {
    final data = await api.getInstructions();
    return await _parse(
      ()=> List<Instruction>.from(data['data'].map((d) => Instruction.fromJson(d)))
    );
  }

  Future<Instruction> getInstruction(int id) async {
    final data = await api.getInstruction(id);
    return await _parse(
      ()=> Instruction.fromJson(data)
    );
  }
  
  Future <Instruction> updateInstruction(int id, {InstructionStatus instructionStatus}) async {
    final data = await api.updateInstruction(id, instructionStatus: instructionStatus);
    return await _parse(
      ()=> Instruction.fromJson(data)
    );
  }

  // areas
  
  Future<List<Area>> getAreas() async {
    final data = await api.getAreas();
    return await _parse(
      ()=> List<Area>.from(data['data'].map((d) => Area.fromJson(d)))
    );
  }

  // districts

  Future<List<District>> getDistricts() async {
    final data = await api.getDistricts();
    return await _parse(
      ()=> List<District>.from(data['data'].map((d) => District.fromJson(d)))
    );
  }

  // streets

  Future<List<Street>> getStreets() async {
    final data = await api.getStreets();
    return await _parse(
      ()=> List<Street>.from(data['data'].map((d) => Street.fromJson(d)))
    );
  }


}