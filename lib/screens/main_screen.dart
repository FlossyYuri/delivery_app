import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/widget/rounded_search_field.dart';
import 'package:hexcolor/hexcolor.dart';

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
                          _buildButtonColumn(Colors.white,
                              Icons.food_bank, 'Restaurantes'),
                          _buildButtonColumn(Colors.white,
                              Icons.shop, 'Vesrtiario'),
                          _buildButtonColumn(
                              Colors.white, Icons.computer, 'Tecnologia'),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Column(
            children: [],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: HexColor("#FF6339"),),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline,color: HexColor("#50555C")),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person,color: HexColor("#50555C")),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.timelapse_rounded,color: HexColor("#50555C")),label: '')
      ]),
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
