import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LinkedIn Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(backgroundColor: Colors.cyan, maxRadius: 80),
            Text(
              "Name:",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Email:",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  width: 300,
                  margin: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      "LinkedIn LogIn",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  width: 300,
                  margin: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      "LinkedIn LogOut",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
