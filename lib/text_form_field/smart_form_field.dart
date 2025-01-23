import 'package:flutter/material.dart';
import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';

class SmartFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final List<SmartFormValidatorService> validators;
  final bool obscureText;
  final bool autofocus = false;
  final InputDecoration? decoration = const InputDecoration();
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization = TextCapitalization.none;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final bool readOnly = false;

  const SmartFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.validators,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
  });

  @override
  State<SmartFormField> createState() => _SmartFormFieldState();
}

class _SmartFormFieldState extends State<SmartFormField> {
  String? _errorMessage;

  void _validate(String value) {
    for (var validator in widget.validators) {
      final result = validator.validate(value);
      if (result != null) {
        setState(() {
          _errorMessage = result;
        });
        return;
      }
    }
    setState(() {
      _errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: _errorMessage,
            border: const OutlineInputBorder(),
          ),
          onChanged: _validate,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textDirection: widget.textDirection,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          
        ),
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
