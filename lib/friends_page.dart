import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {

  static const routeName = "/friends";

  const FriendsPage({Key? key, required this.title}) :super(key: key);

  final String title;

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}
class _FriendsPageState extends State<FriendsPage>{
  @override
  Widget build (BuildContext context) {
return Container(color: Colors.red);
  }
}