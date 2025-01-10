import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';


class RangeValidator extends SmartFormValidatorService {
  final double min;
  final double max;
  final String errorMessage;

  RangeValidator({required this.min, required this.max, String? customMessage})
      : errorMessage = customMessage ?? "Value must be between $min and $max.";

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    final numValue = double.tryParse(value);
    if (numValue == null || numValue < min || numValue > max) {
      return errorMessage;
    }

    return null;
  }
}
