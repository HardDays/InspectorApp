import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/lazy_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_instruction_statuses_service.dart';

class InstructionStatusesService extends LazyCollectionService<InstructionStatus> {

  static final _instance = InstructionStatusesService._internal();

  factory InstructionStatusesService() {
    return _instance;
  }

  InstructionStatusesService._internal() : super(
    ObjectDbInstructionsStatusesService(), 
    ApiService().getInstructionStatuses,
  );
}
