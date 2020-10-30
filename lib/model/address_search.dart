class AddressSearch {
  
  final String district;
  final String area;
  final String house;
  final String street;
  final double lat;
  final double lng;

  AddressSearch({
    this.district,
    this.area,
    this.house,
    this.street,
    this.lat,
    this.lng,
  });

  @override
  String toString() {
    final data = [area, district, street, house];
    return data.where((element) => element != null).join(', ');
  }

}