import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'available_video_players_method_channel.dart';

abstract class AvailableVideoPlayersPlatform extends PlatformInterface {
  /// Constructs a AvailableVideoPlayersPlatform.
  AvailableVideoPlayersPlatform() : super(token: _token);

  static final Object _token = Object();

  static AvailableVideoPlayersPlatform _instance =
      MethodChannelAvailableVideoPlayers();

  /// The default instance of [AvailableVideoPlayersPlatform] to use.
  ///
  /// Defaults to [MethodChannelAvailableVideoPlayers].
  static AvailableVideoPlayersPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AvailableVideoPlayersPlatform] when
  /// they register themselves.
  static set instance(AvailableVideoPlayersPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
