abstract class DictionaryBlocEvent { }

class LoadEvent extends DictionaryBlocEvent {

}

class UpdateEvent extends DictionaryBlocEvent {
  final int count;
  final String name;

  UpdateEvent(this.name, this.count);
}

class LoadedEvent extends DictionaryBlocEvent {

}