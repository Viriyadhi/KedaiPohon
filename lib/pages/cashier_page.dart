import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CashierPage extends StatefulWidget {
  const CashierPage({super.key});

  @override
  State<CashierPage> createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  // Sample item list
  final List<Map<String, dynamic>> chosenItems = [
    {"name": "Pancakes", "price": 5.99},
    {"name": "Coffee", "price": 2.99},
    {"name": "Omelette", "price": 7.49},
    {"name": "Omelette", "price": 7.49},
    {"name": "Omelette", "price": 7.49},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Breakfast",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              // TextField
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(79, 98, 0, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(79, 98, 0, 1),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),

              // GridView Container (Fixed height)
              Container(
                margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                height: 200, // Set a fixed height for GridView area
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(79, 98, 0, 1),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 6,
                        children: <Widget>[
                          // Sample grid items (You can add more if needed)
                          Column(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("He'd have you all unravel at the"),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("He'd have you all unravel at the"),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("He'd have you all unravel at the"),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("He'd have you all unravel at the"),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("He'd have you all unravel at the"),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("He'd have you all unravel at the"),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Item list (chosen items) with name on the left and price on the right
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 300, // Fixed height for the item list
                child: ListView.builder(
                  itemCount: chosenItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(chosenItems[index]['name']),
                        trailing: Text("\$${chosenItems[index]['price'].toStringAsFixed(2)}"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
