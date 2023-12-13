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
          title: Text('liste entretien'),
        ),
        body: ListView.builder(
          itemCount: listEntretiens.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () => Navigator.pushNamed(context, '/details-entretiens'),
              title: Row(
                children: [
                  Text('prenom: ${listEntretiens[index].prenom}'),
                  Text(' nom: ${listEntretiens[index].nom}'),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(' email: ${listEntretiens[index].email}'),
                  Text(' domaine: ${listEntretiens[index].domaine}')
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
