import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

class Delivery_Screen extends StatefulWidget {
  const Delivery_Screen({super.key});

  @override
  State<Delivery_Screen> createState() => _Delivery_ScreenState();
}

class _Delivery_ScreenState extends State<Delivery_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#F5F5F8"),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      "Entrega",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Detalhes do endereço"),
                    Text(
                      "Maputo,Matola",
                      style: TextStyle(color: Colors.deepOrange),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Card(
                    elevation: 15,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 168,
                      child: Center(
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 30, left: 22, right: 16, bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Coop, Malhangalene",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 22, right: 22),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 0, left: 22, right: 16, bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Proximo ao centro do pulmão",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 22, right: 22),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 0, left: 22, right: 16, bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "+258 85 894 9398",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      "Método de pagamento",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Card(
                    elevation: 15,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Center(
                          child: Text('Metodos de Pagamento',
                              style: TextStyle(fontSize: 20))),
                    )),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 16, left: 40, right: 40, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "680,00 MT",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange),
                  onPressed: () {},
                  child: Text(
                    "Finalizar",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ));
  }
}
