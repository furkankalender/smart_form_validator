# 📄 **Smart Form Validator - Flutter Package Documentation**

---

## 🚀 **Introduction**

**Smart Form Validator** is a comprehensive Flutter package that simplifies form validation with a wide range of built-in and customizable validators. It offers real-time feedback, dynamic conditions, and AI-powered text validation, enhancing the user experience for complex form structures.

---

## 📦 **Installation**

Add the package to your Flutter project by including it in your `pubspec.yaml` file:

```yaml
dependencies:
  smart_form_validator:
    path: ../  # For local development, or replace with the published version
```

Install the dependencies:

```bash
flutter pub get
```

---

## 🏗️ **Folder Structure**

```
smart_form_validator/
├── lib/
│   ├── smart_form_validator.dart  # Main export file
│   ├── validators/                # Validator classes
│   │   ├── required_validator.dart
│   │   ├── email_validator.dart
│   │   ├── phone_validator.dart
│   │   ├── password_strength_validator.dart
│   │   └── ... (other validators)
│   ├── widgets/
│   │   └── smart_form_field.dart  # Custom form field with real-time feedback
├── example/                       # Example app
└── test/                          # Unit tests
```

---

## ✨ **Features**

1. ✅ **Built-in Validators** (Email, Phone, Password Strength, URL, etc.)  
2. 🔄 **Dynamic Validation** based on user input  
3. 🔍 **AI-Powered Validation** for text analysis and smart suggestions  
4. 🌐 **Multi-language Support (i18n)**  
5. 📲 **Real-time Validation Feedback**

---

## 🛠️ **Usage**

### **1. Import the Package**

```dart
import 'package:smart_form_validator/smart_form_validator.dart';
```

---

### **2. Basic Validators**

#### **Required Field Validator**

```dart
SmartFormField(
  label: "Username",
  controller: _usernameController,
  validators: [
    RequiredValidator(errorMessage: "Username is required."),
  ],
)
```

#### **Email Validator**

```dart
SmartFormField(
  label: "Email",
  controller: _emailController,
  validators: [
    RequiredValidator(errorMessage: "Email is required."),
    EmailValidator(errorMessage: "Please enter a valid email address."),
  ],
)
```

#### **Phone Number Validator**

```dart
SmartFormField(
  label: "Phone Number",
  controller: _phoneController,
  validators: [
    RequiredValidator(errorMessage: "Phone number is required."),
    PhoneValidator(errorMessage: "Invalid phone number."),
  ],
)
```

---

### **3. Advanced Validators**

#### **Password Strength Validator**

```dart
SmartFormField(
  label: "Password",
  controller: _passwordController,
  obscureText: true,
  validators: [
    RequiredValidator(errorMessage: "Password is required."),
    PasswordStrengthValidator(errorMessage: "Password must include uppercase, lowercase, number, and symbol."),
  ],
)
```

#### **URL Validator**

```dart
SmartFormField(
  label: "Website",
  controller: _websiteController,
  validators: [
    RequiredValidator(errorMessage: "Website URL is required."),
    UrlValidator(errorMessage: "Please enter a valid URL."),
  ],
)
```

#### **Credit Card Validator**

```dart
SmartFormField(
  label: "Credit Card Number",
  controller: _creditCardController,
  validators: [
    RequiredValidator(errorMessage: "Credit card number is required."),
    CreditCardValidator(errorMessage: "Invalid credit card number."),
  ],
)
```

---

### **4. AI-Powered Validation**

#### **Smart Text Validator**

```dart
SmartFormField(
  label: "Feedback",
  controller: _feedbackController,
  validators: [
    RequiredValidator(errorMessage: "Feedback cannot be empty."),
    AdvancedSmartTextValidator(),
  ],
)
```

🔍 **AI Validator Checks:**  
- Detects **spelling mistakes**  
- Identifies **negative sentiment**  
- Avoids **repetitive characters**  
- Detects **contradictory words**

---

### **5. Dynamic Validation**

```dart
SmartFormField(
  label: "Tax ID",
  controller: _taxIdController,
  validators: [
    DynamicValidator(
      condition: () => _userType == 'Company',
      validator: RequiredValidator(errorMessage: "Tax ID is required for companies."),
    ),
  ],
)
```

---

## 🧪 **Testing**

Run unit tests to ensure validators work as expected:

```bash
flutter test
```

**Example Test:**

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_form_validator/smart_form_validator.dart';

void main() {
  test('Phone Validator Test', () {
    final validator = PhoneValidator();

    expect(validator.validate('+1234567890'), null);  // Valid
    expect(validator.validate('12345'), "Please enter a valid phone number.");  // Invalid
  });
}
```

---

## 📚 **All Available Validators**

| **Validator**                  | **Description**                               |
|--------------------------------|-----------------------------------------------|
| `RequiredValidator`            | Checks if the field is not empty              |
| `EmailValidator`               | Validates email format                        |
| `PhoneValidator`               | Validates international phone numbers        |
| `PasswordStrengthValidator`    | Ensures strong passwords                      |
| `UrlValidator`                 | Validates URLs                                |
| `CreditCardValidator`          | Validates credit card numbers                 |
| `DateValidator`                | Validates date formats                       |
| `NumericValidator`             | Checks if the input is numeric               |
| `RangeValidator`               | Checks if value falls within a range         |
| `RegexValidator`               | Custom regular expression validation         |
| `AdvancedSmartTextValidator`   | AI-based smart text analysis                 |
| `DynamicValidator`             | Conditional validation                       |

---

## 🚀 **Publishing the Package**

1. **Update `pubspec.yaml`:**

```yaml
name: smart_form_validator
description: A comprehensive Flutter package for smart and dynamic form validation.
version: 1.0.0
homepage: https://github.com/your_username/smart_form_validator
license: MIT
```

2. **Run Linter & Tests:**

```bash
flutter analyze
flutter test
```

3. **Publish to pub.dev:**

```bash
flutter pub publish
```

---

## 🙌 **Contributing**

1. Fork the repository  
2. Create your feature branch (`git checkout -b feature/your-feature`)  
3. Commit your changes (`git commit -m 'Add some feature'`)  
4. Push to the branch (`git push origin feature/your-feature`)  
5. Open a pull request  

---

## 📧 **Contact**

For feature requests or issues, please open a ticket on [GitHub](https://github.com/your_username/smart_form_validator/issues) or reach out via email at **your.email@example.com**.

---

## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

# 🎉 **Thank You for Using Smart Form Validator!**

Ready to build smarter forms with dynamic, real-time, and AI-powered validation!