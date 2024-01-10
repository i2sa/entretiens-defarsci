// ignore_for_file: depend_on_referenced_packages

import 'package:entretiens_defarsci/pages/details_entretiens.dart';
import 'package:entretiens_defarsci/pages/list_recherche.dart'
    hide Entretiengeneral;
import 'package:entretiens_defarsci/pages/model2.dart';

import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  late int lengthentretiens = 0;
  bool isLoading = true;
  Future<List<Entretiengeneral>> fetchData() async {
    final response =
        await http.get(Uri.parse('//entretiens.defarsci.fr/api/entretiens'));

    if (response.statusCode == 200) {
      List<dynamic> entretiensJson =
          convert.jsonDecode(response.body)['entretiens'];

      List<Entretiengeneral> listEntretiensgeneral = entretiensJson
          .map((entretienJson) => Entretiengeneral(
                entretienJson["id"],
                entretienJson["nom"],
                entretienJson["prenom"],
                entretienJson["email"],
                entretienJson["telephone"],
                entretienJson["addresse"],
                entretienJson["domaine"],
                entretienJson["pourquoi_ce_choix"],
                entretienJson["participants"],
                entretienJson["presentation_du_Candidat"],
                entretienJson["connaissez_vous_defarsci"],
                entretienJson["comment_voyez_vous_defarsci"],
                entretienJson["qu_entendez_de_defarsci"],
                entretienJson["atouts"],
                entretienJson["faiblesses"],
                entretienJson["maladie_ou_allergie"],
                entretienJson["objectifs_dans_2ans"],
                entretienJson["mois_de_formation"],
                entretienJson["demarrage"],
                entretienJson["disponibilite_du_candidat"],
                entretienJson["modalite_paiement"],
                entretienJson["number_en_cas_d_urgence"],
                entretienJson["informations_supplementaires"],
                entretienJson["created_at"],
              ))
          .toList();

      return listEntretiensgeneral;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      '/details-entretiens/': (context) => const DetailsEntretiens(),
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
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error.toString()}');
            } else {
              List<Entretiengeneral> listEntretiensgeneral =
                  snapshot.data as List<Entretiengeneral>;

              return Column(
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
                            listEntretiensgeneral.length.toString()),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listEntretiensgeneral.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              color: Colors.white,
                              margin: const EdgeInsets.all(5),
                              child: ListTile(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  '/details-entretiens/',
                                  arguments: {
                                    'id': listEntretiensgeneral[index].id,
                                    'entretien': listEntretiensgeneral
                                  },
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      'Prenom:  ${listEntretiensgeneral[index].prenom}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        ' Nom: ${listEntretiensgeneral[index].nom}',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ' Email: ${listEntretiensgeneral[index].email}',
                                          style: const TextStyle(),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      " Date : ${DateFormat('dd/MM/yyyy').format(DateTime.parse(listEntretiensgeneral[index].dateCreation))}",
                                      style: const TextStyle(),
                                    ),
                                    Text(
                                      textAlign: TextAlign.right,
                                      ' Domaine: ${listEntretiensgeneral[index].domaine}',
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 233, 101, 29),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
