import 'package:counter/controller/Counter_controller.dart';
import 'package:counter/controller/themeController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          Consumer<themeController>(
            builder: (context, Provider, child) {
              return IconButton(
                  onPressed: () {
                    Provider.changeTheme();
                  },
                  icon: Icon(
                      Provider.getTheme ? Icons.light_mode : Icons.dark_mode));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Press + for increase the counter"),
            Consumer<counterController>(
              builder: (context, Provider, child) =>
                  Text("${Provider.getCounter}"),
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
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<counterController>(context, listen: false).decrease();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
