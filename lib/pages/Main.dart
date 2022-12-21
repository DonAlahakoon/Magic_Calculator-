import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Widget customOutlineButton(String value){
    return Expanded(//this expanded widget makes all distributed in full screen
      child: OutlinedButton(
          onPressed: (){},
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(25),
          ),
          child: Text(
              value,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black
              ),
          ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magic Calculator"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:<Widget> [
            DrawerHeader(
                decoration: BoxDecoration(
                  color:Colors.grey,
                ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text("Contacts"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            )
          ],
        ),
      ),

      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                "0",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )
            )),
            Row(
              children: [
                customOutlineButton("C"),
                customOutlineButton("()"),
                customOutlineButton("%"),
                customOutlineButton("/"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("7"),
                customOutlineButton("8"),
                customOutlineButton("9"),
                customOutlineButton("x"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("4"),
                customOutlineButton("5"),
                customOutlineButton("6"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("1"),
                customOutlineButton("2"),
                customOutlineButton("3"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("+/-"),
                customOutlineButton("0"),
                customOutlineButton("."),
                customOutlineButton("="),
              ],
            ),

          ],
        ),
      ),

    );
  }
}
