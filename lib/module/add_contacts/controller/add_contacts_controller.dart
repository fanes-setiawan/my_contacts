import 'package:flutter/material.dart';
import 'package:my_contacts/core.dart';
import '../../../model/contact_model.dart';
import '../../../service/contact_service.dart';
import '../view/add_contacts_view.dart';

class AddContactsController extends State<AddContactsView> {
  static late AddContactsController instance;
  late AddContactsView view;
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameEditingController = TextEditingController();
  late TextEditingController telphoneEditingController =
      TextEditingController();
  late TextEditingController emailEditingController = TextEditingController();
  late TextEditingController linkAkunEditingController =
      TextEditingController();

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  void save() async {
    if (formKey.currentState!.validate()) {
      final contact = ContactModel(
        id: 0,
        name: nameEditingController.text,
        telephone: telphoneEditingController.text,
        email: emailEditingController.text,
        account: linkAkunEditingController.text,
      );
      ContactService().createContact(contact);
      await ContactService().getContact();
      Get.to(HomeContactsView());
    }
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
