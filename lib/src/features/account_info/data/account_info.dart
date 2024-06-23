class AccountInfo {
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final String? email;

  const AccountInfo({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.email,
  });

  factory AccountInfo.fromMap(Map<String, dynamic> map) {
    return AccountInfo(
      firstName: map['first_name'],
      lastName: map['last_name'],
      phoneNumber: map['phone_number'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() => {
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'email': email,
      };
}
