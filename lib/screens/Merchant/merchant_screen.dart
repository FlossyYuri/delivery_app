import 'package:ergo_delivery/screens/Client/favourite_screen.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({super.key});

  @override
  State<MerchantScreen> createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int activeTabIndex = 0;
  final AuthStoreController authStoreController =
      Get.find<AuthStoreController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        activeTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F2F2F2"),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Container(
            color: HexColor("#F2F2F2"),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width,
                          70.0,
                        ),
                      ),
                    ),
                    child: Column(children: [
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Oval.svg',
                                    ),
                                    const SizedBox(width: 12),
                                    Obx(
                                      () => Text(
                                        'Bem Vindo ${authStoreController.auth['user']['fullName']}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        _screenButton('Estabelecimento',
                            'assets/icons/establishment.svg', () {}),
                        const SizedBox(height: 12),
                        _screenButton('Produtos', 'assets/icons/products.svg',
                            () {
                          Get.toNamed('/merchant/products');
                        }),
                        const SizedBox(height: 12),
                        _screenButton(
                            'Encomendas', 'assets/icons/orders.svg', () {}),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/banner.png'),
                  const SizedBox(
                    height: 48,
                  ),
                  AppButton(
                    onClick: () {
                      authStoreController.logout();
                    },
                    label: 'Logout',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/heroicons-solid_home.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/establishment.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).disabledColor,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/products.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).disabledColor,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/orders.svg',
                colorFilter: ColorFilter.mode(
                  Theme.of(context).disabledColor,
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
        ],
        onTap: (value) {
          if (value == 0)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavouriteScreen(),
              ),
            );

          if (value == 1) Navigator.pushNamed(context, '/extra');

          if (value == 2) Navigator.pushNamed(context, '/extra');

          if (value == 3) Navigator.pushNamed(context, '/extra');
        },
      ),
    );
  }

  _screenButton(String title, String asset, Function callback) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 5),
              color: Colors.black.withAlpha(10),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(asset),
            const SizedBox(width: 24),
            Column(
              children: [
                Text(title),
              ],
            )
          ],
        ),
      ),
    );
  }
}
