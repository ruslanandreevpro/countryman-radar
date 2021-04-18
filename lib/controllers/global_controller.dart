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

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    packageInfo = info;
  }
}
