import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ControlListPageWebView extends StatelessWidget {
  const ControlListPageWebView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://212.46.14.26:9929/oati-insp-mobile/',
      ignoreSSLErrors: true,
    );
  }
}