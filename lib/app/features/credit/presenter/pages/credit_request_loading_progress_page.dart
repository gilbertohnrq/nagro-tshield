import 'package:finan/app/core/theme/components/loading/progress_loading_by_credit.dart';
import 'package:flutter/material.dart';

class CreditRequestLoadingProgressPage extends StatefulWidget {
  const CreditRequestLoadingProgressPage({super.key});

  @override
  State<CreditRequestLoadingProgressPage> createState() =>
      _CreditRequestLoadingProgressPageState();
}

class _CreditRequestLoadingProgressPageState
    extends State<CreditRequestLoadingProgressPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const ProgressLoadingByCredit();
  }
}
