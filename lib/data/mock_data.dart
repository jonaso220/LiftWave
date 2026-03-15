import '../models/models.dart';

// ── Exercise library ──────────────────────────────────────────────────────────

final List<Exercise> mockExercises = [

  // ── PECHO ─────────────────────────────────────────────────────────────────

  const Exercise(
    id: 'e_pecho_1',
    name: 'Press de banca',
    muscleGroup: 'Pecho',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Túmbate en un banco plano con los pies apoyados en el suelo. Agarra la barra con un agarre más ancho que los hombros. Baja la barra controladamente hasta rozar el pecho y empuja hasta la extensión completa. Mantén los omóplatos retraídos durante todo el movimiento.',
    secondaryMuscles: ['Tríceps', 'Deltoides anterior'],
    benefits: [
      'Desarrolla masa y fuerza en el pecho',
      'Fortalece los tríceps y hombros anteriores',
      'Ejercicio compuesto de alta transferencia a la fuerza funcional',
    ],
  ),

  const Exercise(
    id: 'e_pecho_2',
    name: 'Press inclinado con mancuernas',
    muscleGroup: 'Pecho',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'Ajusta el banco a 30-45°. Siéntate con una mancuerna en cada mano apoyadas sobre los muslos. Al reclinarte, lleva las mancuernas a la altura del pecho con los codos a 45° del cuerpo. Empuja hacia arriba y adentro hasta casi juntar las mancuernas en la parte superior.',
    secondaryMuscles: ['Tríceps', 'Deltoides anterior'],
    benefits: [
      'Enfatiza la porción clavicular (superior) del pecho',
      'Mayor rango de movimiento que la barra',
      'Permite trabajar cada lado de forma independiente',
    ],
  ),

  const Exercise(
    id: 'e_pecho_3',
    name: 'Aperturas con mancuernas',
    muscleGroup: 'Pecho',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'Túmbate en banco plano con una mancuerna en cada mano, brazos extendidos sobre el pecho y codos ligeramente flexionados. Baja los brazos en arco amplio hasta sentir el estiramiento del pecho, luego vuelve a la posición inicial apretando el pecho en la parte superior.',
    secondaryMuscles: ['Deltoides anterior', 'Bíceps'],
    benefits: [
      'Aislamiento profundo del pectoral mayor',
      'Mejora la elasticidad y el estiramiento del pecho',
      'Ideal para añadir volumen y definición',
    ],
  ),

  const Exercise(
    id: 'e_pecho_4',
    name: 'Fondos en paralelas',
    muscleGroup: 'Pecho',
    equipment: 'Peso corporal',
    difficulty: 'Intermedio',
    description:
        'Sujétate a las barras paralelas con los brazos extendidos. Inclina el torso ligeramente hacia adelante para activar más el pecho. Baja el cuerpo flexionando los codos hasta que los brazos estén paralelos al suelo. Empuja para volver al inicio sin bloquear los codos.',
    secondaryMuscles: ['Tríceps', 'Deltoides anterior'],
    benefits: [
      'Ejercicio compuesto que trabaja pecho, tríceps y hombros',
      'No requiere equipamiento adicional',
      'Se puede progresar añadiendo peso con cinturón',
    ],
  ),

  const Exercise(
    id: 'e_pecho_5',
    name: 'Cruce de poleas',
    muscleGroup: 'Pecho',
    equipment: 'Polea',
    difficulty: 'Principiante',
    description:
        'Coloca las poleas en la posición alta. Agarra los tiradores y da un paso adelante. Con los codos ligeramente flexionados, cruza los brazos hacia adelante y abajo hasta que las manos se junten frente a ti. Contrae el pecho en la posición final y regresa lentamente.',
    secondaryMuscles: ['Deltoides anterior', 'Bíceps'],
    benefits: [
      'Tensión constante a lo largo de todo el rango de movimiento',
      'Excelente para definición y aislamiento del pecho',
      'Múltiples variantes según altura de la polea',
    ],
  ),

  // ── ESPALDA ───────────────────────────────────────────────────────────────

  const Exercise(
    id: 'e_esp_1',
    name: 'Peso muerto',
    muscleGroup: 'Espalda',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Colócate frente a la barra con los pies a la anchura de las caderas. Agárrala con agarre prono o mixto justo por fuera de las rodillas. Mantén la espalda recta y el pecho alto. Empuja el suelo con los pies mientras extiendes caderas y rodillas hasta estar completamente erguido. Baja controladamente.',
    secondaryMuscles: ['Glúteos', 'Isquiotibiales', 'Core', 'Trapecios'],
    benefits: [
      'Ejercicio total del cuerpo que maximiza la fuerza global',
      'Desarrolla la cadena posterior (espalda, glúteos, isquios)',
      'Alta liberación hormonal y efecto anabólico',
    ],
  ),

  const Exercise(
    id: 'e_esp_2',
    name: 'Dominadas',
    muscleGroup: 'Espalda',
    equipment: 'Barra fija',
    difficulty: 'Intermedio',
    description:
        'Cuelga de la barra con agarre prono (palmas hacia afuera) más ancho que los hombros. Activa los omóplatos y tira del cuerpo hacia arriba hasta que la barbilla supere la barra. Baja lentamente con control. Evita el balanceo y mantén el core apretado durante todo el movimiento.',
    secondaryMuscles: ['Bíceps', 'Romboides', 'Core'],
    benefits: [
      'Desarrolla el ancho de la espalda (latissimus dorsi)',
      'Mejora la fuerza relativa al peso corporal',
      'Excelente indicador de rendimiento funcional',
    ],
  ),

  const Exercise(
    id: 'e_esp_3',
    name: 'Remo con barra',
    muscleGroup: 'Espalda',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Con los pies a la anchura de los hombros, inclínate hacia adelante unos 45° manteniendo la espalda neutra. Agarra la barra con agarre prono, un poco más ancho que los hombros. Tira de la barra hacia el abdomen retrayendo los omóplatos. Baja controladamente sin dejar caer el torso.',
    secondaryMuscles: ['Bíceps', 'Romboides', 'Core', 'Glúteos'],
    benefits: [
      'Desarrolla el espesor y grosor de la espalda',
      'Fortalece los músculos posturales',
      'Complemento ideal del press de banca',
    ],
  ),

  const Exercise(
    id: 'e_esp_4',
    name: 'Remo con mancuerna',
    muscleGroup: 'Espalda',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'Apoya la rodilla y la mano del mismo lado en un banco. Con la espalda paralela al suelo y neutra, agarra la mancuerna con la mano libre. Tira de la mancuerna hacia la cadera retrayendo el omóplato. El codo debe pasar rozando el costado. Baja con control completo.',
    secondaryMuscles: ['Bíceps', 'Romboides', 'Core'],
    benefits: [
      'Corrección de desequilibrios entre los dos lados',
      'Mayor rango de movimiento que el remo con barra',
      'Excelente para principiantes por ser fácil de aprender',
    ],
  ),

  const Exercise(
    id: 'e_esp_5',
    name: 'Jalón al pecho',
    muscleGroup: 'Espalda',
    equipment: 'Polea',
    difficulty: 'Principiante',
    description:
        'Siéntate en la máquina de jalón y agarra la barra ancha con agarre prono. Con el torso ligeramente inclinado hacia atrás, tira de la barra hacia el pecho retrayendo los omóplatos y bajando los codos. No te columpiés. Regresa lentamente a la posición inicial con control.',
    secondaryMuscles: ['Bíceps', 'Romboides', 'Core'],
    benefits: [
      'Alternativa a las dominadas para principiantes',
      'Desarrolla el ancho de la espalda',
      'Control del peso fácil y progresión gradual',
    ],
  ),

  // ── PIERNAS ───────────────────────────────────────────────────────────────

  const Exercise(
    id: 'e_pier_1',
    name: 'Sentadilla con barra',
    muscleGroup: 'Piernas',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Coloca la barra sobre los trapecios. Pies a la anchura de los hombros o ligeramente más abiertos. Baja flexionando rodillas y caderas manteniendo el pecho alto y la espalda neutra hasta que los muslos queden paralelos al suelo. Empuja a través de los talones para volver arriba.',
    secondaryMuscles: ['Glúteos', 'Isquiotibiales', 'Core', 'Espalda baja'],
    benefits: [
      'El ejercicio más completo para el tren inferior',
      'Libera más hormonas anabólicas que cualquier otro ejercicio',
      'Mejora la potencia atlética y la funcionalidad',
    ],
  ),

  const Exercise(
    id: 'e_pier_2',
    name: 'Prensa de piernas',
    muscleGroup: 'Piernas',
    equipment: 'Máquina',
    difficulty: 'Principiante',
    description:
        'Siéntate en la máquina con la espalda completamente apoyada. Coloca los pies a la anchura de los hombros en la plataforma. Libera los seguros y baja la plataforma hasta que las rodillas formen ~90°, luego empuja hasta casi la extensión completa sin bloquear las rodillas.',
    secondaryMuscles: ['Glúteos', 'Isquiotibiales'],
    benefits: [
      'Permite trabajar con cargas altas de forma segura',
      'Ideal para principiantes o rehabilitación',
      'Se puede variar la posición de los pies para enfocar distintas zonas',
    ],
  ),

  const Exercise(
    id: 'e_pier_3',
    name: 'Hip thrust',
    muscleGroup: 'Piernas',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Apoya los omóplatos en un banco resistente con la barra sobre las caderas (usa una almohadilla). Pies apoyados en el suelo a la anchura de los hombros. Baja las caderas al suelo y luego empuja hacia arriba apretando los glúteos hasta que las caderas estén paralelas al suelo.',
    secondaryMuscles: ['Isquiotibiales', 'Core', 'Cuádriceps'],
    benefits: [
      'El ejercicio más eficaz para activar y desarrollar los glúteos',
      'Mejora la extensión de cadera y la postura',
      'Reduce el riesgo de lesiones de rodilla y cadera',
    ],
  ),

  const Exercise(
    id: 'e_pier_4',
    name: 'Zancadas',
    muscleGroup: 'Piernas',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'De pie con una mancuerna en cada mano. Da un paso largo hacia adelante y baja la rodilla trasera hasta casi tocar el suelo. La rodilla delantera no debe sobrepasar la punta del pie. Empuja con el talón delantero para volver a la posición inicial. Alterna las piernas.',
    secondaryMuscles: ['Glúteos', 'Isquiotibiales', 'Core'],
    benefits: [
      'Trabaja cada pierna de forma unilateral, corrigiendo desequilibrios',
      'Mejora el equilibrio y la estabilidad',
      'Excelente para el desarrollo de glúteos y cuádriceps',
    ],
  ),

  const Exercise(
    id: 'e_pier_5',
    name: 'Curl de isquiotibiales',
    muscleGroup: 'Piernas',
    equipment: 'Máquina',
    difficulty: 'Principiante',
    description:
        'Túmbate boca abajo en la máquina con los talones bajo el rodillo. Flexiona las rodillas llevando los talones hacia los glúteos en un movimiento controlado. En la posición final aprieta los isquiotibiales. Baja lentamente sin dejar que los pesos descansen.',
    secondaryMuscles: ['Glúteos', 'Gemelos'],
    benefits: [
      'Aislamiento directo de los isquiotibiales',
      'Previene lesiones de tendón de la corva',
      'Equilibra el desarrollo muscular del muslo',
    ],
  ),

  // ── HOMBROS ───────────────────────────────────────────────────────────────

  const Exercise(
    id: 'e_hom_1',
    name: 'Press militar',
    muscleGroup: 'Hombros',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'De pie o sentado, con la barra a la altura de los hombros y agarre prono ligeramente más ancho que ellos. Empuja la barra verticalmente por encima de la cabeza hasta la extensión completa. Baja de forma controlada hasta la posición inicial. Mantén el core activo para proteger la lumbar.',
    secondaryMuscles: ['Tríceps', 'Trapecios', 'Core'],
    benefits: [
      'Desarrolla los tres haces del deltoides',
      'Mejora la fuerza funcional por encima de la cabeza',
      'Fortalece el manguito rotador y la estabilidad del hombro',
    ],
  ),

  const Exercise(
    id: 'e_hom_2',
    name: 'Elevaciones laterales',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'De pie con una mancuerna en cada mano a los costados, palmas hacia dentro. Con los codos ligeramente flexionados, eleva los brazos lateralmente hasta la altura de los hombros. Baja lentamente. Evita balancearte o usar impulso; el movimiento debe ser puro y controlado.',
    secondaryMuscles: ['Trapecios'],
    benefits: [
      'Aislamiento del deltoides lateral para hombros más anchos',
      'Mejora la apariencia de anchura del torso',
      'Bajo riesgo de lesión cuando se usa peso apropiado',
    ],
  ),

  const Exercise(
    id: 'e_hom_3',
    name: 'Face pull',
    muscleGroup: 'Hombros',
    equipment: 'Polea',
    difficulty: 'Principiante',
    description:
        'Coloca la cuerda en la polea alta. Agarra los extremos con las palmas hacia abajo y da un paso atrás. Tira de la cuerda hacia tu cara separando los codos a la altura de los hombros y llevando las manos hacia las orejas. Aprieta los deltoides posteriores en el punto final.',
    secondaryMuscles: ['Romboides', 'Manguito rotador', 'Trapecios'],
    benefits: [
      'Fortalece los deltoides posteriores y mejora la postura',
      'Previene lesiones del manguito rotador',
      'Contrarresta los efectos del trabajo de empuje',
    ],
  ),

  const Exercise(
    id: 'e_hom_4',
    name: 'Press Arnold',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas',
    difficulty: 'Intermedio',
    description:
        'Sentado con las mancuernas frente a ti a la altura de los hombros, palmas hacia ti. Al empujar hacia arriba, rota las palmas hacia afuera de forma que en la cima estén mirando al frente. Baja invirtiendo el movimiento de rotación hasta la posición inicial. Movimiento fluido y continuo.',
    secondaryMuscles: ['Tríceps', 'Trapecios', 'Deltoides anterior'],
    benefits: [
      'Activa los tres haces del deltoides en un solo movimiento',
      'La rotación mejora la movilidad del hombro',
      'Variante más completa que el press de hombros convencional',
    ],
  ),

  // ── BRAZOS ────────────────────────────────────────────────────────────────

  const Exercise(
    id: 'e_bra_1',
    name: 'Curl de bíceps con mancuernas',
    muscleGroup: 'Brazos',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'De pie con una mancuerna en cada mano, brazos extendidos y palmas al frente. Flexiona los codos llevando las mancuernas hacia los hombros sin mover la parte superior del brazo. Aprieta el bíceps en la cima. Baja controladamente hasta la extensión completa.',
    secondaryMuscles: ['Braquial', 'Braquiorradial'],
    benefits: [
      'Aislamiento directo del bíceps braquial',
      'Trabaja cada brazo de forma independiente',
      'Fácil progresión de peso y técnica accesible',
    ],
  ),

  const Exercise(
    id: 'e_bra_2',
    name: 'Curl en barra Z',
    muscleGroup: 'Brazos',
    equipment: 'Barra',
    difficulty: 'Principiante',
    description:
        'De pie con la barra Z en agarre supino a la anchura de los hombros. Mantén los codos pegados a los costados y flexiona hasta llevar la barra a la altura del pecho. Baja controladamente sintiendo el estiramiento completo del bíceps. La barra Z reduce la tensión en las muñecas.',
    secondaryMuscles: ['Braquial', 'Braquiorradial'],
    benefits: [
      'Permite usar más carga que con mancuernas',
      'La barra EZ reduce la tensión en muñecas y codos',
      'Ideal para desarrollar masa global del bíceps',
    ],
  ),

  const Exercise(
    id: 'e_bra_3',
    name: 'Curl martillo',
    muscleGroup: 'Brazos',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'De pie con una mancuerna en cada mano en agarre neutro (palmas enfrentadas, como si sujetaras un martillo). Flexiona los codos alternando o simultáneamente, llevando las mancuernas hacia los hombros. Mantén los codos pegados al cuerpo en todo momento. Baja con control.',
    secondaryMuscles: ['Bíceps', 'Braquiorradial'],
    benefits: [
      'Énfasis en el braquial y braquiorradial',
      'Da grosor y volumen al brazo visto de frente',
      'Menor estrés en las muñecas que el curl supino',
    ],
  ),

  const Exercise(
    id: 'e_bra_4',
    name: 'Extensión de tríceps en polea',
    muscleGroup: 'Brazos',
    equipment: 'Polea',
    difficulty: 'Principiante',
    description:
        'Coloca la cuerda o barra en la polea alta. Agarra el accesorio con los codos flexionados y pegados al torso. Empuja hacia abajo extendiendo los codos completamente sin moverlos. Separa ligeramente las manos al final si usas cuerda. Regresa lentamente resistiendo el peso.',
    secondaryMuscles: ['Anconeo'],
    benefits: [
      'Aislamiento efectivo de los tres haces del tríceps',
      'Tensión constante gracias a la polea',
      'Excelente para definición y acabado del tríceps',
    ],
  ),

  const Exercise(
    id: 'e_bra_5',
    name: 'Press francés',
    muscleGroup: 'Brazos',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Túmbate en banco con la barra Z a brazos extendidos sobre el pecho. Con los codos apuntando al techo, baja la barra hacia la frente flexionando solo los codos. Extiende nuevamente a la posición inicial. Los codos deben permanecer fijos; solo se mueve el antebrazo.',
    secondaryMuscles: ['Anconeo'],
    benefits: [
      'Máximo estiramiento de la cabeza larga del tríceps',
      'Desarrolla el espesor del tríceps',
      'Se puede usar con mancuernas o barra recta',
    ],
  ),

  // ── CORE ──────────────────────────────────────────────────────────────────

  const Exercise(
    id: 'e_core_1',
    name: 'Plancha',
    muscleGroup: 'Core',
    equipment: 'Peso corporal',
    difficulty: 'Principiante',
    description:
        'Apoya los antebrazos y las puntas de los pies en el suelo. Mantén el cuerpo recto como una tabla: cadera sin elevar ni hundir, glúteos apretados y abdomen contraído. Respira de forma constante. Mantén la posición el tiempo objetivo sin comprometer la forma.',
    secondaryMuscles: ['Glúteos', 'Espalda baja', 'Deltoides'],
    benefits: [
      'Fortalece el core profundo sin carga espinal',
      'Mejora la postura y estabilidad lumbar',
      'Reduce el riesgo de lesiones de espalda',
    ],
  ),

  const Exercise(
    id: 'e_core_2',
    name: 'Crunch abdominal',
    muscleGroup: 'Core',
    equipment: 'Peso corporal',
    difficulty: 'Principiante',
    description:
        'Túmbate boca arriba con rodillas flexionadas y pies apoyados. Coloca las manos detrás de la cabeza sin tirar del cuello. Contrae el abdomen elevando los hombros del suelo unos 30° y apretando el recto abdominal en la cima. Baja controladamente sin relajar completamente el abdomen.',
    secondaryMuscles: ['Oblicuos'],
    benefits: [
      'Ejercicio básico de aislamiento del recto abdominal',
      'Fácil de aprender y ejecutar',
      'Base para progresiones de abdominales más exigentes',
    ],
  ),

  const Exercise(
    id: 'e_core_3',
    name: 'Elevación de piernas colgado',
    muscleGroup: 'Core',
    equipment: 'Barra fija',
    difficulty: 'Intermedio',
    description:
        'Cuélgate de la barra con agarre prono a la anchura de los hombros. Con piernas ligeramente flexionadas, eleva las rodillas o piernas hasta la horizontal (o más arriba) contrayendo el abdomen. Baja lentamente sin balancearte. El movimiento debe venir de la flexión de cadera, no del impulso.',
    secondaryMuscles: ['Hip flexors', 'Oblicuos'],
    benefits: [
      'Trabaja el core inferior con alta intensidad',
      'Mejora la fuerza de agarre y de la zona lumbar',
      'Versión progresiva: rodillas dobladas → piernas rectas → L-sit',
    ],
  ),

  const Exercise(
    id: 'e_core_4',
    name: 'Rueda abdominal',
    muscleGroup: 'Core',
    equipment: 'Peso corporal',
    difficulty: 'Intermedio',
    description:
        'Arrodíllate con la rueda frente a ti. Agarra las asas y rueda hacia adelante extendiendo el cuerpo lentamente hasta casi tocar el suelo. Contrae el core para volver a la posición inicial sin hundir la cadera. Mantén la espalda neutra y el abdomen apretado durante todo el movimiento.',
    secondaryMuscles: ['Espalda baja', 'Hombros', 'Dorsal'],
    benefits: [
      'Uno de los ejercicios de core más completos y exigentes',
      'Trabaja el core en extensión, diferente a los abdominales tradicionales',
      'Desarrolla fuerza funcional en toda la cadena anterior',
    ],
  ),
];

// ── Mock workout history ──────────────────────────────────────────────────────

final List<Workout> mockWorkouts = [
  Workout(
    id: 'w1',
    name: 'Empuje - Pecho & Hombros',
    date: DateTime.now().subtract(const Duration(days: 1)),
    duration: const Duration(minutes: 58),
    totalVolume: 8750,
    exercises: [
      const WorkoutExercise(
        id: 'we1',
        name: 'Press de banca',
        muscleGroup: 'Pecho',
        sets: [
          WorkoutSet(setNumber: 1, reps: 10, weight: 80, completed: true),
          WorkoutSet(setNumber: 2, reps: 8, weight: 85, completed: true),
          WorkoutSet(setNumber: 3, reps: 6, weight: 90, completed: true),
          WorkoutSet(setNumber: 4, reps: 6, weight: 90, completed: true),
        ],
      ),
      const WorkoutExercise(
        id: 'we2',
        name: 'Press militar',
        muscleGroup: 'Hombros',
        sets: [
          WorkoutSet(setNumber: 1, reps: 10, weight: 50, completed: true),
          WorkoutSet(setNumber: 2, reps: 8, weight: 55, completed: true),
          WorkoutSet(setNumber: 3, reps: 8, weight: 55, completed: true),
        ],
      ),
      const WorkoutExercise(
        id: 'we3',
        name: 'Fondos en paralelas',
        muscleGroup: 'Pecho',
        sets: [
          WorkoutSet(setNumber: 1, reps: 12, weight: 0, completed: true),
          WorkoutSet(setNumber: 2, reps: 10, weight: 0, completed: true),
          WorkoutSet(setNumber: 3, reps: 9, weight: 0, completed: true),
        ],
      ),
    ],
  ),
  Workout(
    id: 'w2',
    name: 'Piernas - Fuerza',
    date: DateTime.now().subtract(const Duration(days: 3)),
    duration: const Duration(minutes: 72),
    totalVolume: 14200,
    exercises: [
      const WorkoutExercise(
        id: 'we4',
        name: 'Sentadilla con barra',
        muscleGroup: 'Piernas',
        sets: [
          WorkoutSet(setNumber: 1, reps: 8, weight: 100, completed: true),
          WorkoutSet(setNumber: 2, reps: 6, weight: 110, completed: true),
          WorkoutSet(setNumber: 3, reps: 5, weight: 120, completed: true),
          WorkoutSet(setNumber: 4, reps: 5, weight: 120, completed: true),
        ],
      ),
      const WorkoutExercise(
        id: 'we5',
        name: 'Prensa de piernas',
        muscleGroup: 'Piernas',
        sets: [
          WorkoutSet(setNumber: 1, reps: 12, weight: 160, completed: true),
          WorkoutSet(setNumber: 2, reps: 10, weight: 180, completed: true),
          WorkoutSet(setNumber: 3, reps: 10, weight: 180, completed: true),
        ],
      ),
      const WorkoutExercise(
        id: 'we6',
        name: 'Hip thrust',
        muscleGroup: 'Piernas',
        sets: [
          WorkoutSet(setNumber: 1, reps: 12, weight: 80, completed: true),
          WorkoutSet(setNumber: 2, reps: 10, weight: 90, completed: true),
          WorkoutSet(setNumber: 3, reps: 10, weight: 90, completed: true),
        ],
      ),
    ],
  ),
  Workout(
    id: 'w3',
    name: 'Tirón - Espalda & Bíceps',
    date: DateTime.now().subtract(const Duration(days: 5)),
    duration: const Duration(minutes: 65),
    totalVolume: 9800,
    exercises: [
      const WorkoutExercise(
        id: 'we7',
        name: 'Peso muerto',
        muscleGroup: 'Espalda',
        sets: [
          WorkoutSet(setNumber: 1, reps: 5, weight: 120, completed: true),
          WorkoutSet(setNumber: 2, reps: 5, weight: 130, completed: true),
          WorkoutSet(setNumber: 3, reps: 3, weight: 140, completed: true),
        ],
      ),
      const WorkoutExercise(
        id: 'we8',
        name: 'Dominadas',
        muscleGroup: 'Espalda',
        sets: [
          WorkoutSet(setNumber: 1, reps: 10, weight: 0, completed: true),
          WorkoutSet(setNumber: 2, reps: 8, weight: 0, completed: true),
          WorkoutSet(setNumber: 3, reps: 7, weight: 0, completed: true),
        ],
      ),
      const WorkoutExercise(
        id: 'we9',
        name: 'Curl de bíceps con mancuernas',
        muscleGroup: 'Brazos',
        sets: [
          WorkoutSet(setNumber: 1, reps: 12, weight: 16, completed: true),
          WorkoutSet(setNumber: 2, reps: 10, weight: 18, completed: true),
          WorkoutSet(setNumber: 3, reps: 10, weight: 18, completed: true),
        ],
      ),
    ],
  ),
];

// ── Muscle groups & equipment filters ────────────────────────────────────────

const List<String> muscleGroups = [
  'Todos',
  'Pecho',
  'Espalda',
  'Piernas',
  'Hombros',
  'Brazos',
  'Core',
];

const List<String> equipmentList = [
  'Todos',
  'Barra',
  'Mancuernas',
  'Máquina',
  'Polea',
  'Peso corporal',
  'Barra fija',
];
