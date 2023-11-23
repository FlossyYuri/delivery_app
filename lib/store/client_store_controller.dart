import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ergo_delivery/model/place.dart';
import 'package:get/get.dart';

class ClientStoreController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var currentActivityField = 0.obs;
  var establishments = <Establishment>[].obs;

  Future<List<Establishment>> getEstablishmetsByActivity() async {
    var documents = await _firestore.collection('establishment').get();
    return documents.docs.map((e) {
      var data = e.data()!;
      data['id'] = e.id;

      return Establishment.fromMap(e.data()!);
    }).toList();
  }
}
