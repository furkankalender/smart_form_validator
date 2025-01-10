import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';


/// Koşula bağlı çalışan dinamik doğrulayıcı
class DynamicValidator extends SmartFormValidatorService {
  final bool Function() condition;
  final SmartFormValidatorService validator;

  DynamicValidator({required this.condition, required this.validator});

  @override
  String? validate(String? value) {
    if (condition()) {
      return validator.validate(value);
    }
    return null;
  }
}
