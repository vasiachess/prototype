import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bitmap/bitmap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_plugin/flutter_exif_plugin.dart';
import 'package:flutter_exif_plugin/tags.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
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

    final qrImage = await QrPainter(
      data: '$title\n$location\n$date\n$imageName',
      version: QrVersions.auto,
      gapless: false,
      color: Colors.black,
      emptyColor: Colors.white,
    ).toImage(200);

    canvas.drawImage(qrImage, Offset(width - 220.0, bitmap.height.toDouble() + 10), ui.Paint());

    final picture = recorder.endRecording();
    final img = await picture.toImage(width, height);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    Uint8List bytes = byteData.buffer.asUint8List(byteData.offsetInBytes);

    final exif = FlutterExif.fromBytes(bytes);
    await exif.setAttribute(TAG_CAMERA_OWNER_NAME, title);
    await exif.setAttribute(TAG_USER_COMMENT, title);
    await exif.setAttribute(TAG_SUBJECT_LOCATION, location);
    await exif.setAttribute(TAG_DATETIME, date);
    await exif.setAttribute(TAG_FILE_SOURCE, imageName);
    await exif.saveAttributes();

    var imageToRead = await exif.imageData;
    var imageFile = await writeImage(imageToRead, 'pictureWithExif_01.jpg');

    return imageFile.uri?.path;
  }

  Future<File> writeImage(List<int> bytes, String fileName) async {
    final directory = await getExternalStorageDirectory();
    final path = directory.path;
    var file = new File('$path/' + fileName);
    return await file.writeAsBytes(bytes);
  }

}

