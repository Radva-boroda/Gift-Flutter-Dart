import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'friends_page.dart';

const String teamNameKey = "TEAM_NAME";

void main() {
  _prepareAndRun();
}

 Future<void> _prepareAndRun()async{
  WidgetsFlutterBinding.ensureInitialized();


  SharedPreferences prefs = await SharedPreferences.getInstance();
  final teamName = prefs.getString(teamNameKey);
  runApp( MyApp (teamName:teamName));
}


class MyApp extends StatelessWidget {
  final String? teamName;

  const MyApp ({this.teamName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
        routes: {
          MyHomePage.routeName: (BuildContext context) => const MyHomePage(),
          FriendsPage.routeName: (BuildContext context) => const FriendsPage(),
        },
      initialRoute: teamName ==null? MyHomePage.routeName : FriendsPage.routeName
        );
  }
}

class MyHomePage extends StatefulWidget {

  static const routeName = "/home";

  const MyHomePage({Key? key}) :super(key :key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    _controller.addListener(() {
      print(_controller.text);
    });
  }

  Future<void> _goNext() async {
    Navigator.of(context).pushNamed(FriendsPage.routeName);
    _controller.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(teamNameKey, _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Santa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Веди назву своєї групи',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                autofocus: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goNext,
        tooltip: 'Increment',
        child: const Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
