import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/dialog.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/colors.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart' as p;
import 'package:full_screen_image/full_screen_image.dart';

// class ImagePicker extends StatefulWidget {

//   final EdgeInsets margin;

//   ImagePicker({this.margin = const EdgeInsets.only(top: 20)});

//   @override
//   ImagePickerState createState() => ImagePickerState();
// }


class ImagePicker extends StatelessWidget {
  final bool enabled;
  final EdgeInsets margin;
  final List<String> names;
  final List<Uint8List> images;
  final Function(File) onPicked;
  final Function(int) onRemoved;
  final Function(int, Uint8List) onRotated;
  final String buttonTitle;

  final picker = p.ImagePicker();

  ImagePicker({
    this.onPicked, 
    this.onRemoved, 
    this.onRotated,
    this.names,
    this.enabled = true,
    this.images = const [],
    this.margin = const EdgeInsets.only(top: 20),
    this.buttonTitle = 'Добавить фото',
  });


  Future<p.ImageSource> _showViolationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => ProjectDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProjectButton.builtFlatButton('Галерея',
              onPressed: ()=> Navigator.pop(context, p.ImageSource.gallery)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            ProjectButton.buildOutlineButton('Камера',
              onPressed: ()=> Navigator.pop(context, p.ImageSource.camera)
            ),
          ],
        ),
      ),
    );
  }

  void _onPick(BuildContext context) async {
    if (enabled) {
      final source = await _showViolationDialog(context);
      if (source != null) {
        final image = await picker.getImage(source: source);
        if (image != null && onPicked != null) {
          onPicked(File(image.path));
        }
      }
    }
  }

  void _onRotate(int index, int angle) {
    if (enabled) {
      final image = img.decodeImage(images[index]);
      final rotated = img.copyRotate(image, angle);
      final result = img.encodeNamedImage(rotated, names[index]);
      if (result != null && onRotated != null) {
          onRotated(index, result);
        }
    }
  }

  void _onDelete(int index) {
    if (enabled) {
      if (onRemoved != null) {
        onRemoved(index);
      }
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
              spacing: 10,
              //alignment: WrapAlignment.spaceBetween,
              children: List.generate(images.length, 
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(index),
                    Container(
                      width: 210,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          _buildRotateLeft(index),
                          _buildDelete(index),
                          _buildRotateRight(index),
                        ]
                      ),
                    ),
                  ]
                ),
              )..add((images.length - 2) % 3 == 0 ? SizedBox(width: 210) : Container()),
            ),
          ),
          _buildAdd(context),
        ],
      ),
    );
  }

  Widget _buildImage(int index) {
    return FullScreenWidget(
      child: Image(
        image: MemoryImage(images[index]),
        width: 210,
        height: 210,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildRotateLeft(int index) {
    return InkWell(
      onTap: ()=> _onRotate(index, -90),
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
        child: Icon(Icons.rotate_left,
          color: ProjectColors.blue,
        ),
      ),
    );
  }

  Widget _buildRotateRight(int index) {
    return InkWell(
      onTap: ()=> _onRotate(index, 90),
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
        child: Icon(Icons.rotate_right,
          color: ProjectColors.blue,
        ),
      ),
    );
  }

  Widget _buildAdd(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(bottom: 2),
      child: ProjectButton.buildOutlineButton(buttonTitle,
        icon: ProjectIcons.camera2Icon(
          color: enabled ? ProjectColors.blue : ProjectColors.lightBlue
        ),
        onPressed: enabled ? ()=> _onPick(context) : null,
        style: ProjectTextStyles.subTitle
      ),
    );
  }

  Widget _buildDelete(int index) {
    return InkWell(
      onTap: ()=> _onDelete(index),
      child: Padding(
        padding: const EdgeInsets.only(top: 7, bottom: 7),
        child: Text('Удалить',
          style: ProjectTextStyles.base.apply(color: ProjectColors.red),
        ),
      ),
    );
  }
  
}
