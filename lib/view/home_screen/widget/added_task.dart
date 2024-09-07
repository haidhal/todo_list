
import 'package:flutter/material.dart';

class AddedTask extends StatelessWidget {
  const AddedTask({super.key,
  required this.task,
  required this.date
  });
 final String task;
 final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
 decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.blue
     ),
     child: Row(
      children: [
        Icon(Icons.add_box),
        // Checkbox(
        //   value: isChecked, 
        //   onChanged: (value){
        //      setState(() {
        //       if(value != null){
        //          isChecked = value;
        //       }
              
        //      });   
        //   }),
          Column(children: [
            Text(task,
            style: TextStyle(fontSize: 30,color: Colors.green),),
            Text(date),
            Text("category")
          ],)
      ],
     ),
     
    );
  }
}