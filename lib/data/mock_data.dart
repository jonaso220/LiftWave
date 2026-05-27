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

  // ── PECHO (extensión) ─────────────────────────────────────────────────────

  const Exercise(
    id: 'e_pecho_6',
    name: 'Press inclinado con barra',
    muscleGroup: 'Pecho',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Ajusta el banco a 30-45°. Agarra la barra con un agarre algo más ancho que los hombros. Baja la barra controladamente hasta la parte alta del pecho y empuja hacia arriba hasta extensión completa. Mantén la zona lumbar pegada al banco y los omóplatos retraídos.',
    secondaryMuscles: ['Deltoides anterior', 'Tríceps'],
    benefits: [
      'Enfatiza el pectoral superior (porción clavicular)',
      'Permite cargar más peso que con mancuernas',
      'Mejora la fuerza de empuje desde ángulos elevados',
    ],
  ),

  const Exercise(
    id: 'e_pecho_7',
    name: 'Press declinado con mancuernas',
    muscleGroup: 'Pecho',
    equipment: 'Mancuernas',
    difficulty: 'Intermedio',
    description:
        'Ajusta el banco a una declinación de 15-30°. Con una mancuerna en cada mano a la altura del pecho, empuja hacia arriba juntando las mancuernas en la parte superior. Baja con control sintiendo el estiramiento de la porción inferior del pecho.',
    secondaryMuscles: ['Tríceps', 'Deltoides anterior'],
    benefits: [
      'Trabaja la porción inferior del pectoral',
      'Reduce la implicación de los hombros',
      'Mayor rango que el press declinado con barra',
    ],
  ),

  const Exercise(
    id: 'e_pecho_8',
    name: 'Flexiones',
    muscleGroup: 'Pecho',
    equipment: 'Peso corporal',
    difficulty: 'Principiante',
    description:
        'Apoya las manos en el suelo a la anchura de los hombros y los pies juntos. Mantén el cuerpo recto desde la cabeza hasta los talones. Baja flexionando los codos hasta casi rozar el pecho con el suelo y empuja de vuelta. Mantén el core apretado durante todo el movimiento.',
    secondaryMuscles: ['Tríceps', 'Deltoides anterior', 'Core'],
    benefits: [
      'No requiere equipamiento',
      'Múltiples variantes para progresar (diamante, declinadas, palmada)',
      'Ejercicio compuesto que también fortalece el core',
    ],
  ),

  const Exercise(
    id: 'e_pecho_9',
    name: 'Pullover con mancuerna',
    muscleGroup: 'Pecho',
    equipment: 'Mancuernas',
    difficulty: 'Intermedio',
    description:
        'Túmbate en banco plano sosteniendo una mancuerna con ambas manos sobre el pecho, brazos extendidos. Baja la mancuerna en arco por encima de la cabeza hasta sentir el estiramiento del pecho y los dorsales. Vuelve a la posición inicial contrayendo el pecho.',
    secondaryMuscles: ['Dorsal', 'Tríceps'],
    benefits: [
      'Trabaja simultáneamente pecho y dorsales',
      'Mejora la movilidad de hombros y caja torácica',
      'Excelente complemento entre series de press y remos',
    ],
  ),

  // ── ESPALDA (extensión) ───────────────────────────────────────────────────

  const Exercise(
    id: 'e_esp_6',
    name: 'Remo en T',
    muscleGroup: 'Espalda',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Posiciónate sobre la barra en T con los pies a la anchura de los hombros. Inclínate hacia adelante manteniendo la espalda neutra y tira de las asas hacia el pecho llevando los codos atrás. Aprieta los omóplatos en la posición final y baja con control.',
    secondaryMuscles: ['Trapecios', 'Bíceps', 'Romboides'],
    benefits: [
      'Desarrolla el grosor de la espalda media',
      'Permite cargas muy altas con menor estrés lumbar que el remo libre',
      'Trabaja la postura y la estabilidad escapular',
    ],
  ),

  const Exercise(
    id: 'e_esp_7',
    name: 'Remo bajo en polea',
    muscleGroup: 'Espalda',
    equipment: 'Polea',
    difficulty: 'Principiante',
    description:
        'Siéntate frente a la polea baja con los pies apoyados. Agarra el accesorio con los brazos extendidos y la espalda neutra. Tira de las manos hacia el abdomen retrayendo los omóplatos y manteniendo el torso erguido. Regresa controladamente sin redondear la espalda.',
    secondaryMuscles: ['Bíceps', 'Trapecios', 'Romboides'],
    benefits: [
      'Tensión constante a lo largo del movimiento',
      'Fácil progresión de peso y técnica accesible',
      'Excelente para desarrollar grosor de espalda media',
    ],
  ),

  const Exercise(
    id: 'e_esp_8',
    name: 'Encogimientos con mancuernas',
    muscleGroup: 'Espalda',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'De pie con una mancuerna en cada mano a los costados, brazos relajados. Eleva los hombros hacia las orejas sin doblar los codos. Mantén la contracción 1 segundo en la cima y baja lentamente. No rotes los hombros, el movimiento es puramente vertical.',
    secondaryMuscles: ['Trapecios'],
    benefits: [
      'Aislamiento directo del trapecio superior',
      'Mejora la postura y la apariencia del cuello',
      'Fortalece la estabilidad escapular para otros levantamientos',
    ],
  ),

  const Exercise(
    id: 'e_esp_9',
    name: 'Good morning',
    muscleGroup: 'Espalda',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Coloca la barra sobre los trapecios como en una sentadilla. Con los pies a la anchura de las caderas y rodillas ligeramente flexionadas, inclínate hacia adelante desde las caderas manteniendo la espalda neutra. Baja hasta que el torso esté casi paralelo al suelo y vuelve apretando glúteos.',
    secondaryMuscles: ['Isquiotibiales', 'Glúteos', 'Espalda baja'],
    benefits: [
      'Fortalece la cadena posterior y la zona lumbar',
      'Mejora la bisagra de cadera para peso muerto y sentadilla',
      'Trabajo accesorio clave para powerlifting',
    ],
  ),

  // ── PIERNAS (extensión) ───────────────────────────────────────────────────

  const Exercise(
    id: 'e_pier_6',
    name: 'Sentadilla frontal',
    muscleGroup: 'Piernas',
    equipment: 'Barra',
    difficulty: 'Avanzado',
    description:
        'Coloca la barra sobre los deltoides frontales, codos altos y agarre cruzado o limpio. Pies a la anchura de los hombros. Baja manteniendo el torso vertical y los codos al frente hasta que los muslos pasen la paralela. Empuja con los talones para volver a la posición inicial.',
    secondaryMuscles: ['Glúteos', 'Core', 'Espalda alta'],
    benefits: [
      'Enfatiza más los cuádriceps que la sentadilla trasera',
      'Exige un core muy fuerte y postura erguida',
      'Base técnica para clean y thruster en CrossFit',
    ],
  ),

  const Exercise(
    id: 'e_pier_7',
    name: 'Sentadilla búlgara',
    muscleGroup: 'Piernas',
    equipment: 'Mancuernas',
    difficulty: 'Intermedio',
    description:
        'Coloca el empeine del pie de atrás sobre un banco, sosteniendo una mancuerna en cada mano. Con el pie delantero adelantado, baja flexionando la rodilla delantera hasta que el muslo esté paralelo al suelo. Empuja a través del talón delantero para volver arriba.',
    secondaryMuscles: ['Glúteos', 'Isquiotibiales', 'Core'],
    benefits: [
      'Trabajo unilateral que corrige desequilibrios entre piernas',
      'Activación intensa de glúteos y cuádriceps',
      'Mejora el equilibrio y la estabilidad de cadera',
    ],
  ),

  const Exercise(
    id: 'e_pier_8',
    name: 'Peso muerto rumano',
    muscleGroup: 'Piernas',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'De pie con la barra a la altura de las caderas, agarre prono a la anchura de los hombros. Con las rodillas ligeramente flexionadas y fijas, desliza la barra por las piernas inclinando el torso desde las caderas hasta sentir tensión en isquios. Vuelve apretando glúteos.',
    secondaryMuscles: ['Glúteos', 'Espalda baja'],
    benefits: [
      'Aislamiento intenso de isquiotibiales y glúteos',
      'Fortalece la cadena posterior y mejora la bisagra de cadera',
      'Reduce el riesgo de lesiones de isquios al correr o saltar',
    ],
  ),

  const Exercise(
    id: 'e_pier_9',
    name: 'Extensión de cuádriceps',
    muscleGroup: 'Piernas',
    equipment: 'Máquina',
    difficulty: 'Principiante',
    description:
        'Siéntate en la máquina con la espalda apoyada y el rodillo sobre el empeine. Extiende las rodillas levantando el peso hasta que las piernas estén casi rectas, sin bloquear las rodillas. Aprieta los cuádriceps en la cima y baja con control.',
    secondaryMuscles: ['Cuádriceps'],
    benefits: [
      'Aislamiento directo del cuádriceps',
      'Útil para rehabilitación y trabajo de hipertrofia focalizado',
      'Ajuste de carga preciso y de bajo riesgo',
    ],
  ),

  const Exercise(
    id: 'e_pier_10',
    name: 'Elevación de talones',
    muscleGroup: 'Piernas',
    equipment: 'Máquina',
    difficulty: 'Principiante',
    description:
        'Coloca los hombros bajo las almohadillas de la máquina de gemelos (o usa una mancuerna de pie). Apoya las puntas de los pies en una plataforma con los talones colgando. Sube empujando las puntas y aprieta los gemelos en la cima. Baja lentamente sintiendo el estiramiento.',
    secondaryMuscles: ['Gemelos'],
    benefits: [
      'Aislamiento del sóleo y gemelos',
      'Mejora la potencia en saltos y sprints',
      'Reduce el riesgo de lesiones en tobillo y tendón de Aquiles',
    ],
  ),

  // ── HOMBROS (extensión) ───────────────────────────────────────────────────

  const Exercise(
    id: 'e_hom_5',
    name: 'Press de hombros con mancuernas',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'Sentado con respaldo recto, sostén una mancuerna a cada lado de los hombros, palmas hacia adelante. Empuja las mancuernas hacia arriba hasta casi juntarlas por encima de la cabeza, sin bloquear los codos. Baja con control hasta la posición inicial.',
    secondaryMuscles: ['Tríceps', 'Trapecios'],
    benefits: [
      'Mayor rango de movimiento que el press con barra',
      'Permite trabajar cada lado de forma independiente',
      'Reduce el estrés en hombros respecto a la barra',
    ],
  ),

  const Exercise(
    id: 'e_hom_6',
    name: 'Elevaciones frontales',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'De pie con una mancuerna en cada mano frente a los muslos, palmas hacia el cuerpo. Eleva los brazos alternados o simultáneamente al frente hasta la altura de los hombros, manteniendo los codos casi extendidos. Baja lentamente sin balancearse.',
    secondaryMuscles: ['Deltoides anterior'],
    benefits: [
      'Aislamiento del deltoides anterior',
      'Mejora la apariencia frontal del hombro',
      'Trabajo accesorio de press de banca y press militar',
    ],
  ),

  const Exercise(
    id: 'e_hom_7',
    name: 'Pájaros con mancuernas',
    muscleGroup: 'Hombros',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'Inclínate hacia adelante desde la cadera con el torso casi paralelo al suelo, mancuerna en cada mano y brazos colgando. Eleva los brazos lateralmente hasta la altura de los hombros, codos ligeramente flexionados. Aprieta el deltoides posterior arriba y baja con control.',
    secondaryMuscles: ['Trapecios', 'Romboides'],
    benefits: [
      'Aislamiento del deltoides posterior, área clave para postura',
      'Contrarresta los efectos del trabajo de empuje',
      'Reduce el riesgo de lesiones del manguito rotador',
    ],
  ),

  // ── BRAZOS (extensión) ────────────────────────────────────────────────────

  const Exercise(
    id: 'e_bra_6',
    name: 'Curl predicador',
    muscleGroup: 'Brazos',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Siéntate en el banco predicador con los brazos apoyados sobre la almohadilla. Agarra la barra (recta o Z) con agarre supino. Flexiona los codos llevando la barra hacia los hombros, controlando el movimiento. Baja lentamente sin bloquear los codos al final.',
    secondaryMuscles: ['Bíceps', 'Braquial'],
    benefits: [
      'Aísla el bíceps al inmovilizar el hombro',
      'Imposibilita usar impulso, técnica estricta',
      'Excelente para la contracción máxima del bíceps',
    ],
  ),

  const Exercise(
    id: 'e_bra_7',
    name: 'Curl concentrado',
    muscleGroup: 'Brazos',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'Siéntate en un banco con las piernas abiertas. Apoya el codo del brazo de trabajo contra la cara interna del muslo, mancuerna colgando. Flexiona el codo llevando la mancuerna hacia el hombro, aislando el bíceps. Aprieta arriba y baja con control.',
    secondaryMuscles: ['Braquial'],
    benefits: [
      'Aislamiento puro del bíceps con máxima contracción',
      'Permite enfocarse en la conexión mente-músculo',
      'Ideal como ejercicio final del entreno de brazos',
    ],
  ),

  const Exercise(
    id: 'e_bra_8',
    name: 'Press cerrado de banca',
    muscleGroup: 'Brazos',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Túmbate en banco plano y agarra la barra con un agarre cerrado a la anchura de los hombros. Baja la barra controladamente hasta rozar el esternón manteniendo los codos pegados al cuerpo. Empuja hacia arriba enfatizando la extensión de tríceps.',
    secondaryMuscles: ['Tríceps', 'Pecho'],
    benefits: [
      'Ejercicio compuesto que enfatiza los tríceps',
      'Permite cargar más peso que un aislamiento de tríceps',
      'Transfiere a fuerza en press de banca y press militar',
    ],
  ),

  const Exercise(
    id: 'e_bra_9',
    name: 'Fondos en banco',
    muscleGroup: 'Brazos',
    equipment: 'Peso corporal',
    difficulty: 'Principiante',
    description:
        'Apoya las manos en un banco a tu espalda con los dedos hacia adelante. Extiende las piernas frente a ti apoyando los talones (o con rodillas flexionadas para facilitar). Baja flexionando los codos hacia atrás hasta 90° y empuja para subir.',
    secondaryMuscles: ['Tríceps', 'Deltoides anterior'],
    benefits: [
      'Aislamiento del tríceps sin necesidad de equipamiento',
      'Fácil de progresar añadiendo peso en el regazo',
      'Mejora la fuerza de empuje desde posiciones detrás del cuerpo',
    ],
  ),

  // ── CORE (extensión) ──────────────────────────────────────────────────────

  const Exercise(
    id: 'e_core_5',
    name: 'Russian twists',
    muscleGroup: 'Core',
    equipment: 'Peso corporal',
    difficulty: 'Principiante',
    description:
        'Sentado en el suelo con las rodillas flexionadas y los pies elevados o apoyados, inclínate hacia atrás 45°. Junta las manos (o sostén un peso) y gira el torso de lado a lado tocando el suelo o llevando el peso a cada lateral. Mantén el core apretado.',
    secondaryMuscles: ['Oblicuos', 'Hip flexors'],
    benefits: [
      'Aislamiento directo de los oblicuos',
      'Mejora la rotación del torso, clave en deportes',
      'Se puede progresar añadiendo peso (mancuerna, disco, balón)',
    ],
  ),

  const Exercise(
    id: 'e_core_6',
    name: 'Mountain climbers',
    muscleGroup: 'Core',
    equipment: 'Peso corporal',
    difficulty: 'Principiante',
    description:
        'Adopta la posición de plancha alta con las manos bajo los hombros. Lleva una rodilla hacia el pecho de forma alternada y rápida, como si corrieras en el sitio. Mantén la cadera baja y el core apretado durante todo el movimiento.',
    secondaryMuscles: ['Hip flexors', 'Hombros', 'Cuádriceps'],
    benefits: [
      'Combina trabajo de core con cardio',
      'No requiere equipamiento, ideal para HIIT',
      'Mejora la coordinación y la resistencia',
    ],
  ),

  const Exercise(
    id: 'e_core_7',
    name: 'Hollow hold',
    muscleGroup: 'Core',
    equipment: 'Peso corporal',
    difficulty: 'Intermedio',
    description:
        'Túmbate boca arriba con brazos extendidos por encima de la cabeza y piernas estiradas. Eleva ligeramente los brazos y las piernas del suelo, llevando la zona lumbar contra el suelo. Mantén la posición de "barco" con el core completamente contraído.',
    secondaryMuscles: ['Hip flexors', 'Cuádriceps'],
    benefits: [
      'Base gimnástica para muchos movimientos de CrossFit',
      'Fortalece el core en su totalidad de forma isométrica',
      'Mejora la postura y la fuerza para dominadas estrictas',
    ],
  ),

  const Exercise(
    id: 'e_core_8',
    name: 'Plancha lateral',
    muscleGroup: 'Core',
    equipment: 'Peso corporal',
    difficulty: 'Principiante',
    description:
        'Túmbate de lado con el antebrazo apoyado y el codo bajo el hombro. Eleva la cadera del suelo formando una línea recta desde los pies hasta la cabeza. Mantén la posición sin que la cadera se hunda. Repite del otro lado.',
    secondaryMuscles: ['Oblicuos', 'Glúteos'],
    benefits: [
      'Aislamiento intenso de oblicuos y core lateral',
      'Mejora la estabilidad de cadera y columna',
      'Sin equipamiento y bajo impacto',
    ],
  ),

  const Exercise(
    id: 'e_core_9',
    name: 'Dead bug',
    muscleGroup: 'Core',
    equipment: 'Peso corporal',
    difficulty: 'Principiante',
    description:
        'Túmbate boca arriba con brazos extendidos hacia el techo y rodillas flexionadas a 90° sobre las caderas. Baja simultáneamente el brazo derecho por detrás de la cabeza y la pierna izquierda extendida hacia el suelo. Vuelve y alterna lados manteniendo la zona lumbar pegada al suelo.',
    secondaryMuscles: ['Hip flexors'],
    benefits: [
      'Mejora la estabilidad anti-extensión del core',
      'Excelente para principiantes y rehabilitación lumbar',
      'Trabaja la coordinación contralateral',
    ],
  ),

  // ── CROSSFIT / FUNCIONAL ──────────────────────────────────────────────────

  const Exercise(
    id: 'e_cf_1',
    name: 'Cargada (Clean)',
    muscleGroup: 'CrossFit',
    equipment: 'Barra',
    difficulty: 'Avanzado',
    description:
        'Desde el suelo, agarra la barra con agarre prono justo por fuera de las rodillas. Tira explosivamente extendiendo caderas y rodillas, encoge los hombros y desliza el cuerpo bajo la barra recibiéndola en sentadilla frontal con los codos altos. Levántate completando el lift.',
    secondaryMuscles: ['Piernas', 'Espalda', 'Hombros', 'Trapecios'],
    benefits: [
      'Levantamiento olímpico completo de potencia explosiva',
      'Desarrolla coordinación, velocidad y fuerza simultáneamente',
      'Base de muchos WODs de CrossFit',
    ],
  ),

  const Exercise(
    id: 'e_cf_2',
    name: 'Power Clean',
    muscleGroup: 'CrossFit',
    equipment: 'Barra',
    difficulty: 'Avanzado',
    description:
        'Igual que el Clean pero sin recibir en sentadilla completa: recibes la barra en cuarto de sentadilla con codos altos y la frontal en los hombros. Más rápido y menos exigente de movilidad que el Clean.',
    secondaryMuscles: ['Piernas', 'Espalda', 'Trapecios'],
    benefits: [
      'Desarrolla potencia explosiva de la cadena posterior',
      'Más accesible técnicamente que el Clean completo',
      'Excelente para principiantes en lifts olímpicos',
    ],
  ),

  const Exercise(
    id: 'e_cf_3',
    name: 'Arrancada (Snatch)',
    muscleGroup: 'CrossFit',
    equipment: 'Barra',
    difficulty: 'Avanzado',
    description:
        'Desde el suelo, agarra la barra con agarre muy ancho. Tira explosivamente y recibe la barra por encima de la cabeza con los brazos extendidos en una sentadilla profunda (overhead squat). Levántate manteniendo la barra arriba.',
    secondaryMuscles: ['Piernas', 'Espalda', 'Hombros', 'Core'],
    benefits: [
      'El lift olímpico más completo y técnicamente exigente',
      'Desarrolla potencia, movilidad y estabilidad simultáneamente',
      'Quema más calorías que casi cualquier otro ejercicio',
    ],
  ),

  const Exercise(
    id: 'e_cf_4',
    name: 'Power Snatch',
    muscleGroup: 'CrossFit',
    equipment: 'Barra',
    difficulty: 'Avanzado',
    description:
        'Igual que el Snatch pero recibiendo la barra en cuarto de sentadilla con los brazos extendidos por encima de la cabeza. Más rápido y menos exigente de movilidad de tobillos y caderas.',
    secondaryMuscles: ['Piernas', 'Espalda', 'Hombros'],
    benefits: [
      'Más accesible que el Snatch completo',
      'Desarrolla potencia explosiva de cadena posterior',
      'Excelente para movilidad y coordinación',
    ],
  ),

  const Exercise(
    id: 'e_cf_5',
    name: 'Thruster',
    muscleGroup: 'CrossFit',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Sostén la barra en posición frontal (sobre los deltoides delanteros). Realiza una sentadilla frontal completa y, al subir, usa el impulso de las piernas para empujar la barra por encima de la cabeza con los brazos extendidos. Baja la barra a la posición frontal y repite.',
    secondaryMuscles: ['Piernas', 'Hombros', 'Tríceps', 'Core'],
    benefits: [
      'Trabaja todo el cuerpo en un solo movimiento',
      'Ejercicio estrella de WODs como "Fran"',
      'Combina fuerza y resistencia metabólica',
    ],
  ),

  const Exercise(
    id: 'e_cf_6',
    name: 'Push Press',
    muscleGroup: 'CrossFit',
    equipment: 'Barra',
    difficulty: 'Intermedio',
    description:
        'Con la barra en posición frontal sobre los hombros, realiza un dip rápido flexionando ligeramente las rodillas. Extiende explosivamente las piernas para impulsar la barra por encima de la cabeza hasta los brazos extendidos. Baja con control a la posición inicial.',
    secondaryMuscles: ['Hombros', 'Tríceps', 'Piernas'],
    benefits: [
      'Permite mover más peso que el press militar estricto',
      'Desarrolla potencia de empuje vertical',
      'Transfiere a Jerk y otros lifts olímpicos',
    ],
  ),

  const Exercise(
    id: 'e_cf_7',
    name: 'Push Jerk',
    muscleGroup: 'CrossFit',
    equipment: 'Barra',
    difficulty: 'Avanzado',
    description:
        'Igual que el Push Press pero al impulsar la barra arriba, sueltas las piernas para recibir la barra en cuarto de sentadilla con los brazos ya extendidos. Después, levántate completando el lift. Permite cargar más peso que el Push Press.',
    secondaryMuscles: ['Hombros', 'Tríceps', 'Piernas', 'Core'],
    benefits: [
      'Mueve más peso por encima de la cabeza que cualquier press',
      'Lift olímpico técnico y de alta potencia',
      'Componente del Clean & Jerk',
    ],
  ),

  const Exercise(
    id: 'e_cf_8',
    name: 'Wall Balls',
    muscleGroup: 'CrossFit',
    equipment: 'Pelota',
    difficulty: 'Principiante',
    description:
        'De pie con un balón medicinal frente al pecho, mirando a una pared. Realiza una sentadilla profunda y al subir lanza la pelota hacia un objetivo alto en la pared (~3 m). Atrapa la pelota a la altura del pecho y desciende inmediatamente a la siguiente sentadilla.',
    secondaryMuscles: ['Piernas', 'Hombros', 'Core'],
    benefits: [
      'Ejercicio cardiovascular y de potencia simultáneo',
      'Movimiento estándar en muchos benchmarks de CrossFit',
      'Trabaja la coordinación y el ritmo',
    ],
  ),

  const Exercise(
    id: 'e_cf_9',
    name: 'Kettlebell Swing americano',
    muscleGroup: 'CrossFit',
    equipment: 'Kettlebell',
    difficulty: 'Intermedio',
    description:
        'De pie con la kettlebell colgando entre las piernas con ambas manos. Bisagra de cadera para llevarla atrás y extiende explosivamente las caderas para impulsarla por encima de la cabeza con los brazos extendidos. La fuerza viene de la cadera, no de los brazos.',
    secondaryMuscles: ['Glúteos', 'Espalda', 'Hombros', 'Core'],
    benefits: [
      'Desarrolla potencia explosiva de cadera',
      'Cardio y fuerza en un solo movimiento',
      'Estándar en CrossFit (los rusos van solo hasta el pecho)',
    ],
  ),

  const Exercise(
    id: 'e_cf_10',
    name: 'Kettlebell Swing ruso',
    muscleGroup: 'CrossFit',
    equipment: 'Kettlebell',
    difficulty: 'Principiante',
    description:
        'Idéntico al swing americano pero la kettlebell solo se eleva hasta la altura del pecho/ojos, no por encima de la cabeza. Más fácil técnicamente y de menor estrés en hombros.',
    secondaryMuscles: ['Glúteos', 'Espalda', 'Core'],
    benefits: [
      'Punto de entrada al trabajo con kettlebell',
      'Menos estrés de hombro que el swing americano',
      'Ideal para principiantes y altas repeticiones',
    ],
  ),

  const Exercise(
    id: 'e_cf_11',
    name: 'Box Jumps',
    muscleGroup: 'CrossFit',
    equipment: 'Cajón',
    difficulty: 'Principiante',
    description:
        'Frente a un cajón o plataforma estable, flexiona las rodillas y salta sobre el cajón aterrizando con los pies completamente sobre la superficie. Extiende caderas y rodillas en la cima. Baja saltando o paso a paso para reducir impacto.',
    secondaryMuscles: ['Piernas', 'Glúteos', 'Core'],
    benefits: [
      'Pliometría pura para desarrollar potencia',
      'Mejora el salto vertical y la explosividad',
      'Componente clásico de muchos WODs',
    ],
  ),

  const Exercise(
    id: 'e_cf_12',
    name: 'Burpees',
    muscleGroup: 'CrossFit',
    equipment: 'Peso corporal',
    difficulty: 'Principiante',
    description:
        'De pie, agáchate y apoya las manos en el suelo. Salta con los pies hacia atrás hasta la posición de plancha. Realiza una flexión tocando el pecho al suelo. Salta con los pies de vuelta hacia las manos y salta vertical extendiendo los brazos arriba.',
    secondaryMuscles: ['Pecho', 'Piernas', 'Hombros', 'Core'],
    benefits: [
      'Ejercicio full-body sin equipamiento',
      'Cardio intenso y trabajo de fuerza simultáneo',
      'Estándar de benchmarks como "Murph" y muchos WODs',
    ],
  ),

  const Exercise(
    id: 'e_cf_13',
    name: 'Toes-to-Bar',
    muscleGroup: 'CrossFit',
    equipment: 'Barra fija',
    difficulty: 'Avanzado',
    description:
        'Cuelga de la barra con agarre prono. Activa los dorsales y eleva las piernas extendidas (o con ligera flexión) hasta tocar la barra con los pies. Baja con control sin balanceo excesivo. Usa el "kip" para mantener cadencia.',
    secondaryMuscles: ['Core', 'Dorsal', 'Hip flexors'],
    benefits: [
      'Trabajo dinámico de core de alta exigencia',
      'Mejora la fuerza de agarre y los dorsales',
      'Componente de muchos WODs de CrossFit',
    ],
  ),

  const Exercise(
    id: 'e_cf_14',
    name: 'Knees-to-Elbow',
    muscleGroup: 'CrossFit',
    equipment: 'Barra fija',
    difficulty: 'Intermedio',
    description:
        'Cuelga de la barra con agarre prono. Flexiona las caderas y rodillas llevando las rodillas hacia los codos en un movimiento dinámico controlado. Baja con control. Útil como progresión hacia los Toes-to-Bar.',
    secondaryMuscles: ['Core', 'Dorsal', 'Hip flexors'],
    benefits: [
      'Progresión hacia Toes-to-Bar',
      'Trabajo de core dinámico sin tanta exigencia técnica',
      'Mejora la fuerza de agarre',
    ],
  ),

  const Exercise(
    id: 'e_cf_15',
    name: 'Muscle-Up',
    muscleGroup: 'CrossFit',
    equipment: 'Anillas',
    difficulty: 'Avanzado',
    description:
        'Cuélgate de las anillas (o barra) con agarre falso. Tira explosivamente del cuerpo hacia arriba haciendo una transición sobre las anillas y, en la cima, empuja extendiendo los brazos hasta quedar en soporte arriba. Baja controlando la transición inversa.',
    secondaryMuscles: ['Dorsal', 'Bíceps', 'Pecho', 'Tríceps'],
    benefits: [
      'Movimiento gimnástico avanzado de tracción + empuje',
      'Hito clave en CrossFit (RX en muchos WODs)',
      'Desarrolla fuerza relativa al peso corporal extrema',
    ],
  ),

  const Exercise(
    id: 'e_cf_16',
    name: 'Pistol Squat',
    muscleGroup: 'CrossFit',
    equipment: 'Peso corporal',
    difficulty: 'Avanzado',
    description:
        'De pie sobre una pierna, extiende la otra al frente paralela al suelo. Baja en sentadilla profunda manteniendo el equilibrio y el pie de apoyo plano. Sube empujando con el talón sin que la pierna libre toque el suelo. Repite del otro lado.',
    secondaryMuscles: ['Glúteos', 'Core', 'Cuádriceps'],
    benefits: [
      'Sentadilla unilateral de máxima dificultad',
      'Desarrolla movilidad de tobillo y cadera',
      'Trabajo unilateral que corrige asimetrías',
    ],
  ),

  const Exercise(
    id: 'e_cf_17',
    name: 'Handstand Push-Up (HSPU)',
    muscleGroup: 'CrossFit',
    equipment: 'Peso corporal',
    difficulty: 'Avanzado',
    description:
        'Apoya las manos en el suelo a unos 30 cm de una pared y patea hacia arriba hasta quedar en parada de manos contra la pared. Baja flexionando los codos hasta que la cabeza toque el suelo (o un abmat). Empuja para volver arriba. Usa el "kip" si necesitas asistencia.',
    secondaryMuscles: ['Hombros', 'Tríceps', 'Core'],
    benefits: [
      'Press vertical con peso corporal completo',
      'Mejora la estabilidad de hombro y core',
      'Hito gimnástico clave en CrossFit',
    ],
  ),

  const Exercise(
    id: 'e_cf_18',
    name: 'Turkish Get-Up',
    muscleGroup: 'CrossFit',
    equipment: 'Kettlebell',
    difficulty: 'Intermedio',
    description:
        'Túmbate boca arriba sosteniendo una kettlebell con un brazo extendido hacia el techo. Levántate paso a paso (codo → mano → bisagra de cadera → barrida de pierna → arrodillado → de pie) manteniendo siempre la kettlebell arriba. Invierte el movimiento.',
    secondaryMuscles: ['Hombros', 'Core', 'Glúteos', 'Cuádriceps'],
    benefits: [
      'Movimiento funcional total-body único',
      'Mejora la movilidad, estabilidad y coordinación',
      'Excelente trabajo de hombro y core',
    ],
  ),

  const Exercise(
    id: 'e_cf_19',
    name: 'Double Unders',
    muscleGroup: 'CrossFit',
    equipment: 'Cuerda',
    difficulty: 'Intermedio',
    description:
        'Salta a la cuerda haciéndola pasar dos veces bajo los pies en cada salto. Mantén los saltos bajos y el ritmo de muñeca rápido. Brazos pegados al cuerpo, codos cerca de la cintura. Requiere coordinación y cuerda de velocidad.',
    secondaryMuscles: ['Gemelos', 'Cuádriceps', 'Hombros'],
    benefits: [
      'Cardio explosivo de alta intensidad',
      'Mejora la coordinación y el timing',
      'Estándar en cientos de WODs de CrossFit',
    ],
  ),

  const Exercise(
    id: 'e_cf_20',
    name: 'Farmer\'s Carry',
    muscleGroup: 'CrossFit',
    equipment: 'Mancuernas',
    difficulty: 'Principiante',
    description:
        'Sostén una mancuerna o kettlebell pesada en cada mano a los costados. Camina con pasos cortos manteniendo la postura erguida, hombros atrás y core apretado. Recorre una distancia determinada o trabaja por tiempo.',
    secondaryMuscles: ['Trapecios', 'Core', 'Antebrazos', 'Piernas'],
    benefits: [
      'Fortalece el agarre y los antebrazos',
      'Trabajo funcional de todo el cuerpo',
      'Mejora la postura y la estabilidad del core',
    ],
  ),

  const Exercise(
    id: 'e_cf_21',
    name: 'Goblet Squat',
    muscleGroup: 'CrossFit',
    equipment: 'Kettlebell',
    difficulty: 'Principiante',
    description:
        'Sostén una kettlebell (o mancuerna) frente al pecho a la altura del esternón, agarrándola por las "campanas". Realiza una sentadilla profunda manteniendo el torso vertical y los codos al frente. Empuja con los talones para volver arriba.',
    secondaryMuscles: ['Glúteos', 'Core', 'Cuádriceps'],
    benefits: [
      'Punto de entrada perfecto a la sentadilla con carga',
      'Enseña postura erguida y profundidad correcta',
      'Excelente para activar el core',
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
  'CrossFit',
];

const List<String> equipmentList = [
  'Todos',
  'Barra',
  'Mancuernas',
  'Máquina',
  'Polea',
  'Peso corporal',
  'Barra fija',
  'Kettlebell',
  'Cajón',
  'Cuerda',
  'Anillas',
];
