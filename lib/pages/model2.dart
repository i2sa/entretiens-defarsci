class Entretiengeneral {
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

 

  Entretiengeneral(
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

List<Entretiengeneral> listEntretiensgeneral = [];
