class DictionaryBlocState {

}

class LoadingState extends DictionaryBlocState {
  final int count;
  final String name;

  LoadingState(this.name, this.count);
}

class LoadedState extends DictionaryBlocState {

}