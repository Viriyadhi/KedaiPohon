import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter/material.dart';



import 'package:path/path.dart';import 'package:path_provider/path_provider.dart';

class ExcelController{
  Future<void> updateDataExcel(String tulis, String koordinasi, BuildContext context) async{
    try {
      ByteData data = await rootBundle.load('assets/images/logistics.xlsx');
      var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);

      Sheet sheetObject = excel['logistics'];

      var cell = sheetObject.cell(CellIndex.indexByString(koordinasi));
      cell.value = TextCellValue(tulis);

      var fileBytes = excel.save();
      var directory = await getDownloadsDirectory();
      String dirPath = directory!.path;

      File(join('$dirPath/ga_logis.xlsx'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);
    } catch (e) {
      AlertDialog(
        title: const Text('Error'),
        content: const Text('Data tidak dapat di lemparkan ke excel'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      );
    }


  }

  Future<void> deleteDataExcel(String tulis, String koordinasi, BuildContext context) async{
    try {
      ByteData data = await rootBundle.load('assets/images/logistics.xlsx');
      var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);

      Sheet sheetObject = excel['logistics'];

      var cell = sheetObject.cell(CellIndex.indexByString(koordinasi));
      cell.value = TextCellValue(tulis);

      var fileBytes = excel.save();
      var directory = await getDownloadsDirectory();
      String dirPath = directory!.path;

      File(join('$dirPath/ga_logis.xlsx'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);
    } catch (e) {
      AlertDialog(
        title: const Text('Error'),
        content: const Text('Data tidak dapat di lemparkan ke excel'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      );
    }
  }
}

