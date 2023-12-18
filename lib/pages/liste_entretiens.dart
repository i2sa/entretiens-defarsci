import 'package:entretiens_defarsci/pages/details_entretiens.dart';
import 'package:entretiens_defarsci/pages/list_recherche.dart';
import 'package:flutter/material.dart';
import "model.dart";
class ListEntretiens extends StatelessWidget {
  const ListEntretiens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'liste entretien',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'liste entretien',
      home: MyList(),
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
      debugShowCheckedModeBanner: false,
      routes: routes,
      title: 'liste entretien',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 132, 173, 219),
          title: const Row(
            children: [
              Text(
                'liste entretien',
                style: TextStyle(
                    color: Color.fromARGB(255, 247, 247, 248),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              TextField(),
            ],
          ),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListRecherche()),
                  );
                },
                child: const Text("recherche")),
            Expanded(
                child: ListView.builder(
              itemCount: listEntretiens.length,
              itemBuilder: (context, index) {
                int id = index;
                return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/details-entretiens',
                        arguments: {'id': id, 'age': 25},
                      ),
                      title: Row(
                        children: [
                          Text(
                            'prenom:  ${listEntretiens[id].prenom}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              ' nom: ${listEntretiens[id].nom}',
                              textAlign: TextAlign.end,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' email: ${listEntretiens[id].email}',
                            style: const TextStyle(),
                          ),
                          Expanded(
                              flex: 4,
                              child: Text(
                                textAlign: TextAlign.right,
                                ' domaine: ${listEntretiens[id].domaine}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 233, 101, 29),
                                ),
                              ))
                        ],
                      ),
                    ));
              },
            )),
          ],
        ),
      ),
    );
  }
}
