import 'package:finan/app/core/services/permission/permission_service.dart';
import 'package:finan/app/core/services/permission/permission_service_impl.dart';
import 'package:finan/app/core/services/settings/settings_service.dart';
import 'package:finan/app/core/services/settings/settings_service_impl.dart';
import 'package:finan/app/core/utils/managers/device_manager.dart';
import 'package:finan/app/core/utils/managers/geolocalization_manager.dart';
import 'package:finan/app/features/credit/domain/repositories/i_credit_repository.dart';
import 'package:finan/app/features/credit/domain/usecase/get_credit_validate_usecase.dart';
import 'package:finan/app/features/credit/domain/usecase/get_terms_usecase.dart';
import 'package:finan/app/features/credit/domain/usecase/send_credit_request_usecase.dart';
import 'package:finan/app/features/credit/external/credit_service.dart';
import 'package:finan/app/features/credit/external/i_credit_service.dart';
import 'package:finan/app/features/credit/infra/repositories/credit_repository.dart';
import 'package:finan/app/features/credit/presenter/pages/credit_request_finish_page.dart';
import 'package:finan/app/features/credit/presenter/pages/credit_request_loading_progress_page.dart';
import 'package:finan/app/features/credit/presenter/pages/credit_request_step_one_page.dart';
import 'package:finan/app/features/credit/presenter/pages/credit_request_step_three_page.dart';
import 'package:finan/app/features/credit/presenter/pages/credit_restriction_info_page.dart';
import 'package:finan/app/features/credit/presenter/pages/rural_producer_not_confirmation_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreditModule extends Module {
  @override
  void binds(Injector i) {
    i.add<ISettingsService>(SettingsServiceImpl.new);
    i.add<ICreditService>(CreditService.new);
    i.add<ICreditRepository>(CreditRepositoryImpl.new);
    i.addSingleton(SendCreditRequestUseCase.new);
    i.add(GetTermsUseCase.new);
    i.add(GetCreditValidateUseCase.new);
    i.add(DeviceManager.new);
    i.add<IPermissionService>(PermissionServiceImpl.new);
    i.add(GeoLocalizationManager.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (BuildContext context) => const CreditRequestStepOnePage());

    r.child('/request/second_step',
        child: (BuildContext context) => const CreditRequestStepTwoPage());

    r.child('/request/finish_page',
        child: (BuildContext context) => const CreditRequestFinishPage());
    r.child('/request/not_rural_producer',
        child: (BuildContext context) =>
            const RuralProducerNotConfirmationPage());
    r.child('/request/credit_restriction',
        child: (BuildContext context) => const CreditRestrictionInfoPage());
    r.child('/request/transaction',
        child: (BuildContext context) =>
            const CreditRequestLoadingProgressPage());
  }
}
