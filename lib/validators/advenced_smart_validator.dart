import 'package:smart_form_validator/validators/smart_form_validator_service.dart.dart';



class AdvancedSmartTextValidator extends SmartFormValidatorService {
  final String errorMessage;

  AdvancedSmartTextValidator(
      {this.errorMessage = "Please check your input for possible errors."});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty.";
    }

    if (value.startsWith(' ') || value.endsWith(' ')) {
      return "Avoid starting or ending with spaces.";
    }

    final repeatedCharRegex = RegExp(r'(.)\1{3,}');
    if (repeatedCharRegex.hasMatch(value)) {
      return "Avoid repeating characters excessively.";
    }


    if (_isOveruseOfUpperCase(value)) {
      return "Avoid using too many uppercase letters.";
    }


    final emojiRegex = RegExp(r'[\u{1F600}-\u{1F64F}]', unicode: true);
    if (emojiRegex.hasMatch(value) && value.length < 3) {
      return "Don't use emojis alone, provide meaningful text.";
    }

  
    if (_detectNegativeSentiment(value)) {
      return "Your input seems negative. Please reconsider your wording.";
    }

    if (_hasCommonSpellingMistakes(value)) {
      return "There might be spelling mistakes in your input.";
    }

    if (_detectContradictions(value)) {
      return "Your input seems contradictory. Please clarify.";
    }

    return null; // Hata yoksa
  }
  bool _isOveruseOfUpperCase(String value) {
    int upperCaseCount = value.runes
        .where((r) =>
            String.fromCharCode(r).toUpperCase() == String.fromCharCode(r) &&
            r >= 65 &&
            r <= 90)
        .length;
    return upperCaseCount > (value.length / 2);
  }

  bool _detectNegativeSentiment(String value) {
    final negativeWords = [
      'bad',
      'terrible',
      'worst',
      'hate',
      'awful',
      'angry',
      'disappointed'
    ];
    return negativeWords.any((word) => value.toLowerCase().contains(word));
  }
  bool _hasCommonSpellingMistakes(String value) {
    final commonMistakes = {
      'teh': 'the',
      'recieve': 'receive',
      'adress': 'address',
      'definately': 'definitely',
      'occured': 'occurred'
    };

    for (var mistake in commonMistakes.entries) {
      if (value.toLowerCase().contains(mistake.key)) {
        return true;
      }
    }
    return false;
  }

  bool _detectContradictions(String value) {
    final contradictions = [
      ['always', 'never'],
      ['love', 'hate'],
      ['yes', 'no']
    ];

    for (var pair in contradictions) {
      if (value.toLowerCase().contains(pair[0]) &&
          value.toLowerCase().contains(pair[1])) {
        return true;
      }
    }
    return false;
  }
}
