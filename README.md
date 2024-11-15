const String readmeContent = """
# available_video_players

A Flutter plugin to retrieve a list of installed video player applications on Android devices. This plugin simplifies integration into Flutter apps and provides details such as app names and package names of available video players.

## Features

- Retrieve a list of all installed video player applications.
- Provides app names and package names for easy identification.
- Lightweight and easy-to-integrate solution for Android apps.

## Installation

Add `available_video_players` as a dependency in your `pubspec.yaml` file:

\`\`\`yaml
dependencies:
  available_video_players: <latest version>
\`\`\`

Then, run:

\`\`\`bash
flutter pub get
\`\`\`

## Usage

### 1. Import the Plugin

Start by importing the `available_video_players` package into your Dart code:

\`\`\`dart
import 'package:available_video_players/available_video_players.dart';
\`\`\`

### 2. Retrieve Installed Video Players

Use the `getInstalledVideoPlayers` method to retrieve a list of installed video player apps on the device.

\`\`\`dart
import 'package:available_video_players/available_video_players.dart';

void fetchVideoPlayers() async {
  final videoPlayers = await AvailableVideoPlayers.getInstalledVideoPlayers();

  for (var player in videoPlayers) {
    print('App Name: \${player.appName}');
    print('Package Name: \${player.packageName}');
  }
}
\`\`\`

## API Reference

### AvailableVideoPlayers

#### `getInstalledVideoPlayers()`

Returns a `Future<List<VideoPlayerApp>>`, where each `VideoPlayerApp` contains:

- **appName**: The name of the video player application.
- **packageName**: The package name of the video player application.

### VideoPlayerApp

Represents a video player app with the following properties:

- **appName** (String): The name of the application.
- **packageName** (String): The package name of the application.

## Example App

An example Flutter application demonstrating the use of this plugin can be found in the `example` directory of this repository.

## Permissions

Ensure the Android application has the required permissions in `AndroidManifest.xml`:

\`\`\`xml
<uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" />
\`\`\`

This permission is necessary to query installed apps.

## Notes

- This plugin is currently available for Android only.
- Ensure to comply with Google Play's policies while using `QUERY_ALL_PACKAGES`, as it might require justification during app submission.

## License

MIT License. See LICENSE file for details.
""";
