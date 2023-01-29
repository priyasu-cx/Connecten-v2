import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacknitr_round2/Models/user_models.dart';
import 'package:hacknitr_round2/Providers/database_provider.dart';
import 'package:hacknitr_round2/Services/database_service.dart';
import 'package:hacknitr_round2/widgets/profile_dialog.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScan extends ConsumerStatefulWidget {
  const QRScan({Key? key}) : super(key: key);

  @override
  ConsumerState<QRScan> createState() => _QRScanState();
}

class _QRScanState extends ConsumerState<QRScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final databaseUser = ref.watch(databaseProvider);
    final userDetails = ref.watch(userDetailsProvider);


    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300,
        ),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.resumeCamera();
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Scan Result'),
          content: Text(scanData.code!),
          actions: [
            TextButton(
              onPressed: () {
                final databaseUser = ref.read(userDetailsWithIdProvider(scanData.code!)).value;
                ProfileDialog(databaseUser!, context);


                Navigator.pop(context);},
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }


}
