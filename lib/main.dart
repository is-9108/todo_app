import 'package:flutter/material.dart';

void main() => runApp(ToDo());

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TODOView(),
    );
  }
}

class TODOView extends StatefulWidget {
  @override
  _TODOViewState createState() => _TODOViewState();
}

class _TODOViewState extends State<TODOView> {
  var todoList = ['TODO1','TODO2','TODO3'];

  final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            onTap: (){
              print(todoList[index]);
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text(todoList[index]),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: (){
                          print('calcel');
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        textColor: Colors.red,
                        child: Text('Delete'),
                        onPressed: (){
                          Navigator.pop(context);
                          setState(() {
                            todoList.remove(todoList[index]);
                          });
                        },
                      )
                    ],
                  );
                }
              );
            },
            child: Card(
              child: Padding(
                child: Text(todoList[index]),
                padding: EdgeInsets.all(20.0),
              ),
            ),
          );
        },
        itemCount: todoList.length,
      ),
        floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
              onPressed: (){
                //アラート
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('test'),
                      content: TextField(
                        controller: inputController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.work),
                          hintText: 'TODOを入力して下さい'
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Cancel'),
                          onPressed: (){
                            print('Cancel pressed');
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text('OK'),
                          onPressed: (){
                            print('OK pressed');
                            setState(() {
                              todoList.add(inputController.text);
                            });
                            inputController.clear();
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  }
                );
              },
            ),
          ],
    ),
    );
  }
}


