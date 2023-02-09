import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/custom_drawer.dart';

import '../shared/widgets/user_image_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit),
        label: const Text('Nova Lista'),
        onPressed: () {},
      ),
      body: Center(
        child: Column(
          children: [
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(
                  value: 0,
                  label: Text('Todos'),
                ),
                ButtonSegment(
                  value: 1,
                  label: Text('Pendentes'),
                ),
                ButtonSegment(
                  value: 2,
                  label: Text('Concluídas'),
                ),
                ButtonSegment(
                  value: 3,
                  label: Text('Desativadas'),
                ),
              ],
              selected: const {0},
              onSelectionChanged: (values) {},
            )
          ],
        ),
      ),
    );
  }
}
