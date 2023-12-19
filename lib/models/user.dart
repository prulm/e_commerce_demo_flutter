class User {
  final int id;
  final String firstName;
  final String lastName;
  final String profilePicture;
  final String email;
  final String phone;
  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.profilePicture,
      required this.email,
      required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'profilePicture': profilePicture,
      'email': email,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['content'],
      lastName: map['lastName'],
      profilePicture: map['profilePicture'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
