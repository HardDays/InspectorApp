package com.example.inspector

import android.content.Intent
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.inspector/mainChannel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when(call.method) {
                "openYandexMap" -> {
                    openMap()
                    result.success(null)
                }
                "getInstallDate" -> {
                    result.success(getInstallDate())
                }
            }
        }
    }

    private fun openMap() {
        val uri = Uri.parse("yandexmaps://");
        val intent = Intent(Intent.ACTION_VIEW, uri);
        startActivity(intent);
    }

    private fun getInstallDate() = context
            .packageManager
            .getPackageInfo(context.packageName, 0)
            .firstInstallTime

}
