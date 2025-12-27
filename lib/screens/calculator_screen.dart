
import 'package:flutter/material.dart';
import 'package:myapp/widgets/glass_container.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _patientWeightController = TextEditingController();
  final _drugConcentrationController = TextEditingController();
  final _desiredDoseController = TextEditingController();
  String _result = '0.0';

  void _calculateDose() {
    final patientWeight = double.tryParse(_patientWeightController.text) ?? 0;
    final drugConcentration = double.tryParse(_drugConcentrationController.text) ?? 0;
    final desiredDose = double.tryParse(_desiredDoseController.text) ?? 0;

    if (drugConcentration > 0) {
      final calculation = (desiredDose * patientWeight) / drugConcentration;
      setState(() {
        _result = calculation.toStringAsFixed(2);
      });
    } else {
      setState(() {
        _result = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        width: 400,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Dose Calculator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _patientWeightController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Patient Weight (kg)',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _drugConcentrationController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Drug Concentration (mg/mL)',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _desiredDoseController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Desired Dose (mg/kg)',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _calculateDose,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Volume to Administer (mL):',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(
              _result,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _patientWeightController.dispose();
    _drugConcentrationController.dispose();
    _desiredDoseController.dispose();
    super.dispose();
  }
}
