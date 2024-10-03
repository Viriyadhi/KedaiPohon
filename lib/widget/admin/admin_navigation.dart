import 'package:flutter/material.dart';
import 'package:kedai_pohon/pages/AdminPage/stock_barang.dart';
import 'package:kedai_pohon/pages/AdminPage/transaction_history.dart';

class AdminNavigation extends StatefulWidget {
  const AdminNavigation({super.key});

  @override
  State<AdminNavigation> createState() => AdminNavigationState();
}

class AdminNavigationState extends State<AdminNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget> [
    TransactionHistory(),
    StockBarang()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: screenWidth * 0.25,
            child: Column(
              children: <Widget>[
                Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/kedai_pohon.png',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0 ?const Color.fromRGBO(181, 216, 0, 1): Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(
                      'Riwayat Transaksi',
                      style: TextStyle(
                        color: _selectedIndex == 0 ? Colors.white : Colors.black,
                        fontWeight: _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: _selectedIndex == 0,
                    onTap: () {
                      _onItemTapped(0);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ?const Color.fromRGBO(181, 216, 0, 1): Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(
                      'Stock Barang',
                      style: TextStyle(
                        color: _selectedIndex == 1 ? Colors.white : Colors.black,
                        fontWeight: _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: _selectedIndex == 1,
                    onTap: () {
                      _onItemTapped(1);
                    },
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: 600,
                          child:  TextField(
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
                          width: 175,
                          margin: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(145, 180, 0, 1),
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: ( ) {},
                            child: const Text(
                              "Cari",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: _widgetOptions.elementAt(_selectedIndex),
                    ),
                  ],
                ),
              )
          )
        ],

      ),
    );
  }
}

