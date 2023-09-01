import 'package:crud/model/user.dart';
import 'package:flutter/material.dart';

class ViewUser extends StatefulWidget {
  final User user;
  const ViewUser({super.key, required this.user});

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLITE CRUD"),),

      body:Container(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text("FULL DETAILS"),SizedBox(height: 20,),
        Row(children: [Text("Name  ",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold)),
        
        SizedBox(width: 58,)
        
        ,Text(widget.user.name??'',style: TextStyle(color: Colors.blueGrey,fontSize: 16,fontWeight: FontWeight.bold),)]), 

          SizedBox(height: 20,),
     
         Row(children: [Text("Contact  ",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold)),
         
          SizedBox(width: 43,),
         
         
         Text(widget.user.contact??'',style: TextStyle(color: Colors.blueGrey,fontSize: 16,fontWeight: FontWeight.bold),)]),


          SizedBox(height: 20,),
         Row(
           children: [
             Text("Description ",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold)),SizedBox(width: 20,),Text(widget.user.description??'',style: TextStyle(color: Colors.blueGrey,fontSize: 16,fontWeight: FontWeight.bold)),
           ],
         )   
            
            
            
            
            ],),
      ),) ,

    );
  }
}

