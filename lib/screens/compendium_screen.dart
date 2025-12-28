
import 'package:flutter/material.dart';
import 'package:clinik_all_pharma/widgets/glass_container.dart';

class CompendiumScreen extends StatefulWidget {
  const CompendiumScreen({super.key});

  @override
  State<CompendiumScreen> createState() => _CompendiumScreenState();
}

class _CompendiumScreenState extends State<CompendiumScreen> {
  final List<String> _medications = [
    'Aspirin',
    'Ibuprofen',
    'Paracetamol',
    'Amoxicillin',
    'Ciprofloxacin',
    'Metformin',
    'Lisinopril',
    'Simvastatin',
    'Atorvastatin',
    'Omeprazole',
  ];

  List<String> _filteredMedications = [];
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredMedications = _medications;
    _searchController.addListener(() {
      filterMedications();
    });
  }

  void filterMedications() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredMedications = _medications
          .where((medication) => medication.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        width: 500,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'Drug Compendium',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Search Medications',
                labelStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredMedications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredMedications[index], style: const TextStyle(color: Colors.white)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
