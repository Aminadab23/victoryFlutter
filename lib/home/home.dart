import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:victory/auth/auth_controler.dart';

class WelcomePage extends StatefulWidget {
  String email;
  WelcomePage({Key? key, required this.email}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String dropdownvalue = 'Math';
String grade = '11';
TextEditingController _textEditingController = TextEditingController();
  // List of items in our dropdown menu
  var items = [
    'Math',
    'Physics',
    'Chemistry',
    'Biology',

  ];
  var gradeItems = [
    '11','12'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Center(
          child: Text('Post Menu',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
    child: Column(

        children: [
          Row(

            children: [

              DropdownButton(

                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
 items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              DropdownButton(

                // Initial Value
                value: grade,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: gradeItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    grade = newValue!;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: SingleChildScrollView(
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write the post here',


                ),
                minLines: 1,
                maxLines: 2000,
controller: _textEditingController,
              ),
            ),
          ),
Row(
  children: [
    ElevatedButton(onPressed: (){},

        child: Text('cancel',
    style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,

    ),

    ),
    ),
    SizedBox(width: 20.0,),

    ElevatedButton(onPressed: (){
print(dropdownvalue);
print(grade);
print(_textEditingController.text);

Map<String, dynamic> data= {
  'subject':dropdownvalue,
  'grade': grade,
  'note': _textEditingController.text,
};
String n = 'Note 1';
FirebaseFirestore.instance.collection('Study_notes').add(data);

    },

        child: Text('post',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,

          ),

        ),

    ),
  ],
)
        ],
    ),
    ),
      ),
    );
  }
}

