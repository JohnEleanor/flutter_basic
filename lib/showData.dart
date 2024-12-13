import 'package:flutter/material.dart';

class Showdata extends StatelessWidget {
  final String username;
  final String password;
  const Showdata({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    void backHome() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.blue,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Show Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // ทำให้ content ขึ้นข้างบน
          crossAxisAlignment:
              CrossAxisAlignment.center, // ทำให้ทุก widget อยู่ทางตรงกลาง
          children: [
            const Text(
              '6606021420148',
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.all(150),
              child: Column(
                children: [
                  Text('Username: $username'),
                  Text('Password: $password'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                backHome();
              },
              child: Text("back"),
            ),
          ],
        ),
      ),
    );
  }
}
