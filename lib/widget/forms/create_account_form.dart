import 'package:ergo_delivery/services/auth.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/common/form/CustomTextInput.dart';
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
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'phone',
            label: 'Telefone',
            placeholder: '8* *** ****',
          ),
          const SizedBox(height: 24),
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
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'confirmPassword',
            label: 'Confirmar Senha',
            placeholder: '******',
          ),
          const SizedBox(height: 24),
          AppButton(
            label: "Criar conta",
            onClick: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              _formKey.currentState!.save();
              if (widget.activeTabIndex == 0) {
                _formValues['role'] = 'CLIENT';
              } else {
                _formValues['role'] = 'DRIVER';
              }
              var response = await postRequest('auth/signup', _formValues);
              if (response['statusCode'] >= 200 &&
                  response['statusCode'] < 300) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Conta criada com sucesso!'),
                  ),
                );
                authStoreController.login(response['jsonResponse']);
                Navigator.of(context).pushReplacementNamed('/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Erro ao criar conta! Tente novamente mais'),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
