import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';

class MinLengthValidator extends SmartFormValidatorService {
  final int minLength;
  final String errorMessage;

  MinLengthValidator({required this.minLength, String? customMessage})
      : errorMessage =
            customMessage ?? "En az $minLength karakter girilmelidir.";

  @override
  String? validate(String? value) {
    if (value == null || value.length < minLength) {
      return errorMessage;
    }
    return null;
  }
}
