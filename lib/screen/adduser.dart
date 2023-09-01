import 'package:crud/Services/UserService.dart';
import 'package:crud/model/user.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  var _UserNameController =TextEditingController();
  var _UserContactController = TextEditingController();
  var _UserDescriptionController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDescription = false;
  var _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ADD NEW USER"),),
      body: SingleChildScrollView(padding: const EdgeInsets.all(10),child:
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
 
        const Text("ADD NEW USER",style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.w500),),
        const SizedBox(height: 10),
        TextField(controller: _UserNameController,
        decoration:  InputDecoration(border: OutlineInputBorder(),hintText: "ENTER NAME",labelText: "NAME",
        errorText: _validateName?'Name cannot be empty':null)),
        const SizedBox(height: 10),
        TextField(controller: _UserContactController,
        decoration:  InputDecoration(border: OutlineInputBorder(),hintText: "ENTER CONTACT",labelText: "CONTACT", 
        errorText:   _validateContact ?"Contact cannot be empty":null)),
        const SizedBox(height: 10),
        TextField(controller: _UserDescriptionController,
        decoration:  InputDecoration(border: OutlineInputBorder(),hintText: "ENTER DESCRIPTION",labelText: "DESCRIPTION",
        errorText: _validateDescription ? "Description cannot be empty":null),),
        const SizedBox(height: 15),

        Row(
        children: [
        TextButton(onPressed: ()async{ 
           setState(() {
        _UserNameController.text.isEmpty?_validateName=true:_validateName=false;
        _UserContactController.text.isEmpty?_validateContact=true:_validateContact=false;
        _UserDescriptionController.text.isEmpty?_validateDescription=true:_validateDescription=false;
        });
             if(_validateName == false && _validateContact ==  false && _validateDescription==false){
          print("Good Data Can Save");
          var _user = User();
          _user.name=_UserNameController.text;
          _user.contact=_UserContactController.text;
          _user.description=_UserDescriptionController.text;
          var result = await _userService.SaveUser(_user);
          Navigator.pop(context,result);
             } 
        },
        
        
        child: Text("SAVE DETAILS"),style: TextButton.styleFrom(primary: Colors.white,backgroundColor: Colors.deepPurpleAccent),        ),
        const SizedBox(width: 10),
        TextButton(onPressed: (){_UserNameController.text='';_UserContactController.text='';_UserDescriptionController.text='';},
         child: Text("CLEAR DETAILS"),style: TextButton.styleFrom(primary: Colors.white,backgroundColor: Colors.blueAccent),)
        ],)

        ],),),
    
    
    
    
    
    
    );
  }
}