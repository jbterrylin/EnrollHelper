class Day {
  int day;
  List<String> time = List<String>();

  Day(this.day, this.time);

  Day.fromClass({this.day, this.time});

  Map<String, dynamic> toJson() => {
        'day': day,
        'time': time,
      };

  factory Day.fromJson(Map<String, dynamic> json) {
    return new Day.fromClass(
        day: json['day'], time: List<String>.from(json['time']));
    // .cast<List<String>>());
  }
}
