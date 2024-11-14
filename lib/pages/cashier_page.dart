import 'package:flutter/material.dart';

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


              Container(
                margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                height: 250, // Set a fixed height for GridView area
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:Image.asset('assets/images/kedai_pohon.png',
                                    height: 92,
                                  ),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:Image.asset('assets/images/kedai_pohon.png',
                                    height: 92,
                                  ),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:Image.asset('assets/images/kedai_pohon.png',
                                    height: 92,
                                  ),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:Image.asset('assets/images/kedai_pohon.png',
                                    height: 92,
                                  ),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:Image.asset('assets/images/kedai_pohon.png',
                                    height: 92,
                                  ),
                                ),
                              ),
                              const Text("MENU 1"),
                              const Text("IDR 10K"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:Image.asset('assets/images/kedai_pohon.png',
                                    height: 92,
                                  ),
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

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 200,
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
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(145, 180, 0, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                        },
                        child: const Text(
                          'KONFIRMASI PESANAN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
