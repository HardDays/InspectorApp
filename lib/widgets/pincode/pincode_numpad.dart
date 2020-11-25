import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';

class PinCodeNumpad extends StatefulWidget {
  final ValueChanged<String> listener;

  const PinCodeNumpad({Key key, @required this.listener}) : super(key: key);

  @override
  _PinCodeNumpadState createState() => _PinCodeNumpadState();
}

class _PinCodeNumpadState extends State<PinCodeNumpad> {
  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400.0,
          child: Stack(
            children: [
              TextField(
                controller: _controller,
                style: TextStyle(
                  letterSpacing: 4.0,
                  color: ProjectColors.darkBlue,
                ).merge(ProjectTextStyles.title),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '****',
                  hintStyle: TextStyle(
                    letterSpacing: 4.0,
                    color: ProjectColors.mediumBlue,
                  ).merge(ProjectTextStyles.title),
                  alignLabelWithHint: true,
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ProjectColors.mediumBlue),
                  ),
                  enabled: false,
                ),
              ),
              Positioned(
                right: -8.0,
                child: InkResponse(
                  onTap: () {
                    if (_controller.text.length != 0)
                      _controller.text = _controller.text
                          .substring(0, _controller.text.length - 1);
                  },
                  onLongPress: () {
                    _controller.text = '';
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ProjectIcons.deleteIcon(color: ProjectColors.darkBlue),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 222.0,
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            children: [
              _buildKey('1', Icon(Icons.voicemail, color: ProjectColors.mediumBlue, size: 12.0)),
              _buildKey('2', _buildKeySubtitle('ABC')),
              _buildKey('3', _buildKeySubtitle('DEF')),
              _buildKey('4', _buildKeySubtitle('GHI')),
              _buildKey('5', _buildKeySubtitle('JKL')),
              _buildKey('6', _buildKeySubtitle('MNO')),
              _buildKey('7', _buildKeySubtitle('PQRS')),
              _buildKey('8', _buildKeySubtitle('TUV')),
              _buildKey('9', _buildKeySubtitle('WXYZ')),
            ],
          ),
        ),
        _buildKey('0', _buildKeySubtitle('+')),
      ],
    );
  }

  Widget _buildKeySubtitle(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        color: ProjectColors.mediumBlue,
      ),
    );
  }

  Widget _buildKey(String title, Widget subtitle) {
    return InkResponse(
      onTap: () {
        _controller.text += title;
        if(_controller.text.length >= 4) {
          _controller.text = '';
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 32.0,
              fontWeight: FontWeight.w300,
              color: ProjectColors.black,
            ),
          ),
          subtitle,
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = TextEditingController();
    _controller.addListener(() => widget.listener(_controller.text));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
