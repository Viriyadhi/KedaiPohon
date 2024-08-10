import 'package:flutter/material.dart';
import 'package:kedai_pohon/engine/excel_controller.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  late TextEditingController _testingController;
  late ExcelController excelController;

  @override
  void initState() {
    _testingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _testingController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _testingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'value',
                ),
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, textStyle: const TextStyle(fontSize: 20), // Text color
                ),
                onPressed: () {excelController.updateDataExcel(_testingController.text, "A1", context);},
                child: const Text('Input'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
