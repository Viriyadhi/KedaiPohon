import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockBarang extends StatefulWidget {
  const StockBarang({super.key});

  @override
  State<StockBarang> createState() => StockBarangState();
}

class StockBarangState extends State<StockBarang> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container (
        child:  const Column(
          children: [
            Text("data"),
          ],
        ),
      )
    );
  }
}

