import 'package:flutter/material.dart';
import 'package:smart_form_validator/smart_form_validator.dart';
import 'package:smart_form_validator/validators/advenced_smart_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Real-Time Validation Example')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: RealTimeValidationForm(),
        ),
      ),
    );
  }
}

class RealTimeValidationForm extends StatefulWidget {
  const RealTimeValidationForm({super.key});

  @override
  State<RealTimeValidationForm> createState() => _RealTimeValidationFormState();
}

class _RealTimeValidationFormState extends State<RealTimeValidationForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartFormField(
            label: "Email",
            controller: _emailController,
            validators: [
              RequiredValidator(errorMessage: "Email is required."),
              EmailValidator(
                  errorMessage: "Please enter a valid email address."),
            ],
          ),
          const SizedBox(height: 16),
          SmartFormField(
            label: "Password",
            controller: _passwordController,
            obscureText: true,
            validators: [
              RequiredValidator(errorMessage: "Password is required."),
              MinLengthValidator(
                  minLength: 6,
                  customMessage: "Password must be at least 6 characters."),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Form submitted successfully!")),
                );
              }
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}


class AdvancedAiValidationForm extends StatefulWidget {
  const AdvancedAiValidationForm({super.key});

  @override
  State<AdvancedAiValidationForm> createState() => _AdvancedAiValidationFormState();
}

class _AdvancedAiValidationFormState extends State<AdvancedAiValidationForm> {
  final _formKey = GlobalKey<FormState>();
  final _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartFormField(
            label: "Feedback",
            controller: _feedbackController,
            validators: [
              RequiredValidator(errorMessage: "Feedback is required."),
              AdvancedSmartTextValidator(),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Feedback submitted successfully!")),
                );
              }
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
