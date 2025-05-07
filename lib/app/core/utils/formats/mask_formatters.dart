// coverage:ignore-file
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

MaskTextInputFormatter brMoneyMaskFormatter = MaskTextInputFormatter(
  mask: 'R\$ #.###,##',
  filter: {
    '#': RegExp(r'[0-9]'),
  },
);

MaskTextInputFormatter cpfMaskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: <String, RegExp>{"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

MaskTextInputFormatter phoneMaskFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: <String, RegExp>{"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

MaskTextInputFormatter cepMaskFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: <String, RegExp>{"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

MaskTextInputFormatter numberAccountMaskFormatter = MaskTextInputFormatter(
    mask: '##########',
    filter: <String, RegExp>{"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

MaskTextInputFormatter branchBankMaskFormatter = MaskTextInputFormatter(
    mask: '####',
    filter: <String, RegExp>{"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

MaskTextInputFormatter expeditorDocumentMaskFormatter = MaskTextInputFormatter(
    mask: '###############',
    filter: <String, RegExp>{"#": RegExp(r'^[a-zA-Z ]+$')},
    type: MaskAutoCompletionType.lazy);

final onlyNumberMaskFormatter = TextInputFormatter.withFunction(
  (oldValue, newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length,
      ),
    );
  },
);

MaskTextInputFormatter emailMaskFormatter =
    MaskTextInputFormatter(filter: <String, RegExp>{
  "#": RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})*$',
  )
}, type: MaskAutoCompletionType.lazy);

final lettersAndAccentsOnlyFormatter = TextInputFormatter.withFunction(
  (oldValue, newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final String newText =
        newValue.text.replaceAll(RegExp(r'[^a-zA-ZÀ-ÿ\s]'), '');
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length,
      ),
    );
  },
);
