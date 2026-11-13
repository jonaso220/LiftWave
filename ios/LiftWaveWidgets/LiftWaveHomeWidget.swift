import SwiftUI
import WidgetKit

/// Home-screen widget: today's routine and this week's sessions.
///
/// The app hands over one JSON snapshot (lib/services/home_widget_service.dart)
/// with the routines of every weekday and the days recently trained; "today"
/// and "this week" are worked out here, so the widget stays right on days the
/// app is not opened.
struct LiftWaveHomeWidget: Widget {
  /// Must match `_iosKind` in lib/services/home_widget_service.dart.
  static let kind = "LiftWaveHomeWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: Self.kind, provider: HomeWidgetProvider()) { entry in
      HomeWidgetView(entry: entry)
    }
    .configurationDisplayName("LiftWave")
    .description(WidgetText.description)
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}

struct HomeWidgetEntry: TimelineEntry {
  let date: Date
  let content: HomeWidgetContent?
}

struct HomeWidgetProvider: TimelineProvider {
  func placeholder(in context: Context) -> HomeWidgetEntry {
    HomeWidgetEntry(date: Date(), content: nil)
  }

  func getSnapshot(in context: Context, completion: @escaping (HomeWidgetEntry) -> Void) {
    completion(entry(at: Date()))
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<HomeWidgetEntry>) -> Void) {
    let now = Date()
    let calendar = Calendar.current
    // "Today" changes at midnight whether or not the app runs.
    let midnight = calendar.nextDate(
      after: now, matching: DateComponents(hour: 0, minute: 0, second: 5),
      matchingPolicy: .nextTime) ?? now.addingTimeInterval(6 * 3600)
    completion(Timeline(entries: [entry(at: now)], policy: .after(midnight)))
  }

  private func entry(at date: Date) -> HomeWidgetEntry {
    HomeWidgetEntry(date: date, content: HomeWidgetContent.load(today: date))
  }
}

/// What the widget shows on a given day, read from the app's snapshot.
struct HomeWidgetContent {
  let label: String
  let headline: String
  let week: String
  let done: Int
  let target: Int?

  /// Must match `PluginHomeWidgetGateway` in lib/services/home_widget_service.dart.
  static let appGroup = "group.com.liftwave.liftwave"
  static let dataKey = "liftwave_widget"

  static func load(today: Date) -> HomeWidgetContent? {
    guard let json = UserDefaults(suiteName: appGroup)?.string(forKey: dataKey) else {
      return nil
    }
    return parse(json, today: today)
  }

  static func parse(_ json: String, today: Date, calendar: Calendar = .current) -> HomeWidgetContent? {
    guard let data = json.data(using: .utf8),
      let root = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
      let labels = root["labels"] as? [String: String],
      let todayLabel = labels["today"],
      let free = labels["free"]
    else { return nil }

    // Calendar: 1 = Sunday .. 7 = Saturday. The snapshot uses Dart's
    // 1 = Monday .. 7 = Sunday.
    let weekday = (calendar.component(.weekday, from: today) + 5) % 7 + 1
    let routines = root["routines"] as? [String: String] ?? [:]
    let routine = routines[String(weekday)] ?? ""

    let startOfToday = calendar.startOfDay(for: today)
    let weekStart = calendar.date(byAdding: .day, value: -(weekday - 1), to: startOfToday) ?? startOfToday
    let formatter = DateFormatter()
    formatter.calendar = Calendar(identifier: .gregorian)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = calendar.timeZone
    formatter.dateFormat = "yyyy-MM-dd"
    var done = 0
    for day in root["workouts"] as? [String] ?? [] {
      guard let date = formatter.date(from: day) else { continue }
      if date >= weekStart && date <= today { done += 1 }
    }

    let target = (root["target"] as? Int).flatMap { $0 > 0 ? $0 : nil }
    let week: String
    if let target {
      week = (labels["weekOfTarget"] ?? "{done}/{target}")
        .replacingOccurrences(of: "{done}", with: String(done))
        .replacingOccurrences(of: "{target}", with: String(target))
    } else if done == 1 {
      week = labels["weekOne"] ?? "1"
    } else {
      week = (labels["weekOther"] ?? "{count}")
        .replacingOccurrences(of: "{count}", with: String(done))
    }
    return HomeWidgetContent(
      label: todayLabel,
      headline: routine.isEmpty ? free : routine,
      week: week,
      done: done,
      target: target)
  }
}

struct HomeWidgetView: View {
  let entry: HomeWidgetEntry

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text((entry.content?.label ?? "LiftWave").uppercased())
        .font(.system(size: 11, weight: .bold))
        .kerning(0.6)
        .foregroundColor(WidgetPalette.primaryLight)
        .lineLimit(1)
      Text(entry.content?.headline ?? WidgetText.openApp)
        .font(.system(size: 18, weight: .bold))
        .foregroundColor(.white)
        .lineLimit(3)
        .minimumScaleFactor(0.8)
      Spacer(minLength: 0)
      if let content = entry.content {
        Text(content.week)
          .font(.system(size: 12))
          .foregroundColor(WidgetPalette.textSecondary)
          .lineLimit(1)
          .minimumScaleFactor(0.8)
        if let target = content.target {
          ProgressView(value: Double(min(content.done, target)), total: Double(target))
            .progressViewStyle(.linear)
            .tint(WidgetPalette.accent)
        }
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .widgetCard()
  }
}

extension View {
  /// The widget's dark card, the way each iOS version wants it declared.
  @ViewBuilder
  func widgetCard() -> some View {
    if #available(iOS 17.0, *) {
      containerBackground(WidgetPalette.card, for: .widget)
    } else {
      padding(14).background(WidgetPalette.card)
    }
  }
}

/// The two sentences the widget needs before the app has handed it any
/// wording of its own (everything else arrives already translated).
enum WidgetText {
  private static var language: String {
    String((Locale.preferredLanguages.first ?? "en").prefix(2))
  }

  static var openApp: String {
    switch language {
    case "es": return "Abre LiftWave para empezar"
    case "pt": return "Abra o LiftWave para começar"
    case "de": return "Öffne LiftWave, um zu starten"
    case "fr": return "Ouvrez LiftWave pour commencer"
    case "ja": return "LiftWaveを開いて始めましょう"
    case "ko": return "LiftWave를 열어 시작하세요"
    default: return "Open LiftWave to start"
    }
  }

  static var description: String {
    switch language {
    case "es": return "La rutina de hoy y las sesiones de la semana"
    case "pt": return "A rotina de hoje e os treinos da semana"
    case "de": return "Die heutige Routine und die Trainings der Woche"
    case "fr": return "La routine du jour et les séances de la semaine"
    case "ja": return "今日のルーティンと今週のトレーニング"
    case "ko": return "오늘의 루틴과 이번 주 운동"
    default: return "Today's routine and this week's sessions"
    }
  }
}
