// coverage:ignore-file
import 'dart:async';

import 'package:finan/app/core/theme/components/loading/progress_indicator_custom.dart';
import 'package:finan/app/core/theme/components/loading/text_wheel_loading.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/home/infra/models/commodities/profile_response/profile_response.dart';
import 'package:flutter/material.dart';

class ProgressLoadingByCredit extends StatefulWidget {
  const ProgressLoadingByCredit({super.key});

  @override
  State<ProgressLoadingByCredit> createState() =>
      _ProgressLoadingByCreditState();
}

class _ProgressLoadingByCreditState extends State<ProgressLoadingByCredit>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> animation;
  final _scrollController = ScrollController();
  final List<String> texts = [
    'Estamos processando suas informações...',
    'Seu pedido está em andamento...',
    'Preparando os últimos detalhes...',
  ];
  final double itemWheelSize = 45.0;
  ContractStatus? _contractStatus;
  Timer? _timer;
  bool _receivedNotification = false;

  Future<void> listenForMessages() async {}

  void handleProfileResponse(ProfileResponse response) {
    _receivedNotification = true;
    _extendLoadingDuration();

    final status = response.statusProposal.status;

    if (status.contains('APROVADA')) {
      _contractStatus = ContractStatus.ready;
    } else if (status.contains('NEGADA') ||
        status.contains('REJEITADA') ||
        status.contains('EXPIRADA') ||
        status.contains('PROPOSTA_EM_ANALISE')) {
      _contractStatus = ContractStatus.notReady;
    } else {
      return;
    }

    setState(() {
      texts.add(_contractStatus!.message);
    });
  }

  void _extendLoadingDuration() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 5), () {
      _animationController.duration =
          _animationController.duration! + const Duration(seconds: 5);
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _startAnimation();
    listenForMessages();
    _timer = Timer(const Duration(seconds: 20), () {
      if (!_receivedNotification) {
        setState(() {
          _contractStatus = ContractStatus.notReady;
          texts.add(_contractStatus!.message);
        });
        _extendLoadingDuration();
      }
    });
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  void _startAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
      var item = 1;
      final double initialValue = itemWheelSize * 0.85;

      _animationController.addListener(() {
        if (_scrollController.position.pixels == 0) {
          _scrollController.animateTo(
            initialValue,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }

        if (_animationController.value / item >= 1 / (texts.length + 1)) {
          item += 1;
          _scrollController.animateTo(
            _scrollController.position.pixels + itemWheelSize,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemeColors.kAccent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextWheelLoading(
            scrollController: _scrollController,
            texts: texts,
            itemWheelSize: itemWheelSize,
            statusIcons: {
              ContractStatus.ready.message: Icons.check_circle,
              ContractStatus.notReady.message: Icons.pending,
            },
            statusColors: {
              ContractStatus.ready.message: ThemeColors.kApproved,
              ContractStatus.notReady.message: ThemeColors.kExpired,
            },
          ),
          ProgressIndicatorComponent(
            text: esseProcessoPoderalevarAteDez,
            animation: animation,
          ),
        ],
      ),
    );
  }
}

enum ContractStatus {
  ready('Proposta enviada'),
  notReady('Precisamos de mais tempo, já irá finalizar');

  final String message;

  const ContractStatus(this.message);
}
