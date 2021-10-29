import 'package:bp_app/src/pages/Home/home.dart';
import 'package:bp_app/src/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final authRepository = AuthRepository();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 170,
              width: 170,
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              height: 24,
            ),
            Text(
              'B R A S I L',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
              ),
            ),
            Text(
              'PARALELO',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 43.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              height: 24,
            ),
            TextField(
              onChanged: (text) {
                email = text;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              height: 24,
            ),
            TextField(
              onChanged: (text) {
                password = text;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              height: 40,
            ),
            // ButtonComponent(),
            Container(
              padding: const EdgeInsets.all(0.01),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                  bottom:
                      BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                  left:
                      BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                  right:
                      BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                ),
              ),
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.blue.withOpacity(0.04);
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.blue.withOpacity(0.12);
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () async {
                    final data = {"email": email, "password": password};
                    final response = await authRepository.fetchAuth(data);
                    if (response == []) {
                      print('N');
                      _showMyDialog();
                    }
                    if (response[0].type == "premium") {
                      print('S');
                      Navigator.of(context).pushNamed('/home_premium',
                          arguments: {"username": response[0].name});
                    }
                  },
                  child: Text('Entrar')),
            )
          ],
        ),
      ),
    ));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Error!.'),
                Text('Incorrect email or password, please try again!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
