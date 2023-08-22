import 'package:counter_ex/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Press + for increase the counter"),
            Consumer<counterController>(
              builder: (context, Provider, child) =>
                  Text("${Provider.getcounter}"),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<counterController>(context, listen: false).increase();
            },
            child: Icon(
              Icons.add,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<counterController>(context, listen: false).decrease();
            },
            child: Icon(
              Icons.remove,
            ),
          ),
        ],
      ),
    );
  }
}
