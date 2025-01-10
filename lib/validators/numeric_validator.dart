import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';

class NumericValidator extends SmartFormValidatorService {
  final String errorMessage;

  NumericValidator({this.errorMessage = "Please enter a numeric value."});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    if (double.tryParse(value) == null) {
      return errorMessage;
    }

    return null;
  }
}
