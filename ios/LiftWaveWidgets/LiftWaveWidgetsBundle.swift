import SwiftUI
import WidgetKit

@main
struct LiftWaveWidgetsBundle: WidgetBundle {
  var body: some Widget {
    LiftWaveHomeWidget()
    if #available(iOS 16.2, *) {
      RestLiveActivity()
    }
  }
}

/// LiftWave's dark palette (lib/theme/app_theme.dart).
enum WidgetPalette {
  static let card = Color(red: 0x1A / 255, green: 0x1A / 255, blue: 0x2E / 255)
  static let track = Color(red: 0x25 / 255, green: 0x25 / 255, blue: 0x40 / 255)
  static let primaryLight = Color(red: 0x9C / 255, green: 0x94 / 255, blue: 0xFF / 255)
  static let accent = Color(red: 0x00 / 255, green: 0xD4 / 255, blue: 0xAA / 255)
  static let textSecondary = Color(red: 0xB0 / 255, green: 0xB0 / 255, blue: 0xCC / 255)
}
