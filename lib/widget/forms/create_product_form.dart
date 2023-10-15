import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/utils/form_validation_api.dart';
import 'package:ergo_delivery/model/DropdownItem.dart';
import 'package:ergo_delivery/utils/index.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/common/form/CustomSelectInput.dart';
import 'package:ergo_delivery/widget/common/form/CustomTextInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateProductForm extends StatefulWidget {
  final Function submit;
  const CreateProductForm({super.key, required this.submit});

  @override
  State<CreateProductForm> createState() => _CreateProductFormState();
}

class _CreateProductFormState extends State<CreateProductForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formValues = {
    'name': '',
    'description': '',
    'price': '',
    'category': '',
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
            name: 'name',
            label: 'Nome do produto',
            placeholder: '',
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
            name: 'description',
            label: 'Description',
            placeholder: '',
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
            name: 'price',
            label: 'Preço',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            placeholder: '',
            validator: (val) {
              if (val!.isEmpty) {
                return 'Campo obrigatório';
              }
              if (val!.isNotEmpty && double.parse(val!) <= 0) {
                return 'Valor inválido';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomSelectInput(
            setFieldValue: setFieldValue,
            items: listDynamicToListString(authStoreController
                    .auth.value['establishment']['categories'])
                .map(
                  (e) => DropdownItem(e, e),
                )
                .toList(),
            name: 'category',
            label: 'Categoria',
            placeholder: '',
            validator: (val) {
              if (val!.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          Obx(
            () => AppButton(
              label: "Salvar",
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
