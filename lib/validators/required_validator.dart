

import 'smart_form_validator_service.dart.dart';

class RequiredValidator extends SmartFormValidatorService {
  final String errorMessage;

  RequiredValidator({this.errorMessage = "Bu alan boş bırakılamaz."});

  @override
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
