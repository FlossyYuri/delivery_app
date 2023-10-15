import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/utils/form_validation_api.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/common/form/CustomTextInput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateDriverForm extends StatefulWidget {
  final Function submit;
  const CreateDriverForm({super.key, required this.submit});

  @override
  State<CreateDriverForm> createState() => _CreateDriverFormState();
}

class _CreateDriverFormState extends State<CreateDriverForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formValues = {
    'fullName': '',
    'phone': '',
    'email': '',
    'role': 'DRIVER',
    'plate': '',
    'brand': '',
    'color': '',
    'password': '',
    'confirmPassword': '',
  };
  final AuthStoreController authStoreController =
      Get.find<AuthStoreController>();
  final passwordController = TextEditingController();

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
              return null;
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
              return null;
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
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'brand',
            label: 'Marca do Veículo',
            placeholder: 'Suzuki',
            validator: (val) {
              if (val!.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'color',
            label: 'Cor',
            placeholder: 'Preto',
            validator: (val) {
              if (val!.isEmpty) {
                return 'Cor é obrigatória';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'plate',
            label: 'Matrícula',
            placeholder: 'XYZ 123 MP',
            validator: (val) {
              if (val!.isEmpty) {
                return 'Matrícula é obrigatória';
              }
              return null;
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
              return null;
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
              return null;
            },
          ),
          const SizedBox(height: 24),
          Obx(
            () => AppButton(
              label: "Criar conta",
              isLoading: authStoreController.isLoading.value,
              onClick: () async {
                authStoreController.updateLoader(true);
                if (!_formKey.currentState!.validate()) {
                  authStoreController.updateLoader(false);
                  return;
                }
                _formKey.currentState!.save();
                widget.submit(_formKey, _formValues);
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
