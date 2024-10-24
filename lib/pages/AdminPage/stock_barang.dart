import 'package:flutter/material.dart';

class StockBarang extends StatefulWidget {
  const StockBarang({super.key});

  @override
  State<StockBarang> createState() => StockBarangState();
}

List<Map<String, dynamic>> items = [
  {"name": "Indomie Goreng Box", "out": "4x", "price": "RP. 73,000"},
  {"name": "Nanas", "out": "4x", "price": "RP. 73,000"},
  {"name": "Roti", "out": "4x", "price": "RP. 73,000"},
  {"name": "Indomie Goreng Box", "out": "4x", "price": "RP. 73,000"},
  {"name": "Indomie Goreng Box", "out": "4x", "price": "RP. 73,000"},
];

class StockBarangState extends State<StockBarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0), // Adds padding around the entire section
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green[700]!, width: 2.0), // Border for the entire table
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.green[700],
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(child: Text('Item Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    Expanded(child: Text('Item Out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                    Expanded(child: Text('Item Price', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.end)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(items[index]['name'], style: const TextStyle(fontSize: 16)),
                            ),
                            Expanded(
                              child: Text(items[index]['out'], style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
                            ),
                            Expanded(
                              child: Text(items[index]['price'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.end),
                            ),
                          ],
                        ),
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
