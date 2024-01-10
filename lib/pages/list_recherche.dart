// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:entretiens_defarsci/pages/details_entretiens.dart'
    hide Entretiens;
import 'package:entretiens_defarsci/pages/liste_entretiens.dart';

import 'package:flutter/material.dart';

import "package:intl/intl.dart";
import 'package:http/http.dart' as http;

import 'dart:convert';

class Entretiengeneral {
  int id;
  String prenom;
  String nom;
  String email;
  String telephone;
  String adresse;
  String domaine;
  String pourquoiCeChoix;
  String participants;
  String presentationDuCandidat;
  String connaissezVousDefarsci;
  String commentVoyezVousDefarsci;
  String quEntendezDeDefarsci;
  String atouts;
  String faiblesses;
  String maladieOuAllergie;
  String objectifsDans2ans;
  String moisDeFormation;
  String demarrage;
  String disponibiliteDuCandidat;
  String modalitePaiement;
  String numberEnCasDurgence;
  String informationsSupplementaires;
  DateTime dateCreation;

  // var id;

  Entretiengeneral(
      {required this.id,
      required this.nom,
      required this.prenom,
      required this.email,
      required this.telephone,
      required this.adresse,
      required this.domaine,
      required this.pourquoiCeChoix,
      required this.participants,
      required this.presentationDuCandidat,
      required this.commentVoyezVousDefarsci,
      required this.connaissezVousDefarsci,
      required this.quEntendezDeDefarsci,
      required this.atouts,
      required this.faiblesses,
      required this.maladieOuAllergie,
      required this.objectifsDans2ans,
      required this.moisDeFormation,
      required this.demarrage,
      required this.disponibiliteDuCandidat,
      required this.modalitePaiement,
      required this.numberEnCasDurgence,
      required this.informationsSupplementaires,
      required this.dateCreation});
  factory Entretiengeneral.fromJson(Map<String, dynamic> json) {
    return Entretiengeneral(
      id: json["id"],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      telephone: json['telephone'],
      adresse: json['addresse'],
      domaine: json['domaine'],
      pourquoiCeChoix: json['pourquoi_ce_choix'],
      participants: json['participants'],
      presentationDuCandidat: json['presentation_du_Candidat'],
      commentVoyezVousDefarsci: json['comment_voyez_vous_defarsci'],
      connaissezVousDefarsci: json['connaissez_vous_defarsci'],
      quEntendezDeDefarsci: json['qu_entendez_de_defarsci'],
      atouts: json['atouts'],
      faiblesses: json['faiblesses'],
      maladieOuAllergie: json['maladie_ou_allergie'],
      objectifsDans2ans: json['objectifs_dans_2ans'],
      moisDeFormation: json['mois_de_formation'],
      demarrage: json['demarrage'],
      disponibiliteDuCandidat: json['disponibilite_du_candidat'],
      modalitePaiement: json['modalite_paiement'],
      numberEnCasDurgence: json['number_en_cas_d_urgence'],
      informationsSupplementaires: json['informations_supplementaires'],
      dateCreation: DateTime.parse(json['created_at']),
    );
  }
}

Future<List<Entretiengeneral>> fetchEntretiensFromApi() async {
  const apiUrl = 'https://entretiens.defarsci.fr/api/entretiens';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<dynamic> entretiensJson = json.decode(response.body)["entretiens"];
    List<Entretiengeneral> entretiens = entretiensJson
        .map((entretienJson) => Entretiengeneral.fromJson(entretienJson))
        .toList();

    return entretiens;
  } else {
    throw Exception('Erreur lors de la récupération des entretiens');
  }
}

class ListRecherche extends StatelessWidget {
  const ListRecherche({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SearchScreen(),
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Entretiengeneral> entretiens = [];
  List<Entretiengeneral> filteredEntretiens = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedValue = 'dev';
  int nbreEntretien = 0;
  final myController = TextEditingController();
  late List<dynamic> filteredItems = [];
  bool affiche = true;
  TextEditingController searchController = TextEditingController();
  DateTimeRange? selectedDateRange;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadEntretiens();
  }

  Future<void> _loadEntretiens() async {
    List<Entretiengeneral> fetchedEntretiens = await fetchEntretiensFromApi();
    setState(() {
      entretiens = fetchedEntretiens;
      filteredEntretiens = entretiens; // Afficher tous les entretiens au début
      affiche = !true;
    });
  }

  void _filterEntretiens(String searchTerm) {
    String filterTextOption = selectedValue;
    setState(() {
      filteredEntretiens = entretiens.where((entretien) {
        return entretien.prenom
                .toLowerCase()
                .contains(searchTerm.toLowerCase()) ||
            entretien.nom.toLowerCase().contains(searchTerm.toLowerCase()) &&
                entretien.domaine.toLowerCase() == filterTextOption;
      }).toList();

      affiche = !true;
    });
  }

  void filterListOption() {
    String filterTextOption = selectedValue;
    nbreEntretien;
    setState(() {
      filteredEntretiens = entretiens
          .where((item) =>
              item.domaine.toLowerCase().contains(filterTextOption) &&
              item.prenom.contains(searchController.text))
          .toList();
      affiche = !true;
    });
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      initialEntryMode: DatePickerEntryMode.input,
      initialDateRange: selectedDateRange,
      context: context,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2030, 12, 31),
    );
    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
        _applyDateFilter();
      });
    }
  }

  void _applyDateFilter() {
    if (selectedDateRange != null) {
      filteredEntretiens = entretiens
          .where((item) =>
              item.dateCreation.isAfter(selectedDateRange!.start) &&
              item.dateCreation.isBefore(selectedDateRange!.end))
          .toList();
      affiche = !true;
    } else {
      filteredItems = List.from(entretiens);
    }
  }

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      '/details-entretiens/': (context) => const DetailsEntretiens(),
      // '/details-recherche': (context) => DetailsEntretienRecherche(),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 132, 173, 219),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListEntretiens()),
              );
            },
          ),
          title: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Recherche dans la liste d\'entretien',
                  style: TextStyle(
                      wordSpacing: 10,
                      color: Color.fromARGB(255, 247, 247, 248),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 130,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: myController,
                      onChanged: _filterEntretiens,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 233, 101, 29),
                          width: 2,
                        )),
                        focusColor: const Color.fromARGB(255, 233, 101, 29),
                        labelText: 'Rechercher',
                        prefixIcon: GestureDetector(
                          child: const Icon(
                            Icons.clear,
                          ),
                          onTap: () {
                            setState(() {
                              myController.clear();
                              fetchEntretiensFromApi();
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        DropdownButtonFormField<String>(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(16),
                          borderRadius: BorderRadius.circular(12),
                          value: selectedValue,
                          items: [
                            'bureau',
                            'dev',
                            'marketing',
                          ]
                              .map((value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                              filterListOption();
                            });
                          },
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Sélectionnez une option',
                          ),
                        ),
                      ])),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => _selectDateRange(context),
              child: const Text('Filtrer par Date'),
            ),
            if (selectedDateRange != null)
              Text(
                'Plage de Dates Sélectionnée:\n${DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 16),
            affiche
                ? const Center(child: CircularProgressIndicator())
                : Row(
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
                          filteredEntretiens.length.toString(),
                        ),
                      )
                    ],
                  ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredEntretiens.length,
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
                              'id': filteredEntretiens[index].id,
                              'entretien': filteredEntretiens
                            },
                          ),
                          title: Row(
                            children: [
                              Text(
                                'Prenom:  ${filteredEntretiens[index].prenom}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  ' Nom: ${filteredEntretiens[index].nom}',
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
                                    ' Email: ${filteredEntretiens[index].email}',
                                    style: const TextStyle(),
                                  ),
                                ],
                              ),
                              Text(
                                " Date : ${DateFormat('dd/MM/yyyy').format(filteredEntretiens[index].dateCreation)}",
                                style: const TextStyle(),
                              ),
                              Text(
                                textAlign: TextAlign.right,
                                ' Domaine: ${filteredEntretiens[index].domaine}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 233, 101, 29),
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
        ),
      ),
    );
  }
}
