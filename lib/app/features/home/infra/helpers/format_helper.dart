import 'package:brasil_fields/brasil_fields.dart';
import 'package:intl/intl.dart';

mixin FormatHelper {
  static String moneyNoCents(dynamic value) {
    if (value == null) return '';
    final List<String> parts =
        NumberFormat("#,##0.00", "pt_BR").format(value).split(',');
    return parts.sublist(0, parts.length - 1).join();
  }

  static String moneyWithCents(dynamic value) {
    if (value == null) return '';
    return NumberFormat("#,##0.00", "pt_BR").format(value);
  }

  static String removeDiacritics(String str) {
    const diacritics = {
      'Á': 'A',
      'É': 'E',
      'Í': 'I',
      'Ó': 'O',
      'Ú': 'U',
      'á': 'a',
      'é': 'e',
      'í': 'i',
      'ó': 'o',
      'ú': 'u',
      'À': 'A',
      'à': 'a',
      'Ã': 'A',
      'ã': 'a',
      'Â': 'A',
      'â': 'a',
      'Ê': 'E',
      'ê': 'e',
      'Ô': 'O',
      'ô': 'o',
      'õ': 'o',
      'Õ': 'O',
      'ü': 'u',
      'Ü': 'U',
      'Ç': 'C',
      'ç': 'c',
      'Ñ': 'N',
      'ñ': 'n',
    };

    return str.split('').map((c) => diacritics[c] ?? c).join('');
  }

  static String phoneNumber(String? phoneNumber) {
    if (phoneNumber == null) {
      return '';
    }

    final String phoneNumberWithoutCountryCode =
        phoneNumber.replaceAll("+55", "");

    final bool isPhoneNumberValidLength =
        phoneNumberWithoutCountryCode.length == 10 ||
            phoneNumberWithoutCountryCode.length == 11;

    if (isPhoneNumberValidLength) {
      return UtilBrasilFields.obterTelefone(phoneNumberWithoutCountryCode,
              mascara: true)
          .toString();
    } else {
      return phoneNumber;
    }
  }
}
