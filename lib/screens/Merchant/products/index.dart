import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ergo_delivery/enums/ButtonTypes.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/vendor/CatalogueItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

final List<Map<String, dynamic>> categories = [
  {
    "name": "Streetwise",
    "products": [
      {
        'name': 'SW 1',
        'description': '1 pedaço, 1 batata',
        'price': 200,
        'photo': '',
      },
      {
        'name': 'SW 2',
        'description': '2 pedaço, 1 batata',
        'price': 200,
        'photo': '',
      },
      {
        'name': 'SW 3',
        'description': '3 pedaço, 1 batata',
        'price': 200,
        'photo': '',
      },
    ]
  },
  {
    "name": "Sobremesa",
    "products": [
      {
        'name': 'Krusher',
        'description': 'Batido de sorvete e oreo',
        'price': 130,
      },
      {
        'name': 'Milkshake',
        'description': 'shake de chocolate',
        'price': 200,
        'photo': '',
      },
    ]
  },
  {
    "name": "Burgers",
    "products": [
      {
        'name': 'Double Cheeseburger',
        'description': '1 pedaço, 1 batata',
        'price': 200,
        'photo': '',
      },
      {
        'name': 'Deluxe Burger',
        'description': '2 pedaço, 1 batata',
        'price': 300,
        'photo': '',
      },
      {
        'name': 'Tower Burger',
        'description': '3 pedaço, 1 batata',
        'price': 400,
        'photo': '',
      },
    ]
  },
];

class MerchantProducts extends StatelessWidget {
  MerchantProducts({super.key});

  final AuthStoreController authStoreController =
      Get.find<AuthStoreController>();
  final selectedCategory = (categories.first['name'] as String).obs;
  final products = <Map<String, dynamic>>[...categories.first['products']].obs;

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
                  const Text(
                    "KFC",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Frango Panado - Batata",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
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
                    onClick: () {},
                    label: "Adicionar nova categoria",
                    type: ButtonTypes.outlined,
                  ),
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
                      child: Row(
                        children: categories
                            .map(
                              (category) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: InkWell(
                                  onTap: () {
                                    products.assignAll(category['products']);
                                    selectedCategory.value = category['name'];
                                  },
                                  child: Obx(
                                    () => Text(
                                      category['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: selectedCategory.value ==
                                                category['name']
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Obx(
                    () => Column(
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
