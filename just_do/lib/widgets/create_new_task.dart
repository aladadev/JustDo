import 'package:flutter/material.dart';

class CreateNewTask extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const CreateNewTask(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What is the new task?',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  buttonText: 'Save',
                  onPressFunc: onSave,
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomButton(
                  buttonText: 'Cancel',
                  onPressFunc: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressFunc;
  const CustomButton({
    super.key,
    required this.buttonText,
    this.onPressFunc,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressFunc,
      child: Text(buttonText),
    );
  }
}
