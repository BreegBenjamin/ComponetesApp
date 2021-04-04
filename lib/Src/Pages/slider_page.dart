import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            _createSlider(),
            _createCheckbox(),
            Divider(height: 10.0),
            _createSwitch(),
            Divider(height: 10.0),
            _createImagen(),
          ],
        ),
      ),
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
        title: Text('Bloquear check'),
        value: _blockCheck,
        onChanged: (valor) {
          setState(() {
            _blockCheck = valor;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Bloquear check'),
        value: _blockCheck,
        onChanged: (valor) {
          setState(() {
            _blockCheck = valor;
          });
        });
  }

  Widget _createSlider() {
    return Slider(
      label: 'Corvo Image',
      activeColor: Colors.blueAccent,
      value: _sliderValue,
      min: 100,
      max: 350,
      onChanged: (_blockCheck)
          ? null
          : (valor) {
              setState(() {
                _sliderValue = valor;
              });
            },
    );
  }

  Widget _createImagen() {
    return FadeInImage(
      image: NetworkImage(
          'https://i.pinimg.com/originals/6f/82/ca/6f82ca0564125b8090432f94cca0bfd2.jpg'),
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
      width: _sliderValue,
      fit: BoxFit.fill,
    );
  }
}
