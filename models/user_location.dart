class UserLocation {
  String? lattitude;
  String? longitude;

  Map<String, dynamic> toJson() => {
        "lattitude": lattitude,
        "longitude": longitude,
      };
}
