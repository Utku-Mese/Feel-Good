import 'package:flutter/material.dart';

class EmojiFace extends StatelessWidget {
  final String emoji;
  final String topMessage;
  final String message;

  const EmojiFace({
    Key? key,
    required this.emoji,
    required this.message,
    required this.topMessage,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return Container(
      alignment: Alignment.center,
      width: (width - 100) / 4,
      height: (width - 100) / 4,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 131, 187, 232),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(topMessage),
                content: Text(message),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Text(
          emoji,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
