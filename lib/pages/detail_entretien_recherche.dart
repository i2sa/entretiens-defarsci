import 'package:flutter/material.dart';

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
      title: "details entretien ",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 233, 101, 29),
          leading: ElevatedButton(
              style: const ButtonStyle(),
              onPressed: () {
                () => Navigator.pop(
                      context,
                    );
              },
              child: const Icon(
                size: 30,
                Icons.arrow_back,
              )),
          title: const Text(
            "details entretien",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              title: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        const Text("details candidat",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'prenom: ${entretien[id].prenom}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  ' nom: ${entretien[id].nom}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'telephone: ${entretien[id].telephone}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  ' domaine: ${entretien[id].domaine}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 233, 101, 29)),
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
                                ' Addresse: ${entretien[id].adresse}',
                                style: const TextStyle(color: Colors.black),
                              ),
                              Text(
                                ' email: ${entretien[id].email}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 233, 101, 29)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const Text("details techniques",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'presentation_du_candidat: ${entretien[id].presentationDuCandidat}',
                                  style: const TextStyle(color: Colors.black),
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
                            "details des attentes  du candidat venant de defarsci",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  ' connaissez_vous_defarsci: ${entretien[id].connaissezVousDefarsci}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'comment_voyez_vous_defarsci: ${entretien[id].commentVoyezVousDefarsci}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  ' qu_entendez_de_defarsci: ${entretien[id].quEntendezDeDefarsci}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const Text("details personnel du candidat ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'pourquoi_ce_choix: ${entretien[id].pourquoiCeChoix}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'atouts: ${entretien[id].atouts}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  ' faiblesses: ${entretien[id].faiblesses} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'maladie_ou_allergie: ${entretien[id].maladieOuAllergie} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'disponibilite_du_candidat: ${entretien[id].disponibiliteDuCandidat} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  ' objectifs_dans_2ans: ${entretien[id].objectifsDans2ans} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'disponibilite_du_candidat: ${entretien[id].disponibiliteDuCandidat} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'number_en_cas_d_urgence: ${entretien[id].numberEnCasDurgence} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  ' informations_supplementaires: ${entretien[id].informationsSupplementaires} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const Text("details de la formation",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'mois_de_formation: ${entretien[id].moisDeFormation} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  ' demarrage: ${entretien[id].demarrage} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  ' modalite de paiment: ${entretien[id].modalitePaiement} ',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const Text("details du personne charge de l'entretien",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  ' participants: ${entretien[id].participants} ',
                                  style: const TextStyle(color: Colors.black),
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
