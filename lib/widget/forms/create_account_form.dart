import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/widget/forms/create_client_form.dart';
import 'package:ergo_delivery/widget/forms/create_driver_form.dart';
import 'package:ergo_delivery/widget/forms/create_merchant_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountForm extends StatefulWidget {
  final int activeTabIndex;

  const CreateAccountForm({
    super.key,
    required this.activeTabIndex,
  });

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formValues = {
    'fullName': '',
    'phone': '',
    'email': '',
    'password': '',
    'confirmPassword': '',
  };
  final AuthStoreController authStoreController =
      Get.find<AuthStoreController>();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  setFieldValue(field, value) {
    setState(() {
      _formValues[field] = value;
    });
  }

  registerUser(
      GlobalKey<FormState> _key, Map<String, dynamic> _formValues) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: _formValues['email'], password: _formValues['password']);
      _formValues['uid'] = user.user!.uid;
      _formValues.removeWhere(
          (key, value) => key == 'password' || key == 'confirmPassword');
      await _firestore.collection('users').doc(user.user!.uid).set(_formValues);

      if (_formValues['role'] == 'MERCHANT') {
        var ref = await _firestore.collection('users').doc(user.user!.uid);
        var establishment = await _firestore.collection('establishment').add({
          'establishmentName': _formValues['establishmentName'],
          'activityField': _formValues['activityField'],
          'description': _formValues['description'],
          'address': _formValues['description'],
          'photo': '',
          'representative': ref
        });
        ref.update({
          'establishmentId': establishment.id,
          'establishmentName': FieldValue.delete(),
          'activityField': FieldValue.delete(),
          'description': FieldValue.delete(),
          'address': FieldValue.delete(),
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Conta criada com sucesso!'),
        ),
      );

      var registeredUser =
          await _firestore.collection('users').doc(user.user!.uid).get();
      await authStoreController.login({
        'user': registeredUser.data(),
        'token': await user.user!.getIdToken()
      });
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao criar conta! Tente novamente mais'),
        ),
      );
      print(err.toString());
    }
    authStoreController.updateLoader(false);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.activeTabIndex == 1) {
      return CreateDriverForm(submit: registerUser);
    }
    if (widget.activeTabIndex == 2) {
      return CreateMerchantForm(submit: registerUser);
    }
    return CreateClientForm(submit: registerUser);
  }
}
