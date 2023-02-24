import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.access_time),
              Spacer(),
              Text('Pendente'),
            ],
          ),
          const Text('Title:'),
          const LinearProgressIndicator(),
          const Text('1/5'),
        ],
      ),
    );
  }
}
