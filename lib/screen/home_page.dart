import 'package:flutter/material.dart';
import 'package:menu_ussd/screen/choix_operateur_transfert_argent.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text('Application menu USSD'),
          actions: [
            IconButton(
              icon: const Icon(Icons.apps),
              onPressed: () {},
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(
                          color: Colors.red, // Couleur de la bordure
                          width: 2.0, // Épaisseur de la bordure
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Choixoperateurtransfertargent()), // Remplace "NouvellePage" par ta classe d'écran.
                          );
                        },
                        icon: const Icon(
                          Icons.send_to_mobile_outlined,
                          color: Colors.red,
                        ),
                      )),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(
                          color: Colors.red, // Couleur de la bordure
                          width: 2.0, // Épaisseur de la bordure
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.account_balance_wallet,
                          color: Colors.red,
                        ),
                      )),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(
                          color: Colors.red, // Couleur de la bordure
                          width: 2.0, // Épaisseur de la bordure
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.phone_android,
                          color: Colors.red,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transfert\nd\'argent',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Retrait\nd\'argent',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Achat de \n crédit/forfait',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
