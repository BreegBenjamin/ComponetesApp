import 'package:componetes_app/Src/Widgets/indicator.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: _createBody(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _createBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _createLogo(),
          _createIndicator(),
          SizedBox(height: 10.0),
          _createForm(),
          SizedBox(height: 10.0),
          _createButton(),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _createLogo() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 40.0,
              ),
              SizedBox(width: 10.0),
              Text(
                'Velocity',
                style: TextStyle(
                    color: Color(0XFF05416A),
                    fontSize: 30.0,
                    fontFamily: 'Roboto'),
              )
            ],
          ),
          Column(
            children: [
              Text(
                'Get started for free',
                style: TextStyle(color: Color(0XFF043658), fontSize: 30.0),
              ),
              SizedBox(height: 10.0),
              Text(
                'Free forever. Not creedit card needed.',
                style: TextStyle(color: Colors.black45),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _createIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IndicatorOption(
          Action: 'Administrator',
          SubTitle: 'Full access to all \n settings',
          IconOpt: Icons.addchart_rounded,
        ),
        IndicatorOption(
          Action: 'Operator',
          SubTitle: 'Service desk and \n chat permissions',
          IconOpt: Icons.message_sharp,
        )
      ],
    );
  }

  Widget _createForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        children: [
          _createInput('Full Name', TextInputType.name),
          SizedBox(height: 20.0),
          _createInput('Email Address', TextInputType.emailAddress),
          SizedBox(height: 20.0),
          _createInput('Password', TextInputType.emailAddress, isObscure: true),
        ],
      ),
    );
  }

  Widget _createInput(String msField, TextInputType inputType,
      {bool isObscure = false}) {
    final _outLine = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0XFFD6D6D6), width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          msField.toUpperCase(),
          style: TextStyle(color: Colors.black45, fontSize: 20.0),
        ),
        SizedBox(height: 10.0),
        TextField(
          obscureText: isObscure,
          keyboardType: inputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0XFFF3F3F3),
            focusedBorder: _outLine,
            enabledBorder: _outLine,
            hintText: msField,
          ),
        ),
      ],
    );
  }

  Widget _createButton() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Create Account'),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 18.0, horizontal: 90.0)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(color: Colors.black45, fontSize: 15.0),
            ),
            SizedBox(width: 5.0),
            Text(
              'Sing in',
              style: TextStyle(color: Colors.blue[200], fontSize: 15.0),
            )
          ],
        )
      ],
    );
  }
}
