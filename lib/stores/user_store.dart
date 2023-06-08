
import 'package:campus_go/globals/enums.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {

  Map<String, String> userData = <String, String>{};
  Map<String, String> adminData = <String, String>{};


  Future<void> signInUser() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    saveToPreferences(sharedPrefs, {
      'username': 'Chanchal Yadav',
      'email': 'y.chanchal@iitg.ac.in',
      'phoneNo': '',
      'alternateEmail': '',
      'deliveryLocation': '',
      'id':'',
    });
    saveToUserData(sharedPrefs);
  }

  void saveToPreferences(SharedPreferences instance, dynamic data) {
    instance.setString("username", data["username"]);
    instance.setString("email", data["email"]);
    instance.setString("phoneNo", data["phoneNo"]);
    instance.setString("alternateEmail", data["alternateEmail"]);
    instance.setString("deliveryLocation", data["deliveryLocation"]);
    instance.setString("id", data["id"]);
  }

  void saveToUserData(SharedPreferences instance) {
    userData["username"] = instance.getString("username") ?? "";
    userData["email"] = instance.getString("email") ?? "";
    userData["phoneNo"] = instance.getString("phoneNo") ?? "";
    userData["alternateEmail"] = instance.getString("alternateEmail") ?? "";
    userData["deliveryLocation"] = instance.getString("deliveryLocation") ?? "";
    userData["id"] = instance.getString("id") ?? "";
  }

  void logOut(Function navigationPopCallBack) async {
    SharedPreferences user = await SharedPreferences.getInstance();
    user.clear();
    userData.clear();
    adminData.clear;
    navigationPopCallBack();
  }

   Future<void> signInAdmin(String username,String password) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    saveToPrefs(sharedPrefs, {
      'username': username,
      'password': password,
    });
    saveToAdminData(sharedPrefs);
  }
  void saveToPrefs(SharedPreferences instance, dynamic data) {
    instance.setString("username", data["username"]);
    instance.setString("password", data["password"]);
  }
  void saveToAdminData(SharedPreferences instance) {
    userData["username"] = instance.getString("username") ?? "";
    userData["password"] = instance.getString("password") ?? "";
  }

  @observable
  ViewType viewType = ViewType.admin;

  @action
  void setViewType(ViewType v){
    viewType = v;
  }




}
