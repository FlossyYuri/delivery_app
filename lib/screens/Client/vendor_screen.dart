import 'package:carousel_slider/carousel_slider.dart';
import 'package:ergo_delivery/widget/vendor/CatalogueItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({super.key});

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#50555C"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/banner.png'),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: HexColor('#F2F2F2'),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "KFC",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Frango Panado - Batata",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
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
                                "15 min de espera",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
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
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 0.4,
                            enableInfiniteScroll: false,
                            disableCenter: true,
                            padEnds: false,
                            reverse: false,
                            height: 20,
                          ),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Item $i",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      const CatalogueItem(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
