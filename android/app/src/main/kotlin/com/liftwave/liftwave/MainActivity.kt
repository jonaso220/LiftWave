package com.liftwave.liftwave

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// A FragmentActivity: Health Connect's permission screen is requested through
// registerForActivityResult, which the health plugin needs from its host.
class MainActivity : FlutterFragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        openPrivacyPolicyIfAsked(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        openPrivacyPolicyIfAsked(intent)
    }

    /// Health Connect opens the app with one of these actions when the user
    /// taps "privacy policy" on its permissions screen.
    private fun openPrivacyPolicyIfAsked(intent: Intent?) {
        val action = intent?.action ?: return
        if (action != HEALTH_RATIONALE_ACTION && action != Intent.ACTION_VIEW_PERMISSION_USAGE) {
            return
        }
        try {
            startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(PRIVACY_POLICY_URL)))
        } catch (_: Exception) {
            // No browser: the app simply opens.
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Keeps the screen on during a workout so the phone does not lock
        // between sets (see lib/services/screen_awake_service.dart).
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SCREEN_CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "setKeepOn") {
                    val keepOn = call.arguments as? Boolean ?: false
                    if (keepOn) {
                        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
                    } else {
                        window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
                    }
                    result.success(null)
                } else {
                    result.notImplemented()
                }
            }
    }

    private companion object {
        const val SCREEN_CHANNEL = "com.liftwave.liftwave/screen"
        const val HEALTH_RATIONALE_ACTION = "androidx.health.ACTION_SHOW_PERMISSIONS_RATIONALE"
        const val PRIVACY_POLICY_URL = "https://jonaso220.github.io/LiftWave/privacy-policy.html"
    }
}
