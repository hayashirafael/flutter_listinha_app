import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  final board = TaskBoard(Uuid.v4(), 'Nova lista de tarefas');
  test('taskCard', () {
    final tasks = [
      Task(Uuid.v4(), 'description', complete: true),
      Task(Uuid.v4(), 'description', complete: true),
      Task(Uuid.v4(), 'description'),
      Task(Uuid.v4(), 'description'),
    ];

    final progress = TaskCard(board: board).getProgress(tasks);
    expect(progress, .5);
  });
}
