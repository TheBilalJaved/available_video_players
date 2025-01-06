
# available_video_players

A Flutter plugin to retrieve all installed video player apps on Android, designed for seamless integration in Flutter applications. This plugin currently supports **retrieving installed video players on Android** only.

## Features

- Retrieve a list of installed video player apps on Android
- Get app names and package names of installed video players
- Simple API to access installed video player data

## Installation

Add `available_video_players` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  available_video_players: <latest version>
```

If you are working on the plugin directly or planning to install it from GitHub before publishing to pub.dev, you can add it like this:

```yaml
dependencies:
  available_video_players:
    git:
      url: https://github.com/yourusername/available_video_players.git
```

Then, run:

```bash
flutter pub get
```

## Usage

1. **Import the Plugin**  
   In your Dart code, import the `available_video_players` package:

   ```dart
   import 'package:available_video_players/available_video_players.dart';
   ```

2. **Get Installed Video Players**  
   Use the `getInstalledVideoPlayers` method to get a list of installed video player apps on the device.

   ```dart
   List<VideoPlayerApp> videoPlayers = await AvailableVideoPlayers.getInstalledVideoPlayers();
   videoPlayers.forEach((app) {
     print('App Name: ${app.appName}');
     print('Package Name: ${app.packageName}');
   });
   ```

## Notes

- This plugin works on Android only.
- The list of installed video players is retrieved based on the apps' package names.
- This plugin does not provide icons for the apps, only their names and package names.

## License

MIT License. See LICENSE file for details.
