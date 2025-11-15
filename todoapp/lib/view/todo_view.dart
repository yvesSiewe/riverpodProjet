import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/viewmodel/todo_viewmodel.dart';
class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todoPage = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('todoApp'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50,
                  child: TextFormField()
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.add)
                )
              ],
            ),
            ListView.builder(
              itemBuilder: (context, index){
                if(todoPage.isEmpty){
                  return Text('Ajoutez une tache');
                }
                return Row(
                  children: [
                    Checkbox(
                      value: todoPage[index].isDone,
                      onChanged: (value){
                        ref.read(todoProvider.notifier).toggleDone(index);
                      }
                    ),
                    Text(todoPage[index].todo),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.remove),
                    )
                  ],
                );
              }
            )
          ],
        ),
      ),
    );
  }
}