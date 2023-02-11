import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String redirectUrl = 'https://www.linkedin.com/company/hugee/';

  final String clientId = '861l72zhn2bhx2';

  final String clientSecret = 'F63ZfcW78ra931vS';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool logoutUser = false;
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
                onPressed: () {
                  /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LinkedInUserWidget(
                          appBar: AppBar(
                            title: Text("OAuth User"),
                          ),
                          onGetUserProfile: (value) {
                            print("Access token:: ${value.user.token}");
                            print("user id ${value.user.userId}");
                            print("user FirstName: ${value.user.firstName}");
                            print("user lastName: ${value.user.lastName}");
                            print("user email:: ${value.user.email}");
                          },
                          redirectUrl: redirectUrl,
                          clientId: clientId,
                          clientSecret: clientSecret,
                          projection: const [
                            ProjectionParameters.id,
                            ProjectionParameters.localizedFirstName,
                            ProjectionParameters.localizedLastName,
                            ProjectionParameters.firstName,
                            ProjectionParameters.lastName,
                            ProjectionParameters.profilePicture,
                          ],
                          onError: (final UserFailedAction e) {
                            print('Error: ${e.toString()}');
                            print('Error: ${e.stackTrace.toString()}');
                            setState(() {
                              logoutUser = false;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        fullscreenDialog: true,
                      ));*/
                },
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
