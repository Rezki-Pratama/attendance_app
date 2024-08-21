class Attendance {
  final int id;
  final String checkInTime;
  String checkOutTime;
  final bool isWithinLocation;
  final String timeStamps;

  Attendance(
      {this.id = 0,
      this.checkInTime = "",
      this.checkOutTime = "",
      this.isWithinLocation = false,
      this.timeStamps = ""});
}
