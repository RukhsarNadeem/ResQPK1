import 'package:flutter/material.dart';
import 'package:resqpk/Screens/first_aid_details.dart';

class FirstAid extends StatelessWidget {
  final List<Map<String, String>> firstAidItems = [
    {"id": "cpr", "title": "CPR", "desc": "Steps for cardiopulmonary resuscitation"},
    {"id": "burns", "title": "Burns", "desc": "How to treat minor and major burns"},
    {"id": "bone_injury", "title": "Fractures", "desc": "Immobilization techniques"},
    {"id": "bleeding", "title": "Bleeding", "desc": "First response to heavy bleeding"},
    {"id": "choking", "title": "Choking", "desc": "First response to heavy bleeding"},
    {"id": "chest_pain", "title": "Chest Pain", "desc": "First response to heavy bleeding"},
  ];

  FirstAid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Aid Guide", style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,),
      body: ListView.builder(
          itemCount: firstAidItems.length,
          itemBuilder: (context, index) {
            final item = firstAidItems[index];
            return Card(
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(item["title"]!),
                  subtitle: Text(item["desc"]!),
                  leading: const Icon(
                      Icons.health_and_safety, color: Color(0xFFFF1744)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FirstAidDetailScreen(categoryId: item["id"]!),
                      ),
                    );
                  },
                )
            );
          }
      ),
    );
  }
  }