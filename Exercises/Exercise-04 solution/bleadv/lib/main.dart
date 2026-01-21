import 'package:flutter/material.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLE Emoji Broadcaster',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EmojiScreen(),
    );
  }
}

class EmojiScreen extends StatefulWidget {
  const EmojiScreen({super.key});

  @override
  State<EmojiScreen> createState() => _EmojiScreenState();
}

class EmojiEntry {
  final String emoji;
  final String deviceId;
  final DateTime timestamp;

  EmojiEntry({
    required this.emoji,
    required this.deviceId,
    required this.timestamp,
  });
}

class _EmojiScreenState extends State<EmojiScreen> {
  final CentralManager _cmanager = CentralManager();
  final PeripheralManager _pmanager = PeripheralManager();
  final TextEditingController _textController = TextEditingController();
  final List<EmojiEntry> _emojis = [];
  final Set<String> _seenDevices = {};
  bool _isAdvertising = false;
  bool _isBluetoothReady = false;

  @override
  void initState() {
    super.initState();
    _initializeBluetooth();
  }

  Future<void> _initializeBluetooth() async {
    try {
      // Request authorization for both managers
      await _pmanager.authorize();
      await _cmanager.authorize();

      _isBluetoothReady = true;

      // Start scanning for devices
      _cmanager.discovered.listen((eventArgs) {
        final peripheral = eventArgs.peripheral;
        final advertisementName = eventArgs.advertisement.name;

        // Check if this is a sHCI advertisement
        if (advertisementName != null && advertisementName.startsWith('sHCI:')) {
          // Extract the emoji
          final emoji = advertisementName.substring(5); // Remove "sHCI:" prefix

          // Create a unique device identifier
          final deviceId = peripheral.uuid.toString();

          // Create a unique key for this device+emoji combination
          final uniqueKey = '$deviceId:$emoji';

          // Only add if we haven't seen this device broadcasting this emoji yet
          if (!_seenDevices.contains(uniqueKey)) {
            setState(() {
              _seenDevices.add(uniqueKey);
              // Add to the beginning of the list (latest on top)
              _emojis.insert(
                0,
                EmojiEntry(
                  emoji: emoji,
                  deviceId: deviceId,
                  timestamp: DateTime.now(),
                ),
              );
            });
          }
        }
      });

      await _cmanager.startDiscovery();
    } catch (e) {
      print('Error initializing Bluetooth: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bluetooth Error: $e\nPlease enable Bluetooth and grant permissions.'),
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _broadcastEmoji(String emoji) async {
    if (emoji.isEmpty) return;

    if (!_isBluetoothReady) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bluetooth not ready. Please enable Bluetooth and grant permissions.'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    }

    try {
      // Only stop advertising if we're currently advertising
      if (_isAdvertising) {
        await _pmanager.stopAdvertising();
        _isAdvertising = false;
      }
      
      // Start advertising with the new emoji
      await _pmanager.startAdvertising(
        Advertisement(name: 'sHCI:$emoji'),
      );
      _isAdvertising = true;

      // Clear the text field
      _textController.clear();

      // Show feedback to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Broadcasting: $emoji'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print('Error broadcasting emoji: $e');
      _isAdvertising = false;
      if (mounted) {
        String errorMsg = 'Failed to broadcast emoji.';
        if (e.toString().contains('NullPointerException')) {
          errorMsg = 'Please enable Bluetooth and grant all permissions.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: () => _initializeBluetooth(),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    try {
      _cmanager.stopDiscovery();
    } catch (e) {
      print('Error stopping discovery: $e');
    }
    
    try {
      if (_isAdvertising) {
        _pmanager.stopAdvertising();
      }
    } catch (e) {
      print('Error stopping advertising: $e');
    }
    
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BLE Emoji Broadcaster'),
      ),
      body: Column(
        children: [
          // Scrolling list of received emojis
          Expanded(
            child: _emojis.isEmpty
                ? const Center(
                    child: Text(
                      'No emojis received yet.\nSend an emoji to start!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _emojis.length,
                    itemBuilder: (context, index) {
                      final entry = _emojis[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              entry.emoji,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          title: Text(
                            entry.emoji,
                            style: const TextStyle(fontSize: 32),
                          ),
                          subtitle: Text(
                            'Device: ${entry.deviceId.substring(0, 8)}...\n'
                            'Time: ${entry.timestamp.hour}:${entry.timestamp.minute.toString().padLeft(2, '0')}',
                          ),
                        ),
                      );
                    },
                  ),
          ),
          
          // Divider
          const Divider(height: 1),
          
          // Text input field at the bottom
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter an emoji...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    style: const TextStyle(fontSize: 24),
                    onSubmitted: _broadcastEmoji,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _broadcastEmoji(_textController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
