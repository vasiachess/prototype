import 'dart:io';
import 'dart:ui' as ui;

import 'package:bitmap/bitmap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';


class ImageFooterViewModel extends BaseViewModel {

  final picker = ImagePicker();

  String _imagePath = '';
  String get imagePath => _imagePath;

  Future<String> takePicture() async {

    final pickedFile = await picker.getImage(source: ImageSource.camera, maxHeight: 1200);

    _imagePath = pickedFile.path;

    print(_imagePath);
    notifyListeners();

    Bitmap bitmap = await Bitmap.fromProvider(FileImage(File(_imagePath ?? '')));

    _imagePath = await addTextFooter(bitmap, 'Inspector', '24.7656, 46.79797', '2020.09.07', 'img_131_434.jpeg');

    print(_imagePath);
    notifyListeners();

    return _imagePath;
  }

  Future<String> addTextFooter(Bitmap bitmap, String title, String location, String date, String imageName) async {
    final recorder = new ui.PictureRecorder();

    final width = bitmap.width;
    final height = bitmap.height + 220;

    final canvas = new Canvas(
        recorder,
        new Rect.fromPoints(
            new Offset(0.0, 0.0), Offset(width.toDouble(), height.toDouble())));

    final fill = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        new Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()), fill);

    ui.Image outputImage = await bitmap.buildImage();
    canvas.drawImage(outputImage, Offset.zero, ui.Paint());

    final textSpan = TextSpan(
      text: '$title\n$location\n$date\n$imageName',
      style: TextStyle(
        color: Colors.black,
        fontSize: 36,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: bitmap.width.toDouble(),
    );
    final offset = Offset(20, bitmap.height.toDouble() + 20);
    textPainter.paint(canvas, offset);

    final picture = recorder.endRecording();
    final img = await picture.toImage(width, height);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    var imageFile = await writeImage(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes), 'picture01.png');

    return imageFile?.uri?.path;
  }

  Future<File> writeImage(List<int> bytes, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    var file = new File('$path/' + fileName);
    return await file.writeAsBytes(bytes);
  }

}

