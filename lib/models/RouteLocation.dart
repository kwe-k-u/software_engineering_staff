

class RouteLocation {
  String name;
  double latitude;
  double longitude;

  RouteLocation({
    required this.name,
    required this.latitude,
    required this.longitude,
});

  factory RouteLocation.fromJson(Map<String,dynamic> map) => RouteLocation(
  name: map["name"],
  latitude: map["latitude"],
  longitude: map["longitude"]
  );

  Map<String, dynamic> toJson() => {
    "name" : name,
    "longitude" : longitude,
    "latitude" : latitude
  };
}