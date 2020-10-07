import 'package:hive/hive.dart';
import 'package:inspector/model/check_participant.dart';
import 'package:inspector/model/check_participant_branch.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_check.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

class HiveInstructionService {
  LazyBox _box;

  Future init() async {
    if (_box == null) {
      final adapters = {
        HiveTypeId.UserId: UserAdapter(),
        HiveTypeId.CheckParticipantBranchId: CheckParticipantBranchAdapter(),
        HiveTypeId.CheckParticipantId: CheckParticipantAdapter(),
        HiveTypeId.CheckStatusId: CheckStatusAdapter(),
        HiveTypeId.CheckTypeId: CheckTypeAdapter(),
        HiveTypeId.InstructionCheckId: InstructionCheckAdapter(),
        HiveTypeId.InstructionId: InstructionAdapter(),
        HiveTypeId.InstructionStatusId: InstructionStatusAdapter(),
        HiveTypeId.NormativeActId: NormativeActAdapter()
      };

      for (final id in adapters.keys) {
        if (!Hive.isAdapterRegistered(id)) {
          Hive.registerAdapter(adapters[id]);
        }
      }

      _box = await Hive.openLazyBox('instructionList');
    }
  }

  Future saveInstructions(List<Instruction> instructions) async {
    return await _box.put('list', instructions);
  }

  Future<List<Instruction>> getInstructions() async {
    return _box.get('list');
  }
}
