import 'package:flutter_riverpod/legacy.dart';
import 'package:todoapp/model/todo_model.dart';

class TodoViewmodel extends StateNotifier<List<TodoModel>> {

  TodoViewmodel() : super([]);

  void add(TodoModel element){
    state = [...state, element];
  }
  
  void remove(int index){
    state = [
      ...state.sublist(0, index),
      ...state.sublist(index+1)
    ];
  }

  void toggleDone(int index){
    state = [
      ...state.sublist(0, index), 
      state[index].copyWith(isDone: !state[index].isDone),
      ...state.sublist(index+1)
    ];
  }  

}

final todoProvider = StateNotifierProvider<TodoViewmodel, List<TodoModel>>((ref){
  return TodoViewmodel();
});