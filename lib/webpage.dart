import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  SurveyPageState createState() => SurveyPageState();
}

class SurveyPageState extends State<SurveyPage> {
  final List<int> selectedAnswers = List.filled(surveyQuestions.length, -1);

  @override
  Widget build(BuildContext context) {
    final url = html.window.location.href;
    Uri uri = Uri.parse(url);
    String? uid = uri.queryParameters['uid'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاستبيان'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(

          children: [
            for (int i = 0; i < surveyQuestions.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surveyQuestions[i].question,
                      style: const TextStyle(fontSize: 20),

                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildAnswerOption(
                          context,
                          i,
                          0,
                          surveyQuestions[i].yesIcon,
                          'راض',
                        ),
                        _buildAnswerOption(
                          context,
                          i,
                          1,
                          surveyQuestions[i].neutralIcon,

                          'محايد',
                        ),
                        _buildAnswerOption(
                          context,
                          i,
                          2,
                          surveyQuestions[i].noIcon,
                          'غير راض',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOption(
      BuildContext context,
      int questionIndex,
      int answerIndex,
      String? iconPath,
      String label,
      ) {
    final isSelected = selectedAnswers[questionIndex] == answerIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswers[questionIndex] = answerIndex;
        });
      },
      child: Column(
        children: [
          if (iconPath != null)
            Image.asset(
              iconPath,
              width: 30.0,
              height: 30.0,
              color: isSelected ? ColorsAsset.kGreen : null,
            ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? ColorsAsset.kGreen : null,
            ),
          ),
        ],
      ),
    );
  }
}

class SurveyQuestion {
  final String question;
  final String? yesIcon;
  final String? noIcon;
  final String? neutralIcon;
  SurveyQuestion({
    required this.question,
    this.yesIcon,
    this.noIcon,
    this.neutralIcon,
  });
}

final surveyQuestions = [
  SurveyQuestion(
    question: 'ما مدي رضاءك عن مدة الانتظار؟',
    yesIcon: 'assets/images/icons8-smiling-face-with-smiling-eyes-48.png',
    noIcon: 'assets/images/icons8-upside-down-face-48.png',
    neutralIcon: 'assets/images/icons8-happy-48.png',
  ),
  SurveyQuestion(
    question: 'ما تقييمك لحسن الاستقبال؟',
    yesIcon: 'assets/images/icons8-smiling-face-with-smiling-eyes-48.png',
    noIcon: 'assets/images/icons8-upside-down-face-48.png',
    neutralIcon: 'assets/images/icons8-happy-48.png',
  ),
  SurveyQuestion(
    question: 'ما مدي رضاءك عن جودة الخدمة المقدمة؟',
    yesIcon: 'assets/images/icons8-smiling-face-with-smiling-eyes-48.png',
    noIcon: 'assets/images/icons8-upside-down-face-48.png',
    neutralIcon: 'assets/images/icons8-happy-48.png',
  ),
  SurveyQuestion(
    question: 'ما تقييمك لسعر الخدمة؟',
    yesIcon: 'assets/images/icons8-smiling-face-with-smiling-eyes-48.png',
    noIcon: 'assets/images/icons8-upside-down-face-48.png',
    neutralIcon: 'assets/images/icons8-happy-48.png',
  ),
  SurveyQuestion(
    question: 'هل تم انجاز العمل المطلوب من اول مرة؟',
    yesIcon: 'assets/images/icons8-smiling-face-with-smiling-eyes-48.png',
    noIcon: 'assets/images/icons8-upside-down-face-48.png',
    neutralIcon: 'assets/images/icons8-happy-48.png',
  ),
  SurveyQuestion(
    question: 'هل ستقوم بترشيحنا لعملاء أخرين؟',
    yesIcon: 'assets/images/icons8-smiling-face-with-smiling-eyes-48.png',
    noIcon: 'assets/images/icons8-upside-down-face-48.png',
    neutralIcon: 'assets/images/icons8-happy-48.png',
  ),

];
