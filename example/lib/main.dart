import 'package:available_video_players/available_video_players.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Available Video Players',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VideoPlayersScreen(),
    );
  }
}

class VideoPlayersScreen extends StatefulWidget {
  const VideoPlayersScreen({super.key});

  @override
  State<VideoPlayersScreen> createState() => _VideoPlayersScreenState();
}

class _VideoPlayersScreenState extends State<VideoPlayersScreen> {
  late Future<List<VideoPlayerApp>> _videoPlayers;

  @override
  void initState() {
    super.initState();
    _videoPlayers = AvailableVideoPlayers.getInstalledVideoPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Installed Video Players'),
      ),
      body: FutureBuilder<List<VideoPlayerApp>>(
        future: _videoPlayers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No video players found.'));
          }

          final videoPlayers = snapshot.data!;

          return ListView.builder(
            itemCount: videoPlayers.length,
            itemBuilder: (context, index) {
              final videoPlayer = videoPlayers[index];

              return ListTile(
                title: Text(videoPlayer.appName),
                subtitle: Text(videoPlayer.packageName),
              );
            },
          );
        },
      ),
    );
  }
}
