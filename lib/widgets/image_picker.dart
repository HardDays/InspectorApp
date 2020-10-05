import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/colors.dart';

import 'package:image_picker/image_picker.dart' as p;

class ImagePicker extends StatefulWidget {

  @override
  ImagePickerState createState() => ImagePickerState();
}


class ImagePickerState extends State<ImagePicker> with SingleTickerProviderStateMixin {

  // todo: replace to normal state manager
  
  final picker = p.ImagePicker();

  final files = List<File>();

  @override
  void initState() {
    super.initState();

  }

   @override
  void dispose() {
    super.dispose();
  }

  void _onPick() async {
    final image = await picker.getImage(source: p.ImageSource.gallery);
    if (image != null) {
      setState(() {
        files.add(File(image.path));
      });
    }
  }

  void _onDelete(int index) {
    setState(() {
      files.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.27;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(files.length, 
              (index) => Column(
                children: [
                  SizedBox(
                    width: 210,
                    height: 140,
                    child: Image(
                      fit: BoxFit.cover,
                      image: FileImage(files[index],)
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
            )..add((files.length - 2) % 3 == 0 ? SizedBox(width: 210) : Container()),
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
    );
  }

}
