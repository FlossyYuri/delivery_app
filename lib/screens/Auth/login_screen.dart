import 'package:ergo_delivery/widget/auth/create_account_tab.dart';
import 'package:ergo_delivery/widget/auth/login_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int activeTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
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
    final bannerSize = 1 -
        (MediaQuery.of(context).size.height - 250) /
            MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [bannerSize, bannerSize],
            colors: [
              Theme.of(context).primaryColor,
              Colors.white,
            ],
          ),
        ),
        child: Column(children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 32,
                    child: Image.asset(
                      'assets/ergox.png',
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Container(
                        clipBehavior: Clip.none,
                        height: 200,
                        width: 700,
                        child: SvgPicture.asset(
                          'assets/buildings.svg',
                          width: 700,
                          height: 250,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                  activeTabIndex == 0
                      ? LoginTab(
                          tabController: _tabController,
                          activeTabIndex: activeTabIndex,
                        )
                      : CreateAccountTab(
                          tabController: _tabController,
                          activeTabIndex: activeTabIndex,
                        ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
