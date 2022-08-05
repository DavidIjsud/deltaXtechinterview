class Ubication {
  final double lat;
  final double lng;

  Ubication({required this.lat, required this.lng});

  factory Ubication.fromJson(Map<String, dynamic> json) {
    return Ubication(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}
