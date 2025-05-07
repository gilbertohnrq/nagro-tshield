// coverage:ignore-file
//coverage:ignore-file

import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

const double _kOuterRadius = 8.0;
const double _kInnerRadius = 4.0;

class NagroRadio<T> extends StatefulWidget {
  const NagroRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.mouseCursor,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
    this.unselectColor = ThemeColors.kPrimary,
  });

  final Color? unselectColor;

  final T value;

  final T? groupValue;

  final ValueChanged<T?>? onChanged;

  final MouseCursor? mouseCursor;

  final bool toggleable;

  final Color? activeColor;

  final WidgetStateProperty<Color?>? fillColor;

  final MaterialTapTargetSize? materialTapTargetSize;

  final VisualDensity? visualDensity;

  final Color? focusColor;

  final Color? hoverColor;

  final WidgetStateProperty<Color?>? overlayColor;

  final double? splashRadius;

  final FocusNode? focusNode;

  final bool autofocus;

  bool get _selected => value == groupValue;

  @override
  NagroRadioState<T> createState() => NagroRadioState<T>();
}

class NagroRadioState<T> extends State<NagroRadio<T>>
    with TickerProviderStateMixin, ToggleableStateMixin {
  final _RadioPainter _painter = _RadioPainter();

  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  void didUpdateWidget(NagroRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selected != oldWidget._selected) {
      animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;

  @override
  bool get tristate => widget.toggleable;

  @override
  bool? get value => widget._selected;

  WidgetStateProperty<Color?> get _widgetFillColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return widget.activeColor;
      }
      return null;
    });
  }

  WidgetStateProperty<Color> get _defaultFillColor {
    final ThemeData themeData = Theme.of(context);
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return themeData.disabledColor;
      }
      if (states.contains(WidgetState.selected)) {
        return themeData.colorScheme.secondary;
      }
      return widget.unselectColor ?? themeData.unselectedWidgetColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    final ThemeData themeData = Theme.of(context);
    final MaterialTapTargetSize effectiveMaterialTapTargetSize =
        widget.materialTapTargetSize ??
            themeData.radioTheme.materialTapTargetSize ??
            themeData.materialTapTargetSize;
    final VisualDensity effectiveVisualDensity = widget.visualDensity ??
        themeData.radioTheme.visualDensity ??
        themeData.visualDensity;
    Size size;
    switch (effectiveMaterialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        size = const Size(kMinInteractiveDimension, kMinInteractiveDimension);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        size = const Size(
            kMinInteractiveDimension - 8.0, kMinInteractiveDimension - 8.0);
        break;
    }
    size += effectiveVisualDensity.baseSizeAdjustment;

    final WidgetStateProperty<MouseCursor> effectiveMouseCursor =
        WidgetStateProperty.resolveWith<MouseCursor>((Set<WidgetState> states) {
      return WidgetStateProperty.resolveAs<MouseCursor?>(
              widget.mouseCursor, states) ??
          themeData.radioTheme.mouseCursor?.resolve(states) ??
          WidgetStateProperty.resolveAs<MouseCursor>(
              WidgetStateMouseCursor.clickable, states);
    });

    final Set<WidgetState> activeStates = states..add(WidgetState.selected);
    final Set<WidgetState> inactiveStates = states
      ..remove(WidgetState.selected);
    final Color effectiveActiveColor =
        widget.fillColor?.resolve(activeStates) ??
            _widgetFillColor.resolve(activeStates) ??
            themeData.radioTheme.fillColor?.resolve(activeStates) ??
            _defaultFillColor.resolve(activeStates);
    final Color effectiveInactiveColor =
        widget.fillColor?.resolve(inactiveStates) ??
            _widgetFillColor.resolve(inactiveStates) ??
            themeData.radioTheme.fillColor?.resolve(inactiveStates) ??
            _defaultFillColor.resolve(inactiveStates);

    final Set<WidgetState> focusedStates = states..add(WidgetState.focused);
    final Color effectiveFocusOverlayColor =
        widget.overlayColor?.resolve(focusedStates) ??
            widget.focusColor ??
            themeData.radioTheme.overlayColor?.resolve(focusedStates) ??
            themeData.focusColor;

    final Set<WidgetState> hoveredStates = states..add(WidgetState.hovered);
    final Color effectiveHoverOverlayColor =
        widget.overlayColor?.resolve(hoveredStates) ??
            widget.hoverColor ??
            themeData.radioTheme.overlayColor?.resolve(hoveredStates) ??
            themeData.hoverColor;

    final Set<WidgetState> activePressedStates = activeStates
      ..add(WidgetState.pressed);
    final Color effectiveActivePressedOverlayColor =
        widget.overlayColor?.resolve(activePressedStates) ??
            themeData.radioTheme.overlayColor?.resolve(activePressedStates) ??
            effectiveActiveColor.withAlpha(kRadialReactionAlpha);

    final Set<WidgetState> inactivePressedStates = inactiveStates
      ..add(WidgetState.pressed);
    final Color effectiveInactivePressedOverlayColor =
        widget.overlayColor?.resolve(inactivePressedStates) ??
            themeData.radioTheme.overlayColor?.resolve(inactivePressedStates) ??
            effectiveActiveColor.withAlpha(kRadialReactionAlpha);

    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: widget._selected,
      child: buildToggleable(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        mouseCursor: effectiveMouseCursor,
        size: size,
        painter: _painter
          ..position = position
          ..reaction = reaction
          ..reactionFocusFade = reactionFocusFade
          ..reactionHoverFade = reactionHoverFade
          ..inactiveReactionColor = effectiveInactivePressedOverlayColor
          ..reactionColor = effectiveActivePressedOverlayColor
          ..hoverColor = effectiveHoverOverlayColor
          ..focusColor = effectiveFocusOverlayColor
          ..splashRadius = widget.splashRadius ??
              themeData.radioTheme.splashRadius ??
              kRadialReactionRadius
          ..downPosition = downPosition
          ..isFocused = states.contains(WidgetState.focused)
          ..isHovered = states.contains(WidgetState.hovered)
          ..activeColor = effectiveActiveColor
          ..inactiveColor = effectiveInactiveColor,
      ),
    );
  }
}

class _RadioPainter extends ToggleablePainter {
  @override
  void paint(Canvas canvas, Size size) {
    paintRadialReaction(canvas: canvas, origin: size.center(Offset.zero));
    final Offset center = (Offset.zero & size).center;

    final Paint outlinePaint = Paint()
      ..color = ThemeColors.kPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(center, _kOuterRadius, outlinePaint);

    if (!position.isDismissed) {
      final Paint fillPaint = Paint()
        ..color = ThemeColors.kPrimary
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, _kInnerRadius, fillPaint);
    }
  }
}
