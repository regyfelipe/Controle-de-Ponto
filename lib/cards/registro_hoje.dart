import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistroHoje extends StatefulWidget {
  const RegistroHoje({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistroHojeState createState() => _RegistroHojeState();
}

class _RegistroHojeState extends State<RegistroHoje> {
  String? _ultimoPonto;

  @override
  void initState() {
    super.initState();
    _loadUltimoPonto();
  }

  Future<void> _loadUltimoPonto() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _ultimoPonto = prefs.getString('ultimoPonto');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black54,
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.access_time,
            color: Colors.blue.shade700,
          ),
        ),
        title: Text(
          'Registro de Hoje',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blueGrey.shade700,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.blueGrey.shade700,
        ),
        children: <Widget>[
          Divider(
            thickness: 1,
            color: Colors.grey.shade300,
          ),
          ListTile(
            title: Text(
              _ultimoPonto != null
                  ? 'Último ponto: $_ultimoPonto'
                  : 'Nenhum registro',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
