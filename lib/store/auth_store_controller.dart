import 'package:get/get.dart';

class AuthStoreController extends GetxController {
  RxMap<String, dynamic> auth = {"user": {}, "token": null}.obs;

  void login(payload) {
    auth = {"user": payload['user'], "token": payload['token']}.obs;
  }
}
