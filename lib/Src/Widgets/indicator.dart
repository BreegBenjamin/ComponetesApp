import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class IndicatorOption extends StatefulWidget {
  String Action;
  IconData IconOpt;
  String SubTitle;
  IndicatorOption({this.Action, this.IconOpt, this.SubTitle});
  @override
  _IndicatorOptionState createState() => _IndicatorOptionState(
      Action: Action, IconOpt: IconOpt, SubTitle: SubTitle);
}

class _IndicatorOptionState extends State<IndicatorOption> {
  String Action;
  IconData IconOpt;
  String SubTitle;
  _IndicatorOptionState({this.Action, this.IconOpt, this.SubTitle});
  bool _check = false;
  Color _shadowColor = Colors.black;
  double _elevation = 1.0;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: _shadowColor,
      elevation: _elevation,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(left: 90.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _createCircleCheck(),
                  ],
                ),
              ),
              _iconUser(IconOpt, Action, SubTitle),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createCircleCheck() {
    return CircularCheckBox(
        value: _check,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        onChanged: (bool valor) {
          setState(() {
            _check = valor;
            if (_check) {
              _shadowColor = Colors.blue;
              _elevation = 3.0;
            } else {
              _shadowColor = Colors.black;
              _elevation = 1.0;
            }
          });
        });
    ;
  }

  Widget _iconUser(IconData icon, String action, String subTitle) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue[600]),
            shape: BoxShape.circle,
          ),
          child: RawMaterialButton(
            onPressed: () {},
            elevation: 3.0,
            fillColor: Colors.blue[50],
            child: Icon(icon, size: 40.0, color: Colors.blue[600]),
            padding: EdgeInsets.all(18.0),
            shape: CircleBorder(),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(action,
              style: TextStyle(color: Colors.black87, fontSize: 20.0)),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            subTitle,
            style: TextStyle(color: Colors.black45, fontSize: 15.0),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
