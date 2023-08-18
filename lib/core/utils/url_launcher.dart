import 'package:url_launcher/url_launcher.dart';
import 'package:bookly/core/widgets/custom_snack_bar.dart';

Future<void> launchMyUrl(context, String? url) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      customSnackBar(context, 'Can`t launch url');
    }
  }
}
