import 'package:flutter/material.dart';
class Contactapp extends StatelessWidget {
  const Contactapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  List<Map<String, String>> contacts = [];

  _addContact() {
    String name = _nameController.text.trim();
    String number = _numberController.text.trim();

    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contacts.add({'name': name, 'number': number});
      });
      _nameController.clear();
      _numberController.clear();
    }
  }

   _deleteContact(int index) {
    showDialog(
      context: context,
      builder: (context) =>AlertDialog(
        title:  Text("Confirmation"),
        content:  Text("Are you sure you want to delete?"),
        actions: [
          IconButton(
            icon:  Icon(Icons.close, color: Colors.red),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon:  Icon(Icons.delete, color: Colors.blue),
            onPressed: () {
              setState(() {
                contacts.removeAt(index);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Contact List"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration:  InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(height: 10),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.phone,
              decoration:  InputDecoration(
                labelText: "Number",
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addContact,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                minimumSize:  Size(double.infinity, 40),
              ),
              child:  Text("Add"),
            ),
             SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => _deleteContact(index),
                    child: Card(
                      child: ListTile(
                        leading:  Icon(Icons.person),
                        title: Text(
                          contacts[index]['name']!,
                          style:  TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        subtitle: Text(contacts[index]['number']!),
                        trailing:  Icon(Icons.call, color: Colors.blue),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
