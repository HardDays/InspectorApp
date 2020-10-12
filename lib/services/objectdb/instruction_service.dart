
import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';

class ObjectDBInstructionService extends ObjectDBService {
  // LazyBox _box;

  // Future init() async {
  //   if (_box == null) {
  //     final adapters = {
  //       HiveTypeId.UserId: UserAdapter(),
  //       //HiveTypeId.CheckParticipantBranchId: CheckParticipantBranchAdapter(),
  //       HiveTypeId.CheckParticipantId: CheckParticipantAdapter(),
  //       HiveTypeId.CheckStatusId: CheckStatusAdapter(),
  //       HiveTypeId.CheckTypeId: CheckTypeAdapter(),
  //       HiveTypeId.InstructionCheckId: InstructionCheckAdapter(),
  //       HiveTypeId.InstructionId: InstructionAdapter(),
  //       HiveTypeId.InstructionStatusId: InstructionStatusAdapter(),
  //       HiveTypeId.NormativeActId: NormativeActAdapter()
  //     };

  //     for (final id in adapters.keys) {
  //       if (!Hive.isAdapterRegistered(id)) {
  //         Hive.registerAdapter(adapters[id]);
  //       }
  //     }

  //     _box = await Hive.openLazyBox('instructionList');
  //   }
  // }

  String get name => 'instructions.db';

  Future save(List<Instruction> instructions) async {
    await init();
    try {
      await db.remove({});
      await db.insertMany(instructions.map((e) => e.toJson()).toList());
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Instruction>> getAll() async {
    await init();
    try {
      final data = await db.find({});
      return List<Instruction>.from(data.map((e) => Instruction.fromJson(e)));
    } catch (ex) {
      print(ex);
      throw ParseException();
    }
  }
}
