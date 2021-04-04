import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _listItemsNum = [];
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _imageCard10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fechaData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Page'),
      ),
      body: Stack(children: [
        _createList(),
        _createLoading(),
      ]),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _indicator,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return _createCard(index);
        },
        itemCount: _listItemsNum.length,
      ),
    );
  }

  void _imageCard10() {
    final ran = new Random();
    for (var i = 1; i < 10; i++) {
      int imageNum = ran.nextInt(200);
      _listItemsNum.add(imageNum);
    }
  }

  Future _fechaData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, _responseHttp);
  }

  Widget _createCard(int idImage) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            FadeInImage(
              image: NetworkImage(
                  "https://picsum.photos/id/${_listItemsNum[idImage]}/450/300"),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            _createRowElements(),
          ],
        ),
      ),
    );
  }

  Widget _createRowElements() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.wb_sunny_sharp, color: Colors.white, size: 25.0),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Description Image about \n init text',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2017/08/28/16/29/smile-2690309_960_720.jpg'),
            ),
          )
        ],
      ),
    );
  }

  void _responseHttp() {
    _imageCard10();
    _isLoading = false;
  }

  Future _indicator() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listItemsNum.clear();
      _imageCard10();
    });
    setState(() {});
    return Future.delayed(duration);
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Center(child: CircularProgressIndicator())],
      );
    } else {
      return Container();
    }
  }
}
