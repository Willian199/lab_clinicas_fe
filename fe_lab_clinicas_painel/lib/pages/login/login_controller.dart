import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/service/user/user_login_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessageStateMixin, DDIInject<UserLoginService> {
  LoginController();

  final _obscurePassword = signal(true);
  final _logged = signal(false);

  bool get logged => _logged();
  bool get obscurePassword => _obscurePassword();

  void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String password) async {
    final loginResult = await instance.execute(email, password).asyncLoader();

    switch (loginResult) {
      case Left(value: ServiceException(:final message)):
        showError(message);
      case Right(value: _):
        _logged.value = true;
    }
  }
}
