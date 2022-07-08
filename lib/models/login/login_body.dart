class LoginBody {
  final String id;
  final String password;

  LoginBody({
    required this.id,
    required this.password
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'id': id,
      'password': password
    };
  }
}