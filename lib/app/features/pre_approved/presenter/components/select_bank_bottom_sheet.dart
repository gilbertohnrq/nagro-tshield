// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/features/pre_approved/infra/models/banks_pre_approved.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectBankBottomSheet extends StatefulWidget {
  final TextEditingController codeTextEditingController;
  final TextEditingController bankTextEditingController;
  final String? labelText;
  final List<BanksPreApprovedModel> bankList;
  final void Function()? onChanged;
  final String? Function(BanksPreApprovedModel?)? validator;

  const SelectBankBottomSheet({
    required this.codeTextEditingController,
    required this.bankTextEditingController,
    this.labelText,
    required this.bankList,
    this.onChanged,
    this.validator,
    super.key,
  });

  @override
  State<SelectBankBottomSheet> createState() => _SelectBankBottomSheetState();
}

class _SelectBankBottomSheetState extends State<SelectBankBottomSheet> {
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(ThemeRadius.r8),
        topRight: Radius.circular(ThemeRadius.r8),
      ),
      child: Material(
        color: ThemeColors.kAccent,
        child: FractionallySizedBox(
          heightFactor: 0.75,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: ThemeSpacings.s8,
                      left: ThemeSpacings.s24,
                      right: ThemeSpacings.s24,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                            widget.bankTextEditingController.text,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textScaler: const TextScaler.linear(1),
                            style: bodyText3.copyWith(
                              color: ThemeColors.kTextBase,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: ThemeColors.kCloseGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: ThemeColors.kBorder),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: ThemeSpacings.s24,
                        vertical: ThemeSpacings.s24),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchValue = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.bankList.length,
                      itemBuilder: (context, index) {
                        if (widget.bankList
                                .elementAt(index)
                                .label
                                .toLowerCase()
                                .contains(searchValue.toLowerCase()) ||
                            widget.bankList
                                .elementAt(index)
                                .code
                                .toLowerCase()
                                .contains(searchValue.toLowerCase())) {
                          return GestureDetector(
                            onTap: () {
                              widget.bankTextEditingController.text =
                                  '${widget.bankList.elementAt(index).code} - ${widget.bankList.elementAt(index).label}';
                              widget.codeTextEditingController.text =
                                  widget.bankList.elementAt(index).code;
                              if (widget.onChanged != null) {
                                widget.onChanged!();
                              }
                              Modular.to.pop();
                            },
                            child: Container(
                              height: ThemeSizes.h46,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: ThemeSpacings.s24),
                              child: Text(
                                '${widget.bankList.elementAt(index).code} - ${widget.bankList.elementAt(index).label}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
