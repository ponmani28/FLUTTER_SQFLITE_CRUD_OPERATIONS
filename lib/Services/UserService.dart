import 'package:crud/db_helper.dart/repository.dart';
import 'package:crud/model/user.dart';

class UserService {
 late Repository _repository;
 UserService(){
  _repository = Repository();
 }

//SAVE USER
 SaveUser(User user) async{
  return await _repository.insertData("users", user.UserMap()); 
 }

 //READ all USER
 readAllUsers()async{
  return await _repository.readData('users');
 }


//EDIT USER
  UpdateUser(User user) async{

    return await _repository.UpdateData('Users',user.UserMap());
  }

  deleteUser(userId) async{return await _repository.deleteDataById('users',userId);}  
 } 


