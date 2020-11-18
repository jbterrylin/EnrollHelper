class User {
  User();

  User.fromClass({this.name});

  String name;

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return new User.fromClass(
      name: json['name'],
    );
  }
}
