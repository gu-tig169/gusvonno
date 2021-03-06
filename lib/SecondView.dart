import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class SecondView extends StatelessWidget {
  
final textEditingController = new TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169,TODO'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {},
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
            _buttonRow(context),
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
        controller: textEditingController
      ),
    );
  }


  Widget _buttonRow(BuildContext context) { 
  
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
          onPressed: () {
            Provider.of<MyState>(context, listen: false).addItems(Item(name: textEditingController.text));
            Navigator.popAndPushNamed(context, "/");

          },
          child: Text('Lägg till'),
          color: Colors.blue,
          textColor: Colors.white,
          highlightColor: Colors.green,
        ),
      ],
    );
  }
}