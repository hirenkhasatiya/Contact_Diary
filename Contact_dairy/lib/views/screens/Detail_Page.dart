import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

List<GlobalKey<FormState>> Formkey =
    List.generate(3, (index) => GlobalKey<FormState>());

class _DetailPageState extends State<DetailPage> {
  TextEditingController input3 = TextEditingController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stepper(
          currentStep: currentIndex,
          onStepTapped: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentIndex > 0) {
                currentIndex--;
              }
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentIndex < 2) {
                currentIndex++;
              }
            });
          },
          steps: [
            Step(
              isActive: 0 == currentIndex,
              state: currentIndex == 0
                  ? StepState.editing
                  : currentIndex > 0
                      ? StepState.complete
                      : StepState.indexed,
              title: Text("1"),
              content: Form(
                key: Formkey[0],
                child: Column(
                  children: [
                    TextFormField(
                      controller: input3,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Step(
              isActive: 1 == currentIndex,
              state: currentIndex == 1
                  ? StepState.editing
                  : currentIndex > 1
                      ? StepState.complete
                      : StepState.indexed,
              title: Text("2"),
              content: Form(
                key: Formkey[1],
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Step(
              isActive: 2 == currentIndex,
              state: currentIndex == 2
                  ? StepState.editing
                  : currentIndex > 2
                      ? StepState.complete
                      : StepState.indexed,
              title: Text("3"),
              content: Form(
                key: Formkey[2],
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
