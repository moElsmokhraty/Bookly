import 'package:url_launcher/url_launcher_string.dart';
import 'package:bookly/core/widgets/custom_snack_bar.dart';

Future<void> launchMyUrl(context, String? url) async {
  if (url != null) {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      customSnackBar(context, 'Can`t launch url');
    }
  }
}
