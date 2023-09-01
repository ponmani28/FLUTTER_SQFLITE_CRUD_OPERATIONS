import 'package:crud/Services/UserService.dart';
import 'package:crud/model/user.dart';
import 'package:crud/screen/adduser.dart';
import 'package:crud/screen/editUser.dart';
import 'package:crud/screen/viewuser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late List<User> _userList = <User>[];
  final _userService = UserService();


getAllUserDetails() async {
  var users = await _userService.readAllUsers();
  _userList = <User>[];

  users.forEach((user) {
    setState(() {
      var userModel = User(); // Create a new User instance

      userModel.id = user['id'];
      userModel.name = user['name'];
      userModel.contact = user['contact'];
      userModel.description = user['description'];

      _userList.add(userModel);
    });
  });
}

 @override
  void initState() {

    getAllUserDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }


 _deleteFormDialog(BuildContext context,userId){
  return showDialog(context: context, builder: (param){
    return AlertDialog(
      title: Text("ARE YOU SURE DELETE?"),
      actions: [TextButton(style: TextButton.styleFrom(primary: Colors.white,backgroundColor: Colors.red),
      onPressed: ()async{
        var result = await _userService.deleteUser(userId);
        if(result!=null){
          Navigator.pop(context);
          getAllUserDetails();
          _showSuccessSnackBar("User Details Deleted Successfully");
        }


      }, 
      child: Text("DELETE")),
      TextButton(style: TextButton.styleFrom(primary: Colors.white,backgroundColor: Colors.teal),
      onPressed: (){Navigator.pop(context);}, 
      child: Text("CLOSE"))
      
      
      ],
    );
  });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLITE CRUD"),),

      floatingActionButton: FloatingActionButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> AddUser())).then((data){
        if(data!=null){
          getAllUserDetails();
          _showSuccessSnackBar("User Details Added Successfully");
        }
      }
      );},child: Icon(Icons.add),),





    body: ListView.builder(itemCount: _userList.length,itemBuilder: (context, index) {
      return Card(

        child: ListTile(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewUser(user: _userList[index]))
          );
        },trailing:Row(mainAxisSize: MainAxisSize.min,children: [
          




          IconButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => edituser(user: _userList[index]))
          ).then((data){
        if(data!=null){
          getAllUserDetails();
          _showSuccessSnackBar("User Details Updated  Successfully");
        }
      }
      ); ;}, icon: Icon(Icons.edit,color: Colors.deepPurpleAccent,)),
        
        




        
        IconButton(onPressed: (){

          _deleteFormDialog(context,_userList[index].id);


        }, icon: Icon(Icons.delete,color: Colors.deepPurpleAccent,))],) ,





        leading: Icon(Icons.person),title: Text(_userList[index].name?? '',style: TextStyle(color: Colors.black),),subtitle: Text(_userList[index].contact??'')),

      );

    }),


    );
  }
}