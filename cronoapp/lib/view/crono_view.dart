import 'package:cronoapp/viewmodel/crono_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CronoView extends ConsumerWidget {
  
  const CronoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crono = ref.watch(cronoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('CronoAPP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${crono.heur}:${crono.minutes}:${crono.seconde}',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    ref.read(cronoProvider.notifier).started();
                  }, 
                  child: Text('Start')
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: (){
                    ref.read(cronoProvider.notifier).stop();
                  }, 
                  child: Text('Stop')
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: (){
                    ref.read(cronoProvider.notifier).reset();
                  }, 
                  child: Text('Reset')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}