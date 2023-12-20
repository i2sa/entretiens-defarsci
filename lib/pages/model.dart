class Entretiens {
  final String prenom;
  final String nom;
  final String email;

  final int telephone;
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
  final bool maladieOuAllergie;
  final String objectifsDans2ans;
  final String moisDeFormation;
  final String demarrage;
  final String disponibiliteDuCandidat;
  final String modalitePaiement;
  final int numberEnCasDurgence;
  final String informationsSupplementaires;
  DateTime dateCreation;

  Entretiens(
      this.prenom,
      this.nom,
      this.email,
      this.telephone,
      this.adresse,
      this.domaine,
      this.pourquoiCeChoix,
      this.participants,
      this.presentationDuCandidat,
      this.connaissezVousDefarsci,
      this.commentVoyezVousDefarsci,
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

final List<Entretiens> listEntretiens = [
  Entretiens(
      " abou",
      "Sarr",
      "abousarr@gmail.com",
      772100000,
      "Sacre coeur3",
      "CM",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2011, 12, 02)),
  Entretiens(
      " awa",
      "ndour",
      "awandour@gmail.com",
      772100000,
      "Sacre coeur3",
      "dev",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2017, 08, 17)),
  Entretiens(
      " moussa",
      "ndiaye",
      "awandour@gmail.com",
      772100000,
      "Sacre coeur3",
      "dev",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2020, 11, 12)),
  Entretiens(
      " ousmane",
      "sow",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "marketing",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2021, 11, 22)),
  Entretiens(
      " penda",
      "sy",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "cm",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2020, 12, 15)),
  Entretiens(
      " kadia",
      "fall",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "cm",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2021, 07, 04)),
  Entretiens(
      " rama",
      "diop",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "dev",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2019, 06, 19)),
  Entretiens(
      " demba",
      "ka",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "dev",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2022, 11, 28)),
  Entretiens(
      " amadou",
      "gueye",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "marketing",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2023, 11, 12)),
  Entretiens(
      " lamine",
      "mane",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "cm",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2023, 08, 22)),
  Entretiens(
      " mansour",
      "ndoye",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "cm",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2023, 02, 13)),
  Entretiens(
      " absa",
      "deme",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "marketing",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2022, 10, 24)),
  Entretiens(
      " aissata",
      "ba",
      "ousmanesow@gmail.com",
      772100000,
      "Sacre coeur3",
      "dev",
      "Passion",
      "Ndiankou Ndoye",
      "Titulaire de L3",
      "Oui",
      "Idee top",
      "Competences",
      "motivé",
      "stress",
      true,
      "avoir un bon job",
      "3",
      "Lundi",
      "3mois",
      "10000",
      773100000,
      "bla bla bla",
      DateTime(2023, 12, 12)),
];
