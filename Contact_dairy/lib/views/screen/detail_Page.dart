import 'package:contact_dairy/Modals/contact_Modal.dart';
import 'package:contact_dairy/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  call({required String number}) async {
    Uri uri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    int contact_detail = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.history),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Consumer<contactController>(
            builder: (context, Provider, child) {
              Contact contact = Provider.getContact[contact_detail];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Text(
                      contact.name[0].toUpperCase(),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SelectableText(contact.name, style: TextStyle(fontSize: 20)),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          call(number: contact.number);
                        },
                        child: Icon(Icons.call),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.message_outlined),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.video_call_outlined),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.share),
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Info",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(contact.number, style: TextStyle(fontSize: 15)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(contact.email, style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
