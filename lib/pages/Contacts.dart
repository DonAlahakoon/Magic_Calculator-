import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  void updateContact(num) async {

    Navigator.pop(context,{'phoneNum':num});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Contacts"),
        centerTitle: true,
        backgroundColor:Colors.blue,
      ),
      body: FutureBuilder(
        future: getContacts(),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.data == null){
            return const Center(
              child: SizedBox(height: 50,child:CircularProgressIndicator()),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                Contact contact = snapshot.data[index];
                return Column(
                  children: [
                    ListTile(
                      onTap: (){
                        updateContact(contact.phones[0]);
                      },
                        leading: const CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.person),
                        ),
                        title:Text(contact.displayName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contact.phones.length==0?'No phone number':contact.phones[0]),
                            Text(contact.emails.length==0?'No email':contact.emails[0]),
                          ],
                        )
                    ),
                    const Divider(),
                  ],
                );
              });
        },
      ),
    );
  }
  Future<List<Contact>> getContacts() async{
    bool isGranted = await Permission.contacts.status.isGranted;
    if(!isGranted){
      isGranted = await Permission.contacts.request().isGranted;
    }
    if(isGranted){
      return await FastContacts.allContacts;
    }
    return [];
  }

}
