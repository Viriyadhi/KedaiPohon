import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

Future<void> updateExcel() async{
  ByteData data = await rootBundle.load('assets/existing_excel_file.xlsx');
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);

  Sheet sheetObject = excel['logistic'];

  var cell = sheetObject.cell(CellIndex.indexByString('A1'));
  cell.value = TextCellValue('Awawawaa');
}