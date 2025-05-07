import 'package:finan/app/core/theme/components/loading/progress_loading.dart';
import 'package:flutter/material.dart';

class PreApprovedProcessingUpdatePage extends StatefulWidget {
  const PreApprovedProcessingUpdatePage({super.key});

  static const route = 'processing-update';

  @override
  State<PreApprovedProcessingUpdatePage> createState() =>
      _PreApprovedProcessingUpdatePageState();
}

class _PreApprovedProcessingUpdatePageState
    extends State<PreApprovedProcessingUpdatePage>
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
    return const ProgressLoading();
  }
}
