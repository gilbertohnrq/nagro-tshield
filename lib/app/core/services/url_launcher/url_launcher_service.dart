// coverage:ignore-file
abstract class IUrlLaunchService {
  Future<void> openUrlLaunch(String url);
  Future<void> openEmail(String toEmail, String subject, String body);
  Future<void> launchWhatsApp({required String phone, String? message});
}
