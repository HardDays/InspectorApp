import 'package:inspector/model/instruction.dart';

abstract class InstructionBlocEvent {}

class FlushEvent extends InstructionBlocEvent {
  
} 

class LoadReportsEvent extends InstructionBlocEvent {

}

class RefreshReportsEvent extends InstructionBlocEvent {
  final bool showMessage;
  RefreshReportsEvent({this.showMessage = false});
} 

class UpadteInstructionStatusEvent extends InstructionBlocEvent {
  final int status;

  UpadteInstructionStatusEvent(this.status);
}