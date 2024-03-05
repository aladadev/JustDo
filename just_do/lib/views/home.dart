import 'package:flutter/material.dart';
import 'package:just_do/widgets/create_new_task.dart';
import 'package:just_do/widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  //demo database of tasks
  List taskList = [
    ["Read Books", true],
    ["Learn Chinese for 2 hours", false],
    ["Dopamine Detox", true],
    ["Stop Smoking", true],
  ];

  //function for when checkbox is tapped
  void checkboxTrigger(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  //New Task Save Button Func
  void newTaskSave() {
    _controller.text.isNotEmpty
        ? taskList.add([_controller.text, false])
        : null;
    _controller.clear();
    Navigator.pop(context);
    setState(() {});
  }

  //create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return CreateNewTask(
            controller: _controller,
            onSave: newTaskSave,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text('Just Do'),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskName: taskList[index][0],
            isCompleted: taskList[index][1],
            onChanged: (onchanged) {
              checkboxTrigger(onchanged, index);
            },
          );
        },
      ),
    );
  }
}
