import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:untitled/contact_list_model.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({Key? key, required this.person}) : super(key: key);

  final Contact person;

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.grey.withOpacity(0.1),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Icon(
            Icons.star,
            color: Colors.teal,
          ),
          SizedBox(
            width: 14.0,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.1),
            width: double.infinity,
            child: Column(
              children: [
                widget.person.thumbnailFetched
                    ? CircleAvatar(radius: 40.0, backgroundColor: Colors.indigoAccent, backgroundImage: MemoryImage(widget.person.thumbnail!))
                    : CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.indigoAccent,
                        child: Text(
                          widget.person.displayName.substring(0, 1).toUpperCase() ?? '',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  widget.person.displayName,
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            leading: Icon(
              Icons.call,
              color: Colors.grey,
            ),
            title: Text(widget.person.phones[0].number),
            subtitle: Text(widget.person.phones[0].label.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.video_call,
                  color: Colors.teal,
                  size: 40.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Icon(
                  Icons.message,
                  color: Colors.teal,
                )
              ],
            ),
          ),
          widget.person.emails.isEmpty
              ? Container()
              : ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  title: Text(widget.person.emails[0].address),
                  subtitle: Text(widget.person.emails[0].label.name),
                ),
        ],
      ),
    );
  }
}
