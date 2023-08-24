import 'package:contact_dairy/Modals/contact_Modal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class contactController extends ChangeNotifier {
  List<Contact> _allcontact = [];

  late SharedPreferences preferences;

  contactController({required this.preferences});

  List allNamesdata = [];

  List<String> allNames = [];
  List<String> allEmails = [];
  List<String> allContacts = [];
  List<String> allImages = [];

  init() {
    allNames = preferences.getStringList("name") ?? [];
    allEmails = preferences.getStringList("Email") ?? [];
    allContacts = preferences.getStringList("number") ?? [];

    _allcontact = List.generate(
      allNames.length,
      (index) => Contact(
        name: allNames[index],
        email: allEmails[index],
        number: allContacts[index],
      ),
    );
  }

  set() {
    preferences
      ..setStringList("name", allNames)
      ..setStringList("Email", allEmails)
      ..setStringList("number", allContacts);

    notifyListeners();
  }

  List<Contact> get getContact {
    init();
    return _allcontact;
  }

  addContact({required Contact contact}) {
    if (!_allcontact.any((element) => element.number == contact.number)) {
      _allcontact.add(contact);

      allNames.add(contact.name);
      allEmails.add(contact.email);
      allContacts.add(contact.number);

      set();
    }
    notifyListeners();
  }

  editContact({required int index, required Contact contact}) {
    init();

    allNames[index] = contact.name;
    allEmails[index] = contact.email;
    allContacts[index] = contact.number;

    set();
  }

  removeContact({required Contact contact}) {
    init();

    int index = _allcontact.indexOf(contact);

    allNames.removeAt(index);
    allEmails.removeAt(index);
    allContacts.removeAt(index);

    set();

    notifyListeners();
  }
}
