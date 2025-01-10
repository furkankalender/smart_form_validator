import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';

export 'required_validator.dart';
export 'email_validator.dart';
export 'min_length_validator.dart';

/// Çoklu doğrulama işlemi için kullanılır.
class MultiValidator extends SmartFormValidatorService {
  final List<SmartFormValidatorService> validators;

  MultiValidator({required this.validators});

  @override
  String? validate(String? value) {
    for (var validator in validators) {
      final result = validator.validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
