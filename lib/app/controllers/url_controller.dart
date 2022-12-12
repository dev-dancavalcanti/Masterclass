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
    Uri uri2 = Uri.parse(
        "https://api.whatsapp.com/send?phone=5561999756973&text=Ola%20Daniel%2C%20tudo%20bem%3F%20Podemos%20conversa%3F");

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      if (await canLaunchUrl(uri2)) {
        await launchUrl(uri2, mode: LaunchMode.externalApplication);
      }
    }
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
