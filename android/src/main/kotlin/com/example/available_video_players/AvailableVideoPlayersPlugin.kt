package com.example.available_video_players

import android.content.pm.PackageManager
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.content.pm.ResolveInfo
import android.content.Context
import android.content.pm.ApplicationInfo

/** AvailableVideoPlayersPlugin */
class AvailableVideoPlayersPlugin: FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    // onAttachedToEngine is called when the plugin is registered with the engine
    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "available_video_players")
        channel.setMethodCallHandler(this)  // Setting the MethodCallHandler
        context = flutterPluginBinding.applicationContext
    }

    // onMethodCall is called when a method is called from Dart code
    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getInstalledVideoPlayers") {
            try {
                val videoPlayers = getInstalledVideoPlayers()
                result.success(videoPlayers) // Sending result back to Dart
            } catch (e: Exception) {
                result.error("ERROR", "Failed to get video players: ${e.message}", null)
            }
        } else {
            result.notImplemented() // Handle method that is not implemented
        }
    }

    private fun getInstalledVideoPlayers(): List<Map<String, Any>> {
        val packageManager = context.packageManager
        val intent = android.content.Intent(android.content.Intent.ACTION_VIEW)
        intent.setType("video/*")

        // Query all apps that can handle this intent
        val playerList: List<ResolveInfo> = packageManager.queryIntentActivities(intent, 0)
        val appInfos: MutableList<Map<String, String>> = mutableListOf()


        for (resolveInfo in playerList) {
            try {
                val applicationInfo: ApplicationInfo =
                    packageManager.getApplicationInfo(resolveInfo.activityInfo.packageName, 0)
                val appName: String = packageManager.getApplicationLabel(applicationInfo).toString()
                val packageName: String = applicationInfo.packageName

                val appInfo: Map<String, String> = mapOf(
                    "appName" to appName,
                    "packageName" to packageName
                )
                appInfos.add(appInfo)
            } catch (e: PackageManager.NameNotFoundException) {
                e.printStackTrace()
            }
        }

        return appInfos
    }

    // onDetachedFromEngine is called when the plugin is removed from the engine
    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
