// coverage:ignore-file
import 'package:finan/app/core/services/nagro_animation/nagro_animation_service.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/home/presenter/components/agro_credit_tab.dart';
import 'package:finan/app/features/home/presenter/components/banner_know_more.dart';
import 'package:finan/app/features/home/presenter/components/header_app_bar_component.dart';
import 'package:finan/app/features/home/presenter/components/header_content.dart';
import 'package:finan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late final NagroAnimationService nagroAnimation;
  List<String> newFeatures = [];

  final List<Widget> _carouselItems = [
    BannerKnowMore(
      icon: Icons.shield_outlined,
      title: segurosNagro,
      description: temosOsMelhoresSegurosDoAgro,
      onButtonPressed: () {
        Modular.to.pushNamed(Routes.insuranceKnowMore);
      },
    ),
    BannerKnowMore(
      icon: Icons.speed,
      title: voceConheceScoreAgro,
      description: informacoesSegurasPrecisas,
      onButtonPressed: () {
        Modular.to.pushNamed(Routes.scoreKnowMore);
      },
    ),
    BannerKnowMore(
      icon: Icons.agriculture,
      title: consorcioInteligente,
      description: descubraUmaNovaFormaDe,
      onButtonPressed: () {
        Modular.to.pushNamed(Routes.consortiumKnowMore);
      },
    ),
  ];

  @override
  void initState() {
    super.initState();

    nagroAnimation = Modular.get<NagroAnimationService>();

    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.kPrimary,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ThemeColors.kPrimary,
                ThemeColors.kAccent,
                ThemeColors.kAccent,
              ],
              stops: [0.3, 0.5, 1.0],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: ThemeSpacings.s24,
                  right: ThemeSpacings.s24,
                  top: ThemeSpacings.s56,
                ),
                height: ThemeSpacings.s88,
                color: ThemeColors.kPrimary,
                child: const HeaderGreetingAppBar(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: ThemeSpacings.s16,
                    ),
                    child: Column(
                      children: [
                        HeaderContent(
                          carouselItems: _carouselItems,
                        ),
                        Container(
                          color: ThemeColors.kAccent,
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: ThemeSpacings.s8,
                                  horizontal: ThemeSpacings.s24,
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        AgroCreditTab(),
                                      ],
                                    ),
                                    SizedBox(
                                      height: ThemeSpacings.s16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
