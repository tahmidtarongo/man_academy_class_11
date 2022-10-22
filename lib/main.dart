import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:untitled/contact_details.dart';
import 'package:untitled/contact_list_model.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Contact> phoneBook = [];
  Future<void> _makeSms(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
    print('Data');
  }

  void getContactList() async{
   var status = await FlutterContacts.requestPermission();
   if(status){
     phoneBook = await FlutterContacts.getContacts(
         withProperties: true, withPhoto: true);
   }else{
     status = await FlutterContacts.requestPermission();
   }
  }

  @override
  void initState() {
    getContactList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('My Contacts'),
        ),
        body: phoneBook.isEmpty ? Center(child: CircularProgressIndicator(),) : ListView.builder(
            itemCount: phoneBook.length,
            itemBuilder: (_, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(4.0),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactDetails(person: phoneBook[index]))),
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.indigoAccent,
                  child: Text(
                    phoneBook[index].displayName.substring(0, 1).toUpperCase() ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  phoneBook[index].displayName ?? '',
                  style: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  phoneBook[index].phones[0].number ?? '',
                  style: TextStyle(color: Colors.grey, fontSize: 18.0),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: CircleAvatar(
                        child: Icon(
                          Icons.phone,
                          size: 20.0,
                        ),),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    GestureDetector(
                      onTap: () => _makeSms(contacts[index].mobile!),
                      child: CircleAvatar(
                          child: Icon(
                            Icons.sms,
                            size: 20.0,
                          )),
                    )
                  ],
                ),
              );
            }));
  }
}
