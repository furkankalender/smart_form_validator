import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';


class UrlValidator extends SmartFormValidatorService {
  final String errorMessage;

  UrlValidator({this.errorMessage = "Please enter a valid URL."});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }

    final urlRegex =
        RegExp(r'^(https?:\/\/)?([\w\d\-_]+\.+[A-Za-z]{2,})+\/?.*$');
    if (!urlRegex.hasMatch(value)) {
      return errorMessage;
    }

    return null;
  }
}
