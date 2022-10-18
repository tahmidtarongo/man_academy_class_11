import 'package:flutter/material.dart';
import 'package:untitled/contact_list_model.dart';


class ContactDetails extends StatefulWidget {
  const ContactDetails({Key? key, required this.name}) : super(key: key);

  final ContactListModel name;

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.name.name ?? ''),
      ),
    );
  }
}
