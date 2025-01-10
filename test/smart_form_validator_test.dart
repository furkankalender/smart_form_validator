import 'package:flutter_test/flutter_test.dart';
import 'package:smart_form_validator/validators/dynamic_validator.dart';
import 'package:smart_form_validator/validators/email_validator.dart';
import 'package:smart_form_validator/validators/required_validator.dart';

void main() {
  group('RequiredValidator Test', () {
    test('Boş değer hata verir', () {
      final validator = RequiredValidator();
      expect(validator.validate(''), "Bu alan boş bırakılamaz.");
    });

    test('Dolu değer hata vermez', () {
      final validator = RequiredValidator();
      expect(validator.validate('Merhaba'), null);
    });
  });

  group('EmailValidator Test', () {
    test('Geçersiz e-posta hata verir', () {
      final validator = EmailValidator();
      expect(validator.validate('deneme'), "Geçerli bir e-posta giriniz.");
    });

    test('Geçerli e-posta hata vermez', () {
      final validator = EmailValidator();
      expect(validator.validate('deneme@example.com'), null);
    });
  });


  test('Koşul sağlandığında doğrulama yapılır', () {
    bool isCompany = true;

    final validator = DynamicValidator(
      condition: () => isCompany,
      validator: RequiredValidator(errorMessage: "Vergi Numarası gerekli."),
    );

    expect(validator.validate(''), "Vergi Numarası gerekli.");
    expect(validator.validate('1234567890'), null);
  });

  test('Koşul sağlanmadığında doğrulama yapılmaz', () {
    bool isCompany = false;

    final validator = DynamicValidator(
      condition: () => isCompany,
      validator: RequiredValidator(errorMessage: "Vergi Numarası gerekli."),
    );

    expect(validator.validate(''), null);
  });

}

