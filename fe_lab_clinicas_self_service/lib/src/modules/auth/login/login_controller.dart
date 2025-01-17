import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/services/user/user_login_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessageStateMixin {
  LoginController(this._userLoginService);

  final UserLoginService _userLoginService;

  final _obscurePassword = signal(true);
  bool get obscurePassword => _obscurePassword();

  final _logged = signal(false);
  bool get logged => _logged();

  void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String password) async {
    final loginResult = await _userLoginService.execute(email, password).asyncLoader();

    switch (loginResult) {
      case Left(value: ServiceException(:final message)):
        showError(message);
        break;
      case Right(value: _):
        _logged.value = true;
    }
  }
}
