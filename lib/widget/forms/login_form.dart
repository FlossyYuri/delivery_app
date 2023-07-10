import 'package:ergo_delivery/services/auth.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/common/form/CustomTextInput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthStoreController authStoreController =
      Get.put(AuthStoreController());
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final Map<String, dynamic> _formValues = {
    'email': '',
    'password': '',
  };

  setFieldValue(field, value) {
    setState(() {
      _formValues[field] = value;
    });
  }

  updateLoader(bool value) {
    setState(() {
      isLoading = value;
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
            name: 'email',
            label: 'Email',
            placeholder: 'nome@exemplo.com',
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'password',
            label: 'Senha',
            placeholder: '******',
          ),
          const SizedBox(height: 24),
          AppButton(
            label: "Entrar",
            isLoading: isLoading,
            onClick: () async {
              updateLoader(true);
              if (!_formKey.currentState!.validate()) {
                return;
              }
              _formKey.currentState!.save();
              var response = await postRequest('auth/login', _formValues);
              if (response['statusCode'] >= 200 &&
                  response['statusCode'] < 300) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login Realizado com sucesso'),
                  ),
                );
                authStoreController.login(response['jsonResponse']);
                Navigator.of(context).pushReplacementNamed('/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Não foi possível fazer o login, verifique suas  credenciais!'),
                  ),
                );
              }
              updateLoader(false);
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
