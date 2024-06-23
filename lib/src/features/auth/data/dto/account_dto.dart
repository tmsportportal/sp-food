class AccountDto {
  final String? username;
  final String? password;

  const AccountDto([this.username, this.password]);

  factory AccountDto.fromJson(Map<String, dynamic> json) {
    return AccountDto(
      json['username'],
      json['password'],
    );
  }

  Map<String, dynamic> toMap() => {
        'username': username,
        'password': password,
      };

  bool get isEmpty =>
      (username?.isEmpty ?? false) && (password?.isEmpty ?? false);
}
