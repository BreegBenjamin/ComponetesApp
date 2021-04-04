import 'package:flutter/material.dart';

class CardsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15.0),
      children: [
        _cardTipo1(),
        SizedBox(height: 10.0),
        _cardTipo2(),
        SizedBox(height: 10.0),
        _cardTipo3()
      ],
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.eco, color: Colors.amber),
            title: Text('The Eco of the life'),
            subtitle: Text('Music by Mariana Froes. Lyrics in...'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Cancel'),
              ),
              SizedBox(width: 10.0),
              TextButton(
                onPressed: () {},
                child: Text('Ok'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 10.0,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ClipRRect(
            child: FadeInImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1582210177708-05f8747a6e9f?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1358&q=80"),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 250.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Imagen in the desert"))
        ],
      ),
    );
  }

  Widget _cardTipo3() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image(
            image: NetworkImage(
                "https://images2.alphacoders.com/240/thumb-1920-240032.jpg"),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipOval(
                      child: Container(
                          color: Colors.white,
                          height: 40.0,
                          width: 40.0,
                          child: Icon(Icons.card_giftcard, color: Colors.blue)),
                    ),
                  )
                ],
              ),
              _createDetails(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createDetails() {
    List<Widget> listIcons = [];
    final style = TextStyle(
        fontSize: 23.0, color: Colors.white, fontWeight: FontWeight.bold);
    for (int i = 0; i < 5; i++) {
      if (i == 4) {
        listIcons.add(Icon(Icons.star_border, color: Colors.white, size: 20.0));
      } else {
        listIcons.add(Icon(Icons.star_outlined,
            color: Colors.yellow.shade600, size: 20.0));
      }
      listIcons.add(SizedBox(width: 10.0));
    }
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: listIcons,
          ),
          Text('LightHouse', style: style),
          Text('Excursions', style: style)
        ],
      ),
    );
  }
}
