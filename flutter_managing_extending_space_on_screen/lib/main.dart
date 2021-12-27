// ignore_for_file: deprecated_member_use, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

    return Container(
      width: sizeX,
      height: sizeY,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: createSquares(50),
        crossAxisCount: 3,
        padding: EdgeInsets.all(5),
      ),
      // child: ListView(
      //   children: showContacts(),
      // ),
      // child: ListView.separated(
      //   itemCount: 25,
      //   scrollDirection: Axis.vertical,
      //   itemBuilder: (context, index) => createSquare(index),
      //   separatorBuilder: (context, index) => createSeperator(index),
      //   //fit: StackFit.expand,
      //   // verticalDirection: VerticalDirection.up,
      //   // textDirection: TextDirection.rtl,
      // ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];

    List<Widget> squares = [];
    squares.add(Container(color: Colors.black));
    while (i < numSquares) {
      Container square = Container(
        color: colors[i % 5],
        width: 100,
        height: 100,
        child: Text(i.toString()),
      );
      i++;
      squares.add(square);
    }
    return squares;
  }

  Widget createSquare(int position) {
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];

    Container square = Container(
      color: colors[position % 5],
      width: 100,
      height: 100,
      child: Text(position.toString()),
    );

    return square;
  }

  List<Widget> showPizzaLayout(double sizeX, double sizeY) {
    List<Widget> layoutChildren = <Widget>[];
    Container background = Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('pizza.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
    layoutChildren.add(background);

    Positioned pizzaCard = Positioned(
        top: sizeY / 20,
        left: sizeX / 20,
        child: Card(
            elevation: 12,
            color: Colors.white70,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              Text("Pizza Margherita",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[800])),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "This delicious pizza is made of love",
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                ),
              )
            ])));
    layoutChildren.add(pizzaCard);

    Positioned buttonOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX / 10,
      child: ElevatedButton(
        child: Text(
          "Order Now",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            primary: Colors.orange[800]),
      ),
    );
    layoutChildren.add(buttonOrder);
    return layoutChildren;
  }

  Widget createSeperator(int position) {
    Widget seperator = Container(
      height: 15,
      color: Colors.black,
    );
    return seperator;
  }

  List<Contact> buildContact() {
    List<Contact> contacts = [];
    contacts
        .add(Contact("Enif", "The Istanbul", Icons.sentiment_very_satisfied));
    contacts.add(Contact("Ozlem", "The Turkey", Icons.sentiment_satisfied));
    contacts.add(Contact("Ali", "The Eyy", Icons.sentiment_very_dissatisfied));
    return contacts;
  }

  List<ListTile> showContacts() {
    List<Contact> contacts = buildContact();
    for (int i = 0; i < 20; i++) {
      contacts.addAll(buildContact());
    }
    List<ListTile> list = [];
    contacts.forEach((contact) {
      list.add(ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.subtitle),
        leading: CircleAvatar(
            child: Icon(contact.icon), backgroundColor: Colors.amber[600]),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => true,
      ));
    });
    return list;
  }
}

class Contact {
  String name;
  String subtitle;
  IconData icon;
  Contact(this.name, this.subtitle, this.icon);
}
