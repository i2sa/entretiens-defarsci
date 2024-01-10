// ignore: file_names
import 'package:entretiens_defarsci/pages/liste_entretiens.dart';

import 'package:flutter/material.dart';




class DetailsEntretienRecherche extends StatefulWidget {
  const DetailsEntretienRecherche({super.key});

  @override
  State<DetailsEntretienRecherche> createState() => _DetailsEntretienRechercheState();
}

class _DetailsEntretienRechercheState extends State<DetailsEntretienRecherche> {
  late List<dynamic> entretiens = [];
  

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    int id = arguments["id"];
    entretiens = arguments['entretien'];

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
                MaterialPageRoute(builder: (context) =>  const ListEntretiens()),
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
                                          'Prenom: ${entretiens[id]["prenom"]}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          ' Nom: ${entretiens[id]["nom"]}',
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
                                          'Telephone: ${entretiens[id]["telephone"]}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ' Domaine: ${entretiens[id]["domaine"]}',
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
                                        ' Addresse: ${entretiens[id]["addresse"]}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  ' Email: ${entretiens[id]["email"]}',
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
                                          'Presentation du candidat: ${entretiens[id]["presentation_du_Candidat"]}',
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
                                          ' Connaissez vous defarsci: ${entretiens[id]["connaissez_vous_defarsci"]}',
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
                                          'Comment voyez vous defarsci: ${entretiens[id]["comment_voyez_vous_defarsci"]}',
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
                                          ' Qu\'entendez de defarsci: ${entretiens[id]["qu_entendez_de_defarsci"]}',
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
                                          'Pourquoi ce choix: ${entretiens[id]["pourquoi_ce_choix"]}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Atouts: ${entretiens[id]["atouts"]}',
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
                                          ' Faiblesses: ${entretiens[id]["faiblesses"]} ',
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
                                            'Maladie ou Allergie: ${entretiens[id]["maladie_ou_allergie"]} ',
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
                                        'Disponibilite du candidat: ${entretiens[id]["disponibilite_du_candidat"]} ',
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
                                          ' Objectifs dans 2ans: ${entretiens[id]["objectifs_dans_2ans"]} ',
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
                                        'Disponibilite du candidat: ${entretiens[id]["disponibilite_du_candidat"]} ',
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
                                          'Nombre cas d\'urgence: ${entretiens[id]["number_en_cas_d_urgence"]} ',
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
                                        ' Informations supplementaires: ${entretiens[id]["informations_supplementaires"]} ',
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
                                          'Mois de formation: ${entretiens[id]["mois_de_formation"]} ',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ' Demarrage: ${entretiens[id]["demarrage"]} ',
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
                                        ' Modalite de paiment: ${entretiens[id]["modalite_paiement"]} ',
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
                                const Text("  Charge de l'entretiens",
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
                                          ' Participants: ${entretiens[id]["participants"]} ',
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
