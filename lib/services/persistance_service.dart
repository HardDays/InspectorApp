import 'package:inspector/services/mixins/data_sending_configuration_mixin.dart';
import 'package:inspector/services/mixins/instruction_mixin.dart';
import 'package:inspector/services/mixins/user_mixin.dart';

abstract class PersistanceService with UserMixin, InstructionMixin, DataSendingConfigurationMixin {}