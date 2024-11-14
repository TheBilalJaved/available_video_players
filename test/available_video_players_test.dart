import 'package:flutter_test/flutter_test.dart';
import 'package:available_video_players/available_video_players.dart';
import 'package:available_video_players/available_video_players_platform_interface.dart';
import 'package:available_video_players/available_video_players_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAvailableVideoPlayersPlatform
    with MockPlatformInterfaceMixin
    implements AvailableVideoPlayersPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AvailableVideoPlayersPlatform initialPlatform = AvailableVideoPlayersPlatform.instance;

  test('$MethodChannelAvailableVideoPlayers is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAvailableVideoPlayers>());
  });

  test('getPlatformVersion', () async {
    AvailableVideoPlayers availableVideoPlayersPlugin = AvailableVideoPlayers();
    MockAvailableVideoPlayersPlatform fakePlatform = MockAvailableVideoPlayersPlatform();
    AvailableVideoPlayersPlatform.instance = fakePlatform;

    expect(await availableVideoPlayersPlugin.getPlatformVersion(), '42');
  });
}
