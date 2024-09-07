// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/utils/app_sessions.dart';
import 'package:todo_list/view/home_screen/widget/added_task.dart';
import 'package:todo_list/view/newtask_screen/newtask_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
   final todoBox = Hive.box(AppSessions.todoBox);
   List todoList = [];
   String? dropValue1;
  List droplist1 = ["Default","Personal","Wishlist","Work","Shopping"];
// @override
//   void initState() {
//    todoList= todoBox.keys.toList();
//    setState(() {
     
//    });
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 88, 132, 171),     
        title: Text("Manage your time well",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22            
        ),),
        actions: [
           DropdownButton(
                 value: dropValue1,
                 hint: Text("default",style: TextStyle(color: Colors.white,),),
                 iconEnabledColor: Colors.white,
                 dropdownColor: Color.fromARGB(255, 74, 114, 147),
                 style: TextStyle(color: Colors.white),
                items: List.generate(
                  droplist1.length, 
                  (index)=>DropdownMenuItem(child: Text(droplist1[index]),
                  value: droplist1[index].toString(),
                  )), 
                onChanged:(value){
                  setState(() {
                    dropValue1 = value;
                  });
                } ),
              SizedBox(width: 20,)
        ],
      ),
      
      body:Expanded(
        child: ListView.separated(
          itemBuilder: (context,index){
           
            final currentNote = todoBox.get(todoList[index]);
           // return Container(height: 40,color: Colors.green,);
             return AddedTask(
            
               task : currentNote["task"],
              date : currentNote["date"]
              //time
              //category
           );
          },
           separatorBuilder: (context,index)=>SizedBox(height: 20,), 
           itemCount:todoList.length
            ),
      ) ,
  // floatingAction Button       
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        
          Navigator.push(context,
           MaterialPageRoute(builder: (context)=>NewtaskScreen(  )));
        },
        child: Icon(Icons.add),),
       
    );
  }
}

 