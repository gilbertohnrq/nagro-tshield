// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class CardAmountHolderObject {
  String label;
  String value;
  Color? colorValue;
  CrossAxisAlignment? alignValues;

  CardAmountHolderObject({
    required this.label,
    required this.value,
    this.colorValue,
    this.alignValues,
  });
}

class CardAmount extends StatelessWidget {
  final CardAmountHolderObject cardData;

  const CardAmount({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: cardData.alignValues ?? CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: [
        Flexible(
          child: Text(
            cardData.label,
            style: ThemeTypography.body3.copyWith(
              color: ThemeColors.kTextLight,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Flexible(
          child: Text(
            cardData.value,
            style: ThemeTypography.sub2.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
