// ignore_for_file: prefer_const_constructors

//import 'dart:js_interop';

//import 'package:flutter/cupertino.dart';
//import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/utils/app_sessions.dart';
//import 'package:todo_list/view/home_screen/home_screen.dart';

class NewtaskScreen extends StatefulWidget {
  const NewtaskScreen({super.key,
 
  });
  
  @override
  State<NewtaskScreen> createState() => _NewtaskScreenState();
}

class _NewtaskScreenState extends State<NewtaskScreen> {
  TextEditingController taskcontroller = TextEditingController();
   TextEditingController datecontroller = TextEditingController();
   TextEditingController timecontroller = TextEditingController();
 // hive  
  final todoBox = Hive.box(AppSessions.todoBox);
   List todoList = [];
  String? dropValue;
  List droplist = ["Default","Personal","Wishlist","Work","Shopping"];

@override
  void initState() {
   todoList = todoBox.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
     backgroundColor: Color.fromARGB(255, 220, 221, 233),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
// add data
            todoBox.add(
            {
              "task" :taskcontroller.text,
              "date" :datecontroller.text
           }
             
          );
        todoList = todoBox.keys.toList();
        Navigator.pop(context);
          setState(() {
            
          });
          print(todoBox.values);
        },
        child: Icon(Icons.check),),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 117, 173),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back)),
          title: Text("New Task",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20
          ),),
      ),
       body: Padding(
         padding: const EdgeInsets.all(15.0),
         child: SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("To Do !",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),),
              TextFormField(
                controller: taskcontroller,
                decoration: InputDecoration(
                  hintText: "Enter Task Here",
                  hoverColor: Colors.white
                ),
              ),
              SizedBox(height: 30,),
 // set date                      
               Text("Due Date",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),),
               TextFormField(
                readOnly: true, // can only be focused,cannot type any data
                controller: datecontroller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () async {
                    var selecteddate = await  showDatePicker(
                        context: context, 
                        firstDate: DateTime(2020),
                         lastDate: DateTime(2028));
                         datecontroller.text = selecteddate.toString();
                         // date format is changed using the package intl
                         if(selecteddate != null){
                          datecontroller.text = DateFormat("dd MMM").format(selecteddate);
                         }
                    },
                     icon: Icon(Icons.calendar_month,color: Colors.black,)),
                  hintText: "Set Date Here",
                  hoverColor: Colors.white
                ),
                
              ),
                SizedBox(height: 30,),
 //set timer             
                Text("Add Time",
                style: TextStyle(
                  color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20),),
              
                TextFormField(
                  controller: timecontroller,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      onPressed: () async {
                    var selectedtime = await    showTimePicker(
                          context: context,
                           initialTime: TimeOfDay(hour: 10, minute: 43));
                           timecontroller.text = selectedtime.toString();
                      }, 
                      icon: Icon(Icons.timer_sharp,color: Colors.black,))
                  ),
                ),
           
                SizedBox(height: 30,), 
                Text("Add Category",
                style: TextStyle(
                  color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20),),
                SizedBox(height: 15,),
  // select todo category                       
               DropdownButton(
                 value: dropValue,
                 hint: Text("default",style: TextStyle(color: Colors.black,),),
                 iconEnabledColor: Colors.black,
                items: List.generate(
                  droplist.length, 
                  (index)=>DropdownMenuItem(child: Text(droplist[index]),
                  value: droplist[index].toString(),
                  )), 
                onChanged:(value){
                  setState(() {
                    dropValue = value;
                  });
                } )
           
            ],),
         ),
       ),
    );
  }
}

//show time picker //timer

 