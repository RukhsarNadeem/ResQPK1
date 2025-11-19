import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name = 'Rukhsar';
  final String contact = '0300-1234567';
  final String address = 'Lahore, Pakistan';
  final String emergencyContact = '0311-7654321';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA07A),
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
        backgroundColor: Color(0xFFFF1744),
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

        child: Column(
          children: [
            // Avatar and Name
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50,color: Colors.black, ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    name,
                    style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            // Info fields
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ProfileTile(icon: Icons.phone, label: 'Contact', value: contact),
                  ProfileTile(icon: Icons.home, label: 'Address', value: address),
                  ProfileTile(icon: Icons.warning, label: 'Emergency Contact', value: emergencyContact),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}