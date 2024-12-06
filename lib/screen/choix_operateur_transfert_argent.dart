import 'package:flutter/material.dart';
import 'package:menu_ussd/screen/moov/transfert_moov.dart';
import 'package:menu_ussd/screen/yas/transfert_yas.dart';

class Choixoperateurtransfertargent extends StatefulWidget {
  const Choixoperateurtransfertargent({super.key});

  @override
  State<Choixoperateurtransfertargent> createState() =>
      _ChoixoperateurtransfertargentState();
}

class _ChoixoperateurtransfertargentState
    extends State<Choixoperateurtransfertargent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF2C3E50)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Transfert d'argent",
          style: TextStyle(
            color: Color(0xFF2C3E50),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Choisissez votre opérateur",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Sélectionnez votre opérateur pour effectuer un transfert d'argent en toute sécurité",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7F8C8D),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: _buildOperatorCard(
                        "MOOV Africa",
                        "assets/MoovAfrica.jpg",
                        const Color(0xFF00B4D8),
                        "Transfert rapide et sécurisé",
                        "Plus de 10 millions d'utilisateurs",
                        Icons.speed_rounded,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Transfertmoov(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildOperatorCard(
                        "YAS",
                        "assets/yas.jpg",
                        const Color(0xFFFF6B6B),
                        "Solution innovante",
                        "Transfert instantané",
                        Icons.rocket_launch_rounded,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Transfertyas(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOperatorCard(
    String title,
    String imagePath,
    Color color,
    String subtitle,
    String users,
    IconData featureIcon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(featureIcon, size: 16, color: color),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    users,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF2C3E50).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 20,
            color: const Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
