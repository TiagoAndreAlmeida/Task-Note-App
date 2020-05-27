// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskStore on _TaskStore, Store {
  final _$list_taskAtom = Atom(name: '_TaskStore.list_task');

  @override
  ObservableList<Task> get list_task {
    _$list_taskAtom.reportRead();
    return super.list_task;
  }

  @override
  set list_task(ObservableList<Task> value) {
    _$list_taskAtom.reportWrite(value, super.list_task, () {
      super.list_task = value;
    });
  }

  final _$getTasksAsyncAction = AsyncAction('_TaskStore.getTasks');

  @override
  Future<dynamic> getTasks(BuildContext context, int id) {
    return _$getTasksAsyncAction.run(() => super.getTasks(context, id));
  }

  @override
  String toString() {
    return '''
list_task: ${list_task}
    ''';
  }
}
