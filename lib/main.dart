import 'package:flutter/material.dart';
import 'package:home3/showData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'HomeWork Input'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  String username = "not found";
  String password = "not found";

  void saveData() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      // แสดงข้อความแจ้งเตือนถ้าผู้ใช้ยังไม่ได้กรอกข้อมูล
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter both username and password')),
      );
      return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Showdata(
        username: usernameController.text,
        password: passwordController.text,
      );
    }));

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = usernameController.text;
      password = passwordController.text;
    });
  }

  void clearData() {
    usernameController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.blue,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('[DEBUG] username : $username'),
            // Text('[DEBUG] password : $password \n'),
            const Text(
              '6606021420148',
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                  'assets/images/464219621_10160092389125880_2179630257898618893_n.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter Username '),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter Password '),
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centers the button in the row
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: saveData,
                      child: Row(
                        children: const [
                          Icon(Icons.save),
                          Text("Save"),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: clearData,
                      child: Row(
                        children: const [
                          Icon(Icons.clear),
                          Text("Clear"),
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
