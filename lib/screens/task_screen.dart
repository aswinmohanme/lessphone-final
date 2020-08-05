import 'package:flutter/material.dart';

import '../widgets/heading_text.dart';
import '../widgets/body_text.dart';
import '../styles.dart';
import '../models/task.dart';

class TaskScreen extends StatelessWidget {
  static var _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(kScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: s_4),
              HeadingText("Tasks"),
              SizedBox(height: s_8),
              TextField(
                onSubmitted: (String name) {
                  TaskRepo.createTask(name);
                  _textFieldController.clear();
                },
                decoration: InputDecoration(
                  labelText: "Enter the task",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(s_2)),
                  ),
                ),
              ),
              SizedBox(height: s_4),
              Expanded(
                child: ListView.builder(
                  itemCount: TaskRepo.count(),
                  itemBuilder: (BuildContext context, int index) {
                    Task task = TaskRepo.get(index);
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: s_2),
                      child: ListTileTheme(
                        contentPadding: EdgeInsets.all(0),
                        child: CheckboxListTile(
                          dense: false,
                          value: task.isCompleted,
                          title: Text(task.name,
                              style: Theme.of(context).textTheme.bodyText1),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool value) {
                            task.setCompleted(value);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: s_2),
                      child: BodyText("back"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      TaskRepo.clearCompleted();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: s_2),
                      child: BodyText("clear completed"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
