import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthStoreController extends GetxController {
  final box = GetStorage();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxMap<String, dynamic> auth = {'user': {}, 'token': null}.obs;
  var isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(payload) async {
    Map<String, dynamic> user = {
      "user": payload['user'],
      "token": payload['token']
    };
    if (payload['user']['role'] == 'MERCHANT') {
      var establishmentRef = _firestore
          .collection('establishment')
          .doc(auth.value['user']['establishmentId'].toString());
      var est = (await establishmentRef.get()).data();
      user['establishment'] = est;
    }
    print(user['user'].toString());
    auth = user.obs;
    _persistData();
  }

  void logout() {
    auth = {"user": {}, "token": null}.obs;
    box.erase();
    Get.offAllNamed('/auth/login');
    _auth.signOut();
  }

  void updateLoader(bool payload) {
    isLoading = payload.obs;
  }

  void _persistData() {
    box.write('auth', auth);
  }

  void initAuthStore() async {
    var storedData = box.read('auth');
    print("init value: " + storedData.toString());
    if (storedData != null) {
      auth = (storedData as Map<String, dynamic>).obs;
    }

    print("start value: " + storedData.toString());
  }
}
