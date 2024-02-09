import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Phones",
          style: TextStyle(
            fontFamily: "sfpro",
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _body());

  Widget _body() {
    if (_permissionDenied)
      return Center(
          child: Text(
        'Permission denied',
        style: TextStyle(
          fontFamily: "sfpro",
          color: Colors.white,
        ),
      ));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => Material(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    tileColor: Colors.black,
                    title: Text(
                      _contacts![i].displayName,
                      style: TextStyle(
                          fontFamily: "sfpro",
                          color: Colors.white,
                          fontSize: 17),
                    ),
                    leading: Icon(CupertinoIcons.person),
                    trailing: Icon(CupertinoIcons.phone),
                    onTap: () async {
                      final fullContact =
                          await FlutterContacts.getContact(_contacts![i].id);
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ContactPage(fullContact!)));
                    }),
              ),
            ));
  }
}

class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            contact.displayName,
            style: TextStyle(
              fontFamily: "sfpro",
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Icon(
              CupertinoIcons.person_2,
              size: 70,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Color(0xFF52B6DF),
              leading: Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
              title: Text(
                'First name: ${contact.name.first}',
                style: TextStyle(
                  fontFamily: "sfpro",
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Color(0xFF52B6DF),
              leading: Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
              title: Text(
                'Last name: ${contact.name.last}',
                style: TextStyle(
                  fontFamily: "sfpro",
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Color(0xFF52B6DF),
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.black,
              ),
              title: Text(
                'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : 'None'}',
                style: TextStyle(
                  fontFamily: "sfpro",
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Color(0xFF52B6DF),
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.black,
              ),
              title: Text(
                'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : 'None'}',
                style: TextStyle(
                  fontFamily: "sfpro",
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Spacer(),
              CircleAvatar(
                  radius: 35,
                  backgroundColor: Color(0xFF52B6DF),
                  child: IconButton(
                      onPressed: () {
                        _makePhoneCall(contact.phones.isNotEmpty ? contact.phones.first.number : 'None');
                      },
                      icon: Icon(
                        CupertinoIcons.phone,
                        color: Colors.black,
                        size: 40,
                      ))),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xFF52B6DF),
                child: IconButton(
                    onPressed: () {
                      _makePhoneCall(contact.phones.isNotEmpty ? contact.phones.first.number : 'None');
                    },
                    icon: Icon(
                      CupertinoIcons.video_camera,
                      color: Colors.black,
                      size: 50,
                    )),
              ),
              Spacer(),
            ],
          ),
        ]),
      );
}
