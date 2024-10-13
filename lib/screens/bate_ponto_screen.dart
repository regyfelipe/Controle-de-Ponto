import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import '../components/awesome_bottom_bar.dart';
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
  int _currentIndex = 0;

  double _progress = 0; 
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();

    _notificationService.initializeNotifications();

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

            final now = DateTime.now();
            final newEntry = {
              'data': DateFormat('dd/MM').format(now),
              'entrada': formatTime(now),
              'saida': '-',
              'saldo': '0:00',
            };

            Navigator.pushReplacementNamed(context, '/registroBatida', arguments: newEntry);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
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
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AwesomeBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
