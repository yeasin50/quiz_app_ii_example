import 'package:flutter/material.dart';
import 'package:quiz_app_ii_example/data/result_manager.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late int _totalQuestion, _currectAnswer = 0;
  @override
  void initState() {
    _totalQuestion = userResult.length;

    userResult.forEach((element) {
      if (element) _currectAnswer++;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Quiz Result'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.purple],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your score: $_currectAnswer / $_totalQuestion"),
            ],
          ),
        ),
      ),
    );
  }
}
