
import 'package:flutter/material.dart';
import 'package:myapp/widgets/glass_container.dart';

class InteractionsScreen extends StatefulWidget {
  const InteractionsScreen({super.key});

  @override
  State<InteractionsScreen> createState() => _InteractionsScreenState();
}

class _InteractionsScreenState extends State<InteractionsScreen> {
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

  String? _selectedMed1;
  String? _selectedMed2;
  String _interactionResult = '';

  void _checkInteractions() {
    if (_selectedMed1 == null || _selectedMed2 == null) {
      setState(() {
        _interactionResult = 'Please select two medications.';
      });
      return;
    }

    // Placeholder logic for interaction checking
    if ((_selectedMed1 == 'Aspirin' && _selectedMed2 == 'Ibuprofen') ||
        (_selectedMed1 == 'Ibuprofen' && _selectedMed2 == 'Aspirin')) {
      setState(() {
        _interactionResult = 'Significant interaction found between Aspirin and Ibuprofen. Increased risk of gastrointestinal bleeding.';
      });
    } else {
      setState(() {
        _interactionResult = 'No significant interaction found between $_selectedMed1 and $_selectedMed2.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        width: 500,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Interaction Checker',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 24),
            DropdownButton<String>(
              value: _selectedMed1,
              hint: const Text('Select Medication 1', style: TextStyle(color: Colors.white70)),
              isExpanded: true,
              dropdownColor: Colors.deepPurple.withOpacity(0.8),
              style: const TextStyle(color: Colors.white),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMed1 = newValue;
                });
              },
              items: _medications.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedMed2,
              hint: const Text('Select Medication 2', style: TextStyle(color: Colors.white70)),
              isExpanded: true,
              dropdownColor: Colors.deepPurple.withOpacity(0.8),
              style: const TextStyle(color: Colors.white),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMed2 = newValue;
                });
              },
              items: _medications.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _checkInteractions,
              child: const Text('Check Interactions'),
            ),
            const SizedBox(height: 32),
            if (_interactionResult.isNotEmpty)
              Text(
                _interactionResult,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
