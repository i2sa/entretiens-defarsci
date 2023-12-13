import 'package:entretiens_defarsci/pages/detailsEntretiens.dart';
import 'package:flutter/material.dart';

import "model.dart";

class ListEntretiens extends StatelessWidget {
  const ListEntretiens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'liste entretien',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'liste entretien',
      home: MyList(),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/details-entretiens': (context) => DetailsEntretiens(),
      },
      title: 'liste entretien',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 132, 173, 219),
          title: Text(
            'liste entretien',
            style: TextStyle(
                color: Color.fromARGB(255, 247, 247, 248),
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        body: ListView.builder(
          itemCount: listEntretiens.length,
          itemBuilder: (context, index) {
            int id = index;
            return Card(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                child: ListTile(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/details-entretiens',
                    arguments: {'id': id, 'age': 25},
                  ),
                  title: Row(
                    children: [
                      Text(
                        'prenom: ${listEntretiens[id].prenom}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          ' nom: ${listEntretiens[id].nom}',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        ' email: ${listEntretiens[id].email}',
                        style: TextStyle(),
                      ),
                      Expanded(
                          flex: 4,
                          child: Text(
                            ' domaine: ${listEntretiens[id].domaine}',
                            style: TextStyle(
                                color: Color.fromARGB(255, 233, 101, 29)),
                          ))
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
