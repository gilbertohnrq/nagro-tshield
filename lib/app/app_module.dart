import 'package:finan/app/core/services/app_links/app_links_service_impl.dart';
import 'package:finan/app/core/services/local_data/local_data_service.dart';
import 'package:finan/app/core/services/local_data/local_data_service_impl.dart';
import 'package:finan/app/core/services/permission/permission_service.dart';
import 'package:finan/app/core/services/permission/permission_service_impl.dart';
import 'package:finan/app/core/services/rate_application/rate_application_service.dart';
import 'package:finan/app/core/services/rate_application/rate_application_service_impl.dart';
import 'package:finan/app/core/services/settings/settings_service.dart';
import 'package:finan/app/core/services/settings/settings_service_impl.dart';
import 'package:finan/app/core/services/trace_id/trace_id_service.dart';
import 'package:finan/app/core/services/trace_id/trace_id_service_impl.dart';
import 'package:finan/app/core/services/unico_check/unico_check_service.dart';
import 'package:finan/app/core/services/upgrader/upgrader_service.dart';
import 'package:finan/app/core/services/upgrader/upgrader_service_impl.dart';
import 'package:finan/app/core/services/url_launcher/url_launcher_service.dart';
import 'package:finan/app/core/services/url_launcher/url_launcher_service_impl.dart';
import 'package:finan/app/core/utils/managers/geolocalization_manager.dart';
import 'package:finan/app/features/biometric_signature/domain/repositories/i_biometric_signature_repository.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/get_proposal_available_use_case.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/ocr_document_usecase.dart';
import 'package:finan/app/features/biometric_signature/domain/usecases/sign_contract_usecase.dart';
import 'package:finan/app/features/biometric_signature/external/biometric_signature_service.dart';
import 'package:finan/app/features/biometric_signature/external/i_biometric_signature_service.dart';
import 'package:finan/app/features/biometric_signature/infra/repositories/biometric_signature_repository.dart';
import 'package:finan/app/features/home/home_module.dart';
import 'package:finan/app/features/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    i.add<ISettingsService>(SettingsServiceImpl.new);
    i.addSingleton<IRateApplicationService>(RateApplicationService.new);

    i.add(GeoLocalizationManager.new);
    i.addSingleton<ILocalDataService>(LocalDataServiceImpl.new);
    i.addSingleton<ITraceIdService>(TraceIdServiceImpl.new);
    i.addSingleton<IPermissionService>(PermissionServiceImpl.new);
    i.addSingleton<IUrlLaunchService>(UrlLaunchServiceImpl.new);
    i.addSingleton<AppLinksService>(AppLinksService.new);
    i.addSingleton<UnicoCheckService>(UnicoCheckService.new);
    i.addSingleton(GetProposeAvailableUseCase.new);
    i.add<IBiometricSignatureService>(BiometricSignatureService.new);
    i.add<IBiometricSignatureRepository>(BiometricSignatureRepositoryImpl.new);
    i.add(SignContractUseCase.new);
    i.add(OcrDocumentUsecase.new);
    i.addSingleton<IUpgraderService>(UpgraderServiceImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/home', module: HomeModule());
  }
}
