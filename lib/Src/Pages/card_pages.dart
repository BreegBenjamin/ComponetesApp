import 'package:componetes_app/Src/Widgets/card_details.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CardsDetails(),
      ),
    );
  }
}
