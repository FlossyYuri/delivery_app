import 'package:ergo_delivery/constants.dart';
import 'package:ergo_delivery/enums/ActivityFields.dart';
import 'package:ergo_delivery/model/DropdownItem.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/utils/form_validation_api.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/common/form/CustomSelectInput.dart';
import 'package:ergo_delivery/widget/common/form/CustomTextInput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateMerchantForm extends StatefulWidget {
  final Function submit;
  const CreateMerchantForm({super.key, required this.submit});

  @override
  State<CreateMerchantForm> createState() => _CreateMerchantFormState();
}

class _CreateMerchantFormState extends State<CreateMerchantForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formValues = {
    'fullName': '',
    'phone': '',
    'email': '',
    'role': 'MERCHANT',
    'password': '',
    'confirmPassword': '',
    'activityField': '',
    'description': '',
    'address': '',
    'photo': '',
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
            label: 'Nome do Responsável',
            placeholder: 'Nome Apelido',
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
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'establishmentName',
            label: 'Nome do negócio',
            placeholder: 'nome',
            validator: (val) {
              if (val!.isEmpty) {
                return 'Este campo é obrigatório';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomSelectInput(
            setFieldValue: setFieldValue,
            items: ActivityFields.values
                .map(
                  (e) => DropdownItem(
                    fieldFromString[e.toString()],
                    e.toString(),
                  ),
                )
                .toList(),
            name: 'activityField',
            label: 'Ramo de actividade',
            placeholder: 'Ramo de actividade',
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
            name: 'description',
            label: 'Descrição do negócio',
            placeholder: '...',
            validator: (val) {
              if (val!.isEmpty) {
                return 'Este campo é obrigatório';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            setFieldValue: setFieldValue,
            name: 'address',
            label: 'Endereço',
            placeholder: 'Y Mall, Av ...',
            validator: (val) {
              if (val!.isEmpty) {
                return 'Este campo é obrigatório';
              }
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
