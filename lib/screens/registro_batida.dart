import 'package:flutter/material.dart';
import '../components/awesome_bottom_bar.dart'; 

class RegistroBatidaScreen extends StatefulWidget {
  const RegistroBatidaScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistroBatidaScreenState createState() => _RegistroBatidaScreenState();
}

class _RegistroBatidaScreenState extends State<RegistroBatidaScreen> {
  int _currentIndex = 1;

  List<Map<String, String>> historicoPonto = [
     ];

 @override
void didChangeDependencies() {
  super.didChangeDependencies();

  final newEntry = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

  if (newEntry != null) {
    historicoPonto.insert(0, newEntry); 
  }
}

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _navigateToScreen(context, index); 
  }

  void _navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0: 
        Navigator.pushReplacementNamed(context, '/batePonto');
        break;
      case 1: 
        break;
      case 2: 
        Navigator.pushReplacementNamed(context, '/configuracoes');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text('Historio de Batidas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[900], 
        elevation: 0,
        actions: [
          IconButton(
            icon:const Icon(Icons.calendar_today_outlined, color: Colors.white),
            onPressed: () {
            },
          )
        ],
      ),
      backgroundColor: Colors.grey[900], 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
              'Registrar o ponto na unidade:',
              style: TextStyle(fontSize: 16, color: Colors.white54),
            ),
            const SizedBox(height: 4),
            const Text(
              'Teste, Aquiraz, CE',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
           const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSaldoCard('Saldo mês', '+4:32'),
                _buildSaldoCard('Saldo geral', '+40:42'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Histórico de ponto',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
           const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: historicoPonto.length,
                itemBuilder: (context, index) {
                  return _buildHistoricoItem(historicoPonto[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AwesomeBottomBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,

      ),
    );
  }

  Widget _buildSaldoCard(String title, String saldo) {
    return Container(
      width: 150,
      padding:const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800], 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:const TextStyle(fontSize: 16, color: Colors.white54),
          ),
         const SizedBox(height: 8),
          Text(
            saldo,
            style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoricoItem(Map<String, String> ponto) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 8),
      padding:const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blueGrey[100]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(ponto['data']!, style:const TextStyle(fontSize: 16)),
          Text(ponto['entrada']!, style:const TextStyle(fontSize: 16)),
          Text(ponto['saida']!, style:const TextStyle(fontSize: 16)),
          Text(
            ponto['saldo']!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ponto['saldo']!.contains('-') ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
