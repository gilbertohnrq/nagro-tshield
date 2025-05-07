// coverage:ignore-file
import 'package:finan/app/core/services/cloud_firestore/cloud_firestore_service.dart';
import 'package:finan/app/core/services/cloud_firestore/cloud_firestore_service_impl.dart';
import 'package:finan/app/core/services/flutter_logs/flutter_logs_service_impl.dart';
import 'package:finan/app/core/services/local_data/local_data_service.dart';
import 'package:finan/app/core/services/local_data/local_data_service_impl.dart';
import 'package:finan/app/core/services/nagro_animation/nagro_animation_service.dart';
import 'package:finan/app/core/services/nagro_animation/nagro_animation_service_impl.dart';
import 'package:finan/app/core/services/nagro_video_player/presenter/full_screen_video_player.dart';
import 'package:finan/app/core/services/permission/permission_service.dart';
import 'package:finan/app/core/services/permission/permission_service_impl.dart';
import 'package:finan/app/core/services/settings/settings_service.dart';
import 'package:finan/app/core/services/settings/settings_service_impl.dart';
import 'package:finan/app/core/theme/components/pdf_viewer.dart';
import 'package:finan/app/core/utils/managers/device_manager.dart';
import 'package:finan/app/features/biometric_signature/biometric_signature_module.dart';
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
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_qrcode_scanner_info_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_scanning_finished_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_unexpected_error_info_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_user_error_info_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometrics_know_more_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/finish_sign/biometric_proposal_sign_loading_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/finish_sign/biometric_proposal_sign_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/proposal_sign_denied_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/refuse/reasons_refuse_page.dart';
import 'package:finan/app/features/credit/credit_module.dart';
import 'package:finan/app/features/home/presenter/pages/home/presenter/home_page.dart';
import 'package:finan/app/features/home/presenter/pages/proposal_status/biometrics_in_analysis.dart';
import 'package:finan/app/features/home/presenter/pages/proposal_status/proporsal_sign_denied.dart';
import 'package:finan/app/features/home/presenter/pages/proposal_status/proposal_approve_external.dart';
import 'package:finan/app/features/home/presenter/pages/proposal_status/proposal_declined_by_user.dart';
import 'package:finan/app/features/home/presenter/pages/proposal_status/proposal_expired.dart';
import 'package:finan/app/features/home/presenter/pages/proposal_status/proposal_refused.dart';
import 'package:finan/app/features/pre_approved/pre_approved_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add<ISettingsService>(SettingsServiceImpl.new);

    i.addSingleton<ILocalDataService>(LocalDataServiceImpl.new);
    i.addSingleton<CloudFirestoreService<Map<String, dynamic>>>(
        () => CloudFirestoreServiceImpl<Map<String, dynamic>>());

    i.addSingleton<IPermissionService>(PermissionServiceImpl.new);

    i.add(DeviceManager.new);
    i.add(FlutterLogsServiceImpl.new);

    i.addLazySingleton<NagroAnimationService>(NagroAnimationServiceImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());

    r.child('/info', child: (context) => const BiometricSignatureInfoPage());
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
    r.module('/credit-request', module: CreditModule());

    r.module('/approved-proposal', module: BiometricSignatureModule());

    r.child('/proposal/sign',
        child: (BuildContext context) => const BiometricProposalSignPage());

    r.child('/approved-proposal-external',
        child: (BuildContext context) => const ProposalApproveExternal());

    r.child('/proposal-refused',
        child: (BuildContext context) => const ProposalRefusedScreen());

    r.child('/expired-proposal',
        child: (BuildContext context) => const ProposalExpiredScreen());

    r.child('/biometrics-analysis',
        child: (BuildContext context) => const BiometricsInAnalysisScreen());

    r.child('/proposal-declined-by-user',
        child: (BuildContext context) => const ProposalDeclinedByUserScreen());

    r.child('/biometrics-denied',
        child: (BuildContext context) => const ProposalSignDeniedScreen());

    r.module('/pre-approved', module: PreApprovedModule());
    r.module('/proposal-details', module: BiometricSignatureModule());

    r.child('/user-error',
        child: (BuildContext context) => const BiometricUserErrorInfoPage());
    r.child('/unexpected-error',
        child: (BuildContext context) =>
            const BiometricUnexpectedErrorInfoPage());

    r.child('/video-player-full-screen',
        child: (BuildContext context) =>
            FullScreenVideoPlayer(controller: r.args.data));
  }
}
