// coverage:ignore-file
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/formats/date_helper.dart';
import 'package:flutter/material.dart';

class DatePickerComponent extends StatelessWidget {
  static const _weekdayLabels = [
    'DOM',
    'SEG',
    'TER',
    'QUA',
    'QUI',
    'SEX',
    'SAB'
  ];
  static const _defaultLocale = Locale('pt_BR');
  static const _firstDateOffset = Duration(days: 30);
  static const _lastDateOffset = Duration(days: 60);

  final bool datePickerIsActive;
  final List<DateTime?> curDate;
  final ValueChanged<List<DateTime?>> onDateChanged;
  final VoidCallback onActivatePicker;

  const DatePickerComponent({
    super.key,
    required this.datePickerIsActive,
    required this.curDate,
    required this.onDateChanged,
    required this.onActivatePicker,
  });

  String _formatMonth(DateTime date) =>
      getLocaleShortMonthFormat(_defaultLocale).format(date);

  Future<void> _handleDateChange(
      List<DateTime?> dates, double currentSliderValue) async {
    onDateChanged(dates);
    if (dates.isEmpty) return;
  }

  Widget _buildDatePickerField() {
    return GestureDetector(
      onTap: onActivatePicker,
      child: Container(
        height: ThemeSizes.h48,
        padding: const EdgeInsets.symmetric(horizontal: ThemeSpacings.s12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ThemeRadius.r6),
          border: Border.all(width: 1, color: ThemeColors.kGrayEnabled),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateHelper.formatDate(curDate[0].toString()),
              style: ThemeTypography.body1.copyWith(
                color: ThemeColors.kTextLight,
              ),
            ),
            Icon(
              Icons.date_range_outlined,
              size: ThemeSizes.w20,
              color: ThemeColors.kGrayEnabled,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!datePickerIsActive) return _buildDatePickerField();

    return CalendarDatePicker2(
      onDisplayedMonthChanged: _formatMonth,
      config: CalendarDatePicker2Config(
        modePickerTextHandler: ({required monthDate, isMonthPicker}) =>
            isMonthPicker ?? false ? _formatMonth(monthDate) : null,
        calendarType: CalendarDatePicker2Type.single,
        firstDate: DateTime.now().add(_firstDateOffset),
        lastDate: DateTime.now().add(_lastDateOffset),
        weekdayLabels: _weekdayLabels,
      ),
      value: curDate,
      onValueChanged: (dates) => _handleDateChange(dates, 0),
    );
  }
}
