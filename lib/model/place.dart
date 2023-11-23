import 'package:ergo_delivery/enums/ActivityFields.dart';
import 'package:ergo_delivery/utils/index.dart';

class Establishment {
  String? id;
  ActivityFields? activityField;
  String? address;
  String? description;
  String? establishmentName;
  String? photo = '';
  List<String>? categories;
  String? representativeId;

  Establishment(
    this.activityField,
    this.address,
    this.description,
    this.establishmentName,
    this.photo,
    this.categories,
    this.representativeId,
  );

  Establishment.fromMap(Map<String, dynamic> document) {
    id = document['id'];
    address = document['address'];
    description = document['description'];
    establishmentName = document['establishmentName'];
    photo = document['photo'];
    activityField = stringToActivityEnum(document['activityField']);
    categories = document['categories'] != null
        ? listDynamicToListString(document['categories'])
        : [];
    representativeId = document['representativeId'];
  }
}
