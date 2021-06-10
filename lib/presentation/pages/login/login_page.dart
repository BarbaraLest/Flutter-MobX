import 'package:flutter/material.dart';
import 'package:flutter_mobx/presentation/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  String _email = "";
  String _password = "";

  _errorMessage(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          message,
          style: TextStyle(
              color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _emailValid() {
    if (_email.trim().length == 0) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
  }

  _passwordValid() {
    return _password.trim().length > 0;
  }

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
              onSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_passwordNode),
              onChanged: (value) => {
                setState(() {
                  _email = value;
                })
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail), hintText: "Informe o email"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Visibility(
              child: _errorMessage("Insira um email correto."),
              visible: !_emailValid(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
            ),
            TextField(
              focusNode: _passwordNode,
              keyboardType: TextInputType.text,
              onChanged: (value) => {
                setState(() {
                  _password = value;
                })
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: "Informe a senha"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Visibility(
              child: _errorMessage("A senha é origatoria."),
              visible: !_passwordValid(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                child: Text("Acessar"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
