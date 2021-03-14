extension ObjectExtensions on Object {
  
  T apply<T>(void Function(T) function) {
    function(this);
    return this;
  }

  T println<T>() => apply(print);

  E let<T, E>(E Function(T) function) => function(this);

}