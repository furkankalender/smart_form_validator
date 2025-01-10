import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';

class PasswordStrengthValidator extends SmartFormValidatorService {
  final String errorMessage;

  PasswordStrengthValidator({this.errorMessage = "Password is too weak."});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty.";
    }

    final passwordRegex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return errorMessage;
    }

    return null;
  }
}
