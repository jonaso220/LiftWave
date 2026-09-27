# LiftWave

App de entrenamiento de fuerza hecha con Flutter para iOS (con app de Apple Watch) y Android. Sirve para registrar series rápido en el gimnasio, seguir rutinas por día de la semana y ver el progreso.

## Qué hace

- **Inicio:** una tarjeta "Hoy toca" con un solo botón. Ofrece continuar el entrenamiento en curso, la rutina asignada a hoy o la próxima sesión del plan semanal adaptativo.
- **Entrenar:** rutinas propias agrupadas por día, rutinas predefinidas y sesión libre. Durante el entrenamiento:
  - Columnas SERIE · ANTERIOR · KG/LB · REPS · ✓, con los valores de la última vez.
  - Botones −/+ en la próxima serie a registrar.
  - Sugerencia de progresión según el objetivo, explicada en una frase.
  - Temporizador de descanso por ejercicio, pantalla siempre encendida y sincronización con el Apple Watch.
- **Progreso:** historial, medidas corporales, fotos y logros.
- **Perfil:** plan PRO, preferencias de entrenamiento, apariencia (clara/oscura/automática), unidad de peso (kg/lb) y cuenta.
- **Modo invitado:** se puede usar sin cuenta (cuenta anónima de Firebase) y vincular Google, Apple o email después sin perder datos.
- **Idiomas:** español (plantilla), inglés, alemán, francés, portugués, japonés y coreano.

## Estructura

```
lib/
  main.dart                 Arranque: Firebase, tema, unidad de peso, auth
  navigation/               Barra inferior (Inicio · Entrenar · Progreso · Perfil)
  screens/                  Una carpeta por área (home, train, progress, history, profile, auth, ...)
    train/train_screen.dart   Entrenamiento activo; partes en train_screen_*.dart
  services/                 Lógica sin UI (progresión, plan semanal, "Hoy toca", auth, suscripción, Watch)
  data/                     Stores con caché local y sincronización con Firestore
  models/                   Modelos de datos (los pesos siempre se guardan en kg)
  utils/                    Formatos, unidades kg/lb, localización de ejercicios
  widgets/                  Componentes compartidos (fila de serie, temporizador, selectores)
  l10n/                     Textos en .arb y código generado (lib/l10n/generated)
ios/, android/              Proyectos nativos (canales: com.liftwave.liftwave/watch y /screen)
scripts/play/               Publicación en Google Play (ver scripts/play/README.md)
docs/                       Páginas públicas (privacidad, términos, soporte) y QA
```

## Desarrollo

Requisitos: Flutter estable con Dart `^3.11` (Xcode Cloud usa la versión fijada en `ios/ci_scripts/ci_post_clone.sh`).

```sh
flutter pub get
flutter gen-l10n        # después de editar lib/l10n/*.arb
flutter analyze
flutter test
flutter run
```

- **Textos:** se editan en `lib/l10n/app_*.arb`. La plantilla es `app_es.arb`, y los placeholders se declaran ahí. El código generado se versiona.
- **Pesos:** se guardan siempre en kg. Para mostrarlos o leerlos, usar las funciones de `lib/utils/weight_units.dart` (`formatLoadWithUnit`, `displayToKg`, etc.).
- **Colores:** usar `AppColors` (dependen del tema claro u oscuro). No usar colores fijos para fondos ni textos.
- **iOS:** Xcode Cloud instala los pods con `pod install --deployment`. Si se agrega un plugin con código nativo, hay que regenerar y commitear `ios/Podfile.lock` desde una Mac.

## Configuración externa

- **Firebase** (Auth y Firestore): proyecto `liftwave-6d1fe`. En Authentication tienen que estar habilitados Google, Apple, Email/contraseña y **Anónimo** (modo invitado). Las reglas de Firestore están en `firestore.rules`.
- **Suscripciones:** RevenueCat (`purchases_flutter`).
- **Publicación Android:** GitHub Actions, ver `scripts/play/README.md`. **iOS:** Xcode Cloud.
