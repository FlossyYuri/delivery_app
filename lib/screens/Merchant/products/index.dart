import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ergo_delivery/enums/ButtonTypes.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/utils/index.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/vendor/CatalogueItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MerchantProducts extends StatelessWidget {
  MerchantProducts({super.key});

  final AuthStoreController authStoreController =
      Get.find<AuthStoreController>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final selectedCategory = ''.obs;
  final products = <Map<String, dynamic>>[].obs;

  setProducts(String category) async {
    authStoreController.updateLoader(true);
    var queriedProducts = await _firestore
        .collection('products')
        .where('establishmentId',
            isEqualTo: authStoreController.auth.value['user']
                ['establishmentId'])
        .where('category', isEqualTo: category)
        .get();
    products.assignAll(queriedProducts.docs.map((e) => e.data()).toList());
    authStoreController.updateLoader(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F2F2F2"),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            color: HexColor("#F2F2F2"),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Obx(
                    () => Text(
                      authStoreController.auth['establishment']
                          ['establishmentName'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Text(
                      authStoreController.auth['establishment']['description'],
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/star.svg'),
                          const SizedBox(width: 8),
                          const Text(
                            "4.0 (2 REVIEWS)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    onClick: () {
                      Get.toNamed('/merchant/products/create');
                    },
                    label: "Adicionar novo produto",
                    type: ButtonTypes.outlined,
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    onClick: () {
                      Get.toNamed('/merchant/products/createCategory');
                    },
                    label: "Adicionar nova categoria",
                    type: ButtonTypes.outlined,
                  ),
                  Obx(() {
                    if (authStoreController
                            .auth.value['establishment']['categories'].length ==
                        0) {
                      return Container();
                    }
                    if (selectedCategory.value.isEmpty) {
                      return Column(
                        children: [
                          const SizedBox(height: 24),
                          Center(
                              child: Text(
                            "Selecione uma categoria",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey.shade600,
                            ),
                          )),
                        ],
                      );
                    }
                    return Container();
                  }),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 24,
                      bottom: 24,
                    ),
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: HexColor("#FF6339").withAlpha(100),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          20,
                        ),
                        bottomLeft: Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(() {
                        var categories = listDynamicToListString(
                            authStoreController.auth.value['establishment']
                                ['categories']);
                        if (categories.length == 0) {
                          return Container();
                        }
                        return Row(
                          children: categories
                              .map(
                                (category) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: InkWell(
                                    onTap: () {
                                      setProducts(category);
                                      selectedCategory.value = category;
                                    },
                                    child: Obx(
                                      () => Text(
                                        category,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                              selectedCategory.value == category
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      }),
                    ),
                  ),
                  Obx(
                    () => authStoreController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            children: [
                              ...products.value
                                  .map(
                                    (product) => Column(
                                      children: [
                                        CatalogueItem(product: product),
                                        const SizedBox(height: 12),
                                      ],
                                    ),
                                  )
                                  .toList(),
                              if (products.value.isEmpty)
                                const Center(child: Text("Nenhum Produto"))
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
