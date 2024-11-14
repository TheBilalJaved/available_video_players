import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:available_video_players/available_video_players_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAvailableVideoPlayers platform = MethodChannelAvailableVideoPlayers();
  const MethodChannel channel = MethodChannel('available_video_players');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
