import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/colors.dart';

import 'package:image_picker/image_picker.dart' as p;

// class ImagePicker extends StatefulWidget {

//   final EdgeInsets margin;

//   ImagePicker({this.margin = const EdgeInsets.only(top: 20)});

//   @override
//   ImagePickerState createState() => ImagePickerState();
// }


class ImagePicker extends StatelessWidget {
  final EdgeInsets margin;
  final List<Uint8List> images;
  final Function(File) onPicked;
  final Function(int) onRemoved;

  final picker = p.ImagePicker();

  ImagePicker({
    this.onPicked, 
    this.onRemoved, 
    this.images = const [],
    this.margin = const EdgeInsets.only(top: 20)
  });

  void _onPick() async {
    final image = await picker.getImage(source: p.ImageSource.gallery);
    if (image != null && onPicked != null) {
      onPicked(File(image.path));
    }
  }

  void _onDelete(int index) {
    if (onRemoved != null) {
      onRemoved(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(images.length, 
                (index) => Column(
                  children: [
                    SizedBox(
                      width: 210,
                      height: 140,
                      child: Image(
                        fit: BoxFit.cover,
                        image: MemoryImage(images[index],)
                      ),
                    ),
                    InkWell(
                      onTap: ()=> _onDelete(index),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 15),
                        child: Text('Удалить',
                          style: ProjectTextStyles.base.apply(color: ProjectColors.red),
                        ),
                      ),
                    ),
                  ]
                ),
              )..add((images.length - 2) % 3 == 0 ? SizedBox(width: 210) : Container()),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(bottom: 2),
            child: ProjectButton.buildOutlineButton('Добавить фото',
              icon: ProjectIcons.camera2Icon(),
              onPressed: _onPick,
              style: ProjectTextStyles.subTitle
            ),
          ),
        ],
      ),
    );
  }

}
