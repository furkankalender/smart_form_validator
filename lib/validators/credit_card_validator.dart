import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';


class CreditCardValidator extends SmartFormValidatorService {
  final String errorMessage;

  CreditCardValidator(
      {this.errorMessage = "Please enter a valid credit card number."});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    final cardRegex = RegExp(r'^\d{16}$');
    if (!cardRegex.hasMatch(value.replaceAll(' ', ''))) {
      return errorMessage;
    }

    return null;
  }
}
