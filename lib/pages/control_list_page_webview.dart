import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:provider/provider.dart';

class ControlListPageWebView extends StatelessWidget {
  const ControlListPageWebView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) => snapshot.hasData
          ? WebviewScaffold(
              url: snapshot.data,
              ignoreSSLErrors: true,
            )
          : Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
      future: Provider.of<PersistanceService>(context).dcWebUrl(),
    );
  }
}
