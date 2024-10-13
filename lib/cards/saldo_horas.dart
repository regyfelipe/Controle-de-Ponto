import 'package:flutter/material.dart';

class SaldoHoras extends StatefulWidget {
  const SaldoHoras({super.key});

  @override
  State<SaldoHoras> createState() => _SaldoHorasState();
  
}

class _SaldoHorasState extends State<SaldoHoras> {
  bool _showBalance = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black54,
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.access_time_filled,
                    color: Colors.orange.shade700,
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  'Saldos de Horas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blueGrey.shade700,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    _showBalance ? Icons.visibility_off : Icons.visibility,
                    color: Colors.blueGrey.shade700,
                  ),
                  onPressed: () {
                    setState(() {
                      _showBalance = !_showBalance;
                    });
                  },
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Horas Trabalhadas Hoje',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey.shade700,
                    ),
                  ),
                  Text(
                    _showBalance ? '8h 30m' : '---',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Banco de Horas',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey.shade700,
                    ),
                  ),
                  Text(
                    _showBalance ? '5h 15m' : '---',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
