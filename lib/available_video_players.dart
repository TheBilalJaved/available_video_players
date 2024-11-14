import 'package:flutter/services.dart';

class AvailableVideoPlayers {
  static const MethodChannel _channel =
      MethodChannel('available_video_players');
  Future<String?> getPlatformVersion() {
    return _channel.invokeMethod('getPlatformVersion');
  }

  // Get installed video players
  static Future<List<VideoPlayerApp>> getInstalledVideoPlayers() async {
    final List<dynamic> result =
        await _channel.invokeMethod('getInstalledVideoPlayers');
    return result.map<VideoPlayerApp>((app) {
      return VideoPlayerApp(
        appName: app['appName'],
        packageName: app['packageName'],
      );
    }).toList();
  }
}

class VideoPlayerApp {
  final String appName;
  final String packageName;

  VideoPlayerApp({
    required this.appName,
    required this.packageName,
  });
}
