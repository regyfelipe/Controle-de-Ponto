import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/circularProgress.dart';
import '../widgets/confirmation_dialog.dart';
import '../notifications/notification_service.dart';

class BatePontoScreen extends StatefulWidget {
  const BatePontoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BatePontoScreenState createState() => _BatePontoScreenState();
}

class _BatePontoScreenState extends State<BatePontoScreen>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late DateTime _currentTime;
  double _progress = 0;
  final NotificationService _notificationService = NotificationService();
  String? _ultimoPonto; 

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _notificationService.initializeNotifications();
    _loadUltimoPonto(); 

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
        _progress = (_currentTime.second % 60) / 60;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatTime(DateTime time) {
    return DateFormat('HH:mm:ss').format(time);
  }

  Future<void> _saveUltimoPonto(String horario) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ultimoPonto', horario);
  }

  Future<void> _savePonto() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final formattedTime = formatTime(now);

    final newEntry = {
      'data': DateFormat('dd/MM').format(now),
      'entrada': formattedTime,
      'saida': '-',
      'saldo': '0:00',
    };

    List<String> pontos = prefs.getStringList('batidas') ?? [];
    pontos.add(newEntry.toString());

    await prefs.setStringList('batidas', pontos);
    await _saveUltimoPonto(formattedTime);

    setState(() {
      _ultimoPonto = formattedTime;
    });
  }

  Future<void> _loadUltimoPonto() async {
    final prefs = await SharedPreferences.getInstance();
    final ultimoPonto = prefs.getString('ultimoPonto');
    print('Carregando último ponto: $ultimoPonto');
    setState(() {
      _ultimoPonto = ultimoPonto;
    });
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          onConfirmed: () {
            Navigator.of(context).pop();
            _notificationService.showNotification(
              title: 'Ponto Batido!',
              body: 'Você bateu o ponto com sucesso!',
            );

            _savePonto();

            final now = DateTime.now();
            final newEntry = {
              'data': DateFormat('dd/MM').format(now),
              'entrada': formatTime(now),
              'saida': '-',
              'saldo': '0:00',
            };

            Navigator.pushReplacementNamed(context, '/home', arguments: newEntry);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF536493),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(300, 300),
              painter: CircularProgressPainter(_progress),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formatTime(_currentTime),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _showConfirmationDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: const Text(
                    'Bater Ponto',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
