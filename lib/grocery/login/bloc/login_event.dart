abstract class LoginEvents {}

class LoginSubmitted extends LoginEvents {
  final String email;
  final String password;

  LoginSubmitted(this.email, this.password);
}
