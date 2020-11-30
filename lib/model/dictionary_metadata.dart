
class DictionaryMetadata {
  final DateTime loadetAt;
  final Map<String, bool> loaded;
  
  DictionaryMetadata({
    this.loaded,
    this.loadetAt
  });

  factory DictionaryMetadata.fromJson(Map<String, dynamic> json) {
    return DictionaryMetadata(
      loadetAt: json['loadetAt'] != null ? DateTime.parse(json['loadetAt']) : null, 
      loaded: json['loaded'] != null ? json['loaded'].cast<String, bool>() : {}, 
    );
  }
  
   Map<String, dynamic> toJson() {
    return {
      'loadetAt': loadetAt?.toString(),
      'loaded': loaded,
    };
  }
}