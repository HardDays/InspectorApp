
import 'package:inspector/model/instruction.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';

class ObjectDBInstructionsService extends ObjectDbCollectionService<Instruction> {

  String get name => 'instructions.db';

  ObjectDBInstructionsService(): super(Instruction.fromJson);
}
