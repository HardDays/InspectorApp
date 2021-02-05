import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class SortDialog extends StatefulWidget {
  final String value;
  final List<String> values;
  final List<String> titles;

  const SortDialog(this.value, this.values, this.titles);

  @override
  SortDialogState createState() => SortDialogState();
}

class SortDialogState extends State<SortDialog> {

  String value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(widget.values.length, 
                  (index) => _buildButton(context, index)
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, bottom: 15),
      child: Text('Сортировать...',
        style: ProjectTextStyles.title.apply(color: ProjectColors.blue)
      )
    );
  }

  Widget _buildButton(BuildContext context, int index) {
    final enabled = widget.values[index] == value;
    return InkWell(
      onTap: () async {
        setState(() {
          value = widget.values[index];
        });
        await Future.delayed(Duration(milliseconds: 400));
        Navigator.pop(context, widget.values[index]);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        color: enabled ? ProjectColors.blue : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.titles[index],
              style: ProjectTextStyles.base.apply(color: enabled ? Colors.white : ProjectColors.black),
            ),
            Icon(Icons.check,
              size: 18,
              color: enabled ? Colors.white : Colors.transparent,
            )
          ],
        ),
      )
    );
  }
}
