import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlController {
  TextEditingController subjectTextController = TextEditingController();
  TextEditingController bodyTextController = TextEditingController();

  Future<void> launchHttps(String link, String paramets) async {
    Uri uri = Uri.https(link, paramets);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {}
  }

  Future<void> launchHttpsRepositorie(String link) async {
    Uri uri = Uri.parse(link);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {}
  }

  Future<void> launchWhatsApp() async {
    Uri uri = Uri.parse("whatsapp://send?phone=+5561999756973");

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {}
  }

  Future<void> launchEmail() async {
    Uri uri = Uri(
      scheme: 'mailto',
      path: 'dev.dancavalcanti@gmail.com',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {}
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=+${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
