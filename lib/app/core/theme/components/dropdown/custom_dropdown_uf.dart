// coverage:ignore-file
import 'package:finan/app/core/enums/uf_enum.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomDropdownUf extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? labelText;
  final void Function()? formKeyValidate;

  const CustomDropdownUf(
      {required this.textEditingController,
      this.labelText,
      this.formKeyValidate,
      super.key});

  @override
  CustomDropdownUfState createState() => CustomDropdownUfState();
}

class CustomDropdownUfState extends State<CustomDropdownUf> {
  Uf? dropdownValue;

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(_updateDropdownValue);
    _updateDropdownValue();
  }

  @override
  void dispose() {
    widget.textEditingController.removeListener(_updateDropdownValue);
    super.dispose();
  }

  void _updateDropdownValue() {
    setState(() {
      dropdownValue = stringAbbreviationToUf[
          widget.textEditingController.text.toLowerCase()];
    });
  }

  @override
  void didChangeDependencies() {
    dropdownValue = stringToUf[widget.textEditingController.text.toLowerCase()];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Uf>(
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintStyle:
            ThemeTypography.body1.copyWith(color: ThemeColors.kGrayEnabled),
        labelStyle:
            ThemeTypography.body3.copyWith(color: ThemeColors.kGrayEnabled),
        border: InputBorder.none,
      ),
      style: ThemeTypography.body2.copyWith(color: ThemeColors.kTextLight),
      value: dropdownValue,
      validator: (value) {
        if (widget.textEditingController.text.isEmpty) {
          return 'Selecione um estado válido';
        } else {
          return null;
        }
      },
      onChanged: (Uf? newValue) {
        if (widget.formKeyValidate != null) {
          widget.formKeyValidate;
        }
        setState(() {
          dropdownValue = newValue!;
          widget.textEditingController.text = newValue.name;
        });
      },
      items: Uf.values.map<DropdownMenuItem<Uf>>((Uf uf) {
        return DropdownMenuItem<Uf>(
          value: uf,
          child: Text(ufToString(uf)),
        );
      }).toList(),
    );
  }
}
