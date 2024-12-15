import 'package:geolocator/geolocator.dart';

import '../../core.dart';
import '../../widgets/toast/toast.dart';

Future<bool> checkPermissionLocationIsGranted() async {
  LocationPermission permission;
  bool isGranted = false;
  BuildContext context =
      injection<NavigationService>().navigatorKey.currentContext!;

  ///
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      isGranted = false;
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      isGranted = true;
    }
  } else if (permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always) {
    isGranted = true;
  }

  if (context.mounted) {
    if (!isGranted) {
      CustomToast.showError(
        'Please Give Location Permission',
        context: context,
      );
    }
  }

  return isGranted;
}
