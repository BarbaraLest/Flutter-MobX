import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobx App"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordNode),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail), hintText: "Informe o email"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
            ),
            TextField(
              focusNode: _passwordNode,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: "Informe a senha"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                child: Text("Acessar"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
