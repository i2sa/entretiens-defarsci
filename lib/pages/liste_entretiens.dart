// ignore_for_file: depend_on_referenced_packages

import 'package:entretiens_defarsci/pages/details_entretiens.dart';
import 'package:entretiens_defarsci/pages/list_recherche.dart';
import 'package:flutter/material.dart';
import "model.dart";
import "package:intl/intl.dart";

class ListEntretiens extends StatelessWidget {
  const ListEntretiens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste entretien',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final _search = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      '/details-entretiens': (context) => const DetailsEntretiens(),
      '/details-recherche': (context) => const ListRecherche(),
    };
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.purple, fontFamily: 'SpaceGrotesk'),
      debugShowCheckedModeBanner: false,
      routes: routes,
      title: 'Liste entretien',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 132, 173, 219),
          title: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Liste entretien',
                  style: TextStyle(
                      fontFamily: "RobotoSlab",
                      wordSpacing: 10,
                      color: Color.fromARGB(255, 247, 247, 248),
                      fontWeight: FontWeight.w700,
                      fontSize: 35),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListRecherche()),
                    );
                  },
                  child: const Text("Recherche")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Nombre de candidat des entretiens ',
                    style: TextStyle(
                        fontFamily: "RobotoSlab",
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  child: Text(
                    style: const TextStyle(color: Colors.white),
                    listEntretiens.length.toString(),
                  ),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: listEntretiens.length,
              itemBuilder: (context, index) {
                int id = index;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/details-entretiens',
                          arguments: {'id': index, 'age': 25},
                        ),
                        title: Row(
                          children: [
                            Text(
                              'Prenom:  ${listEntretiens[id].prenom}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                ' Nom: ${listEntretiens[id].nom}',
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' Email: ${listEntretiens[id].email}',
                                  style: const TextStyle(),
                                ),
                              ],
                            ),
                            Text(
                              " Date : ${DateFormat('dd/MM/yyyy').format(listEntretiens[id].dateCreation)}",
                              style: const TextStyle(),
                            ),
                            Text(
                              textAlign: TextAlign.right,
                              ' Domaine: ${listEntretiens[id].domaine}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 233, 101, 29),
                              ),
                            )
                          ],
                        ),
                      )),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
