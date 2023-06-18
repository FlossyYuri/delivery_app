import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:delivery_app/widget/rounded_search_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

class Cart_screen extends StatefulWidget {
  const Cart_screen({super.key});

  @override
  State<Cart_screen> createState() => _Cart_screenState();
}

class _Cart_screenState extends State<Cart_screen> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  int varQuant = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F5F5F8"),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: HexColor("#F5F5F8"),
        elevation: 0.0,
        bottomOpacity: 0.0,
        title: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 38,
            ),
            Text(
              "Carrinho",
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "swipe on an item to delete",
              style: TextStyle(color: Colors.black, fontSize: 12.0),
            )
          ],
        )),
        toolbarHeight: 90,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items[index];
                      return Dismissible(
                        key: Key(item),
                        onDismissed: (direction) {
                          setState(() {
                            items.removeAt(index);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$item removido')));
                        },
                        background: Container(
                            color: HexColor("#F5F5F8"),
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.backspace,
                                  color: Colors.deepOrange,
                                )
                              ],
                            )),
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(8),
                            leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage("assets/images/kfc.jpg")),
                            title: Text(
                              "CAIXA WRAPSTER",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "2 PEDAÇOS E 1 BATATA",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "300 MT",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Theme.of(context)
                                                  .accentColor),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      varQuant--;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 16,
                                                  )),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 3),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3, vertical: 2),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: Colors.white),
                                                child: Text(
                                                  varQuant.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      varQuant++;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 16,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Subtotal"), Text("580,00 MT")],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Taxa de Entrega",
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                          Text(
                            "100,00 MT",
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "680,00 MT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange
                        ),
                          onPressed: () {}, child: Text("Completar encomenda",style: TextStyle(color: Colors.white),))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
