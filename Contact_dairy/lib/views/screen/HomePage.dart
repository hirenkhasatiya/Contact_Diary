import 'package:contact_dairy/Modals/contact_Modal.dart';
import 'package:contact_dairy/controller/contact_controller.dart';
import 'package:contact_dairy/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  call({required String number}) async {
    Uri uri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Diary"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          Consumer<themeController>(builder: (context, Provider, child) {
            return IconButton(
                onPressed: () {
                  Provider.changeTheme();
                },
                icon: Icon(
                    Provider.getTheme ? Icons.light_mode : Icons.dark_mode));
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<contactController>(
          builder: (context, Provider, child) => Provider.getContact.isNotEmpty
              ? ListView.builder(
                  itemCount: Provider.getContact.length,
                  itemBuilder: (context, index) {
                    Contact contact = Provider.getContact[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('Detail_Page', arguments: index);
                      },
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(contact.name[0].toUpperCase()),
                          ),
                          title: Text(contact.name),
                          subtitle: Text(contact.number),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  call(number: contact.number);
                                },
                                icon: Icon(Icons.call),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    "Please Add Contact",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String name, contact, email;

          name = contact = email = "";

          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Add Contact"),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            onChanged: (val) => name = val,
                            decoration: const InputDecoration(
                              hintText: "Enter Name",
                              icon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (val) => contact = val,
                            decoration: const InputDecoration(
                              hintText: "Enter Number",
                              icon: Icon(Icons.dialpad),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (val) => email = val,
                            decoration: const InputDecoration(
                              hintText: "Enter Email",
                              icon: Icon(Icons.email),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Contact c = Contact(
                              name: name,
                              number: contact,
                              email: email,
                            );

                            Provider.of<contactController>(context,
                                    listen: false)
                                .addContact(contact: c);

                            Navigator.of(context).pop();
                          },
                          child: Text("Add")),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("cancel"))
                    ],
                  ));
        },
        child: const Icon(Icons.dialpad_outlined),
      ),
    );
  }
}
