package com.liftwave.liftwave

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.view.View
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider
import java.time.DayOfWeek
import java.time.LocalDate
import java.time.temporal.TemporalAdjusters
import org.json.JSONObject

/// Home-screen widget: today's routine and this week's sessions.
///
/// The app hands over one JSON snapshot (lib/services/home_widget_service.dart)
/// with the routines of every weekday and the days recently trained; "today"
/// and "this week" are worked out here, so the widget stays right on days the
/// app is not opened.
class LiftWaveWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences,
    ) {
        val content = WidgetContent.from(widgetData.getString(DATA_KEY, null), LocalDate.now())
        for (id in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.liftwave_widget)
            views.setOnClickPendingIntent(
                R.id.widget_root,
                HomeWidgetLaunchIntent.getActivity(context, MainActivity::class.java),
            )
            if (content == null) {
                // No account data yet (or signed out): the layout's defaults.
                views.setTextViewText(R.id.widget_label, context.getString(R.string.widget_app_name))
                views.setTextViewText(R.id.widget_headline, context.getString(R.string.widget_open_app))
                views.setViewVisibility(R.id.widget_week, View.GONE)
                views.setViewVisibility(R.id.widget_progress, View.GONE)
            } else {
                views.setTextViewText(R.id.widget_label, content.label)
                views.setTextViewText(R.id.widget_headline, content.headline)
                views.setTextViewText(R.id.widget_week, content.week)
                views.setViewVisibility(R.id.widget_week, View.VISIBLE)
                val target = content.target
                if (target != null) {
                    views.setProgressBar(R.id.widget_progress, target, minOf(content.done, target), false)
                    views.setViewVisibility(R.id.widget_progress, View.VISIBLE)
                } else {
                    views.setViewVisibility(R.id.widget_progress, View.GONE)
                }
            }
            appWidgetManager.updateAppWidget(id, views)
        }
    }

    private companion object {
        const val DATA_KEY = "liftwave_widget"
    }
}

/// What the widget shows on [today], read from the app's snapshot.
internal data class WidgetContent(
    val label: String,
    val headline: String,
    val week: String,
    val done: Int,
    val target: Int?,
) {
    companion object {
        fun from(json: String?, today: LocalDate): WidgetContent? {
            if (json.isNullOrEmpty()) return null
            return try {
                val root = JSONObject(json)
                val labels = root.getJSONObject("labels")
                val routines = root.optJSONObject("routines")
                // 1 = Monday .. 7 = Sunday, the same numbering as Dart.
                val routine = routines?.optString(today.dayOfWeek.value.toString(), "").orEmpty()

                val weekStart = today.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY))
                val workouts = root.optJSONArray("workouts")
                var done = 0
                if (workouts != null) {
                    for (i in 0 until workouts.length()) {
                        val day = runCatching { LocalDate.parse(workouts.getString(i)) }.getOrNull()
                            ?: continue
                        if (!day.isBefore(weekStart) && !day.isAfter(today)) done++
                    }
                }

                val target = if (root.isNull("target")) null else root.optInt("target").takeIf { it > 0 }
                val week = when {
                    target != null -> labels.getString("weekOfTarget")
                        .replace("{done}", done.toString())
                        .replace("{target}", target.toString())
                    done == 1 -> labels.getString("weekOne")
                    else -> labels.getString("weekOther").replace("{count}", done.toString())
                }
                WidgetContent(
                    label = labels.getString("today"),
                    headline = routine.ifEmpty { labels.getString("free") },
                    week = week,
                    done = done,
                    target = target,
                )
            } catch (_: Exception) {
                null
            }
        }
    }
}
