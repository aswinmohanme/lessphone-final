import 'package:flutter/material.dart';

import '../widgets/text.dart';
import '../widgets/footer.dart';
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
              SizedBox(height: s_12),
              TextField(
                controller: _textFieldController,
                onSubmitted: (String name) {
                  Task.createTask(name);
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
                child: ValueListenableBuilder(
                    valueListenable: Task.listenable(),
                    builder: (context, box, _) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: Task.count(),
                        itemBuilder: (BuildContext context, int index) {
                          Task task = Task.getReversedAt(index);
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: s_2),
                            child: ListTileTheme(
                              contentPadding: EdgeInsets.all(0),
                              child: CheckboxListTile(
                                checkColor:
                                    Theme.of(context).colorScheme.background,
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                dense: true,
                                value: task.isCompleted,
                                title: Text(task.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            decoration: task.isCompleted
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none)),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  task.setCompleted(value);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
              Footer(
                leftText: "back",
                leftFunction: () {
                  Navigator.of(context).pop();
                },
                rightText: "clear completed",
                rightFunction: () {
                  Task.clearCompleted();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
