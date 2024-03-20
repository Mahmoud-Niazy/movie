import 'package:url_launcher/url_launcher.dart';

Future<void> launchMyUrl() async {
  final Uri url = Uri.parse('https://www.linkedin.com/in/mahmoud-niazy-29a251254/');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}