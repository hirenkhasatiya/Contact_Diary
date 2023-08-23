import 'package:contact_dairy/Modals/contact_Modal.dart';
import 'package:flutter/material.dart';

class contactController extends ChangeNotifier {
  List<Contact> _allcontact = [];

  List allNamesdata = [];

  get allContact {
    return _allcontact;
  }

  addContact({required Contact contact}) {
    if (!_allcontact.contains(contact)) {
      _allcontact.add(contact);
    }
    notifyListeners();
  }

  removeContact({required Contact contact}) {
    _allcontact.remove(contact);
    notifyListeners();
  }
}
