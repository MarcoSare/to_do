import 'package:flutter/material.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/settings/preferences_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PreferencesUser preferencesUser = PreferencesUser();
  late UserModel user;

  initData() async {
    user = await preferencesUser.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ConnectionState.done:
              {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      "Hola ${user.firstName!}",
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/editUser");
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(user.profilePicture!)),
                              shape: BoxShape.circle),
                        ),
                      )
                    ],
                  ),
                  drawer: Drawer(
                    child: ListView(
                      children: [
                        UserAccountsDrawerHeader(
                          accountName: Text(
                            user.firstName!,
                            style: const TextStyle(color: Colors.black),
                          ),
                          accountEmail: Text(user.email!,
                              style: const TextStyle(color: Colors.black)),
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.aihr.com/wp-content/uploads/working-from-home-background-and-featured-image.png"))),
                        ),
                        ListTile(
                          title: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.red),
                          ),
                          leading: const Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          onTap: () {
                            preferencesUser.logout();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/login", (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.add, size: 30),
                  ),
                );
              }
          }
        });
  }
}
/*
Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hola Marco",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Marco",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text("19030260@itcelaya.edu,mx",
                  style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.aihr.com/wp-content/uploads/working-from-home-background-and-featured-image.png"))),
            ),
            ListTile(
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onTap: () {
                preferencesUser.logout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    "/login", (Route<dynamic> route) => false);
              },
            )
          ],
        ),
      ),
    );
*/