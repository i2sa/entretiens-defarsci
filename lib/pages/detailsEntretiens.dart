import 'package:entretiens_defarsci/pages/model.dart';
import 'package:flutter/material.dart';

class DetailsEntretiens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    int id = arguments["id"];

    int age = arguments['age'];
    return MaterialApp(
      color: Colors.white,
      title: "details candidat ",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 233, 101, 29),
          leading: ElevatedButton(
              style: ButtonStyle(),
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
            "details candidat",
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
                  Text(
                    'prenom: ${listEntretiens[id].prenom}',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    ' nom: ${listEntretiens[id].nom}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'telephone: ${listEntretiens[id].telephone}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' Addresse: ${listEntretiens[id].Adresse}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'pourquoi_ce_choix: ${listEntretiens[id].pourquoi_ce_choix}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' participants: ${listEntretiens[id].participants}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'presentation_du_candidat: ${listEntretiens[id].presentation_du_candidat}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' connaissez_vous_defarsci: ${listEntretiens[id].connaissez_vous_defarsci}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'comment_voyez_vous_defarsci: ${listEntretiens[id].comment_voyez_vous_defarsci}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' qu_entendez_de_defarsci: ${listEntretiens[id].qu_entendez_de_defarsci}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'atouts: ${listEntretiens[id].atouts}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' faiblesses: ${listEntretiens[id].faiblesses}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'maladie_ou_allergie: ${listEntretiens[id].maladie_ou_allergie}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' objectifs_dans_2ans: ${listEntretiens[id].objectifs_dans_2ans}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'mois_de_formation: ${listEntretiens[id].mois_de_formation}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' demarrage: ${listEntretiens[id].demarrage}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'disponibilite_du_candidat: ${listEntretiens[id].disponibilite_du_candidat}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' demarrage: ${listEntretiens[id].modalite_paiement}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'number_en_cas_d_urgence: ${listEntretiens[id].number_en_cas_d_urgence}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' informations_supplementaires: ${listEntretiens[id].informations_supplementaires}',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
                    ' email: ${listEntretiens[id].email}',
                    style: TextStyle(color: Color.fromARGB(255, 233, 101, 29)),
                  ),
                  Text(
                    ' domaine: ${listEntretiens[id].domaine}',
                    style: TextStyle(color: Color.fromARGB(255, 233, 101, 29)),
                  )
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
