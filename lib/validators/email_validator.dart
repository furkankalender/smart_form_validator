import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';

class EmailValidator extends SmartFormValidatorService {
  final String errorMessage;

  EmailValidator(
      {this.errorMessage =
          "Validates if the input is a proper email address."});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }
}
