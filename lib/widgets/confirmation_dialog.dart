import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirmed;

  ConfirmationDialog({required this.onConfirmed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      backgroundColor: Colors.grey[800],
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Confirmação',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Você deseja bater o ponto?',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text(
                    'Confirmar',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: onConfirmed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
