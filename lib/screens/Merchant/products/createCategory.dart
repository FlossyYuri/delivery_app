import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ergo_delivery/widget/common/add_button.dart';
import 'package:ergo_delivery/widget/forms/create_category_form.dart';
import 'package:ergo_delivery/widget/forms/create_product_form.dart';
import 'package:ergo_delivery/widget/layout/SimpleAppBar.dart';
import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  registerCategory(
      GlobalKey<FormState> _key, Map<String, dynamic> _formValues) async {
    try {
      // await _firestore
      //     .collection('establishment')
      //     .doc(user.user!.uid)
      //     .set(_formValues);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Produto cadastrado com sucesso!'),
        ),
      );
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
                                CreateCategoryForm(submit: registerCategory)
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
                child: const AddButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
