// ignore: file_names

// ignore_for_file: depend_on_referenced_packages

import 'package:entretiens_defarsci/pages/liste_entretiens.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Entretiens {
  int id;
  final String prenom;
  final String nom;
  final String email;
  final String telephone;
  final String adresse;
  final String domaine;
  final String pourquoiCeChoix;
  final String participants;
  final String presentationDuCandidat;
  final String connaissezVousDefarsci;
  final String commentVoyezVousDefarsci;
  final String quEntendezDeDefarsci;
  final String atouts;
  final String faiblesses;
  final String maladieOuAllergie;
  final String objectifsDans2ans;
  final String moisDeFormation;
  final String demarrage;
  final String disponibiliteDuCandidat;
  final String modalitePaiement;
  final String numberEnCasDurgence;
  final String informationsSupplementaires;
  final String dateCreation;

  Entretiens(
      this.id,
      this.nom,
      this.prenom,
      this.email,
      this.telephone,
      this.adresse,
      this.domaine,
      this.pourquoiCeChoix,
      this.participants,
      this.presentationDuCandidat,
      this.commentVoyezVousDefarsci,
      this.connaissezVousDefarsci,
      this.quEntendezDeDefarsci,
      this.atouts,
      this.faiblesses,
      this.maladieOuAllergie,
      this.objectifsDans2ans,
      this.moisDeFormation,
      this.demarrage,
      this.disponibiliteDuCandidat,
      this.modalitePaiement,
      this.numberEnCasDurgence,
      this.informationsSupplementaires,
      this.dateCreation);
}

class DetailsEntretiens extends StatefulWidget {
  const DetailsEntretiens({super.key});

  @override
  State<DetailsEntretiens> createState() => _DetailsEntretiensState();
}

class _DetailsEntretiensState extends State<DetailsEntretiens> {
  late List<dynamic> entretiens = [];
  Map<String, dynamic>? responseData;
  bool isLoading = true;

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

    int ids = arguments["id"];
    entretiens = arguments['entretien'];
    fetchData(ids);
    // print(entretiens[ids]);
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
              Navigator.pop(
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
        body: responseData == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Prenom: ${responseData!["prenom"]}',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    textAlign: TextAlign.left,
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
                                                  ' Nom: ${responseData!["nom"]}',
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Telephone: ${responseData!["telephone"]}',
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
                                                  ' Domaine: ${responseData!["domaine"]}',
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 233, 101, 29)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' Addresse: ${responseData!["addresse"]}',
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            ' Email: ${responseData!["email"]}',
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 233, 101, 29)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Card(
                                      child: Column(
                                        children: [
                                          const Text("Detail techniques",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25)),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Presentation du candidat: ${responseData!["presentation_du_Candidat"]}',
                                                    softWrap: true,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    ' Connaissez vous defarsci: ${responseData!["connaissez_vous_defarsci"]}',
                                                    softWrap: true,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Comment voyez vous defarsci: ${responseData!["comment_voyez_vous_defarsci"]}',
                                                    softWrap: true,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    ' Qu\'entendez de defarsci: ${responseData!["qu_entendez_de_defarsci"]}',
                                                    softWrap: true,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Pourquoi ce choix: ${responseData!["pourquoi_ce_choix"]}',
                                                    softWrap: true,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Atouts: ${responseData!["atouts"]}',
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    ' Faiblesses: ${responseData!["faiblesses"]} ',
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
                                                      'Maladie ou Allergie: ${responseData!["maladie_ou_allergie"]} ',
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Disponibilite du candidat: ${responseData!["disponibilite_du_candidat"]} ',
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                ' Objectifs dans 2ans: ${responseData!["objectifs_dans_2ans"]} ',
                                                softWrap: true,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Disponibilite du candidat: ${responseData!["disponibilite_du_candidat"]} ',
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Nombre cas d\'urgence: ${responseData!["number_en_cas_d_urgence"]} ',
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' Informations supplementaires: ${responseData!["informations_supplementaires"]} ',
                                                  softWrap: true,
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
                                          const Text("Details de la formation",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontFamily: "RobotoSlab",
                                              )),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Mois de formation: ${responseData!["mois_de_formation"]} ',
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
                                                  ' Demarrage: ${responseData!["demarrage"]} ',
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
                                                  ' Modalite de paiment: ${responseData!["modalite_paiement"]} ',
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    ' Participants: ${responseData!["participants"]} ',
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
                      )
                    ],
                  );
                }),
      ),
    );
  }

  Future<void> fetchData(int id) async {
    final response = await http
        .get(Uri.parse('//entretiens.defarsci.fr/api/entretiens/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = convert.jsonDecode(response.body);

      setState(() {
        responseData = data['entretien'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
}
