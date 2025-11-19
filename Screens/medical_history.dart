import 'package:flutter/material.dart';

class MedicalHistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Patient Medical History'),
        backgroundColor: Color(0xFFE63946),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white,const Color(0xFFE63946).withOpacity(0.1),Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildCard(
              icon: Icons.person,
              title: 'Patient Info',
              content: 'Name: Ali Raza\nAge: 42\nGender: Male\nBlood Group: B+',
            ),
            _buildCard(
              icon: Icons.health_and_safety,
              title: 'Chronic Conditions',
              content: '• Diabetes (Type 2)\n• Hypertension',
            ),
            _buildCard(
              icon: Icons.medication,
              title: 'Current Medications',
              content: '• Metformin 500mg (2x daily)\n• Amlodipine 5mg (1x daily)',
            ),
            _buildCard(
              icon: Icons.local_hospital,
              title: 'Past Surgeries',
              content: '• Appendectomy – 2015\n• Cataract Surgery – 2021',
            ),
            _buildCard(
              icon: Icons.warning_amber,
              title: 'Allergies',
              content: '• Penicillin (rash)\n• Peanuts (mild)',
            ),
            _buildCard(
              icon: Icons.science,
              title: 'Recent Lab Reports',
              content: '• CBC – Normal (Oct 2025)\n• HbA1c – 7.2% (Sep 2025)',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required IconData icon, required String title, required String content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white

      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        subtitle: Text(content, style: const TextStyle(color: Colors.black)),
      ),
    );
  }
}