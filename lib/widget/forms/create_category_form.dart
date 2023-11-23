import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/utils/form_validation_api.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/common/form/CustomTextInput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCategoryForm extends StatefulWidget {
  final Function submit;
  const CreateCategoryForm({super.key, required this.submit});

  @override
  State<CreateCategoryForm> createState() => _CreateCategoryFormState();
}

class _CreateCategoryFormState extends State<CreateCategoryForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formValues = {
    'name': '',
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
            label: 'Nome da Categoria',
            placeholder: '',
            validator: (val) {
              if (val!.isEmpty) {
                return 'Nome inválido';
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
