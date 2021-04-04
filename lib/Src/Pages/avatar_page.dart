import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images-na.ssl-images-amazon.com/images/I/717yDikYx-L._AC_SX466_.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: CircleAvatar(
              child: Text('BB'),
              backgroundColor: Colors.grey[600],
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            _backgroundStack(),
            _iconsPage(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundStack() {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image(
            image: NetworkImage(
                'https://i.pinimg.com/564x/bd/87/93/bd879305a6c9494f8a7856fb69949bb8.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(0, 0, 0, 0.3),
        ),
      ],
    );
  }

  Widget _iconsPage() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _iconUser(Icons.online_prediction, 'Connect to matrix'),
          _iconUser(Icons.fingerprint, 'Authorize person'),
          _iconUser(Icons.visibility, 'Eye scan'),
          _iconUser(Icons.hearing, 'Mute sound'),
          _iconUser(Icons.view_in_ar, 'Unlock everything'),
        ],
      ),
    );
  }

  Widget _iconUser(IconData icon, String action) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            shape: BoxShape.circle,
          ),
          child: RawMaterialButton(
            onPressed: () {},
            elevation: 3.0,
            fillColor: Colors.transparent,
            child: Icon(icon, size: 40.0, color: Colors.white),
            padding: EdgeInsets.all(18.0),
            shape: CircleBorder(),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            action,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        )
      ],
    );
  }
}
