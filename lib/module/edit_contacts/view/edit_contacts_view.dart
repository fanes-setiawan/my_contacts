import 'package:flutter/material.dart';
import 'package:my_contacts/core.dart';
import 'package:my_contacts/model/contact_model.dart';
import 'package:my_contacts/service/contact_service.dart';
import '../../../widget/form_input.dart';
import '../controller/edit_contacts_controller.dart';

class EditContactsView extends StatefulWidget {
  final ContactModel model;

  const EditContactsView({Key? key, required this.model}) : super(key: key);

  Widget build(context, EditContactsController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("edit"),
        actions: [
          IconButton(
            onPressed: () {
              controller.updateContact();
            },
            icon: Icon(Icons.upload_file),
          ),
        ],
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                FormInput(
                  controller: controller.nameEditingController,
                  label: 'name',
                  hintText: 'enter your name',
                  textValidator: 'please enter some text',
                ),
                FormInput(
                  controller: controller.telphoneEditingController,
                  label: 'nomer telphone',
                  hintText: 'enter your nomer telphone',
                  textValidator: 'please enter some text',
                ),
                FormInput(
                  controller: controller.emailEditingController,
                  label: 'email',
                  hintText: 'enter your email address',
                  textValidator: 'please enter some text',
                ),
                FormInput(
                  controller: controller.linkAkunEditingController,
                  label: 'akun',
                  hintText: 'enter your name akun',
                  textValidator: 'please enter some text',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<EditContactsView> createState() => EditContactsController();
}
