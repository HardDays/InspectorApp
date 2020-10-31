import 'package:inspector/model/control_object.dart';

abstract class ControlListBlocState {}

class LoadingState extends ControlListBlocState {} 

class RefreshState extends ControlListBlocState {
  final List<ControlObject> objects;
  final Future loadingFuture;

  RefreshState(this.objects, this.loadingFuture);
}

class LoadedState extends ControlListBlocState {
  final List<ControlObject> objects;

  LoadedState(this.objects);
}