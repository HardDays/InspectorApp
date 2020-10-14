
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';

class ObjectDbInstructionsStatusesService extends ObjectDbCollectionService<InstructionStatus> {

  String get name => 'instruction_statuses.db';

  ObjectDbInstructionsStatusesService(): super((json) => InstructionStatus.fromJson(json));
}
