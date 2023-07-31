import 'package:flutter/material.dart';
import '../view/detail_contacts_view.dart';

class DetailContactsController extends State<DetailContactsView> {
  static late DetailContactsController instance;
  late DetailContactsView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
