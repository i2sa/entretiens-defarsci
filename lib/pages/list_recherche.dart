// ignore_for_file: depend_on_referenced_packages

import 'package:entretiens_defarsci/pages/detail_entretien_recherche.dart';
import 'package:entretiens_defarsci/pages/details_entretiens.dart';
import 'package:flutter/material.dart';
import "model.dart";
import "package:intl/intl.dart";

class ListRecherche extends StatelessWidget {
  const ListRecherche({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ItemList(
          items: listEntretiens,
          itemListpickerRangeDateSearch: listEntretiens,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemList extends StatefulWidget {
  List<Entretiens> items;
  final List<Entretiens> itemListpickerRangeDateSearch;
  ItemList(
      {super.key,
      required this.items,
      required this.itemListpickerRangeDateSearch});
  @override
  // ignore: library_private_types_in_public_api
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedValue = 'dev';
  int nbreEntretien = 0;
  late List<Entretiens> filteredItems;
  bool affiche = true;
  TextEditingController searchController = TextEditingController();
  DateTimeRange? selectedDateRange;
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
      filteredItems = widget.itemListpickerRangeDateSearch
          .where((item) =>
              item.dateCreation.isAfter(selectedDateRange!.start) &&
              item.dateCreation.isBefore(selectedDateRange!.end))
          .toList();
      affiche = !true;
    } else {
      filteredItems = List.from(widget.itemListpickerRangeDateSearch);
    }
  }

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  void filterList() {
    String filterText = searchController.text.toLowerCase();
    String filterTextOption = selectedValue;
    setState(() {
      filteredItems = widget.items
          .where((item) =>
              item.prenom.toLowerCase().contains(filterText) ||
              item.nom.toLowerCase().contains(filterText) &&
                  item.domaine.toLowerCase() == filterTextOption)
          .toList();
      affiche = !true;
    });
  }

  void filterListOption() {
    String filterTextOption = selectedValue;
    nbreEntretien;
    setState(() {
      filteredItems = widget.items
          .where((item) =>
              item.domaine.toLowerCase().contains(filterTextOption) &&
              item.prenom.contains(searchController.text))
          .toList();
      affiche = !true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      '/details-entretien': (context) => const DetailsEntretiens(),
      '/details-recherche': (context) => const DetailsEntretienRecherche(),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      title: 'Recherche dans la liste d\'entretien',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 132, 173, 219),
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
            children: <Widget>[
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      filterList();
                    },
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 233, 101, 29),
                        width: 2,
                      )),
                      focusColor: Color.fromARGB(255, 233, 101, 29),
                      labelText: 'Rechercher',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    child: Form(
                        key: _formKey,
                        child: Column(children: [
                          DropdownButtonFormField<String>(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10),
                            borderRadius: BorderRadius.circular(12),
                            value: selectedValue,
                            items: [
                              'cm',
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
                          ElevatedButton(
                            onPressed: () => _selectDateRange(context),
                            child: const Text('Sélectionner la Plage de Dates'),
                          ),
                        ])),
                  ),
                ],
              ),
              if (selectedDateRange != null)
                Text(
                  'Plage de Dates Sélectionnée:\n${DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)}',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 16),
              if (affiche)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('nombre de candidats entretien ',
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
                        filteredItems.length.toString(),
                      ),
                    )
                  ],
                ),
              if (!affiche)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('nombre de candidats entretien ',
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
                        filteredItems.length.toString(),
                      ),
                    )
                  ],
                ),
              if (affiche)
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      // print(filteredItems[index]);

                      nbreEntretien = filteredItems.length;
                      int id = index;
                      return Column(
                        children: [
                          Card(
                              color: Colors.white,
                              margin: const EdgeInsets.all(5),
                              child: ListTile(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  '/details-entretien',
                                  arguments: {'id': index, 'age': 25},
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      'prenom:  ${listEntretiens[id].prenom}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        ' nom: ${listEntretiens[id].nom}',
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
                                          ' email: ${listEntretiens[id].email}',
                                          style: const TextStyle(),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      " date : ${DateFormat('dd/MM/yyyy').format(listEntretiens[id].dateCreation)}",
                                      style: const TextStyle(),
                                    ),
                                    Text(
                                      textAlign: TextAlign.right,
                                      ' domaine: ${listEntretiens[id].domaine}',
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 233, 101, 29),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      );
                    },
                  ),
                ),
              if (!affiche)
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      nbreEntretien = filteredItems.length;
                      int id = index;
                      return Column(
                        children: [
                          Card(
                              color: Colors.white,
                              margin: const EdgeInsets.all(5),
                              child: ListTile(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  '/details-recherche',
                                  arguments: {
                                    'id': id,
                                    'entretien': filteredItems
                                  },
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      'prenom:  ${filteredItems[index].prenom}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        ' nom: ${filteredItems[index].nom}',
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
                                      children: [
                                        Text(
                                          ' email: ${filteredItems[index].email}',
                                          style: const TextStyle(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      );
                    },
                  ),
                )
            ],
          )),
    );
  }
}
