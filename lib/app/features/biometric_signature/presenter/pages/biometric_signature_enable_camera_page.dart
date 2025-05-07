import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/services/permission/permission_service.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/infra/models/get_proposal_available_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BiometricSignatureEnableCameraPage extends StatefulWidget {
  final GetProposalAvailableResponse proposalResponse;

  const BiometricSignatureEnableCameraPage({
    super.key,
    required this.proposalResponse,
  });

  @override
  State<BiometricSignatureEnableCameraPage> createState() =>
      _BiometricSignatureEnableCameraPageState();
}

class _BiometricSignatureEnableCameraPageState
    extends State<BiometricSignatureEnableCameraPage> {
  final permissionService = Modular.get<IPermissionService>();

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              minimumSize:
                  const WidgetStatePropertyAll(Size(double.infinity, 56)),
              textButton: habilitarCamera,
              icon: Icons.gpp_good_outlined,
              action: () async {
                if (await permissionService.isCameraPermissionGranted()) {
                } else if (context.mounted) {
                  final bool cameraGranted =
                      await permissionService.requestCameraPermission(context);

                  if (cameraGranted) {}
                }
              },
            ),
          ),
        ],
      ),
      child: ListView(
        children: [
          Text(
            habilitarCamera,
            style: ThemeTypography.headline5.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            porFavorConcedaAPermissao,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s96),
          const CustomSvgImage(assetName: Assets.enableCamera),
        ],
      ),
    );
  }
}
