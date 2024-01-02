import 'package:flutter/material.dart';
import 'list_recherche.dart';

class DetailsEntretienRecherche extends StatelessWidget {
  const DetailsEntretienRecherche({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    int id = arguments["id"];
    List entretien = arguments["entretien"];

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
                MaterialPageRoute(builder: (context) => const ListRecherche()),
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
            return Column(
              children: [
                Card(
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
                                          'Prenom: ${entretien[id].prenom}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          ' Nom: ${entretien[id].nom}',
                                          style: const TextStyle(
                                              color: Colors.black),
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
                                          'Telephone: ${entretien[id].telephone}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ' Domaine: ${entretien[id].domaine}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' Addresse: ${entretien[id].adresse}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  ' Email: ${entretien[id].email}',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Presentation du candidat: ${entretien[id].presentationDuCandidat}',
                                          style: const TextStyle(
                                              color: Colors.black),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' Connaissez vous defarsci: ${entretien[id].connaissezVousDefarsci}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Comment voyez vous defarsci: ${entretien[id].commentVoyezVousDefarsci}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' Qu\'entendez de defarsci: ${entretien[id].quEntendezDeDefarsci}',
                                          style: const TextStyle(
                                              color: Colors.black),
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
                                          'Pourquoi ce choix: ${entretien[id].pourquoiCeChoix}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Atouts: ${entretien[id].atouts}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' Faiblesses: ${entretien[id].faiblesses} ',
                                          style: const TextStyle(
                                              color: Colors.black),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Maladie ou Allergie: ${entretien[id].maladieOuAllergie} ',
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
                                        'Disponibilite du candidat: ${entretien[id].disponibiliteDuCandidat} ',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' Objectifs dans 2ans: ${entretien[id].objectifsDans2ans} ',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Disponibilite du candidat: ${entretien[id].disponibiliteDuCandidat} ',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nombre cas d\'urgence: ${entretien[id].numberEnCasDurgence} ',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        ' Informations supplementaires: ${entretien[id].informationsSupplementaires} ',
                                        style: const TextStyle(
                                            color: Colors.black),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mois de formation: ${entretien[id].moisDeFormation} ',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ' Demarrage: ${entretien[id].demarrage} ',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' Modalite de paiment: ${entretien[id].modalitePaiement} ',
                                        style: const TextStyle(
                                            color: Colors.black),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' Participants: ${entretien[id].participants} ',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
