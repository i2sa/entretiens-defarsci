import 'package:entretiens_defarsci/pages/detail_entretien_recherche.dart';
import 'package:entretiens_defarsci/pages/details_entretiens.dart';
import 'package:flutter/material.dart';
import "model.dart";
import "package:intl/intl.dart";

class ListRecherche extends StatelessWidget {
  const ListRecherche({super.key});

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      '/details-entretien': (context) => const DetailsEntretiens(),
      '/details-recherche': (context) => const DetailsEntretienRecherche(),
    };
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      title: 'Recherche dans la liste d\'entretien',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liste recherche d\'entretien'),
        ),
        body: ItemList(items: listEntretiens),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemList extends StatefulWidget {
  List<Entretiens> items;

  ItemList({super.key, required this.items});

  @override
  // ignore: library_private_types_in_public_api
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedValue = 'dev';
  int nbreEntretien = 0;
  late List<Entretiens> filteredItems;
  late int id;
  bool affiche = true;
  TextEditingController searchController = TextEditingController();
  DateTimeRange? selectedDateRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2017),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
        filteredItems = widget.items
            .where((item) =>
                    DateFormat('dd/MM/yyyy')
                        .format(item.dateCreation)
                        .toString() ==
                    DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)
                //     &&
                // DateFormat('dd/MM/yyyy').format(item.dateCreation) ==
                //     DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)

                )
            .toList();
      });
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
      // affiche = false;
      id = filteredItems.length;
    });
  }

  void filterListOption() {
    String filterText = searchController.text.toLowerCase();
    String filterTextOption = selectedValue;
    nbreEntretien;
    setState(() {
      filteredItems = widget.items
          .where((item) =>
              item.domaine.toLowerCase().contains(filterTextOption) &&
              item.prenom.contains(searchController.text))
          .toList();
      // affiche = false;
      print(DateFormat('dd/MM/yyyy').format(filteredItems[1].dateCreation));
      id = filteredItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
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
        Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
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
                child: Text('Sélectionner la Plage de Dates'),
              ),
              if (selectedDateRange != null)
                Text(
                  'Plage de Dates Sélectionnée:\n${DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 16),
              if (affiche)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('nombre de candidats entretien ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, right: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      height: 30,
                      width: 30,
                      child: Text(
                        style: TextStyle(color: Colors.white),
                        filteredItems.length.toString(),
                      ),
                      alignment: Alignment.center,
                    )
                  ],
                ),
              if (!affiche)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('nombre de candidats entretien ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, right: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      height: 30,
                      width: 30,
                      child: Text(
                        style: TextStyle(color: Colors.white),
                        filteredItems.length.toString(),
                      ),
                      alignment: Alignment.center,
                    )
                  ],
                ),
            ],
          ),
        ),
        if (affiche)
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                print(filteredItems[index].dateCreation);

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
                            arguments: {'id': id, 'age': 25},
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
                          subtitle: Row(
                            children: [
                              Text(
                                ' email: ${filteredItems[index].email}',
                                style: const TextStyle(),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    ' domaine: ${filteredItems[index].domaine}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 233, 101, 29)),
                                  ))
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
                            arguments: {'id': id, 'entretien': filteredItems},
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
                          subtitle: Row(
                            children: [
                              Text(
                                ' email: ${filteredItems[index].email}',
                                style: const TextStyle(),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    ' domaine: ${filteredItems[index].domaine}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 233, 101, 29)),
                                  ))
                            ],
                          ),
                        )),
                  ],
                );
              },
            ),
          )
      ],
    );
  }
}
