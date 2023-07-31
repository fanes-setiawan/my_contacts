import 'package:flutter/material.dart';
import 'package:my_contacts/model/contact_model.dart';
import 'package:my_contacts/service/contact_service.dart';
import '../view/home_contacts_view.dart';

class HomeContactsController extends State<HomeContactsView> {
  static late HomeContactsController instance;
  late HomeContactsView view;
  ContactService service = ContactService();
  List<ContactModel> contacts = [];
  bool isLoading = false;

  Future<void> getAllContacts() async {
    setState(() {
      isLoading = true;
    });
    try {
      final fetchedContacts = await service.getContact();
      setState(() {
        contacts = fetchedContacts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error if necessary
    }
  }

  @override
  void initState() {
    instance = this;
    print(contacts.length);
    getAllContacts();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
