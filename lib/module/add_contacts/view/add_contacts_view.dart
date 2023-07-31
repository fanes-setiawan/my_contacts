import 'package:flutter/material.dart';
import 'package:my_contacts/core.dart';
import 'package:my_contacts/widget/form_input.dart';
import '../controller/add_contacts_controller.dart';

class AddContactsView extends StatefulWidget {
  const AddContactsView({Key? key}) : super(key: key);

  Widget build(context, AddContactsController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contacts"),
        actions: [
          IconButton(
            onPressed: () {
              controller.save();
            },
            icon: Icon(Icons.save),
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
  State<AddContactsView> createState() => AddContactsController();
}
