import 'package:flutter/material.dart';

class ProjectTopDialog extends StatelessWidget {
  final Widget child;

  ProjectTopDialog({this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: SizedBox(
                height: 56 + MediaQuery.of(context).padding.top,
                width: double.infinity,
              ),
              onTap: () => Navigator.pop(context),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 20, left: 30, right: 30, bottom: 20),
              child: child,
            ),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
