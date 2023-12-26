// ignore: file_names
import 'package:entretiens_defarsci/pages/liste_entretiens.dart';
import 'package:entretiens_defarsci/pages/model.dart';
import 'package:flutter/material.dart';

class DetailsEntretiens extends StatelessWidget {
  const DetailsEntretiens({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    int id = arguments["id"];

    // int age = arguments['age'];
    return MaterialApp(
      color: Colors.white,
      title: "details entretien ",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 233, 101, 29),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListEntretiens()),
              );
            },
          ),
          title: const Text(
            "details entretien",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Card(
                elevation: 8,
                child: ListTile(
                  title: Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            const Text("details candidat",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'prenom: ${listEntretiens[id].prenom}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      ' nom: ${listEntretiens[id].nom}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'telephone: ${listEntretiens[id].telephone}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      ' domaine: ${listEntretiens[id].domaine}',
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 233, 101, 29)),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' Addresse: ${listEntretiens[id].adresse}',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              ' email: ${listEntretiens[id].email}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 233, 101, 29)),
                            )
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            const Text("details techniques",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25)),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'presentation du candidat: ${listEntretiens[id].presentationDuCandidat}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            const Text(
                              " attentes  du candidat ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: "RobotoSlab",
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' connaissez vous defarsci: ${listEntretiens[id].connaissezVousDefarsci}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'comment voyez vous defarsci: ${listEntretiens[id].commentVoyezVousDefarsci}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ' qu\'entendez de defarsci: ${listEntretiens[id].quEntendezDeDefarsci}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            const Text("info personnel  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: "RobotoSlab",
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'pourquoi ce choix: ${listEntretiens[id].pourquoiCeChoix}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      'atouts: ${listEntretiens[id].atouts}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' faiblesses: ${listEntretiens[id].faiblesses} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'maladie ou allergie: ${listEntretiens[id].maladieOuAllergie} ',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'disponibilite du candidat: ${listEntretiens[id].disponibiliteDuCandidat} ',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' objectifs dans 2ans: ${listEntretiens[id].objectifsDans2ans} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Text(
                              'disponibilite du candidat: ${listEntretiens[id].disponibiliteDuCandidat} ',
                              style: const TextStyle(color: Colors.black),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'numbre cas d\'urgence: ${listEntretiens[id].numberEnCasDurgence} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Text(
                              ' informations supplementaires: ${listEntretiens[id].informationsSupplementaires} ',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            const Text("details de la formation",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: "RobotoSlab",
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'mois de formation: ${listEntretiens[id].moisDeFormation} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      ' demarrage: ${listEntretiens[id].demarrage} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Text(
                              ' modalite de paiment: ${listEntretiens[id].modalitePaiement} ',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            const Text("  charge de l'entretien",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: "RobotoSlab",
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' participants: ${listEntretiens[id].participants} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
