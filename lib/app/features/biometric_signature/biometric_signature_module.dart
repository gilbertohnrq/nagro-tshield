import 'package:finan/app/core/services/local_data/local_data_service.dart';
import 'package:finan/app/core/services/local_data/local_data_service_impl.dart';
import 'package:finan/app/core/services/trace_id/trace_id_service.dart';
import 'package:finan/app/core/services/trace_id/trace_id_service_impl.dart';
import 'package:finan/app/core/theme/components/pdf_viewer.dart';
import 'package:finan/app/core/utils/managers/geolocalization_manager.dart';
import 'package:finan/app/features/biometric_signature/domain/repositories/i_biometric_signature_repository.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/get_proposal_available_use_case.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/ocr_document_usecase.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/refuse_proposal_usecase.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/sign_contract_usecase.dart';
import 'package:finan/app/features/biometric_signature/external/biometric_signature_service.dart';
import 'package:finan/app/features/biometric_signature/external/i_biometric_signature_service.dart';
import 'package:finan/app/features/biometric_signature/infra/repositories/biometric_signature_repository.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_drive_license_front_accept_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_in_analysis_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_potential_risk_alert_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_proposal_details.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_proposal_signed_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_sign_canceled_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_attach_file_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_choose_type_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_enable_camera_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_info_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_proposal_approve_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_qrcode_scanner_info_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_scanning_finished_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometrics_know_more_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/finish_sign/biometric_proposal_sign_loading_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/finish_sign/biometric_proposal_sign_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/proposal_sign_denied_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/refuse/reasons_refuse_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BiometricSignatureModule extends Module {
  @override
  void binds(Injector i) {
    i.add(GeoLocalizationManager.new);
    i.add<ITraceIdService>(TraceIdServiceImpl.new);
    i.add<ILocalDataService>(LocalDataServiceImpl.new);

    i.add<IBiometricSignatureService>(BiometricSignatureService.new);
    i.add<IBiometricSignatureRepository>(BiometricSignatureRepositoryImpl.new);
    i.add(GetProposeAvailableUseCase.new);
    i.add(SignContractUseCase.new);
    i.add(OcrDocumentUsecase.new);

    i.add(RefuseProposalUseCase.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (BuildContext context) =>
            const BiometricSignatureProposalApprovePage());
    r.child('/proposal-details',
        child: (BuildContext context) =>
            BiometricsProposalDetailsPage(proposalResponse: r.args.data));

    r.child('/info',
        child: (BuildContext context) => const BiometricSignatureInfoPage());
    r.child('/risk-alert',
        child: (BuildContext context) => const BiometricRiskAlertPage());
    r.child('/enable/camera',
        child: (BuildContext context) => BiometricSignatureEnableCameraPage(
              proposalResponse: r.args.data,
            ));

    r.child('/send/face-scanning-finished',
        child: (BuildContext context) => BiometricSignatureScanningFinishedPage(
              biometricArguments: r.args.data,
            ));

    r.child('/qrcode-info',
        child: (BuildContext context) =>
            BiometricSignatureQRCodeScannerInfoPage(
              biometricArguments: r.args.data,
            ));

    r.child('/choose-type',
        child: (BuildContext context) => BiometricSignatureChooseTypePage(
              biometricArguments: r.args.data,
            ));

    r.child('/drive-license-front-accepted',
        child: (BuildContext context) => DriveLicenseFrontAcceptPage(
              biometricArguments: r.args.data,
            ));

    r.child('/attach-file',
        child: (BuildContext context) => BiometricSignatureAttachFilePage(
              biometricArguments: r.args.data,
            ));

    r.child('/pdf-viewer',
        child: (BuildContext context) => PDFViewer(
              curFile: r.args.data,
            ));

    r.child('/proposal/signed',
        child: (BuildContext context) => const ProposalSignedPage());
    r.child('/proposal/signDenied',
        child: (BuildContext context) => const ProposalSignDeniedPage());
    r.child('/proposal/analysis',
        child: (BuildContext context) => const BiometricsInAnalysisPage());
    r.child('/proposal/signCanceled',
        child: (BuildContext context) => const ProposalSignCanceledPage());

    r.child('/proposal/sign',
        child: (BuildContext context) => const BiometricProposalSignPage());

    r.child('/refuse-proposal',
        child: (BuildContext context) => const ReasonsRefusePage());

    r.child('/know-more',
        child: (BuildContext context) => const BiometricsKnowMorePage());
    r.child('/loading',
        child: (BuildContext context) =>
            const BiometricProposalSignLoadingPage());
  }
}
