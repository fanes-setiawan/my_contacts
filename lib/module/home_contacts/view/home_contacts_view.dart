import 'package:flutter/material.dart';
import 'package:my_contacts/core.dart';
import 'package:my_contacts/widget/search.dart';
import '../controller/home_contacts_controller.dart';

class HomeContactsView extends StatefulWidget {
  const HomeContactsView({Key? key}) : super(key: key);

  Widget build(context, HomeContactsController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text("My Contacts"),
        actions: const [],
      ),
      body: controller.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : controller.contacts.isEmpty
              ? Center(
                  child: Text(
                    "contact kosong",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                )
              : Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Search(),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: ListView.builder(
                              itemCount: controller.contacts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = controller.contacts[index];
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 28,
                                          child: Center(
                                            child: Text(
                                              item.name.substring(0, 1),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              item.email,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: () {
            Get.to(AddContactsView());
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  State<HomeContactsView> createState() => HomeContactsController();
}
