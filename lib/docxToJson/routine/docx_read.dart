import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:xml/xml.dart';

class DocxRead {
  Future<List<XmlElement>> extractTables(String filePath) async {
    final bytes = await File(filePath).readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);
    final docFile = archive.files.firstWhere(
      (f) => f.name == 'word/document.xml',
    );
    final xmlDoc = XmlDocument.parse(utf8.decode(docFile.content));
    return xmlDoc.findAllElements('w:tbl').toList();
  }

  List<List<String>> extractTable(XmlElement table) {
    return table.findAllElements('w:tr').map((row) {
      return row.findAllElements('w:tc').map((cell) {
        return cell.findAllElements('w:t').map((t) => t.innerText).join(' ');
      }).toList();
    }).toList();
  }
}
