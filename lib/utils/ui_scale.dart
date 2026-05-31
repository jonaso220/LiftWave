/// Multiplier used to size the UI on wide (desktop / tablet) windows.
///
/// The app is laid out for phone widths, so on a large Mac/iPad window it
/// reads tiny. [main] applies this factor to the text via `textScaler`;
/// fixed-size chrome that `textScaler` can't reach (nav-bar icons, bar
/// height, etc.) should multiply its dimensions by this same factor so it
/// grows in step with the labels. Phones (< 850 logical px) stay at 1.0.
double uiScaleForWidth(double width) {
  if (width >= 1400) return 1.4;
  if (width >= 1100) return 1.3;
  if (width >= 850) return 1.18;
  return 1.0;
}
