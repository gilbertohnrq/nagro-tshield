import 'package:finan/app/core/services/unico_check/unico_check_service.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/loading/loading_animation.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/core/utils/extensions/extensions.dart';
import 'package:finan/app/features/biometric_signature/infra/models/page_arguments/biometric_signature_page_arguments.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_qrcode_scanner_page.dart';
import 'package:finan/app/features/pre_approved/presenter/components/need_help_whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:unico_check/unico_check.dart';

class DocumentTipsPage extends StatefulWidget {
  const DocumentTipsPage({super.key});

  static const route = 'document-tips';

  @override
  State<DocumentTipsPage> createState() => _DocumentTipsPageState();
}

class _DocumentTipsPageState extends State<DocumentTipsPage>
    implements UnicoListener, UnicoDocument {
  final unicoCheckService = Modular.get<UnicoCheckService>();

  String? _rgFrenteBase64;
  String? _rgVersoBase64;
  static bool isRgFlowActive = false;

  String? _cnhFrenteBase64;
  String? _cnhVersoBase64;
  static bool isCnhFlowActive = false;

  static DocumentType? currentDocumentType;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    unicoCheckService.init(this);
  }

  void _resetFlowState() {
    isRgFlowActive = false;
    isCnhFlowActive = false;
    currentDocumentType = null;
  }

  void iniciarFluxoCapturaRG() {
    _resetFlowState();
    setState(() {
      _rgFrenteBase64 = null;
      _rgVersoBase64 = null;
      _cnhFrenteBase64 = null;
      _cnhVersoBase64 = null;
    });
    isRgFlowActive = true;
    currentDocumentType = DocumentType.RG_FRENTE;
    unicoCheckService.openCameraDocument(
        documentType: DocumentType.RG_FRENTE, listener: this);
  }

  void iniciarFluxoCapturaCNH() {
    _resetFlowState();
    setState(() {
      _rgFrenteBase64 = null;
      _rgVersoBase64 = null;
      _cnhFrenteBase64 = null;
      _cnhVersoBase64 = null;
    });
    isCnhFlowActive = true;
    currentDocumentType = DocumentType.CNH_FRENTE;
    openCameraDocumentCNHFront();
  }

  void openCameraDocumentCNHFront() {
    unicoCheckService.openCameraDocument(
        documentType: DocumentType.CNH_FRENTE, listener: this);
  }

  void openCameraDocumentCNHVerso() {
    unicoCheckService.openCameraDocument(
        documentType: DocumentType.CNH_VERSO, listener: this);
  }

  void _showRgLoadingDialog() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted && _isLoading) {
        setState(() {
          _isLoading = false;
        });
        if (isRgFlowActive) {
          unicoCheckService.openCameraDocument(
              documentType: DocumentType.RG_VERSO, listener: this);
        }
      }
    });
  }

  void _showCnhLoadingDialog() {
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

  Future<void> _processarDocumentosRG() async {
    if (_rgFrenteBase64 != null && _rgVersoBase64 != null) {
      _resetFlowState();
    }
  }

  Future<void> _processarDocumentosCNH() async {
    if (_cnhFrenteBase64 != null && _cnhVersoBase64 != null) {
      _resetFlowState();
    }
  }

  @override
  void onSuccessDocument(ResultCamera resultCamera) {
    if (resultCamera.base64 == null) {
      _resetFlowState();
      return;
    }

    if (isRgFlowActive) {
      if (currentDocumentType == DocumentType.RG_FRENTE) {
        setState(() {
          _rgFrenteBase64 = resultCamera.base64;
        });
        currentDocumentType = DocumentType.RG_VERSO;
        if (isRgFlowActive) {
          _showRgLoadingDialog();
        }
      } else if (currentDocumentType == DocumentType.RG_VERSO) {
        setState(() {
          _rgVersoBase64 = resultCamera.base64;
        });
        _processarDocumentosRG();
      }
    } else if (isCnhFlowActive) {
      if (currentDocumentType == DocumentType.CNH_FRENTE) {
        setState(() {
          _cnhFrenteBase64 = resultCamera.base64;
        });
        currentDocumentType = DocumentType.CNH_VERSO;
        if (isCnhFlowActive) {
          _showCnhLoadingDialog();
        }
      } else if (currentDocumentType == DocumentType.CNH_VERSO) {
        setState(() {
          _cnhVersoBase64 = resultCamera.base64;
        });
        _processarDocumentosCNH();
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
    return NagroScaffold(
      actions: const [NeedHelpWhatsapp()],
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: continuar,
              action: () {
                Modular.to.pushNamed(
                  BiometricSignatureQRCodeScannerPage.route,
                  arguments: BiometricSignatureSendPhotoPageArguments.mocked(),
                );
              },
            ),
          ),
        ],
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Carteira de Habilitação (CNH)',
                  style: ThemeTypography.headline5.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: ThemeSpacings.s24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Para seguir com a validação, precisamos de uma foto da frente e do verso do seu RG.',
                      style: ThemeTypography.body2,
                    ),
                    SizedBox(height: 134.5.h),
                    Text(
                      'Dicas para boas fotos do seu RG',
                      style: ThemeTypography.body2.copyWith(
                        color: ThemeColors.kPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const _TipItem(
                  icon: Symbols.id_card,
                  text:
                      'Retire o documento do plástico e abra-o com o verso para cima, onde está o QRCode.',
                ),
                const SizedBox(height: ThemeSpacings.s40),
                const _TipItem(
                  icon: Symbols.brightness_5,
                  text:
                      'Posicione o documento sobre uma mesa em um ambiente iluminado.',
                ),
                const SizedBox(height: ThemeSpacings.s40),
                const _TipItem(
                  icon: Symbols.qr_code_scanner,
                  text: 'Aponte a câmera para o QRCode e aguarde a leitura.',
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

class _TipItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TipItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 56.w,
          height: 56.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ThemeColors.kPrimary50,
          ),
          child: Icon(
            icon,
            color: ThemeColors.kPrimary,
            size: 32.w,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: ThemeTypography.body3.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
        ),
      ],
    );
  }
}
