import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(
  double size,
  Color color,
  FontWeight fontWeight,
) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontWeight, );
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

// Future<List<File>> pickFile() async {
//   List<File> images = [];
//   try {
//     var file = await FilePicker.platform
//         .pickFiles(allowMultiple: true, type: FileType.image);
//     if (file != null && file.files.isNotEmpty) {
//       for (int i = 0; i < file.files.length; i++) {
//         images.add(File(file.files[i].path!));
//       }
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return images;
// }
Future<List<File>> pickFile() async {
  List<File> images = [];
  try {
    var file = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.any);
    if (file != null && file.files.isNotEmpty) {
      for (int i = 0; i < file.files.length; i++) {
        images.add(File(file.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
