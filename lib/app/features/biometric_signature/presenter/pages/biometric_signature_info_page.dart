// coverage:ignore-file
import 'package:finan/app/core/services/permission/permission_service.dart';
import 'package:finan/app/core/services/unico_check/unico_check_service.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/components/snack_bar/nagro_snack_bar.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/finish_sign/biometric_proposal_sign_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:unico_check/unico_check.dart';

class BiometricSignatureInfoPage extends StatefulWidget {
  static const String routeName = '/info';

  const BiometricSignatureInfoPage({
    super.key,
  });

  @override
  State<BiometricSignatureInfoPage> createState() =>
      _BiometricSignatureInfoPageState();
}

class _BiometricSignatureInfoPageState extends State<BiometricSignatureInfoPage>
    with WidgetsBindingObserver
    implements UnicoListener, UnicoSelfie {
  bool isInBatterySaveMode = false;

  final permissionService = Modular.get<IPermissionService>();

  final unicoCheckService = Modular.get<UnicoCheckService>();

  Future<void> checkAndRequestLocationPermission(BuildContext context) async {
    bool locationPermissionGranted =
        await permissionService.isLocationPermissionGranted();

    if (!locationPermissionGranted && context.mounted) {
      locationPermissionGranted =
          await permissionService.requestLocationPermission(context);
    }

    if (locationPermissionGranted) {
      handleContinue();
    }
  }

  Future<void> handleContinue() async {
    unicoCheckService.openCameraSmartWithButton(this);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    unicoCheckService.init(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: continuar,
              action: () async {
                if (context.mounted) {
                  checkAndRequestLocationPermission(context);
                }
              },
            ),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    biometriaFacial,
                    style: ThemeTypography.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: ThemeSpacings.s24),
                  Text(
                    agoraPrecisamosTirarFotoDoSeu,
                    style: ThemeTypography.body1.copyWith(
                      fontSize: ThemeSizes.sp16,
                      color: ThemeColors.kTextLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: ThemeSpacings.s64),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dicasPasso1,
                    style: ThemeTypography.body1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.kPrimary,
                    ),
                  ),
                  const SizedBox(height: ThemeSpacings.s40),
                  Text(
                    fotoDoRosto,
                    style: ThemeTypography.body2.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.kPrimary,
                    ),
                  ),
                  const SizedBox(height: ThemeSpacings.s40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _tipRow(
                        concedaPermissaoParaAtivarACameraDoSeuDispositivoPoisSemEla,
                        Symbols.photo_camera,
                      ),
                      const SizedBox(height: ThemeSpacings.s40),
                      _tipRow(
                        centralizeORostoCorretamenteDentroDoCirculoIndicativo,
                        Symbols.face,
                      ),
                      const SizedBox(height: ThemeSpacings.s40),
                      _tipRow(
                        naoUtilizenNenhumAcessorioComoBoneChapeuOuOculosNoMomentoDaFoto,
                        Symbols.eyeglasses,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _tipRow(String text, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: ThemeSizes.w56,
          width: ThemeSizes.w56,
          decoration: BoxDecoration(
            color: ThemeColors.kPrimary50,
            borderRadius: BorderRadius.circular(ThemeRadius.r500),
          ),
          child: Icon(
            icon,
            size: 24,
            color: ThemeColors.kPrimary,
          ),
        ),
        const SizedBox(width: ThemeSpacings.s16),
        Expanded(
          child: Text(
            text,
            style: ThemeTypography.body3.copyWith(
              fontWeight: FontWeight.normal,
              color: ThemeColors.kTextBlack,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onErrorSelfie(UnicoError error) {
    if (context.mounted) {
      NagroSnackbar.show(
        text: 'Falha ao capturar a foto. Tente novamente.',
        status: NagroSnackbarStatus.error,
      );
    }
  }

  @override
  void onErrorUnico(UnicoError error) {}

  @override
  Future<void> onSuccessSelfie(ResultCamera result) async {
    if (context.mounted) {
      Modular.to.pushNamed(
        BiometricProposalSignPage.route,
      );
    }
  }

  @override
  void onSystemChangedTypeCameraTimeoutFaceInference() {}

  @override
  void onSystemClosedCameraTimeoutSession() {}

  @override
  void onUserClosedCameraManually() {}
}
