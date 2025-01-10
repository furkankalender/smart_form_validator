import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';


class PhoneValidator extends SmartFormValidatorService {
  final String errorMessage;

  PhoneValidator({this.errorMessage = "Please enter a valid phone number."});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return errorMessage;
    }

    return null;
  }
}
