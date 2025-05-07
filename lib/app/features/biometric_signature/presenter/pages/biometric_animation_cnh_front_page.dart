// coverage:ignore-file
import 'package:finan/app/core/services/unico_check/unico_check_service.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/loading/loading_animation.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/infra/models/page_arguments/biometric_signature_page_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:unico_check/unico_check.dart';

class AnimationCNHFrontPage extends StatefulWidget {
  final BiometricSignatureSendPhotoPageArguments biometricArguments;

  const AnimationCNHFrontPage({
    super.key,
    required this.biometricArguments,
  });

  @override
  State<AnimationCNHFrontPage> createState() => _AnimationCNHFrontPageState();
}

class _AnimationCNHFrontPageState extends State<AnimationCNHFrontPage>
    implements UnicoListener, UnicoDocument {
  final unicoCheckService = Modular.get<UnicoCheckService>();

  static bool isCnhFlowActive = false;
  static DocumentType? currentDocumentType;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    unicoCheckService.init(this);
  }

  void _resetFlowState() {
    isCnhFlowActive = false;
    currentDocumentType = null;
    setState(() {});
  }

  void iniciarFluxoCapturaCNH() {
    _resetFlowState();
    isCnhFlowActive = true;
    currentDocumentType = DocumentType.CNH_FRENTE;
    unicoCheckService.openCameraDocument(
        documentType: DocumentType.CNH_FRENTE, listener: this);
  }

  void _showLoadingDialog() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted && _isLoading) {
        setState(() {
          _isLoading = false;
        });
        if (isCnhFlowActive) {
          unicoCheckService.openCameraDocument(
              documentType: DocumentType.CNH_VERSO, listener: this);
        }
      }
    });
  }

  @override
  void onSuccessDocument(ResultCamera resultCamera) {
    if (resultCamera.base64 == null) {
      _resetFlowState();
      return;
    }

    if (isCnhFlowActive) {
      if (currentDocumentType == DocumentType.CNH_FRENTE) {
        setState(() {});
        currentDocumentType = DocumentType.CNH_VERSO;
        if (isCnhFlowActive) {
          _showLoadingDialog();
        }
      } else if (currentDocumentType == DocumentType.CNH_VERSO) {
        setState(() {});
      }
    }
  }

  @override
  void onErrorDocument(UnicoError error) {
    _resetFlowState();
  }

  @override
  void onErrorUnico(UnicoError error) {
    _resetFlowState();
  }

  @override
  void onSystemChangedTypeCameraTimeoutFaceInference() {}

  @override
  void onSystemClosedCameraTimeoutSession() {
    _resetFlowState();
  }

  @override
  void onUserClosedCameraManually() {
    _resetFlowState();
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return NagroScaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: NagroFloatingDock(
        backgroundColor: Colors.transparent,
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: continuar,
              action: () {
                iniciarFluxoCapturaCNH();
              },
            ),
          ),
        ],
      ),
      hasLeading: false,
      hasAppbar: false,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: statusBarHeight + ThemeSpacings.s24,
                    bottom: ThemeSpacings.s8,
                    left: ThemeSpacings.s16,
                    right: ThemeSpacings.s32,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Modular.to.pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: ThemeColors.kTextBase,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: ThemeSpacings.s16),
                      Expanded(
                        child: Text(
                          vejaAbaixoComoESimplesTirarAFotoDaFrenteDeSuaCNH,
                          maxLines: 2,
                          style: ThemeTypography.sub2.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ThemeColors.kPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Lottie.asset(
                    Assets.cnhFront,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.white.withValues(alpha: 0.8),
              width: double.infinity,
              height: double.infinity,
              child: const LoadingAnimation(),
            ),
        ],
      ),
    );
  }
}
