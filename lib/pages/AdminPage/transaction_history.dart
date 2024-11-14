import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => TransactionHistoryState();
}

List<Map<String, dynamic>> items = [
  {"name": "Indomie Goreng Box", "out": "4x", "price": "RP. 73,000"},
  {"name": "Nanas", "out": "4x", "price": "RP. 73,000"},
  {"name": "Roti", "out": "4x", "price": "RP. 73,000"},
  {"name": "Indomie Goreng Box", "out": "4x", "price": "RP. 73,000"},
  {"name": "Indomie Goreng Box", "out": "4x", "price": "RP. 73,000"},
];

class TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.green[700],
            margin: const EdgeInsets.only(top: 20, bottom: 0, left: 10, right: 10),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text('Item Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text('Item Out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Item Price', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.end),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
    );
  }
}

