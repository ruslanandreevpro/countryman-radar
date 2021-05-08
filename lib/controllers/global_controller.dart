import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GlobalController extends GetxController {
  static GlobalController to = Get.find();

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    packageInfo = info;
  }
}
