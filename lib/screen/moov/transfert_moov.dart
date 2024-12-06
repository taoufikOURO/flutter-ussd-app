import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

/// Widget principal représentant la page de transfert Moov
class Transfertmoov extends StatefulWidget {
  const Transfertmoov({super.key});

  @override
  State<Transfertmoov> createState() => _TransfertmoovState();
}

class _TransfertmoovState extends State<Transfertmoov> {
  /// Liste des contacts récupérés
  List<Contact>? _contacts;

  /// Indique si la permission d'accès aux contacts a été refusée
  bool _permissionDenied = false;

  /// Contact actuellement sélectionné dans la liste
  Contact? _selectedContact;

  /// Booléen pour inclure ou non les frais de transfert
  bool _includeFees = false;

  /// Contrôleurs pour les champs de saisie (montant et frais)
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchContacts(); // Charger les contacts dès l'initialisation
  }

  /// Récupère les contacts de l'utilisateur en demandant les permissions nécessaires
  Future<void> _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() => _contacts = contacts);
    }
  }

  /// Envoie le transfert en affichant les détails dans la console
  void _sendTransfer() {
    if (_selectedContact != null && _amountController.text.isNotEmpty) {
      final phoneNumber = _selectedContact!.phones.isNotEmpty
          ? _selectedContact!.phones.first.number
          : 'Aucun numéro disponible';
      final amount = _amountController.text;

      // Affichage des informations du transfert dans la console
      print(
          'Transfert envoyé à $phoneNumber pour un montant de $amount avec frais inclus: $_includeFees');

      // Réinitialise le formulaire après l'envoi
      setState(() {
        _selectedContact = null;
        _amountController.clear();
        _includeFees = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar avec un thème dark blue
      appBar: AppBar(
        title: const Text("Transfert Moov"),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),

      // Contenu principal avec un arrière-plan dégradé
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[900]!, Colors.blue[200]!],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              // Permet de faire défiler le contenu si nécessaire
              child: Card(
                elevation: 10, // Ombre pour améliorer l'esthétique
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Message d'erreur si la permission d'accès aux contacts est refusée
                      if (_permissionDenied)
                        const Text(
                          "Permission d'accès aux contacts refusée.",
                          style: TextStyle(color: Colors.red),
                        )
                      // Indicateur de chargement si les contacts sont en cours de récupération
                      else if (_contacts == null)
                        const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.blue), // Loader avec couleur bleue
                        )
                      // Contenu principal lorsque les contacts sont disponibles
                      else ...[
                        // Dropdown pour sélectionner un contact
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey[400]!),
                          ),
                          child: DropdownButtonFormField<Contact>(
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              border: InputBorder.none,
                              prefixIcon:
                                  Icon(Icons.contact_page, color: Colors.blue),
                            ),
                            hint: const Text("Sélectionnez un contact"),
                            value: _selectedContact,
                            onChanged: (Contact? newValue) {
                              setState(() {
                                _selectedContact = newValue;
                              });
                            },
                            items: _contacts!.map<DropdownMenuItem<Contact>>(
                                (Contact contact) {
                              return DropdownMenuItem<Contact>(
                                value: contact,
                                child: Text(contact.displayName),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Champ pour entrer le montant
                        TextField(
                          controller: _amountController,
                          decoration: InputDecoration(
                            labelText: "Montant",
                            prefixIcon:
                                const Icon(Icons.money, color: Colors.blue),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),

                        // Checkbox pour inclure les frais de transfert
                        CheckboxListTile(
                          title: const Text("Inclure les frais de transfert"),
                          value: _includeFees,
                          onChanged: (bool? value) {
                            setState(() {
                              _includeFees = value ?? false;
                            });
                          },
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: 30),

                        // Bouton pour envoyer le transfert
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _sendTransfer,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900], // Dark blue
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5, // Ajout d'une ombre
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.send),
                                SizedBox(width: 10),
                                Text(
                                  "Envoyer",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
