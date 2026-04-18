import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Audio Player App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer player = AudioPlayer();
  int counter = 0;
  bool isPlaying = false;

  // PLAY AUDIO
  Future<void> playAudio() async {
    await player.play(AssetSource('audio/lagu.mp3'));
    setState(() {
      isPlaying = true;
    });
  }

  // PAUSE AUDIO
  Future<void> pauseAudio() async {
    await player.pause();
    setState(() {
      isPlaying = false;
    });
  }

  // STOP AUDIO
  Future<void> stopAudio() async {
    await player.stop();
    setState(() {
      isPlaying = false;
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  void dispose() {
    player.dispose(); // penting untuk elak memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IMAGE
            Image.asset('assets/images/uum.png', scale: 5),

            const SizedBox(height: 20),

            // AUDIO BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow, size: 40),
                  onPressed: playAudio,
                ),
                IconButton(
                  icon: const Icon(Icons.pause, size: 40),
                  onPressed: pauseAudio,
                ),
                IconButton(
                  icon: const Icon(Icons.stop, size: 40),
                  onPressed: stopAudio,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // COUNTER TEXT
            const Text('You have pushed the button this many times:'),
            Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),

      // FLOATING BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
