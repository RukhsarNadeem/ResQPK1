import 'package:flutter/material.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});



  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Map<String, String>> hospitals = [
    {
      'name': 'St. Elizabeth Hospital (American Hospital)',
      'address': 'Unit #7, Latifabad, Hyderabad',
      'contact': '+92-22-382-1234'
    },
    {
      'name': 'Usmania Hospital',
      'address': 'Saddar, Hyderabad',
      'contact': '+92-22-381-5678'
    },
    {
      'name': 'Wasi Medical Centre',
      'address': 'Hyderabad',
      'contact': '+92-22-383-1122'
    },
    {
      'name': 'Niaz Hospital',
      'address': 'Hyderabad',
      'contact': '+92-22-384-3344'
    },
    {
      'name': 'Maajee Hospital',
      'address': 'Hyderabad',
      'contact': '+92-22-385-5566'
    },
    {
      'name': 'Hina Medical Center',
      'address': 'Hyderabad',
      'contact': '+92-22-386-7788'
    },
    {
      'name': 'Faisal Hospital',
      'address': 'Hyderabad',
      'contact': '+92-22-387-9900'
    },
    {
      'name': 'Bukhari Medical Center',
      'address': 'Hyderabad',
      'contact': '+92-22-388-2211'
    },
    {
      'name': 'C.D.F Hospital',
      'address': 'Hyderabad',
      'contact': '+92-22-389-4433'
    },
    {
      'name': 'Advance Diagnostic Center',
      'address': 'Hyderabad',
      'contact': '+92-22-390-6655'
    },
  ];

  final List<Map<String, String>> _visibleHospitals = [];

  @override
  void initState() {
    super.initState();
    _addHospitalsWithDelay();
  }

  void _addHospitalsWithDelay() async {
    for (int i = 0; i < hospitals.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      _visibleHospitals.add(hospitals[i]);
      _listKey.currentState?.insertItem(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hospitals in Hyderabad'),
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
        child: AnimatedList(
        key: _listKey,
        initialItemCount: _visibleHospitals.length,
        itemBuilder: (context, index, animation) {
          final hospital = _visibleHospitals[index];
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            )),
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospital['name']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.black),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            hospital['address']!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.black),
                        const SizedBox(width: 8),
                        Text(
                          hospital['contact']!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),)
    );
  }
}