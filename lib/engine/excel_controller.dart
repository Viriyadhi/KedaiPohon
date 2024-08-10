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

  Future<void> readDataExcel(String koordinasi, BuildContext context) async{
    try {
      var directory = await getDownloadsDirectory();
      String dirPath = directory!.path;
      var file = '$dirPath/ga_logis.xlsx';
      var bytes = File(file).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys){
        print(table);
        print(excel.tables[table]!.maxColumns);
        print(excel.tables[table]!.maxRows);
        for (var row in excel.tables[table]!.rows){
          for (var cell in row){
            final value = cell?.value;
            final numFormat = cell?.cellStyle!.numberFormat ?? NumFormat.standard_0;
            switch(value){
              case null:
                print('  empty cell');
                print('  format: $numFormat');
              case TextCellValue():
                print('  text: ${value.value}');
              case FormulaCellValue():
                print('  formula: ${value.formula}');
                print('  format: $numFormat');
              case IntCellValue():
                print('  int: ${value.value}');
                print('  format: $numFormat');
              case BoolCellValue():
                print('  bool: ${value.value ? 'YES!!' : 'NO..' }');
                print('  format: $numFormat');
              case DoubleCellValue():
                print('  double: ${value.value}');
                print('  format: $numFormat');
              case DateCellValue():
                print('  date: ${value.year} ${value.month} ${value.day} (${value.asDateTimeLocal()})');
              case TimeCellValue():
                print('  time: ${value.hour} ${value.minute} ... (${value.asDuration()})');
              case DateTimeCellValue():
                print('  date with time: ${value.year} ${value.month} ${value.day} ${value.hour} ... (${value.asDateTimeLocal()})');
            }
            print('$row');
          }
        }
      }
    } catch (e) {
      AlertDialog(
        title: const Text('Error'),
        content: const Text('Data tidak dapat di ditampilkan'),
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

