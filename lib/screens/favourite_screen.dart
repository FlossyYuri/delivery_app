import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#FF6339"),
        title: const Text(
          'Locais Favoritos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange)),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 10, left: 20),
                                child: Text(
                                  "KFC",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20),
                                child: Text(
                                  "Frango Panado - Batata",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20),
                                child: Text(
                                  "4.0 (2 REVIEWS)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 20),
                                    child: Text(
                                      "15 min de espera",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 70,
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.red,
                                      width: 70,
                                      height: 70,
                                      child: const Icon(Icons.cake,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(width: 10),
                                    const Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('STREETWISE 2'),
                                          Text('2 PEDAÇOS E 1 BATATA',
                                              style:
                                                  TextStyle(color: Colors.grey))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 70,
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.red,
                                      width: 70,
                                      height: 70,
                                      child: const Icon(Icons.spoke,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(width: 10),
                                    const Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('STREETWISE 2'),
                                          Text('2 PEDAÇOS E 1 BATATA',
                                              style:
                                                  TextStyle(color: Colors.grey))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 40, left: 20, right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 70,
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.red,
                                      width: 70,
                                      height: 70,
                                      child: const Icon(Icons.food_bank,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(width: 10),
                                    const Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('STREETWISE 2'),
                                          Text('2 PEDAÇOS E 1 BATATA',
                                              style:
                                                  TextStyle(color: Colors.grey))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          // ListTile(
                          //   leading: new Icon(Icons.photo),
                          //   title: new Text('Photo'),
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          // ),
                          // ListTile(
                          //   leading: new Icon(Icons.music_note),
                          //   title: new Text('Music'),
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          // ),
                          // ListTile(
                          //   leading: new Icon(Icons.videocam),
                          //   title: new Text('Video'),
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          // ),
                          // ListTile(
                          //   leading: new Icon(Icons.share),
                          //   title: new Text('Share'),
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          // ),
                        ],
                      );
                    });
              },

              child: const Text(
                'Clique aqui para ver os detalhes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
