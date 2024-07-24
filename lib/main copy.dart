import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HTML in Flutter'),
        ),
        body: HtmlWidget(
          '<p>this is description</p>',
          onErrorBuilder: (context, element, error) => Text('$element error: $error'),
          onLoadingBuilder: (context, element, loadingProgress) => Center(
            child: Image.asset(
              'assets/loading_icon.gif',
              width: 100,
              height: 100,
            ),
          ),
          renderMode: RenderMode.column,
        ),
      ),
    );
  }
}
