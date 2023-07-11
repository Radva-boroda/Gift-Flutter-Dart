import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:santa/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendsPage extends StatefulWidget {

  static const routeName = "/friends";

  const FriendsPage({Key? key}) :super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>{

  String? _teamName;

  @override
  void initState() {
    super.initState();
  }

   Future<void> loadName() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     final teamName = prefs.getString(teamNameKey);
     setState(() {
       _teamName = teamName;
     });
  }

  @override
  Widget build (BuildContext context) {
return Container(color: Colors.red);
  }
}