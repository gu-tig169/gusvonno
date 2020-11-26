import 'package:flutter/material.dart';
import 'package:gusvonnoapp/model.dart';
import 'package:provider/provider.dart';
import './model.dart';

  class ItemList extends StatefulWidget {
    
    final List<Item>list;

    ItemList(this.list);
     
     @override
  _ItemListState createState() => _ItemListState();
     
  }
  class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
   return ListView.builder(
    itemCount: widget.list.length,
    itemBuilder:(context, index) => _item(widget.list[index]));
  }
  

  
Widget _item(Item item) {
    return ListTile(
      leading: Checkbox(
          value: item.isDone,
          onChanged: (bool value) {
            setState(() {
              item.isDone = value;  }
            ); 
            },
      ),
      title: Text(item.name, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black)),
      
    trailing: IconButton(
            color: Colors.black,
            icon: Icon(Icons.close),
           
            onPressed: () {
              Provider.of<MyState>(context, listen: false)
                  .removeTodo(item);
            },
          ),

    );
    
    }
 }
 
    

  