import 'package:finan/app/core/services/rate_application/rate_application_service.dart';
import 'package:in_app_review/in_app_review.dart';

class RateApplicationService implements IRateApplicationService {
  final InAppReview _inAppReview = InAppReview.instance;

  @override
  Future<void> openOnStore() async {
    await _inAppReview.openStoreListing();
  }

  @override
  Future<void> requestReview() async {
    await _inAppReview.requestReview();
  }
}
