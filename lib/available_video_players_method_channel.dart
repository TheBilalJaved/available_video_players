import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'available_video_players_platform_interface.dart';

/// An implementation of [AvailableVideoPlayersPlatform] that uses method channels.
class MethodChannelAvailableVideoPlayers extends AvailableVideoPlayersPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('available_video_players');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
