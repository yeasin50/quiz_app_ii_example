import 'package:flutter/material.dart';
import 'package:quiz_app_ii_example/model/category.dart';
import 'package:quiz_app_ii_example/model/option.dart';
import 'package:quiz_app_ii_example/model/question.dart';
import 'package:quiz_app_ii_example/page/result.page.dart';
import 'package:quiz_app_ii_example/widget/options_widget.dart';

import 'show_result.widget.dart';

class QuestionsWidget extends StatelessWidget {
  final Category category;
  final PageController? controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Option> onClickedOption;

  const QuestionsWidget({
    Key? key,
    required this.category,
    required this.controller,
    required this.onChangedPage,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => PageView.builder(
        onPageChanged: onChangedPage,
        controller: controller,
        itemCount: category.questions.length,
        itemBuilder: (context, index) {
          return buildQuestion(
              question: category.questions[index],
              isLastQuestion: index == category.questions.length - 1);
        },
      );

  Widget buildQuestion({
    required Question question,
    required bool isLastQuestion,
  }) =>
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              question.text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              'Choose your answer from below',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
            SizedBox(height: 32),
            Expanded(
              child: OptionsWidget(
                question: question,
                onClickedOption: onClickedOption,
              ),
            ),
            if (isLastQuestion)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    MaterialPageRoute(
                      builder: (context) => ResultPage(),
                    );
                  },
                  child: Text("Check Result"),
                ),
              ),
          ],
        ),
      );
}
