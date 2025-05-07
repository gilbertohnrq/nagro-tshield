// coverage:ignore-file
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/core/utils/extensions/extensions.dart';
import 'package:finan/app/core/utils/formats/mask_formatters.dart';

final RegExp emailValid = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
);

final RegExp phoneValidation = RegExp(r'^\(?\d{2}\)?[\s-]?[\s9]?\d{4}-?\d{4}$');

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return informeONumeroDoCelularComDDD;
  }

  if (phoneMaskFormatter.getUnmaskedText().length < 11 &&
      phoneMaskFormatter.unmaskText(value).length < 11) {
    return informeONumeroDoCelularComDDD;
  }

  if (!phoneValidation.hasMatch(phoneMaskFormatter.getUnmaskedText()) &&
      !phoneValidation.hasMatch(phoneMaskFormatter.unmaskText(value))) {
    return informeUmNumeroDeCelularValido;
  }

  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return informeUmEmailValido;
  }

  if (!isValidEmail(value)) return informeUmEmailValido;

  return null;
}

bool isValidEmail(String email) {
  final RegExp regex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})*$',
  );
  return regex.hasMatch(email);
}

String? validatePassword(String? value) {
  if (value == null || value.length < 6) {
    return 'Sua senha deve ter entre 6 e 8 dígitos';
  }

  if (value.length >= 6) {
    if (value.length > 8) {
      return 'Sua senha deve ter entre 6 e 8 dígitos';
    }
    return null;
  }

  return null;
}

String? validatePasswordConfirmation(String? value, String password) {
  if (value == null || value.isEmpty) {
    return null;
  }

  if (value != password) {
    return 'As senhas não coincidem. Verifique sua senha e tente novamente.';
  }

  if (value.length >= 6) {
    if (value.length > 8) {
      return 'Sua senha deve ter entre 6 e 8 dígitos';
    }
    return null;
  }
  return null;
}

String? validateTaxId(String? value) {
  if (!CPFValidator.isValid(value)) {
    return 'Informe um CPF válido';
  }
  return null;
}

String? validateValue(String inputValue, String limitValue) {
  final String cleanedValue = cleanValue(inputValue);
  final String cleanedLimit = cleanValue(limitValue);

  // Verifica se os valores estão vazios
  if (cleanedValue.isEmpty || cleanedLimit.isEmpty) {
    return 'O campo não pode estar vazio.'; // Mensagem de campo vazio
  }

  final int valueInCents = convertToCentsByInt(cleanedValue);
  final int limitInCents = convertToCentsByInt(cleanedLimit);

  // Calcula 50% do limite
  final double halfLimit = limitInCents / 2;

  // Validações
  if (valueInCents < 1600 * 100) {
    return 'O valor deve ser maior ou igual a R\$ 1.600,00.'; // Mensagem para valor mínimo
  } else if (valueInCents < halfLimit) {
    return 'O valor deve ser maior ou igual a 50% do limite.';
  } else if (valueInCents > limitInCents) {
    return 'O valor não pode ser maior que o limite.';
  }

  return null; // Valor válido
}

bool hasSequentialNumbers(String input) {
  int consecutiveCount = 1;

  for (int i = 0; i < input.length - 1; i++) {
    if (int.tryParse(input[i]) != null && int.tryParse(input[i + 1]) != null) {
      if (int.parse(input[i + 1]) == int.parse(input[i]) + 1) {
        consecutiveCount++;
        if (consecutiveCount > 2) {
          return true;
        }
      } else {
        consecutiveCount = 1;
      }
    } else {
      consecutiveCount = 1;
    }
  }
  return false;
}

bool hasRepeatedNumbers(String input) {
  final repeatingPattern = RegExp(r'(\d)\1{2,}');

  final alternatingPattern = RegExp(r'(\d\d)\1+');

  return repeatingPattern.hasMatch(input.trim()) || alternatingPattern.hasMatch(input.trim());
}
