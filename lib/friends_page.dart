import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:santa/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'friend.dart';

class FriendsPage extends StatefulWidget {

  static const routeName = "/friends";

  const FriendsPage({Key? key}) :super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>{

  String? _teamName;
List _friends = [];

  @override
  void initState() {
    super.initState();
    _loadName();
  }

   Future<void> _loadName() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     final teamName = prefs.getString(teamNameKey);
     print("Loaded name = $teamName");

     setState(() {
       _teamName = teamName;
     });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_teamName?? ""),
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: _itemBilder,
            separatorBuilder: _separatorBuilder,
            itemCount: _friends.length,
        )),
        floatingActionButton: FloatingActionButton(
      onPressed: _add,
      tooltip: 'Increment',
      child: const Icon(Icons.plus_one),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

Widget _itemBilder(BuildContext context, int index){
    return Container(color: Colors.black, height: 100);

}

  Widget _separatorBuilder(BuildContext context, int index){
return const SizedBox(height: 10);
  }


Future<void> _add() async {
    final friend = Friend(_friends.length, Colors.grey, "My friend" );
    setState(() {
      _friends.add(friend);
    });
}
}