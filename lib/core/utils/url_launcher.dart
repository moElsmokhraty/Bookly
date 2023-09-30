import 'package:bookly/core/functions/show_custom_snack_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchMyUrl(context, String? url) async {
  if (url != null) {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      showCustomSnackBar(context, 'Can`t launch url');
    }
  }
}
