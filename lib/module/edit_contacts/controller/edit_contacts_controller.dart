import 'package:flutter/material.dart';
import 'package:my_contacts/core.dart';
import 'package:my_contacts/model/contact_model.dart';
import '../../../service/contact_service.dart';
import '../view/edit_contacts_view.dart';

class EditContactsController extends State<EditContactsView> {
  static late EditContactsController instance;
  late EditContactsView view;
  ContactService service = ContactService();
  late ContactModel model;
  final formKey = GlobalKey<FormState>();
  TextEditingController? nameEditingController;
  TextEditingController? telphoneEditingController;
  TextEditingController? emailEditingController;
  TextEditingController? linkAkunEditingController;

  @override
  void initState() {
    instance = this;
    model = widget.model;
    nameEditingController = TextEditingController();
    telphoneEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    linkAkunEditingController = TextEditingController();
    nameEditingController!.text = model.name;
    telphoneEditingController!.text = model.telephone;
    emailEditingController!.text = model.email;
    linkAkunEditingController!.text = model.account;
    super.initState();
  }

  Future<void> updateContact() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      ContactModel updatedContact = ContactModel(
        id: model.id,
        name: nameEditingController!.text,
        telephone: telphoneEditingController!.text,
        email: emailEditingController!.text,
        account: linkAkunEditingController!.text,
      );

      try {
        await service.updateContact(updatedContact);
        Get.to(HomeContactsView());
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void dispose() {
    nameEditingController!.dispose();
    telphoneEditingController!.dispose();
    emailEditingController!.dispose();
    linkAkunEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
