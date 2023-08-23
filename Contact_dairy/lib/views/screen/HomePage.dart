import 'package:contact_dairy/Modals/contact_Modal.dart';
import 'package:contact_dairy/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Diary"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Consumer<contactController>(
          builder: (context, Provider, child) => Provider.allContact.isNotEmpty
              ? ListView.builder(
                  itemCount: Provider.allContact.length,
                  itemBuilder: (context, index) {
                    Contact contact = Provider.allContact[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(
                              "https://tse4.mm.bing.net/th?id=OIP.jixXH_Els1MXBRmKFdMQPAHaHa&pid=Api&P=0&h=180"),
                        ),
                        title: Text(contact.name),
                        subtitle: Text(contact.number),
                        trailing: IconButton(
                          onPressed: () {
                            Provider.removeContact(contact: contact);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                )
              : Center(
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
                            decoration: InputDecoration(
                              hintText: "Enter Name",
                              icon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (val) => contact = val,
                            decoration: InputDecoration(
                              hintText: "Enter Number",
                              icon: Icon(Icons.dialpad),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (val) => email = val,
                            decoration: InputDecoration(
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
        child: Icon(Icons.dialpad_outlined),
      ),
    );
  }
}
