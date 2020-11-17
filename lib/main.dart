import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}
class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169,TODO'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            _nameLabel(),
            _nameInputField(),
            Container(
              height: 24,
            ),
            Container(
              height: 24,
            ),
            _buttonRow(),
          ],
        ),
      ),
    );
  }

  

  Widget _nameLabel() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        top: 24,
      ),
      child: Text(
        'Lägg till syssla',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _nameInputField() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        top: 24,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Syssla',
        ),
      ),
    );
  }


  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlineButton(
          onPressed: () {},
          child: Text('Cancel'),
          highlightColor: Colors.red,
        ),
        Container(
          width: 50,
        ),
        RaisedButton(
          onPressed: () {},
          child: Text('Lägg till'),
          color: Colors.blue,
          textColor: Colors.white,
          highlightColor: Colors.green,
        ),
      ],
    );
  }
}

class SecondView extends StatelessWidget {
  get onPressed => null;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tig169 TODO'),
      actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {
            
            },
      
      ),
     ]
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton (
        child: Icon(Icons.add), 
        onPressed: () {}, 
      ),
    );
  }

  Widget _list() {
    return ListView(
      children: [
        _item(),
        _item(),
        _item(),
        _item(),
        _item(),
        _item(),
        _item(),

      ],
    );
  }

  Widget _item() {
    return CheckboxListTile(
      title: Text('Viktiga saker att göra', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black)),
      secondary:Icon(Icons.cancel),
      controlAffinity:ListTileControlAffinity.leading,
      value: true,
      onChanged: (null));
    
    }
  }