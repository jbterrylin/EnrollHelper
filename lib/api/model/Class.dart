class Class {
  Class(this.id);

  Class.fromClass(
      {this.id, this.priority, this.classcode, this.day, this.time});

  int id;
  int priority = 99;
  String classcode;
  List<int> day = new List();
  List<List<String>> time = new List();

  Map<String, dynamic> toJson() => {
        'id': id,
        'priority': priority,
        'classcode': classcode,
        'day': day,
        'time': time,
      };

  factory Class.fromJson(Map<String, dynamic> json) {
    return new Class.fromClass(
        id: json['id'],
        priority: json['priority'],
        classcode: json['classcode'],
        day: json['day'].cast<int>(),
        time: json['time']
            .map<List<String>>((l) => List<String>.from(l))
            .toList());
    // .cast<List<String>>());
  }

  // Class.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       priority = json['priority'],
  //       classcode = json['classcode'],
  //       day = json['day'],
  //       time = json['time'];
}
