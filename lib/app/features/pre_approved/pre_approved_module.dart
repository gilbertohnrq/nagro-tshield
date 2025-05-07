import 'package:finan/app/core/router/update_contact_guard.dart';
import 'package:finan/app/core/services/local_data/local_data_service.dart';
import 'package:finan/app/core/services/local_data/local_data_service_impl.dart';
import 'package:finan/app/features/biometric_signature/domain/repositories/i_biometric_signature_repository.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/get_proposal_available_use_case.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/ocr_document_usecase.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/sign_contract_usecase.dart';
import 'package:finan/app/features/biometric_signature/external/biometric_signature_service.dart';
import 'package:finan/app/features/biometric_signature/external/i_biometric_signature_service.dart';
import 'package:finan/app/features/biometric_signature/infra/models/page_arguments/biometric_signature_page_arguments.dart';
import 'package:finan/app/features/biometric_signature/infra/repositories/biometric_signature_repository.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_animation_cnh_front_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_attach_file_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_choose_type_page.dart';
import 'package:finan/app/features/biometric_signature/presenter/pages/biometric_signature_qrcode_scanner_page.dart';
import 'package:finan/app/features/pre_approved/domain/repositories/i_cep_repository.dart';
import 'package:finan/app/features/pre_approved/domain/repositories/i_pre_approved_repository.dart';
import 'package:finan/app/features/pre_approved/domain/usecases/get_address_usecase.dart';
import 'package:finan/app/features/pre_approved/domain/usecases/pre_approved_get_banks_usecase.dart';
import 'package:finan/app/features/pre_approved/domain/usecases/pre_approved_simulate_usecase.dart';
import 'package:finan/app/features/pre_approved/domain/usecases/pre_approved_update_client_usecase.dart';
import 'package:finan/app/features/pre_approved/external/cep_service/cep_service.dart';
import 'package:finan/app/features/pre_approved/external/cep_service/i_cep_service.dart';
import 'package:finan/app/features/pre_approved/external/pre_approved_service/i_pre_approved_service.dart';
import 'package:finan/app/features/pre_approved/external/pre_approved_service/pre_approved_service.dart';
import 'package:finan/app/features/pre_approved/infra/repositories/imp_cep_repository.dart';
import 'package:finan/app/features/pre_approved/infra/repositories/imp_pre_approved_repository.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/about_nagro_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/cnh-examples/new_cnh_example_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/cnh-examples/old_cnh_example_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/data_confirm_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/document_selection_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/document_tips_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_bank_info_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_input_address_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_input_cnh_info_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_not_confirmed_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_processing_update_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_resumed_proposal_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_simulate_page.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_update_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PreApprovedModule extends Module {
  @override
  void binds(Injector i) {
    i.add<IPreApprovedRepository>(ImpPreApprovedRepository.new);
    i.add(PreApprovedSimulateUsecase.new);
    i.add(PreApprovedUpdateClientUsecase.new);
    i.add(PreApprovedGetBanksUsecase.new);
    i.add<IPreApprovedService>(PreApprovedService.new);
    i.addSingleton<ILocalDataService>(LocalDataServiceImpl.new);
    i.addSingleton<ICepService>(CepService.new);
    i.add<ICepRepository>(ImpCepRepository.new);
    i.add(GetAddressUsecase.new);

    i.addSingleton(GetProposeAvailableUseCase.new);
    i.add<IBiometricSignatureService>(BiometricSignatureService.new);
    i.add<IBiometricSignatureRepository>(BiometricSignatureRepositoryImpl.new);
    i.add(SignContractUseCase.new);
    i.add(OcrDocumentUsecase.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (BuildContext context) =>
            const PreApprovedResumedProposalPage());
    r.child('/simulate',
        child: (BuildContext context) =>
            PreApprovedSimulateProposalPage(loanAmount: r.args.data));
    r.child('/document-selection',
        child: (BuildContext context) => const DocumentSelectionPage());
    r.child('/document-tips',
        child: (BuildContext context) => const DocumentTipsPage());
    r.child('/input-cnh-info',
        child: (BuildContext context) => const PreApprovedInputCNHInfoPage());
    r.child('/input-address',
        child: (BuildContext context) => const PreApprovedInputAddressPage());
    r.child('/input-bank',
        child: (BuildContext context) => const PreApprovedInputBankPage());

    r.child('/processing-update',
        child: (BuildContext context) =>
            const PreApprovedProcessingUpdatePage());

    r.child('/input-contact',
        child: (BuildContext context) => const PreApprovedUpdateContactPage(),
        guards: [UpdateContactGuard()]);

    r.child('/new-cnh-example',
        child: (BuildContext context) => const NewCnhExamplePage());
    r.child('/old-cnh-example',
        child: (BuildContext context) => const OldCnhExamplePage());
    r.child('/not-confirmed-page',
        child: (BuildContext context) => const PreApprovedNotConfirmedPage());
    r.child('/about-nagro',
        child: (BuildContext context) =>
            AboutNagroPage(collection: r.args.data));
    r.child('/data-confirm',
        child: (BuildContext context) => const DataConfirmPage());
    r.child(
      '/qrcode-scanner',
      child: (BuildContext context) => BiometricSignatureQRCodeScannerPage(
        biometricArguments: BiometricSignatureSendPhotoPageArguments.mocked(),
      ),
    );
    r.child('/choose-type',
        child: (BuildContext context) => BiometricSignatureChooseTypePage(
              biometricArguments: r.args.data,
            ));
    r.child('/animation-cnh',
        child: (BuildContext context) => AnimationCNHFrontPage(
              biometricArguments: r.args.data,
            ));
    r.child('/attach-file',
        child: (BuildContext context) => BiometricSignatureAttachFilePage(
              biometricArguments: r.args.data,
            ));
  }
}
