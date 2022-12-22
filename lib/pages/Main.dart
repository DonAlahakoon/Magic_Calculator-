import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  late int first,second;
  late String opp;
  late String result="",text = "";
  late String screen = "";

  late String phoneNum="9999";

  void btnClicked(String btnText){
    if(btnText=="C"){
      print("Case 1");
      //resetting all
      result = "";
      text = "";
      first = 0;
      second = 0;

      screen = "";
    }
    else if(btnText == "+"||btnText=="-"||btnText=="x"||btnText=="/"){
      print("Case 2");
      //saving value first
      first = int.parse(text);
      result = "";
      opp = btnText;

      screen = screen + btnText;
    }
    else if(btnText == "="){
      print("Case 3");
      // second = int.parse(text);
      // switch(opp){
      //   case "+": result = (first+second).toString();break;
      //   case "-": result  = (first-second).toString();break;
      //   case "/": result = (first/second).toString();break;
      //   case "x": result  = (first*second).toString();break;
      //   default: print("Error");break;
      //
      // }
      screen = phoneNum.substring(3,15);
    }
    else{
      print("Case 4");
      //7 + 7 => 77
      result = (int.parse(text + btnText)).toString();

      screen = screen + btnText;
    }
    setState((){
      text = result;
    });

  }
  Widget customOutlineButton(String value){
    return Expanded(//this expanded widget makes all distributed in full screen
      child: OutlinedButton(
          onPressed: () => btnClicked(value),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(20),
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
        title: Text("Calculator✨"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
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
                'Magical Functions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text("Contacts"),
              onTap: () async {
                dynamic result = await Navigator.pushNamed(context, '/contact');
                setState((){
                  phoneNum = result['phoneNum'];
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.handshake),
              title: Text("About app"),
              onTap: ()=>showDialog(context: context,
                builder: (BuildContext context) =>AlertDialog(
                  title: const Text("About MagicCal!"),
                  content: const Text('Created by DON'),
                  actions: <Widget>[
                    TextButton(onPressed: ()=>Navigator.pop(context,'Cancel'), child: const Text('Cancel'),),
                    TextButton(onPressed: ()=>Navigator.pop(context,'OK'), child: const Text('OK'),),
                  ],
                ),
            ),
            ),
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
                screen,
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
