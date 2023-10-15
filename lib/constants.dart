import 'package:ergo_delivery/enums/ActivityFields.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 244, 95, 55);
const kPrimaryLightColor = Color.fromARGB(255, 255, 255, 255);

Map<String, dynamic> fieldFromString = {
  ActivityFields.restaurants.toString(): 'Restaurante',
  ActivityFields.grocery.toString(): 'Mercado',
  ActivityFields.tecnology.toString(): 'Tecnologia',
  ActivityFields.fashion.toString(): 'Vestuário',
};
