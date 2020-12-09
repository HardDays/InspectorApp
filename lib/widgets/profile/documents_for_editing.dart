import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/documents_for_editing/bloc.dart';
import 'package:inspector/blocs/documents_for_editing/events.dart';
import 'package:inspector/blocs/documents_for_editing/states.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/pages/total_report_page.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
import 'package:intl/intl.dart';

class DocumentsForEditingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DocumentsBloc>(
      create: (context) => DocumentsBloc()..add(LoadEvent()),
      child: BlocBuilder<DocumentsBloc, DocumentsBlocState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return DocumentsList(reportsList: state.reports);
          }
          if(state is EmptyState) {
            return Text('Отсутствуют', style: ProjectTextStyles.base);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class Document extends StatelessWidget {
  final ReportError report;

  const Document({Key key, this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TotalReportPage(report: report.report)));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
              child: Text(
                'Рапорт №${report.report.reportNum} от ${DateFormat("dd.MM.yyyy").format(report.report.reportDate)}',
                style: ProjectTextStyles.subTitle.apply(
                  color: ProjectColors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          child: Text(
            'Ошибка',
            style: ProjectTextStyles.base.apply(
              color: ProjectColors.red,
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: ProjectColors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}

class DocumentsList extends StatefulWidget {
  final List<ReportError> reportsList;

  const DocumentsList({Key key, this.reportsList}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DocumentsListState();
}

class DocumentsListState extends State<DocumentsList>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  AnimationController _expandController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  void _onExpand() {
    if (_expanded) {
      _expandController.reverse();
    } else {
      _expandController.forward();
    }
    setState(() {
      _expanded = !_expanded;
    });
  }

  Widget _buildInk() {
    if (widget.reportsList.length > 5) {
      return InkWell(
        onTap: _onExpand,
        child: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                    color: ProjectColors.darkBlue, shape: BoxShape.circle),
                child: _buildInkIcon(),
              ),
              _buildInkText(),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildInkIcon() {
    if (_expanded) {
      return const Icon(
        Icons.keyboard_arrow_up,
        size: 18,
        color: Colors.white,
      );
    } else {
      return Text(
        '+${widget.reportsList.length - 5}',
        style: ProjectTextStyles.small.apply(color: Colors.white),
      );
    }
  }

  Widget _buildInkText() {
    return Text(
      _expanded ? 'Скрыть все' : 'Показать все',
      style: ProjectTextStyles.small.apply(
          color: ProjectColors.darkBlue, decoration: TextDecoration.underline),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.reportsList.take(5).map((e) => Document(report: e)),
        _buildHidden(),
        _buildInk(),
      ],
    );
  }

  Widget _buildHidden() {
    if (widget.reportsList.length > 5 && _expanded) {
      return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: _animation,
        child: Column(
          children: widget.reportsList
              .skip(5)
              .map((e) => Document(report: e))
              .toList(),
        ),
      );
    }
    return Container();
  }
}
