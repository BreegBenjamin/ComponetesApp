import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _optionDrop = 'Iron Maiden';

  List<String> _bands = [
    'Iron Maiden',
    'Queen',
    'Stratovarius',
    'Dio',
    'Rainbow'
  ];

  TextEditingController _inputFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs Page')),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Nombre',
        labelText: 'Nombre',
        icon: Icon(Icons.person),
        counter: Text('Caracteres ${_nombre.length}'),
        suffixIcon: Icon(Icons.person_add_alt),
      ),
      onChanged: (String vulue) {
        setState(() {
          _nombre = vulue;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (String vulue) {
        setState(() => _email = vulue);
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'Password',
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.lock_clock),
      ),
      onChanged: (String vulue) {
        setState(() => _email = vulue);
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text(_nombre),
      subtitle: Text(_email),
      trailing: Text(_optionDrop),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Fecha de Nacimiento',
        icon: Icon(Icons.calendar_today_rounded),
        suffixIcon: Icon(Icons.calendar_view_day_outlined),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      controller: _inputFieldController,
    );
  }

  Future _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'CO'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> _getOptionsDropdawn() {
    List<DropdownMenuItem<String>> listItem = [];
    _bands.forEach((band) {
      listItem.add(DropdownMenuItem(
        child: Text(band),
        value: band,
      ));
    });
    return listItem;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _optionDrop,
          items: _getOptionsDropdawn(),
          onChanged: (value) {
            setState(() {
              _optionDrop = value;
            });
          },
        ),
      ],
    );
  }
}
