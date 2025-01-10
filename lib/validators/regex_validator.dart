import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';


class RegexValidator extends SmartFormValidatorService {
  final String pattern;
  final String errorMessage;

  RegexValidator({required this.pattern, this.errorMessage = "Invalid input."});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return errorMessage;
    }

    return null;
  }
}
