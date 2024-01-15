
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  var hasPermission = false.obs;
  var isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  checkPermission() async{
    isLoading.value = false;
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
      hasPermission.value = true;
    } else {
      hasPermission.value = false;
    }
    isLoading.value = true;
  }

}
