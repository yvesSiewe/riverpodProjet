import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/viewmodel/todo_viewmodel.dart';


class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoPage = ref.watch(todoProvider);

    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('todoApp'),
        actions: [
          ElevatedButton(
            onPressed: (){}, 
            child:  Text('')
          )
        ],
      ),

      body: Column(
        children: [
          // Barre d'ajout
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: "Ajouter une tâche",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    if(controller.text.isNotEmpty){
                      TodoModel model = TodoModel(todo: controller.text);
                      ref.read(todoProvider.notifier).add(model);
                    }
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          ),

          // LISTE
          Expanded(
            child: todoPage.isEmpty
                ? Center(child: Text("Ajoutez une tâche"))
                : ListView.builder(
                    itemCount: todoPage.length,
                    itemBuilder: (context, index) {
                      final todo = todoPage[index];
                      return ListTile(
                        leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (_) {
                            ref
                              .read(todoProvider.notifier)
                              .toggleDone(index);
                          },
                        ),
                        title: Text(todo.todo),
                        trailing: IconButton(
                          onPressed: () {
                            ref.read(todoProvider.notifier).remove(index);
                          },
                          icon: Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
