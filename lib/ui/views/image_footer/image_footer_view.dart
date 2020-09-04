import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedprototype/constants.dart';
import 'package:stackedprototype/ui/views/image_footer/image_footer_viewmodel.dart';

class ImageFooterView extends StatelessWidget {

  const ImageFooterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImageFooterViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: colorViolet,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              'Image Footer',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            elevation: 3.0,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: 24,),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(60, 12, 60, 12),
                    color: colorViolet,
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                        model.takePicture();
                    },
                    child: Text(
                      'Take Picture',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: Image.file(File(model.imagePath ?? ''),
                      width: 200, fit: BoxFit.fill)),

            ],
          ),
        );
      },
      viewModelBuilder: () => ImageFooterViewModel(),
    );
  }
}
