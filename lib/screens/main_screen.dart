import 'package:carousel_slider/carousel_slider.dart';
import 'package:ergo_delivery/model/place.dart';
import 'package:ergo_delivery/screens/Client/favourite_screen.dart';
import 'package:ergo_delivery/screens/Client/vendor_screen.dart';
import 'package:ergo_delivery/store/auth_store_controller.dart';
import 'package:ergo_delivery/widget/common/app_button.dart';
import 'package:ergo_delivery/widget/local_card.dart';
import 'package:ergo_delivery/widget/rounded_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
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
    // var user = authStoreController.auth['user'];
    // print(user['fullName']);
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
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/cart');
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/shopping-cart.svg',
                                    colorFilter: ColorFilter.mode(
                                      HexColor("#ffffff").withAlpha(140),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            RoundedSearchField(onChanged: (value) {}),
                            const SizedBox(height: 12),
                            TabBar(
                              controller: _tabController,
                              indicatorColor: Theme.of(context).primaryColor,
                              indicatorSize: TabBarIndicatorSize.label,
                              tabs: [
                                _buildTabItem('assets/icons/cocktail.svg',
                                    'Restaurantes', activeTabIndex, 0),
                                _buildTabItem('assets/icons/bag.svg',
                                    'Vestuário', activeTabIndex, 1),
                                _buildTabItem('assets/icons/laptop.svg',
                                    'Tecnologia', activeTabIndex, 2),
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
                  // TabBarView(
                  //   children: [
                  //     // Content of Tab 1
                  //     Center(child: Text('Tab 1 Content')),

                  //     // Content of Tab 2
                  //     Center(child: Text('Tab 2 Content')),

                  //     // Content of Tab 3
                  //     Center(child: Text('Tab 3 Content')),
                  //   ],
                  // ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Melhor Avaliação",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        //LocalCardView(place: Place(1, "name", 1, 1, 1))
                        CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 0.8,
                            enableInfiniteScroll: false,
                            disableCenter: true,
                            padEnds: false,
                            reverse: false,
                          ),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const VendorScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8)),
                                    margin: const EdgeInsets.only(right: 12),
                                    child: LocalCardView(
                                      place: Place(
                                        1,
                                        "Frango Panado - Batata",
                                        1,
                                        1,
                                        1,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Image.asset('assets/images/banner.png'),
                  const SizedBox(
                    height: 48,
                  ),
                  AppButton(
                      onClick: () {
                        authStoreController.logout();
                      },
                      label: 'Logout')
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
                'assets/icons/heart.svg',
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic_sharp-history.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          )
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
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

Widget _buildCarousel(BuildContext context, int carouselIndex) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text('Carousel $carouselIndex'),
      SizedBox(
        // you may want to use an aspect ratio here for tablet support
        height: 200.0,
        child: PageView.builder(
          // store this controller in a State to save the carousel scroll position
          controller: PageController(viewportFraction: 0.8),
          itemBuilder: (BuildContext context, int itemIndex) {
            return _buildCarouselItem(context, carouselIndex, itemIndex);
          },
        ),
      )
    ],
  );
}

Widget _buildCarouselItem(
    BuildContext context, int carouselIndex, int itemIndex) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    ),
  );
}

Widget _buildTabItem(String asset, String text, int currentTab, int tab) {
  return Tab(
    height: 68,
    child: Column(
      children: [
        SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(
            currentTab == tab ? Colors.white : Colors.white.withAlpha(200),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: currentTab == tab ? FontWeight.w400 : FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    ),
  );
}
