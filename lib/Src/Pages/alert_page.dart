import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: ElevatedButton(
            child: Text('Alerta'),
            onPressed: () => _lanzarAlerta(context),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _lanzarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('My Alerta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Este es lad escripción del alerta'),
                SizedBox(height: 30),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok'),
              )
            ],
          );
        });
  }
}
