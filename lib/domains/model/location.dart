class Location {
  final int id;
  String name;
  final double latitude;
  final double longitude;
  final bool isActive;
  final String timeStamps;

  Location(
      {this.id = 0,
      this.name = "",
      this.latitude = 0.0,
      this.longitude = 0.0,
      this.isActive = false,
      this.timeStamps = ""});
}
