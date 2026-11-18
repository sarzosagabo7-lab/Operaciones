import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  double resultado = 0;
  String mensajeError = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        title: const Text(
          'Calculadora Pro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF111827),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 440),
              padding: const EdgeInsets.all(28.0),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.cyanAccent.withOpacity(0.15),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.05),
                    blurRadius: 30,
                    spreadRadius: 2,
                    offset: const Offset(0, 10),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.calculate_rounded, color: Colors.cyanAccent, size: 24),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Operaciones Matemáticas",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  
                  const Text(
                    "Primer número",
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: num1,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: _inputDecoration("Ej. 50"),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  const Text(
                    "Segundo número",
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: num2,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: _inputDecoration("Ej. 10"),
                  ),
                  
                  const SizedBox(height: 28),
                  
                  // Botones con iconos básicos seguros
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildNeonButton("Sumar", sumar, Colors.cyanAccent, Icons.add),
                      _buildNeonButton("Restar", restar, Colors.amberAccent, Icons.remove),
                      _buildNeonButton("Multiplicar", multiplicar, Colors.purpleAccent, Icons.close),
                      _buildNeonButton("Dividir", dividir, const Color(0xFF34D399), Icons.remove),
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                  
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF0F172A),
                          const Color(0xFF1E293B).withOpacity(0.5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: mensajeError.isNotEmpty 
                            ? Colors.redAccent.withOpacity(0.4) 
                            : Colors.cyanAccent.withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          mensajeError.isNotEmpty ? "ATENCIÓN" : "RESULTADO OBTENIDO",
                          style: TextStyle(
                            color: mensajeError.isNotEmpty ? Colors.redAccent : const Color(0xFF38BDF8),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          mensajeError.isNotEmpty ? mensajeError : "$resultado",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: mensajeError.isNotEmpty ? Colors.redAccent : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF4B5563)),
      filled: true,
      fillColor: const Color(0xFF030712),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.05)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.05)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.cyanAccent, width: 1.5),
      ),
    );
  }

  Widget _buildNeonButton(String text, VoidCallback onPressed, Color color, IconData icon) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18, color: color),
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: color.withOpacity(0.4), width: 1),
        ),
      ),
      label: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  void sumar() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() {
      mensajeError = "";
      resultado = n1 + n2;
    });
  }

  void restar() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() {
      mensajeError = "";
      resultado = n1 - n2;
    });
  }

  void multiplicar() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() {
      mensajeError = "";
      resultado = n1 * n2;
    });
  }

  void dividir() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() {
      if (n2 == 0) {
        mensajeError = "No se puede dividir para 0";
      } else {
        mensajeError = "";
        resultado = n1 / n2;
      }
    });
  }
}