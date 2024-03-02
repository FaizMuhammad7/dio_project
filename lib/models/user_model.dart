class UserModel{
  String name;
  String email;
  String password;

//<editor-fold desc="Data Methods">
  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          password == other.password);

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' name: $name,' +
        ' email: $email,' +
        ' password: $password,' +
        '}';
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}