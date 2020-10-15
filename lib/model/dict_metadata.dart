
class DictMetadata {
  final DateTime loadetAt;
  final Map<String, bool> loaded;
  
  DictMetadata({
    this.loaded,
    this.loadetAt
  });

  factory DictMetadata.fromJson(Map<String, dynamic> json) {
    return DictMetadata(
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