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
      title: "Detail entretien ",
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
            "Detail entretien",
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
                            const Text("Detail candidat",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Prenom: ${listEntretiens[id].prenom}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      ' Nom: ${listEntretiens[id].nom}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Telephone: ${listEntretiens[id].telephone}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      ' Domaine: ${listEntretiens[id].domaine}',
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 233, 101, 29)),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                              ' Email: ${listEntretiens[id].email}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 233, 101, 29)),
                            )
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            const Text("Detail techniques",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25)),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Presentation du candidat: ${listEntretiens[id].presentationDuCandidat}',
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
                              " Attentes  du candidat ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: "RobotoSlab",
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' Connaissez vous defarsci: ${listEntretiens[id].connaissezVousDefarsci}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Comment voyez vous defarsci: ${listEntretiens[id].commentVoyezVousDefarsci}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' Qu\'entendez de defarsci: ${listEntretiens[id].quEntendezDeDefarsci}',
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
                            const Text("Info personnel  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: "RobotoSlab",
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pourquoi ce choix: ${listEntretiens[id].pourquoiCeChoix}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      'Atouts: ${listEntretiens[id].atouts}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' Faiblesses: ${listEntretiens[id].faiblesses} ',
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
                                        'Maladie ou Allergie: ${listEntretiens[id].maladieOuAllergie} ',
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
                                    'Disponibilite du candidat: ${listEntretiens[id].disponibiliteDuCandidat} ',
                                    style: const TextStyle(color: Colors.black),
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
                                      ' Objectifs dans 2ans: ${listEntretiens[id].objectifsDans2ans} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Disponibilite du candidat: ${listEntretiens[id].disponibiliteDuCandidat} ',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nombre cas d\'urgence: ${listEntretiens[id].numberEnCasDurgence} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ' Informations supplementaires: ${listEntretiens[id].informationsSupplementaires} ',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            const Text("Details de la formation",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: "RobotoSlab",
                                )),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mois de formation: ${listEntretiens[id].moisDeFormation} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      ' Demarrage: ${listEntretiens[id].demarrage} ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    ' Modalite de paiment: ${listEntretiens[id].modalitePaiement} ',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            const Text("  Charge de l'entretien",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: "RobotoSlab",
                                )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' Participants: ${listEntretiens[id].participants} ',
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
