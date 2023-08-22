import 'package:counter/controller/Counter_controller.dart';
import 'package:counter/controller/stepper_controller.dart';
import 'package:counter/controller/theme_controller.dart';
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
              builder: (context, Provider, child) => Text(
                  "${Provider.getCounter}",
                  style: TextStyle(fontSize: 35)),
            ),
            SizedBox(
              height: 50,
            ),
            Consumer<stepperController>(
              builder: (context, Provider, child) {
                return Stepper(
                    currentStep: Provider.getIndex,
                    onStepContinue: () {
                      Provider.Continue();
                    },
                    onStepCancel: () {
                      Provider.cancel();
                    },
                    steps: [
                      Step(
                        isActive: 0 == Provider.getIndex,
                        state: Provider.getIndex == 0
                            ? StepState.editing
                            : Provider.getIndex > 0
                                ? StepState.complete
                                : StepState.indexed,
                        title: Text("1"),
                        content: TextField(),
                      ),
                      Step(
                        isActive: 1 == Provider.getIndex,
                        state: Provider.getIndex == 1
                            ? StepState.editing
                            : Provider.getIndex > 1
                                ? StepState.complete
                                : StepState.indexed,
                        title: Text("2"),
                        content: TextField(),
                      ),
                      Step(
                        isActive: 2 == Provider.getIndex,
                        state: Provider.getIndex == 2
                            ? StepState.editing
                            : Provider.getIndex > 2
                                ? StepState.complete
                                : StepState.indexed,
                        title: Text("3"),
                        content: TextField(),
                      ),
                    ]);
              },
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
