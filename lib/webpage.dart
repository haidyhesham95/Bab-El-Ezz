import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    final url = html.window.location.href;
    Uri uri = Uri.parse(url);
    String? uid = uri.queryParameters['uid'];

    return Scaffold(
      body: Center(
        child: Text(uid ?? 'null'),
      ),
    );
  }
}
