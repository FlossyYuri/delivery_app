import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/utils/index.dart';
import 'package:ergo_delivery/widget/common/add_button.dart';
import 'package:ergo_delivery/widget/forms/create_category_form.dart';
import 'package:ergo_delivery/widget/layout/SimpleAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthStoreController authStoreController =
      Get.find<AuthStoreController>();

  deleteCategory(String category) async {
    var establishment = _firestore
        .collection('establishment')
        .doc(authStoreController.auth.value['user']['establishmentId']);

    List<String> categories = listDynamicToListString(
        (await establishment.get()).data()!['categories']);
    categories.remove(category);
    await establishment.update({'categories': categories});
    authStoreController.updateEstablishment();
    Get.back();
  }

  registerCategory(
      GlobalKey<FormState> _key, Map<String, dynamic> _formValues) async {
    try {
      var establishment = _firestore
          .collection('establishment')
          .doc(authStoreController.auth.value['user']['establishmentId']);

      List<String> categories = listDynamicToListString(
          (await establishment.get()).data()!['categories']);
      categories.add(_formValues['name']);
      await establishment.update({'categories': categories});
      authStoreController.updateEstablishment();
      _key.currentState!.reset();

      CustomUtils().showCustomDialog(
        context,
        'Categoria Criada',
        'A nova categoria foi criada com sucesso! Clique ok para voltar para tela de produtos.',
        'Criar Mais 1',
        () {},
        'OK',
        () {
          Get.back();
        },
      );
      authStoreController.updateLoader(false);
    } on FirebaseFirestore catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao criar conta! Tente novamente mais'),
        ),
      );
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    print(authStoreController.auth.value['establishment']);
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: const SimpleAppBar(
            title: 'Cadastrar Categoria',
            isDark: false,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 64,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        top: -48,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 24,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Informações da categoria',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 12),
                                CreateCategoryForm(submit: registerCategory),
                                const SizedBox(height: 12),
                                Text(
                                  'Lista de categorias',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Obx(() => Column(
                                      children: [
                                        ...listDynamicToListString(
                                                authStoreController.auth
                                                        .value['establishment']
                                                    ['categories'])
                                            .map(
                                              (e) => ListTile(
                                                title: Text(e),
                                                trailing: IconButton(
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                    onPressed: () {
                                                      CustomUtils()
                                                          .loadingModal(
                                                              context);
                                                      deleteCategory(e);
                                                    }),
                                              ),
                                            )
                                            .toList(),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                decoration: BoxDecoration(color: Theme.of(context).canvasColor),
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
