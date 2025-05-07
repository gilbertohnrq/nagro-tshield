// coverage:ignore-file
import 'dart:io';

import 'package:finan/app/core/services/url_launcher/url_launcher_service.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunchServiceImpl implements IUrlLaunchService {
  @override
  Future<void> openUrlLaunch(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Nao foi possível abrir: $url';
    }
  }

  @override
  Future<void> openEmail(String toEmail, String subject, String body) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Nao foi possível finalizar';
    }
  }

  @override
  Future<void> launchWhatsApp({required String phone, String? message}) async {
    final String contact = "+55$phone";
    final String androidUrl = "whatsapp://send?phone=$contact&text=$message";
    final String iosUrl =
        "https://wa.me/$contact?text=${Uri.parse(message ?? '')}";

    final String webUrl =
        'https://api.whatsapp.com/send/?phone=$contact&text=hi';

    try {
      if (Platform.isIOS) {
        if (await canLaunchUrl(Uri.parse(iosUrl))) {
          await launchUrl(Uri.parse(iosUrl));
        }
      } else {
        if (await canLaunchUrl(Uri.parse(androidUrl))) {
          await launchUrl(Uri.parse(androidUrl));
        }
      }
    } catch (e) {
      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
    }
  }
}
