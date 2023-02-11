import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';

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
    UserObject user;
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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LinkedInUserWidget(
                          appBar: AppBar(
                            title: Text("OAuth User"),
                          ),
                          onGetUserProfile:
                              (final UserSucceededAction linkedInUser) {
                            print("Access token:: ${linkedInUser.user.token}");
                            print("user id ${linkedInUser.user.userId}");
                            print(
                                "user FirstName: ${linkedInUser.user.firstName}");
                            print(
                                "user lastName: ${linkedInUser.user.lastName}");
                            print("user email:: ${linkedInUser.user.email}");
                            user = UserObject(
                              lastName: linkedInUser
                                  ?.user?.lastName?.localized?.label,
                              firstName: linkedInUser
                                  ?.user?.firstName?.localized?.label,
                              email: linkedInUser?.user?.email?.elements![0]
                                  ?.handleDeep?.emailAddress,
                              profileImageUrl: linkedInUser
                                  ?.user
                                  ?.profilePicture
                                  ?.displayImageContent
                                  ?.elements![0]
                                  ?.identifiers![0]
                                  ?.identifier,
                            );
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
                      ));
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
            // Text('First: ${user?.firstName} '),
            // Text('Last: ${user?.lastName} '),
            // Text('Email: ${user?.email}'),
            // Text('Profile image: ${user?.profileImageUrl}'),
          ],
        ),
      ),
    );
  }
}

class AuthCodeObject {
  AuthCodeObject({this.code, this.state});

  final String? code;
  final String? state;
}

class UserObject {
  UserObject({
    this.firstName,
    this.lastName,
    this.email,
    this.profileImageUrl,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImageUrl;
}
