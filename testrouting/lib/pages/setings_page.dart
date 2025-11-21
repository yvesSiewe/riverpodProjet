import 'package:flutter/material.dart';

class SetingsPage extends StatefulWidget {
  const SetingsPage({super.key});

  @override
  State<SetingsPage> createState() => _SetingsPageState();
}

class _SetingsPageState extends State<SetingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: const Text('Back to home page')
        ),
      ),
    );
  }
}