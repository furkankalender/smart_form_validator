import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';


class DateValidator extends SmartFormValidatorService {
  final String errorMessage;
  final String format;

  DateValidator(
      {this.errorMessage = "Invalid date format.", this.format = "yyyy-MM-dd"});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    try {
      DateTime.parse(value);
      return null;
    } catch (_) {
      return "$errorMessage Expected format: $format";
    }
  }
}
