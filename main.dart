import 'package:flutter/material.dart';

void main() => runApp(const FlashlightApp());


class FlashlightApp extends StatelessWidget {
  const FlashlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashlight App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlashlightScreen(),
    );
  }
}

class FlashlightScreen extends StatefulWidget {
  const FlashlightScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FlashlightScreenState createState() => _FlashlightScreenState();
}

class _FlashlightScreenState extends State<FlashlightScreen> {
  bool _isFlashOn = false;

  void _toggleFlashlight() async {
    if (_isFlashOn) {
      await TorchCompat.turnOff();
    } else {
      await TorchCompat.turnOff();
    }
    setState(() {
      _isFlashOn = !_isFlashOn;
    });
  }

  @override
  void dispose() {
    TorchCompat.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashlight App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              _isFlashOn ? Icons.flash_on : Icons.flash_off,

              size: 80,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleFlashlight,
              child: Text(_isFlashOn ? 'Turn Off' : 'Turn On'),
            ),
          ],
        ),
      ),
    );
  }
}

    class TorchCompat {
    static void dispose() {

    }

    static turnOff() {}
    }
