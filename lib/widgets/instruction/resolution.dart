import 'package:flutter/material.dart';
import 'package:inspector/model/report_status_info.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/text_field.dart';

class ResolutionWidget extends StatefulWidget {
  ResolutionWidget({
    Key key,
    @required this.resolution,
  }) : super(key: key);

  final ViolatorResolution resolution;

  @override
  _ResolutionWidgetState createState() => _ResolutionWidgetState();
}

class _ResolutionWidgetState extends State<ResolutionWidget> {
  final _prescriptionController = TextEditingController();
  final _executorController = TextEditingController();
  final _authorController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _prescriptionController.text = widget.resolution.resolutionType?.name ?? '';
    _executorController.text = widget.resolution.executor?.name ?? '';
    _authorController.text = widget.resolution.author?.name ?? '';
    _commentController.text = widget.resolution.resolutionText ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 34),
                  child: ProjectTextField(
                    title: 'Резолюция',
                    controller: _prescriptionController,
                    hintText: 'Предписание',
                    enabled: false,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ProjectTextField(
                  title: 'Исполнитель',
                  controller: _executorController,
                  hintText: 'T04 Test T.T.',
                  enabled: false,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 34),
                  child: ProjectDatePicker(
                    title: 'Дата резолюции',
                    hintText: 'Выберите дату',
                    singleDate: true,
                    values: [DateTime.parse(widget.resolution.resolutionDate ?? DateTime.now().toString())],
                    onChanged: (date) => {},
                    enabled: false,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ProjectTextField(
                  title: 'Резолюцию наложил',
                  controller: _authorController,
                  hintText: 'T43 Test T.T.',
                  enabled: false,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ProjectTextField(
            title: 'Комментарии',
            minLines: 3,
            controller: _commentController,
            enabled: false,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _prescriptionController.dispose();
    _executorController.dispose();
    _authorController.dispose();
    _commentController.dispose();
  }
}
