import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => TransactionHistoryState();
}

class TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
      Text("Transaction History"),
    );
  }
}

