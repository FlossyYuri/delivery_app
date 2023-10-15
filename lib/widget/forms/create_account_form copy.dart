import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/utils/form_validation_api.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/common/form/CustomTextInput.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'fullName',
            label: 'Nome Completo',
            placeholder: 'Nome Completo',
            validator: (val) {
              if (!val!.isValidName) {
                return 'Nome inválido';
              }
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'phone',
            label: 'Telefone',
            placeholder: '8* *** ****',
            validator: (val) {
              if (!val!.isValidPhone) {
                return 'Número inválido';
              }
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'email',
            label: 'Email',
            placeholder: 'nome@exemplo.com',
            validator: (val) {
              if (!val!.isValidEmail) {
                return 'Email inválido, escreva novamente';
              }
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'password',
            label: 'Senha',
            placeholder: '******',
            textController: passwordController,
            validator: (val) {
              if (!val!.isValidPassword) {
                return 'Senha fraca, tente outra';
              }
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'confirmPassword',
            label: 'Confirmar Senha',
            placeholder: '******',
            validator: (val) {
              if (val != passwordController.text) {
                return 'Senha inválida, digite a mesma senha';
              }
              // if (val != _formValues['password']) {
              //   return 'Senha inválida, digite a mesma senha';
              // }
            },
          ),
          const SizedBox(height: 24),
          Obx(
            () => AppButton(
              label: "Criar conta",
              isLoading: authStoreController.isLoading.value,
              onClick: () async {
                authStoreController.updateLoader(true);
                print('in validation');
                if (!_formKey.currentState!.validate()) {
                  authStoreController.updateLoader(false);
                  return;
                }
                _formKey.currentState!.save();
                if (widget.activeTabIndex == 0) {
                  _formValues['role'] = 'CLIENT';
                } else {
                  _formValues['role'] = 'DRIVER';
                }
                try {
                  UserCredential user =
                      await _auth.createUserWithEmailAndPassword(
                          email: _formValues['email'],
                          password: _formValues['password']);
                  _formValues['uid'] = user.user!.uid;
                  _formValues.removeWhere((key, value) =>
                      key == 'password' || key == 'confirmPassword');
                  await _firestore
                      .collection('users')
                      .doc(user.user!.uid)
                      .set(_formValues);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Conta criada com sucesso!'),
                    ),
                  );
                  var registeredUser = await _firestore
                      .collection('users')
                      .doc(user.user!.uid)
                      .get();
                  authStoreController.login({
                    'user': registeredUser.data(),
                    'token': await user.user!.getIdToken()
                  });
                  Get.offAllNamed('/home');
                } on FirebaseAuthException catch (err) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Erro ao criar conta! Tente novamente mais'),
                    ),
                  );
                  print(err.toString());
                }
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}