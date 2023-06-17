import 'package:delivery_app/model/place.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/widget/rounded_search_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:delivery_app/widget/local_card.dart';
import 'package:delivery_app/screens/home_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery_app/screens/favourite_screen.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({super.key});

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F2F2F2"),
      body: Column(
        children: [
          Container(
            height: 290,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [HexColor("#FF6339"), Colors.deepOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [BoxShadow(blurRadius: 40.0)],
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 100.0)),
            ),
            child: Padding(
                padding: const EdgeInsets.only(top: 80, left: 10),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.white),
                        Text(
                          'Entregar Para: Casa',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 15, right: 20, left: 20),
                          child: Flexible(
                              child: RoundedSearchField(onChanged: (value) {})),
                          width: MediaQuery.of(context).size.width * 0.96,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButtonColumn(
                              Colors.white, Icons.food_bank, 'Restaurantes'),
                          _buildButtonColumn(
                              Colors.white, Icons.shop, 'Vesrtiario'),
                          _buildButtonColumn(
                              Colors.white, Icons.computer, 'Tecnologia'),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 40, left: 10, right: 40, bottom: 20),
                child: Row(
                  children: [Text("Melhor Avaliação",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)],
                ),
              ),
              //LocalCardView(place: Place(1, "name", 1, 1, 1))
              CarouselSlider(
  options: CarouselOptions(height: 200.0),
  items: [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: 260,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: LocalCardView(place: Place(1, "Frango Panado - Batata", 1, 1, 1))
        );
      },
    );
  }).toList(),
)
              
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: HexColor("#FF6339"),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, color: HexColor("#50555C")),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: HexColor("#50555C")), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_rounded, color: HexColor("#50555C")),
            label: '')
      ],
      onTap: (value) {
        if (value == 0) Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  FavouriteScreen()),
  );;
        if (value == 1) Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FavouriteScreen()),
  );;
        if (value == 2) Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FavouriteScreen()),
  );;
      },),
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
    padding: EdgeInsets.symmetric(horizontal: 4.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
  );
}
