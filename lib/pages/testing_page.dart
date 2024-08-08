import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  late TextEditingController _testingController;
  
  

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


  Future<void> updateExcel(String tulis) async{
    try {
      ByteData data = await rootBundle.load('assets/images/logistics.xlsx');
      var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);

      Sheet sheetObject = excel['logistics'];

      var cell = sheetObject.cell(CellIndex.indexByString('A1'));
      cell.value = TextCellValue(tulis);

      var fileBytes = excel.save();
      var directory = await getApplicationDocumentsDirectory();
      String dirPath = directory.path;

      File(join('$dirPath/output_file_name.xlsx'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);

      print('Updated cell value: ${cell.value}');
      print('Excel file saved at $directory');
    } catch (e) {
      print('Error: $e');
    }


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
                onPressed: () {updateExcel(_testingController.text);},
                child: const Text('Input'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
