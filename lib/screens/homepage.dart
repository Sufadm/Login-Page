import 'package:flutter/material.dart';
import 'package:login_1/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: Colors.green,
        title: const Text(
          'HomePage',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ListTile(
                title: const Text(
                  'WarrenBuffet',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                subtitle: const Text(
                  'The Great Investor',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                leading: Image.asset(
                  'images/download.jpeg',
                ),
                trailing: const Icon(Icons.more_vert),
              ),
              const ListTile(
                title: Text(
                  'Berkshire Hathway',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              Image.asset(
                'images/GettyImages-184769358-d334e8ac6239419aa7f98c983b65b2bf.jpg',
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up),
                    ),
                  ],
                ),
              ),
              Icon(Icons.comment),
              const ListTile(
                title: Text(
                  'Elonmusk',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                subtitle: Text(
                  'Spacex',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/elon.jpeg'),
                ),
                trailing: Icon(Icons.more_vert),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  'images/elon.jpeg',
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up),
                    ),
                  ),
                  Icon(Icons.comment)
                ],
              ),
              const ListTile(
                title: Text(
                  'Jeffbezoz',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                subtitle: Text(
                  'Amazon',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/jeff.jpg'),
                ),
                trailing: Icon(Icons.more_vert),
              ),
              Image.asset('images/jeff.jpg'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up),
                    ),
                  ),
                  Icon(Icons.comment),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Confirmation'),
                                    content:
                                        const Text('Do you wish to logout'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            logout(context);
                                          },
                                          child: const Text('OK')),
                                    ],
                                  ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  logout(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return Loginpage();
    }), (route) => false);
  }
}
