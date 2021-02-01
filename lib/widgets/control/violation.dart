import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspector/model/control_object.dart';
import 'package:inspector/model/violation.dart';
import 'package:inspector/pages/control_violation_page.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
import 'package:intl/intl.dart';

class ControlViolationWidget extends StatefulWidget {

  final ViolationShortSearchResult violation;

  const ControlViolationWidget({Key key, @required this.violation}) : super(key: key);

  @override
  ControlViolationWidgetState createState() => ControlViolationWidgetState();
}


class ControlViolationWidgetState extends State<ControlViolationWidget> {
  
  SlidableController _controller;

  bool _actions = false;

  @override
  void initState() {
    super.initState();

    _controller = SlidableController(
      onSlideIsOpenChanged: _onSlideableChange,
      onSlideAnimationChanged: (t)=> {}
    );
  }

  void _onSlideableChange(bool value) {
    setState(() {
      print(value);
      _actions = value;
    });
  }

  void _onTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ControlViolationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: ProjectColors.lightBlue))
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 7, right: 7),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ProjectColors.darkBlue,
                ),
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text('ОАТИ',
                    style: ProjectTextStyles.baseBold.apply(color: ProjectColors.white),
                  ),
                ),
              ),
              Flexible(
                child: ClipRect(
                  child: Slidable(
                    controller: _controller,
                    actionExtentRatio: 0.15,
                    actionPane: SlidableDrawerActionPane(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${widget.violation.violationNum} от ${widget.violation.detectionDate} ',
                                  style: ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text(widget.violation.objectElement.objectType.name,
                                    style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                                  ),
                                ),
                                Text(widget.violation.eknViolationName.name,
                                  style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                              child: CachedNetworkImage(
                                width: 120,
                                height: 80,
                                fit: BoxFit.cover ,
                                imageUrl: 'https://picsum.photos/640/480',
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: ProjectColors.cyan), 
                                    top: BorderSide(color: ProjectColors.cyan), 
                                    bottom: BorderSide(color: ProjectColors.cyan),
                                    right: _actions ? BorderSide(color: ProjectColors.cyan) : BorderSide(width: 0, color: Colors.transparent)
                                  )
                                ),
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 4),
                                margin: EdgeInsets.only(top: 15, right: _actions ? 15 : 0),
                                child: Text('На контроле',
                                  style: ProjectTextStyles.smallBold.apply(color: ProjectColors.cyan),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    secondaryActions: [
                      _buildAction(
                        context,
                        Icon(Icons.check,
                          color: ProjectColors.green,
                          size: 26,
                        ),
                        'Устранено',
                      ),
                      _buildAction(
                        context,
                        Icon(Icons.close,
                          color: ProjectColors.red,
                          size: 26,
                        ),
                        'Не устранено',
                      ),
                    ],  
                  ),
                ),
              ), 
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildAction(BuildContext context, Widget icon, String text) {
    return InkWell(
      //onTap: ()=> _onAddressReport(context, status),
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColors.grey,
          border: Border(right: BorderSide(color: ProjectColors.lightBlue))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 34,
              child: icon,
            ),
            Text(text,
              textAlign: TextAlign.center,
              style: ProjectTextStyles.smallAction.apply(color: ProjectColors.black),
            ),
          ],
        ),
      ),
    );
  }

}
