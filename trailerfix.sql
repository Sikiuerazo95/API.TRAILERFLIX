CREATE SCHEMA TRAILERFLIX
DEFAULT CHARACTER SET utf8;

USE trailerflix;

CREATE TABLE categorias (
idCategoria INT AUTO_INCREMENT PRIMARY KEY,
nombreCategoria VARCHAR(50) NOT NULL
);

CREATE TABLE generos (
idGenero INT AUTO_INCREMENT PRIMARY KEY,
nombreGenero VARCHAR(50) NOT NULL
);

CREATE TABLE contenido (
idContenido INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
resumen TEXT,
temporadas INT NULL,
poster VARCHAR(200) NOT NULL,
trailer VARCHAR(200),
idCategoria INT,
idGenero INT,
FOREIGN KEY (idCategoria) REFERENCES categorias(idCategoria),
FOREIGN KEY (idGenero) REFERENCES generos(idGenero)
);

CREATE TABLE tags (
idTag INT AUTO_INCREMENT PRIMARY KEY,
nombreTag VARCHAR(50) NOT NULL
);

CREATE TABLE contenido_tags (
    idContenido INT,
    idTag INT NOT NULL,
    PRIMARY KEY (idTag, idContenido),
    FOREIGN KEY (idContenido) REFERENCES contenido(idContenido),
    FOREIGN KEY (idTag) REFERENCES tags(idTag)
);

CREATE TABLE actores (
idActor INT AUTO_INCREMENT PRIMARY KEY,
nombreActor VARCHAR (100) NOT NULL
);

CREATE TABLE reparto (
idContenido INT NOT NULL,
idActor INT NOT NULL,
PRIMARY KEY ( idContenido, idActor),
FOREIGN KEY (idContenido) REFERENCES contenido(idContenido),
FOREIGN KEY (idActor) REFERENCES actores(idActor)
);


INSERT INTO categorias (nombreCategoria)
VALUES
('Serie'),
('Película');

INSERT INTO generos (nombreGenero) 
VALUES
('Ciencia Ficción'),
('Drama'),
('Suceso Real'),
('Suspenso'),
('Fantasía'),
('Comedia'),
('Acción'),
('Terror'),
('Familia'),
('Aventura');



INSERT INTO contenido (idContenido, titulo, resumen, temporadas, poster, trailer, idCategoria, idGenero) 
VALUES
(3, 'The Mandalorian', 'Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la Serie sigue los pasos de un pistolero solitario...', 2, './posters/3.jpg', 'https://www.youtube.com/embed/aOC8E8z_ifw', 1, 1),
(4, 'The Umbrella Academy', 'La muerte de su padre reúne a unos hermanos distanciados...', 1, './posters/4.jpg', 'https://www.youtube.com/embed/KHucKOK-Vik', 1, 1),
(5, 'Gambito de Dama', 'En los cincuenta, una joven de un orfanato descubre que tiene un increíble don...', 1, './posters/5.jpg', 'https://www.youtube.com/embed/lbleRbyGKL4', 1, 2),
(2, 'Riverdale', 'El paso a la edad adulta incluye sexo, romance, escuela y familia...', 5, './posters/2.jpg', 'https://www.youtube.com/embed/HxtLlByaYTc', 1, 2),
(1, 'The Crown', 'Este drama narra las rivalidades políticas y el romance de la reina Isabel II...', 4, './posters/1.jpg', 'https://www.youtube.com/embed/JWtnJjn6ng0', 1, 3),
(6, 'Enola Holmes', 'La hermana menor de Sherlock, descubre que su madre ha desaparecido...', NULL, './posters/6.jpg', 'https://www.youtube.com/embed/3t1g2pa355k', 2, 2),
(7, 'Guasón', 'Arthur Fleck es un hombre ignorado por la sociedad...', NULL, './posters/7.jpg', 'https://www.youtube.com/embed/zAGVQLHvwOY', 2, 4),
(8, 'Avengers: End Game', 'Después de los devastadores eventos de los Vengadores: Infinity War...', NULL, './posters/8.jpg', 'https://www.youtube.com/embed/TcMBFSGVi1c', 2, 1),
(9, 'Juego de tronos', 'En un mundo fantástico y en un contexto medieval varias familias...', 8, './posters/9.jpg', 'https://www.youtube.com/embed/KPLWWIOCOOQ', 1, 5),
(10, 'The Flash', 'Sigue las veloces aventuras de Barry Allen...', 6, './posters/10.jpg', 'https://www.youtube.com/embed/Yj0l7iGKh8g', 1, 1),
(11, 'The Big Bang Theory', 'Leonard y Sheldon son dos físicos que comparten trabajo...', 12, './posters/11.jpg', 'https://www.youtube.com/embed/WBb3fojgW0Q', 1, 6),
(12, 'Friends', 'Friends narra las aventuras de seis jóvenes de Nueva York...', 10, './posters/12.jpg', 'https://www.youtube.com/embed/ekYGfU0XIx0', 1, 6),
(13, 'Anne with an \'E\'', 'Anne Shirley es una niña huérfana que vive en Avonlea...', 2, './posters/13.jpg', 'https://www.youtube.com/embed/M4T-_aB8smU', 1, 9),
(14, 'Expedientes Secretos \'X\'', 'Fox Mulder y Dana Scully investigan casos sin explicación...', 11, './posters/14.jpg', 'https://www.youtube.com/embed/KKziOmsJxzE', 1, 1),
(15, 'Chernobyl', 'Sigue la verdadera historia de una de las peores catástrofes provocadas por el hombre...', 1, './posters/15.jpg', 'https://www.youtube.com/embed/s9APLXM9Ei8', 1, 3),
(16, 'Westworld', 'Westworld es una oscura odisea sobre conciencia artificial...', 3, './posters/16.jpg', 'https://www.youtube.com/embed/qLFBcdd6Qw0', 1, 1),
(17, 'Halt and Catch Fire', 'Drama sobre el boom de la informática en los años 80...', 4, './posters/17.jpg', 'https://www.youtube.com/embed/pWrioRji60A', 1, 2),
(18, 'Ava', 'Ava es una asesina a sueldo que trabaja para una organización secreta...', NULL, './posters/18.jpg', 'https://www.youtube.com/embed/eLEwNo78f0k', 2, 7),
(19, 'Aves de presa y la fantabulosa emancipación de una Harley Quinn', 'Después de separarse de Joker, Harley Quinn se une a otras heroínas...', NULL, './posters/19.jpg', 'https://www.youtube.com/embed/saUmnenKbBM', 2, 1),
(20, 'Archivo', 'George Almore trabaja en una IA humana...', NULL, './posters/20.jpg', 'https://www.youtube.com/embed/VHSoCnDioAo', 2, 1),
(22, '3022', 'Tripulación en estación espacial cree que la Tierra ha sido destruida...', NULL, './posters/22.jpg', 'https://www.youtube.com/embed/AGQ7OkmIx4Q', 2, 4),
(23, 'IT - Capítulo 2', '27 años después, el Club de los Perdedores vuelve a enfrentar a Pennywise...', NULL, './posters/23.jpg', 'https://www.youtube.com/embed/hZeFeYSmBcg', 2, 8),
(24, 'Pantera Negra', 'T''Challa regresa a Wakanda y asume el rol de Pantera Negra...', NULL, './posters/24.jpg', 'https://www.youtube.com/embed/BE6inv8Xh4A', 2, 1),
(25, 'Contra lo imposible (Ford versus Ferrari)', 'Shelby y Miles enfrentan a Ferrari en Le Mans 1966...', NULL, './posters/25.jpg', 'https://www.youtube.com/embed/SOVb0-2g1Q0', 2, 3),
(26, 'Centígrados', 'Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.', NULL, './posters/26.jpg', 'https://www.youtube.com/embed/0RvV7TNUlkQ', 2, 4),
(27, 'DOOM: Aniquilación', 'Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.', NULL, './posters/27.jpg', 'https://www.youtube.com/embed/nat3u3gAVLE', 2, 8),
(28, 'Contagio', 'De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.', NULL, './posters/28.jpg', 'https://www.youtube.com/embed/4sYSyuuLk5g', 2, 2),
(29, 'Viuda Negra', 'Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.', NULL, './posters/29.jpg', 'https://www.youtube.com/embed/BIn8iANwEog', 2, 7),
(30, 'The Martian', 'Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.', NULL, './posters/30.jpg', 'https://www.youtube.com/embed/XvB58bCVfng', 2, 1),
(31, 'Ex-Machina', 'Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.', NULL, './posters/31.jpg', 'https://www.youtube.com/embed/XRYL5spvEcI', 2, 1),
(32, 'Jurassic World', 'Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.', NULL, './posters/32.jpg', 'https://www.youtube.com/embed/RFinNxS5KN4', 2, 10),
(33, 'Soy leyenda', 'Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.', NULL, './posters/33.jpg', 'https://www.youtube.com/embed/dtKMEAXyPkg', 2, 8),
(34, 'El primer hombre en la luna', 'Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.', NULL, './posters/34.jpg', 'https://www.youtube.com/embed/PSoRx87OO6k', 2, 3),
(35, 'Titanes del pacífico - La insurrección', 'Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.', NULL, './posters/35.jpg', 'https://www.youtube.com/embed/_EhiLLOhVis', 2, 1),
(36, 'JOBS: La Vida De Steve Jobs', 'Sólo hace falta una persona para empezar una revolución. Jobs es la extraordinaria historia de Steve Jobs, el original innovador y emprendedor que no dejó que nada se interpusiera en su camino hacia la grandeza. La película cuenta la épica y turbulenta historia de Jobs mientras abría un camino que cambió la tecnología - y el mundo - para siempre. Su vida es repasada desde que era adolescente, intentando estudiar en la universidad, hasta el año 2001, cuando el iPod fue presentado al mundo y comenzó a ''allanar'' el camino para lo que años después, sería el iPhone.', NULL, './posters/36.jpg', 'https://www.youtube.com/embed/FrvkCS0ZGPU', 2, 3),
(37, 'Piratas de Silicon Valey', 'Esta película es el documental semigracioso sobre los hombres que hicieron el mundo de la tecnología lo que es hoy, sus luchas durante el colegio, la fundación de sus compañías y las acciones ingeniosas que tomaron para aumentar los Imperios corporativos globales de Apple Computer Inc. y Microsoft Corporation.', NULL, './posters/37.jpg', 'https://www.youtube.com/embed/lEyrivrjAuU', 2, 3),
(38, 'Red Social', 'En una noche de otoño de 2003, el genio de la programación de computación de la Universidad de Harvard Mark Zuckerberg se sienta en su computadora y acaloradamente comienza a trabajar en una nueva idea. En una furia de los blogs y la programación, lo que comienza en su dormitorio como un pequeño sitio entre amigos pronto se convierte en una red social global y una revolución en la comunicación. A sólo seis años y 500 millones de amigos más tarde, Mark Zuckerberg es el multimillonario más joven de la historia ... pero para este empresario, el éxito conduce a complicaciones tanto personales como legales.', NULL, './posters/38.jpg', 'https://www.youtube.com/embed/lB95KLmpLR4', 2, 3),
(39, 'Antitrust', 'Milo Hoffman es un joven informático increíblemente prometedor para su edad que rápidamente es contratado por una importante empresa de Sillicon Valley. El empleo de sus sueños se ha hecho realidad, ya que ahí puede trabajar con los ordenadores más potentes del mundo y con las últimas tecnologías que aún no han salido al mercado. El Paraíso de un informático. Su jefe, Gary Winston , es un poderoso pez gordo de la industria que en un principio parece un tipo íntegro y legal. Pero pronto descubrirá que fisgar en sus archivos secretos no es la mejor idea si uno quiere conservar su trabajo... y su vida.', NULL, './posters/39.jpg', 'https://www.youtube.com/embed/k3TwIJjyjPM', 2, 7),
(40, 'Stowaway', 'Una misión al planeta Marte. Dos años de duración. De repente, los tres tripulantes afectados a esta labor deben tomar una decisión imposible cuando un pasajero imprevisto compromete la vida de todos a bordo. No hay vuelta atrás. La decisión deberá tomarse contemplando la vida de los, ahora, cuatro pasajeros aún cuando la supervivecnaia tenga que acarrear algún sacrificio.', NULL, './posters/40.jpg', 'https://www.youtube.com/embed/A_apvQkWsVY', 2, 1),
(41, 'Liga de la Justicia - Zack Snyder', 'Decidido a asegurarse de que el sacrificio final de Superman no fue en vano, Bruce Wayne alinea fuerzas con Diana Prince con planes para reclutar un equipo de metahumanos para proteger al mundo de una amenaza de proporciones catastróficas que se aproxima. En esta fascinante entrega, no apta para niños, verás cómo se conforma la Liga de la Justicia, uniendo a los principales superhéroes conocidos como Metahumanos.', NULL, './posters/41.jpg', 'https://www.youtube.com/embed/BUb_-RxsoBs', 2, 7),
(42, 'Two and a half men', 'Un quiropráctico y padre soltero, Alan Harper, vive en una casa al frente de la playa con su hijo mediocre, Jake, y un billonario de la Internet divorciado Walden Schmidt, que se muda con la familia de los Harper y ofrece comprar la casa luego de la muerte inesperada del hermano de Alan, Charlie, que era el propietario de la casa en la que vivía con Alan y Jake, luego de que padre e hijo se mudaran después del divorcio de Alan. La exesposa de Alan y madre de Jake, Judith, permanece en sus vidas.', 12, './posters/42.jpg', 'https://www.youtube.com/embed/mVHDanSl2pc', 1, 6),
(43, 'La casa de Papel', 'Ocho ladrones toman rehenes en la Fábrica Nacional de Moneda y Timbre de España, mientras el líder de la banda manipula a la policía para cumplir con su plan.', 4, './posters/43.jpg', 'https://www.youtube.com/embed/w1jkStuRQU8', 1, 7),
(44, 'Stranger Things', 'Pasan cosas muy extrañas en Hawkins, Indiana, tras una desaparición que revela la presencia de una niña con poderes sobrenaturales. Después de la extraña desaparición de un niño, un pueblo se encuentra ante un misterio que revela experimentos secretos, fuerzas sobrenaturales.', 4, './posters/44.jpg', 'https://www.youtube.com/embed/b9EkMc79ZSU', 1, 4),
(45, 'Gravity', 'Durante un paseo espacial rutinario, dos astronautas sufren un grave accidente y quedan flotando en el espacio. Una es la doctora Ryan Stone, una brillante ingeniera en su primera misión espacial en la Shuttle. Su acompañante es el veterano astronauta Matt Kowalsky. Durante el paseo algo sale mal y ocurre el desastre: el shuttle queda destrozado, dejando a Ryan y Matt completamente solos, momento a partir del cual intentarán por todos los medios volver a la Tierra.', NULL, './posters/45.jpg', 'https://www.youtube.com/embed/OiTiKOy59o4', 2, 4),
(49, 'It (eso)', 'Remake del clásico de Stephen King, y de la película homónima de 1990, en el que un payaso aterroriza a los niños de un vecindario. En un pequeño pueblo de Maine, siete niños conocidos como el Club de los Perdedores se encuentran cara a cara con problemas de la vida, matones y un monstruo que toma la forma de un payaso llamado Pennywise..', NULL, './posters/49.jpg', 'https://www.youtube.com/embed/FnCdOQsX5kc', 2, 8),
(46, 'Apollo 13', 'El Apolo 13 inicia su viaje a la luna en abril de 1970. Cuando la tripulación está a punto de llegar a su destino, una explosión en el espacio les hace perder oxígeno, energía y el curso de la nave... Todo se convierte en una situación desesperada para los tres hombres tripulantes, especialmente cuando el oxígeno amenaza con agotarse. Mientras, el mundo entero, que apenas un año antes conoció la gloria de la aventura espacial cuando el hombre pisó la luna, contiene la respiración a la espera de ver cómo acaba tan angustiosa espera.', NULL, './posters/46.jpg', 'https://www.youtube.com/embed/e3ZtOS4MCkk', 2, 3),
(47, 'La profecía', 'Incapaz de decirle a su mujer Katherine la trágica muerte de su hijo recién nacido, el diplomático americano Robert Thorn acepta un huérfano como su hijo. Los detalles del nacimiento del chico son un secreto, pero cuando Damien va creciendo, empieza a dar muestras de que no es un chico corriente.', NULL, './posters/47.jpg', 'https://www.youtube.com/embed/8L-1Qk_MQQs', 2, 8),
(48, 'El exorcista', 'Regan es una niña de doce años víctima de fenómenos paranormales como la levitación o la manifestación de una fuerza sobrehumana. Su madre, aterrorizada, tras someter a su hija a múltiples análisis médicos que no ofrecen ningún resultado, acude a un sacerdote con estudios de psiquiatría. Éste está convencido de que el mal no es físico sino espiritual, es decir, que la niña es víctima de una posesión diabólica. Por eso, con la ayuda de otro sacerdote decide practicar un exorcismo.', NULL, './posters/48.jpg', 'https://www.youtube.com/embed/YDGw1MTEe9k', 2, 8),
(50, 'The Office', 'Steve Carell protagoniza The Office, un fresco y divertido vistazo, con formato pseudo-documental, al día a día en la vida de unos excéntricos trabajadores de la empresa Dunder Mifflin. El serio pero despistadísimo director Michael Scott se considera un magnífico jefe y mentor, pero realmente inspira más críticas que respeto a sus empleados.', 9, './posters/50.jpg', 'https://www.youtube.com/embed/LHOtME2DL4g', 1, 6),
(51, 'The Good Doctor', 'Un cirujano joven y autista que padece el síndrome del sabio empieza a trabajar en un hospital prestigioso. Allá tendrá que vencer el escepticismo con el que sus colegas lo reciben.', 4, './posters/51.jpg', 'https://www.youtube.com/embed/fYlZDTru55g', 1, 9),
(52, 'La teoría del todo', 'La película gira en torno a la vida de Stephen Hawking, el importante teórico y divulgador científico que cambió la historia de la ciencia y la tecnología moderna para siempre. La película se centrará en la relación que mantuvo el británico con Jane Wilde, su primera mujer, con quien contrajo matrimonio después de que le diagnosticaran una enfermedad por la que no le quedaban más de dos años de vida. Estupenda adaptación con un Eddie Redmayne que cada día nos sorprende más.', NULL, './posters/52.jpg', 'https://www.youtube.com/embed/Salz7uGp72c', 2, 3),
(53, 'Código enigma', 'Durante el invierno de 1952, las autoridades británicas entraron en el hogar del matemático, analista y héroe de guerra Alan Turing, con la intención de investigar la denuncia de un robo. Al final acabaron arrestando a Turing acusándole de indecencia grave, un cargo que le supondría una devastadora condena por una ofensa criminal: ser homosexual. Los oficiales no tenían ni idea de que en realidad estaban incriminando al pionero de la informática actual. Liderando a un heterogéneo grupo de académicos, lingüistas, campeones de ajedrez y oficiales de inteligencia, se le conoce por haber descifrado el código de la inquebrantable máquina Enigma de los alemanes durante la Segunda Guerra Mundial.', NULL, './posters/53.jpg', 'https://www.youtube.com/embed/nuPZUUED5uk', 2, 3),
(54, 'Talentos ocultos', 'Narra la historia nunca contada de tres brillantes mujeres científicas afroamericanas que trabajaron en la NASA a comienzos de los años sesenta (en plena carrera espacial, y asimismo en mitad de la lucha por los derechos civiles de los negros estadounidenses) en el ambicioso proyecto de poner en órbita al astronauta John Glenn.', NULL, './posters/54.jpg', 'https://www.youtube.com/embed/RK8xHq6dfAo', 2, 3),
(55, 'Una mente brillante', 'Obsesionado con la búsqueda de una idea matemática original, el brillante estudiante John Forbes Nash llega a Princeton para realizar sus estudios de postgrado. Es un muchacho extraño y solitario, al que sólo comprende su compañero de cuarto. Por fin, Nash esboza una revolucionaria teoría y consigue una plaza de profesor en el MIT. Alicia Lardé, una de sus alumnas, lo deja fascinado al mostrarle que las leyes del amor están por encima de las de las matemáticas. Gracias a su prodigiosa habilidad para descifrar códigos es reclutado por Parcher William, del departamento de Defensa, para ayudar a los Estados Unidos en la Guerra Fría contra la Unión Soviética.', NULL, './posters/55.jpg', 'https://www.youtube.com/embed/jT51irTIrAc', 2, 3),
(56, 'Passengers', 'Una nave espacial, que viaja a un planeta lejano transportando a miles de personas, tiene una avería en una de las cápsulas de hibernación tras el impacto con un gran meteorito. Como resultado, un pasajero se despierta noventa años antes del final del viaje.', NULL, './posters/56.jpg', 'https://www.youtube.com/embed/7BWWWQzTpNU', 2, 1),
(57, 'Passengers', 'Un avión se estrella y tan sólo sobreviven cinco personas. Asignada al caso por su mentor, la joven terapeuta Claire, una brillante psicóloga, deberá ayudar a los supervivientes a superar el trauma. Pero, poco a poco, éstos empiezan a desaparecer misteriosamente... o a no aparecer en la sesiones. Nada está claro, ni siquiera qué pasó en el accidente. Además, entre los supervivientes está Eric, un atractivo pasajero que parece no necesitar terapia. (la línea entre este mundo y el próximo, está a pundo de ser cruzada)', NULL, './posters/57.jpg', 'https://www.youtube.com/embed/iMW4RpQmJJQ', 2, 4),
(58, 'Argo', 'Irán, año 1979. Cuando la embajada de los Estados Unidos en Teherán es ocupada por seguidores del Ayatolá Jomeini para pedir la extradición del Sha de Persia, la CIA y el gobierno canadiense organizaron una operación para rescatar a seis diplomáticos estadounidenses que se habían refugiado en la casa del embajador de Canadá. Con este fin se recurrió a un experto en rescatar rehenes y se preparó el escenario para el rodaje de una película de ciencia-ficción, de título ''Argo'', en la que participaba un equipo de cazatalentos de Hollywood. La misión: ir a Teherán y hacer pasar a los diplomáticos por un equipo de filmación canadiense para traerlos de vuelta a casa.', NULL, './posters/58.jpg', 'https://www.youtube.com/embed/JW3WfSFgrVY', 2, 3),
(59, 'Prometheus', 'Un grupo de científicos y exploradores emprende un viaje espacial a un remoto planeta, una rara estrella recién descubierta, donde sus límites físicos y mentales serán puestos a prueba. El motivo de la misión es que los humanos creen que allá podrán encontrar la respuesta a las preguntas más profundas y al mayor de los misterios: el origen de la vida en la Tierra.', NULL, './posters/59.jpg', 'https://www.youtube.com/embed/34cEo0VhfGE', 2, 1),
(60, 'Alien: Covenant', 'Rumbo a un remoto planeta al otro lado de la galaxia, la tripulación de la nave colonial Covenant descubre lo que creen que es un paraíso inexplorado, pero resulta tratarse de un mundo oscuro y hostil cuyo único habitante es un ''sintético'' llamado David (Michael Fassbender), superviviente de la malograda expedición Prometheus. Secuela de ''Prometheus'' (2012), a su vez precuela de ''Alien, el octavo pasajero'' (1979).', NULL, './posters/60.jpg', 'https://www.youtube.com/embed/svnAD0TApb8', 2, 1),
(61, 'Life: Vida inteligente', 'Seis miembros de la tripulación de la Estación Espacial Internacional que están a punto de lograr uno de los descubrimientos más importantes en la historia humana: la primera evidencia de vida extraterrestre en Marte. A medida que el equipo comienza a investigar y sus métodos tienen consecuencias inesperadas, la forma viviente demostrará ser más inteligente de lo que cualquiera esperaba.', NULL, './posters/61.jpg', 'https://www.youtube.com/embed/viX9irZw9Cg', 2, 4),
(62, 'Madame Curie', 'Basada en el libro ''A tale of love and fallout'' de Lauren Redniss, Radioactive es la historia biográfica sobre la científica polaca Marie Curie, la primera persona en recibir dos premios Nobel en distintas especialidades —Física y Química—, y la primera mujer en ocupar el puesto de profesora en la Universidad de París. Dirigida por Marjane Satrapi y protagonizada por Rosamund Pike como Marie Curie, está basada en la novela gráfica de Lauren Redniss.', NULL, './posters/62.jpg', 'https://www.youtube.com/embed/w0jqppl-ybY', 2, 3),
(63, 'The IT Crowd', 'En un desordenado sótano en las entrañas de Industrias Reynholm habitan Roy y Moss, los componentes del Departamento de informática. Víctimas del desprecio y del escarnio de sus compañeros más guays, su mundo de servidores y cortafuegos se ve interrumpido por la llegada de Jen, su nueva jefa, que sabe tanto de ordenadores como un yak.', 4, './posters/63.jpg', 'https://www.youtube.com/embed/wCa1jfo93jQ', 1, 6),
(64, 'Humans', 'En un presente paralelo donde el último gadget que hay que tener para cualquier familia ocupada es un ''Synth'' - un sirviente robótico altamente desarrollado que es tan similar a un humano real que está transformando la manera en que vivimos.', 3, './posters/64.jpg', 'https://www.youtube.com/embed/BV8qFeZxZPE', 1, 1),
(65, 'Need for Speed', 'El más famoso de los videojuegos de carreras llega a la gran pantalla para dejar a los más fanáticos boquiabiertos. Need for Speed cuenta la historia de un experto en automovilismo (Aaron Paul), el cual tiene un garage en dónde transforma coches para hacerlos más rápidos de lo que son para poder competir en carreras ilegales. Entró en la cárcel por un delito que no había cometido, justo cuando su mejor amigo muere en una carrera, y ahora sale de allí para vengarse.', NULL, './posters/65.jpg', 'https://www.youtube.com/embed/u3wtVI-aJuw', 2, 7),
(66, 'Mare of Easttown', 'Mare of Easttown es una miniserie estadounidense de drama y misterio creada por Brad Ingelsby cuenta la historia de Mare Sheehan, una detective de un pequeño pueblo de Pensilvania que investiga un asesinato local mientras trata de evitar que su vida se desmorone a raiz de la muerte de su hijo, su separación, y la posible restitución de su nieto a su madre biológica.', 1, './posters/66.jpg', 'https://www.youtube.com/embed/miQqyfO66uw', 1, 2),
(67, 'Ray', 'La vida de Ray Charles es una alternancia de triunfos y fracasos personales que se suceden a lo largo de una dilatada y galardonada carrera en el mundo del espectáculo. Pero estamos hablando de un hombre que sintetizó sus luchas, su dolor y su oscuridad personal con la misma efectividad con la que supo fundir en su arte una miríada de estilos musicales: el jazz, el rhythm & blues, el rock & roll, el gospel y el country. Su historia tiene entonces un sentido muy distinto: la cadena de logros se transforma en el vibrante y conmovedor trayecto de un genio único con una visión propia que enseñó al mundo a escuchar música de una forma nueva. RAY es la biografía, nunca contada antes, de esa leyenda de la música americana que es Ray Charles. Se centra en el período más explosivo de la carrera de Charles, que comienza cuando este joven negro ciego se sube solo a un autobús en Florida y cruza el país para refinar su arte en la floreciente escena jazzística de Seattle.', NULL, './posters/67.jpg', 'https://www.youtube.com/embed/jVHCQfcugdw', 2, 3),
(68, 'Black Mirror', 'Black Mirror es una serie de televisión británica creada por Charlie Brooker que muestra el lado oscuro de la vida y la tecnología. La serie es producida por Zeppotron para Endemol. En cuanto al contenido del programa y la estructura, Brooker ha señalado que ''cada episodio tiene un tono diferente, un entorno diferente, incluso una realidad diferente, pero todos son acerca de la forma en que vivimos ahora - y la forma en que podríamos estar viviendo en 10 minutos si somos torpes''.', 5, './posters/68.jpg', 'https://www.youtube.com/embed/jVHCQfcugdw', 1, 1),
(69, 'Detrás de sus ojos', 'Una madre soltera se adentra en un mundo de retorcidos juegos psicológicos cuando inicia una relación cuasi-no consentida con su jefe, un psiquiatra, y se hace amiga en secreto de su misteriosa esposa. La trama se bassa en un thriller sobre un triángulo amoroso perverso, más la introducción sutilmente de un elemento clave, que dará un giro notable a la obra.', 1, './posters/69.jpg', 'https://www.youtube.com/embed/c4LtoWQaLxk', 1, 2),
(70, 'Her', 'En un futuro cercano, Theodore, un hombre solitario a punto de divorciarse que trabaja en una empresa como escritor de cartas para terceras personas, compra un día un nuevo sistema operativo basado en el modelo de Inteligencia Artificial, diseñado para satisfacer todas las necesidades del usuario. Para su sorpresa, se crea una relación romántica entre él y Samantha, la voz femenina de ese sistema operativo.', NULL, './posters/70.jpg', 'https://www.youtube.com/embed/UVMcpZ42BkA', 2, 1),
(71, 'Misión Imposible', 'Ethan Hunt es un superespía capaz de resolver cualquier arriesgada situación con la máxima elegancia. Forma parte de un competente equipo dirigido por el agente Jim Phelps, que ha vuelto a reunir a sus hombres para participar en una dificilísima misión: evitar la venta de un disco robado que contiene información secreta de vital importancia.', NULL, './posters/71.jpg', 'https://www.youtube.com/embed/Ohws8y572KE', 2, 7),
(72, 'El agente de C.I.P.O.L.', 'Guerra fría, años 60. Narra las aventuras de dos agentes secretos que se parecen más de lo que creen: Napoleon Solo, de la CIA, e Illya Kuryakin, del KGB. Ambos se ven obligados a olvidar sus diferencias y formar un equipo cuya misión será poner fin a una misteriosa organización criminal internacional que pretende desestabilizar el frágil equilibrio de poder provocado por la proliferación de las armas nucleares. La hija de un científico alemán desaparecido es la clave para infiltrarse en la organización, encontrar al científico y evitar una catástrofe mundial.', NULL, './posters/72.jpg', 'https://www.youtube.com/embed/AeUzNxHHryQ', 2, 7),
(73, 'Jumanji - Bienvenidos a la jungla', 'Cuatro adolescentes son absorbidos por un videojuego, en el que se convierten en avatares de personajes arquetípicos. Allí vivirán múltiples aventuras, al tiempo que buscan cómo salir de allí para volver a su mundo.', NULL, './posters/73.jpg', 'https://www.youtube.com/embed/2QKg5SZ_35I', 2, 5),
(21, 'Jumanji - The next level', 'Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?', NULL, './posters/21.jpg', 'https://www.youtube.com/embed/rBxcF-r9Ibs', 2, 5),
(74, 'Mujer Maravilla 1984', 'En 1984, en plena guerra fría, Diana Prince, conocida como La Mujer Maravilla, se enfrenta al empresario Maxwell Lord y a su antigua amiga Barbara Minerva / Cheetah, una villana que posee fuerza y agilidad sobrehumanas.', NULL, './posters/74.jpg', 'https://www.youtube.com/embed/sfM7_JLk-84', 2, 5),
(75, 'El Contador', 'Christian Wolff es un contable y genio matemático, un hombre obsesivo con el orden y con mucha más afinidad con los números que con las personas, que lleva una doble vida como asesino despiadado.', NULL, './posters/75.jpg', 'https://www.youtube.com/embed/DBfsgcswlYQ', 2, 10),
(76, 'Mala Educación', 'Frank Tassone, uno de los superintendentes más destacados del distrito escolar de Roslyn en Nueva York se desvive a diario para que la educación de sus alumnos sea la mejor. Pero de forma paralela, este se lucra con dinero público para llevar una vida llena de lujos. Así, Tassone y su personal, amigos y familiares, se convierten en los principales sospechosos del mayor escándalo de malversación de fondos ocurrido en una escuela pública de toda la historia de los Estados Unidos. (Algunas personas aprenden de manera difícil.)', NULL, './posters/76.jpg', 'https://www.youtube.com/embed/DBfsgcswlYQ', 2, 3),
(77, 'Horizonte Rojo', 'En el año 2087, una astronauta lidera una misión para terraformar Marte, pero descubre una amenaza oculta bajo la superficie que pone en riesgo a toda la humanidad.', NULL, './posters/51.jpg', 'https://www.youtube.com/embed/redhorizon', 2, 1),
(78, 'Noche en el Museo', 'Un padre divorciado trata de establecerse, impresionar a su hijo y encontrar su destino. Él se presenta para un trabajo como vigilante nocturno en el Museo Americano de Historia Natural de la ciudad de Nueva York y, posteriormente, descubre que los objetos expuestos, animados por un artefacto mágico de Egipto, vuelven a la vida durante la noche. Al principio le va muy mal tratando de mantener el orden y la calma en el museo, pero al final se vuelve muy buen amigo de todos y juntos ayudan a recuperar aquel artefacto mágico egipcio, ya que ha sido robado por los antiguos vigilantes del museo.', NULL, './posters/78.jpg', 'https://www.youtube.com/embed/B2G-8raHvOU', 2, 10),
(79, 'Bohemian Rhapsody', 'Bohemian Rhapsody es una rotunda y sonora celebración de Queen, de su música y de su extraordinario cantante Freddie Mercury, que desafió estereotipos e hizo añicos tradiciones para convertirse en uno de los showmans más queridos del mundo. La película plasma el meteórico ascenso al olimpo de la música de la banda a través de sus icónicas canciones y su revolucionario sonido, su crisis cuando el estilo de vida de Mercury estuvo fuera de control, y su triunfal reunión en la víspera del Live Aid, en la que Mercury, mientras sufría una enfermedad que amenazaba su vida, lidera a la banda en uno de los conciertos de rock más grandes de la historia. Veremos cómo se cimentó el legado de una banda que siempre se pareció más a una familia, y que continúa inspirando a propios y extraños, soñadores y amantes de la música hasta nuestros días.', NULL, './posters/79.jpg', 'https://www.youtube.com/embed/mP0VHJYFOAU', 2, 3),
(80, 'Rock of ages', 'Los Ángeles, 1987: Un aspirante a roquero y una chica que trabajan en el mismo club (Bourbone Room) se enamoran y tratan de impedir que el local caiga en manos de unos empresarios que quieren demolerlo. Esta película es la adaptación cinematográfica del musical homónimo de Broadway.', NULL, './posters/80.jpg', 'https://www.youtube.com/embed/mP0VHJYFOAU', 2, 6),
(81, 'Super 8', 'Año 1979, en un pequeño pueblo de Ohio. Joe Lamb (Joel Courtney) es un muchacho que ha perdido a su madre en un accidente y que vive con su padre policía (Kyle Chandler). Comenzado el verano, y mientras rueda una película de zombis en Super 8 con sus amigos -y sobre todo con la bella Alice Dainard (Elle Fanning)-, Joe observa cómo una camioneta se estrella contra un tren de mercancías, provocando su descarrilamiento y un terrible accidente. A partir de ese momento cosas extrañas e inexplicables comienzan a suceder en el pueblo.', NULL, './posters/81.jpg', 'https://www.youtube.com/embed/QtZ6BQRDk4g', 2, 1),
(82, 'Jurassic World - El reino caido', 'Tras cuatro años de abandono del complejo turístico Jurassic World, la isla Nublar solo está habitada por los dinosaurios supervivientes, pero el volcán inactivo de la isla comienza a cobrar vida, Owen y Claire montan una campaña para rescatar a los dinosaurios restantes en la isla.', NULL, './posters/82.jpg', 'https://www.youtube.com/embed/vn9mMeWcgoM', 2, 10),
(83, 'Indiana Jones - y el Reino de la Calavera de Cristal', 'Guerra Fría (1957). Indiana Jones (Harrison Ford) y su amigo Mac (Ray Winstone) acaban de escapar de las garras de unos agentes soviéticos en un remoto aeropuerto. El decano de la Universidad (Jim Broadbent) le confiesa a su amigo el profesor Jones que las últimas misiones de Indy han fracasado y que está a punto de ser despedido. Mientras tanto, Indiana conoce a Mutt (Shia LaBeouf), un joven rebelde que le propone un trato: si le ayuda a resolver un problema personal, él, a cambio, le facilitaría uno de los descubrimientos más espectaculares de la historia: la Calavera de Cristal de Akator, que se encuentra en un lugar remoto del Perú. Pero los agentes soviéticos, dirigidos por la fría y bella Irina Spalko (Cate Blanchett), tienen el mismo objetivo.', NULL, './posters/83.jpg', 'https://www.youtube.com/embed/WAdJf4wTC5Y', 2, 10),
(84, 'Los Goonies', 'Mikey, un muchacho de trece años, que junto con su hermano mayor y sus amigos se hacen llamar ''Los Goonies'', decide subir a jugar al desván de su casa, donde su padre guarda antigüedades. Allí, el grupo encuentra el mapa de un tesoro y emprende un fabuloso viaje para validar la veracidad de dicho mapa, y encontrar ese tesoro tan preciado por estos amigos inseparables.', NULL, './posters/84.jpg', 'https://www.youtube.com/embed/hJ2j4oWdQtU', 2, 9),
(85, 'Cars', 'El aspirante a campeón de carreras Rayo McQueen está sobre la vía rápida al éxito, la fama y todo lo que él había soñado, hasta que por error toma un desvío inesperado en la polvorienta y solitaria Ruta 66. Su actitud arrogante se desvanece cuando llega a una pequeña comunidad olvidada que le enseña las cosas importantes de la vida que había olvidado.', NULL, './posters/85.jpg', 'https://www.youtube.com/embed/SbXIj2T-_uk', 2, 9),
(86, 'Los pingüinos de Madagascar', 'Los pingüinos llevan sus misiones en su hábitat en el Parque Central. Aparecen Julien, el rey de los lémures, y sus súbditos Maurice y Mort, sus nuevos vecinos, que constituyen la exhibición de lémures en el zoológico. Ahora los pingüinos deben mantener las cosas bajo control, a menudo a pesar de las payasadas de los lémures así como auxiliar en labores poco comunes o aventuras fuera de lo común. Skipper rara vez llama al Rey Julien por su nombre, dirigiéndose a él siempre como ''Cola anillada'' (por ser un lemur de cola anillada).', NULL, './posters/86.jpg', 'https://www.youtube.com/embed/SbXIj2T-_uk', 2, 9),
(87, 'Cementerio de animales', 'Louis Creed, su esposa y sus dos niños se instalan en una vivienda próxima a una carretera con mucho tráfico. Cerca de la casa hay un sendero que lleva a un cementerio de animales y también a un antiguo cementerio indio; según la leyenda, los que sean enterrados allí volverán a la vida. Cuando uno de los niños muere atropellado por un camión, Louis ldecide enterrarlo en el cementerio indio.', NULL, './posters/87.jpg', 'https://www.youtube.com/embed/JMao8sg4DPA', 2, 8),
(88, 'Poltergeist', 'Una familia americana de clase media se traslada a vivir e una nueva casa en un aparentemente idílico barrio, pero dentro de la casa comienzan a suceder cosas extrañas, fenómenos paranormales para los que no hay explicación posible.', NULL, './posters/88.jpg', 'https://www.youtube.com/embed/9eZgEKjYJqA', 2, 8),
(89, 'El código Da Vinci', 'El catedrático y afamado simbologista Robert Langdon se ve obligado a acudir una noche al Museo del Louvre, cuando el asesinato de un restaurador deja tras de sí un misterioso rastro de símbolos y pistas. Con la ayuda de la criptógrafa de la policía Sophie Neveu y poniendo en juego su propia vida, Langdon descubre que la obra de Leonardo Da Vinci esconde una serie de misterios que apuntan a una sociedad secreta encargada de custodiar un antiguo secreto que ha permanecido oculto durante dos mil años.', NULL, './posters/89.jpg', 'https://www.youtube.com/embed/lfqHb6INj3w', 2, 10),
(90, 'Johnny English', 'Las joyas de la Corona de su Majestad han desaparecido. Detrás de ello se esconde Pascal Sauvage (John Malkovich), que también conspira para hacerse con el trono de la reina. La misión es asignada a Johnny English (Rowan Atkinson), un agente tan entregado al trabajo como inexperto. Desde ese momento la información confidencial, los coches de lujo y la tecnología más sofisticada forman parte de su rutina diaria. Johnny English aún no se lo acaba de creer. Quizás todo esto le venga algo grande, pero su empeño con la misión y dedicación para llegar hasta el final es incuestionable, especialmente después de conocer a la agente doble Lorna Campbell (Natalie Imbruglia). Parece ser que lo de estar enamorado aún hará más emocionante esto de salvar al país.', NULL, './posters/90.jpg', 'https://www.youtube.com/embed/EG0MR5dFz7E', 2, 6),
(91, 'Almost Famous', 'Homenaje al rock de los 70. Gracias a sus buenas críticas musicales, un adolescente que aspira a ser periodista es contratado por la revista ''Rolling Stone'' para cubrir la gira de una famosa banda. A pesar de su juventud y de la oposición de su madre, el chico vivirá con los músicos y sus fans una aventura inolvidable. Basada en la propia experiencia de Crowe.', NULL, './posters/91.jpg', 'https://www.youtube.com/embed/aQXh_AaJXaM', 2, 2),
(92, 'Escuela de Rock', 'Dewey Finn -Jack Black- es un guitarrista con delirios de grandeza que es expulsado de su banda. Desesperado por encontrar un trabajo ante su falta de dinero, suplanta la identidad de un profesor sustituto para dar clase en una escuela privada a los pequeños alumnos pre-adolescentes de 5o grado a los que intentará enseñarles el ''rock & roll de alto voltaje''. Además entre sus alumnos está Yuki, un guitarrista prodigio de 9 años que puede ayudar a Dewey a ganar la competición de bandas de música... y de paso solucionar sus problemas económicos.', NULL, './posters/92.jpg', 'https://www.youtube.com/embed/TExoc0MG4I4', 2, 6),
(93, 'Mi pobre angelito', 'Kevin McAllister es un niño de ocho años, miembro de una familia numerosa, que accidentalmente se queda abandonado en su casa cuando toda la familia se marcha a pasar las vacaciones a Francia. Kevin aprende a valerse por sí mismo e incluso a protegerse de Harry y Marv, dos bribones que se proponen asaltar todas las casas cerradas de su vecindario. Cuando su madre Kate lo hecha en falta, realiza un pintoresco viaje de vuelta contra reloj a Chicago para recuperar a su hijo.', NULL, './posters/93.jpg', 'https://www.youtube.com/embed/jEDaVHmw7r4', 2, 9),
(94, 'Aprendices fuera de línea', 'Cuando dos cuarentones vendedores de relojes son despedidos de sus respectivos trabajos, convencidos ambos de que no se han adaptado a los cambios de las nuevas tecnologías, deciden empezar de nuevo y buscar trabajo en la empresa más exitosa de Internet: Google. Finalmente consiguen un contrato de prácticas como becarios. La locura comienza cuando se ven compitiendo para conseguir el puesto con jóvenes veinteañeros, mucho más listos y más familiarizados con el mundo digital que ellos.', NULL, './posters/94.jpg', 'https://www.youtube.com/embed/tn02SPT6ivM', 2, 6),
(95, 'Outsourced', 'Ambientada en el continente estadounidense, una empresa norteamericana que busca reducir los gastos, asciende a su mejor empleado del Call Center, poniéndolo a cargo del mismo. La única condición para dicho empleado, es viajar a la India, lugar en el mundo donde tercerizan el servicio ode atención al cliente, para abaratar costos. Allí, en la Ciudad de Bombay, los nativos le explican la cultura indú a los nóveles norteamericanos, y viceversa. Tendrán que convivir cada uno de los empleados de estos diferentes países, con sus pares y/o jefes opuestos en cultura.', 1, './posters/95.jpg', 'https://www.youtube.com/embed/_wR3LhFlgGo', 1, 6),
(96, 'Miedo Profundo', 'Nancy, una estudiante de medicina apasionada del surfing, es una joven que trata de superar la pérdida de su madre. Un día, practicando surf en una solitaria playa mexicana se queda atrapada en un islote a sólo cien metros de la costa. El problema está en que un enorme tiburón blanco se interpone entre ella y la otra orilla.', NULL, './posters/96.jpg', 'https://www.youtube.com/embed/EgdxIlSuB70', 2, 4),
(97, 'Everest', 'Inspirada en los hechos que tuvieron lugar durante un intento por alcanzar el pico más alto del mundo, narra las peripecias de dos expediciones que se enfrentan a la peor tormenta de nieve conocida. En un desesperado esfuerzo por sobrevivir, el temple de los alpinistas se ve puesto a prueba al tener que enfrentarse a la furia desatada de los elementos y a obstáculos casi insuperables.', NULL, './posters/97.jpg', 'https://www.youtube.com/embed/5ZQVpPiOji0', 2, 3),
(98, 'La Familia Addams', 'El delirante y gótico estilo de vida de la peculiar familia Addams se ve amenazado peligrosamente cuando el codicioso dúo que forman madre e hijo, con la ayuda de un abogado sin ningún escrúpulos, conspiran para hacerse con la fortuna familiar... (No se pierdan las locutras de Gomez, Morticia, Tío Lucas, Merlina, El tío Cosas, Dedos y Largo)', NULL, './posters/98.jpg', 'https://www.youtube.com/embed/G388UMkJIBE', 2, 9),
(99, 'El Último Susurro', 'Un periodista se ve envuelto en una conspiración internacional mientras investiga una serie de desapariciones conectadas con mensajes codificados encontrados en viejos casetes.', 2, './posters/52.jpg', 'https://www.youtube.com/embed/elultimosusurro', 1, 4),
(100, 'Vecinos del Fin del Mundo', 'Una familia se muda a un remoto pueblo de la Patagonia solo para descubrir que sus extravagantes vecinos tienen más secretos de lo que aparentan.', 1, './posters/53.jpg', 'https://www.youtube.com/embed/vecinosfin', 1, 6);

INSERT INTO tags (nombreTag) 
VALUES
('Acción'),
('Aventura'),
('Ciencia Ficción'),
('Comedia'),
('Conspiración'),
('Crimen'),
('Drama'),
('Familia'),
('Fantasía'),
('Ficción'),
('Futurista'),
('Historia'),
('Intriga'),
('Investigación'),
('Misterio'),
('Música'),
('Romance'),
('Sci-Fi'),
('Suceso'),
('Suceso Real'),
('Suspenso'),
('Tecnología'),
('Terror'),
('Thriller'),
('Western');

INSERT INTO contenido_tags (idContenido, idTag) VALUES
-- The Mandalorian (id:3)
(3, 18),  -- Sci-Fi
(3, 9),   -- Fantasía
(3, 1),   -- Acción

-- The Umbrella Academy (id:4)
(4, 18),  -- Sci-Fi
(4, 7),   -- Drama
(4, 9),   -- Fantasía

-- Gambito de Dama (id:5)
(5, 7),   -- Drama
(5, 10),  -- Ficción
(5, 20),  -- Suceso Real

-- Riverdale (id:2)
(2, 7),   -- Drama
(2, 15),  -- Misterio
(2, 10),  -- Ficción

-- The Crown (id:1)
(1, 7),   -- Drama
(1, 20),  -- Suceso Real

-- Enola Holmes (id:6)
(6, 10),  -- Ficción
(6, 7),   -- Drama
(6, 15),  -- Misterio

-- Guasón (id:7)
(7, 6),   -- Crimen
(7, 21),  -- Suspenso

-- Avengers: Endgame (id:8)
(8, 2),   -- Aventura
(8, 18),  -- Sci-Fi
(8, 1),   -- Acción

-- Juego de Tronos (id:9)
(9, 2),   -- Aventura
(9, 7),   -- Drama
(9, 9),   -- Fantasía

-- The Flash (id:10)
(10, 18), -- Sci-Fi
(10, 1),  -- Acción
(10, 9),  -- Fantasía

-- The Big Bang Theory (id:11)
(11, 4),  -- Comedia
(11, 10), -- Ficción

-- Friends (id:12)
(12, 4),  -- Comedia
(12, 8),  -- Familia
(12, 7),  -- Drama

-- Anne with an 'E' (id:13)
(13, 7),  -- Drama
(13, 8),  -- Familia
(13, 25), -- Western

-- Expedientes Secretos 'X' (id:14)
(14, 7),  -- Drama
(14, 18), -- Sci-Fi
(14, 21), -- Suspenso

-- Chernobyl (id:15)
(15, 7),  -- Drama
(15, 20), -- Suceso Real

-- Westworld (id:16)
(16, 25), -- Western
(16, 18), -- Sci-Fi
(16, 7),  -- Drama

-- Halt and Catch Fire (id:17)
(17, 10), -- Ficción
(17, 7),  -- Drama
(17, 22), -- Tecnología

-- Ava (id:18)
(18, 1),  -- Acción
(18, 7),  -- Drama
(18, 21), -- Suspenso

-- Aves de Presa (id:19)
(19, 1),  -- Acción
(19, 10), -- Ficción
(19, 4),  -- Comedia

-- Archivo (id:20)
(20, 1),  -- Acción
(20, 18), -- Sci-Fi
(20, 21), -- Suspenso

-- 3022 (id:22)
(22, 18), -- Sci-Fi
(22, 21), -- Suspenso
(22, 11), -- Futurista

-- IT - Capítulo 2 (id:23)
(23, 23), -- Terror
(23, 21), -- Suspenso
(23, 9),  -- Fantasía

-- Pantera Negra (id:24)
(24, 1),  -- Acción
(24, 2),  -- Aventura
(24, 9),  -- Fantasía

-- Ford vs Ferrari (id:25)
(25, 7),  -- Drama
(25, 12), -- Historia
(25, 2),  -- Aventura

-- Centígrados (id:26)
(26, 7),  -- Drama
(26, 21), -- Suspenso
(26, 13), -- Intriga

-- DOOM: Aniquilación (id:27)
(27, 23), -- Terror
(27, 1),  -- Acción
(27, 18), -- Sci-Fi
(27, 11), -- Futurista

-- Contagio (id:28)
(28, 7),  -- Drama
(28, 21), -- Suspenso
(28, 10), -- Ficción

-- Viuda Negra (id:29)
(29, 7),  -- Drama
(29, 1),  -- Acción
(29, 2),  -- Aventura

-- The Martian (id:30)
(30, 7),  -- Drama
(30, 18), -- Sci-Fi
(30, 2),  -- Aventura

-- Ex-Machina (id:31)
(31, 7),   -- Drama
(31, 18),  -- Sci-Fi
(31, 21),  -- Suspenso

-- Jurassic World (id:32)
(32, 21), -- Suspenso
(32, 2),  -- Aventura
(32, 10), -- Ficción

-- Soy Leyenda (id:33)
(33, 7),   -- Drama
(33, 23),  -- Terror
(33, 10),  -- Ficción

-- El primer hombre en la luna (id:34)
(34, 7),   -- Drama
(34, 20),  -- Suceso Real

-- Titanes del Pacífico (id:35)
(35, 1),   -- Acción
(35, 18),  -- Sci-Fi
(35, 9),   -- Fantasía

-- JOBS: La Vida de Steve Jobs (id:36)
(36, 7),   -- Drama
(36, 12),  -- Historia
(36, 22),  -- Tecnología

-- Piratas de Silicon Valley (id:37)
(37, 22),  -- Tecnología
(37, 12),  -- Historia
(37, 4),   -- Comedia

-- Red Social (id:38)
(38, 7),   -- Drama
(38, 12),  -- Historia
(38, 22),  -- Tecnología

-- Antitrust (id:39)
(39, 1),   -- Acción
(39, 21),  -- Suspenso
(39, 7),   -- Drama

-- Stowaway (id:40)
(40, 7),   -- Drama
(40, 3),   -- Ciencia Ficción
(40, 21),  -- Suspenso

-- Liga de la Justicia (id:41)
(41, 1),   -- Acción
(41, 2),   -- Aventura
(41, 18),  -- Sci-Fi
(41, 9),   -- Fantasía

-- Two and a Half Men (id:42)
(42, 8),   -- Familia
(42, 4),   -- Comedia
(42, 2),   -- Aventura

-- La Casa de Papel (id:43)
(43, 2),   -- Aventura
(43, 7),   -- Drama
(43, 1),   -- Acción

-- Stranger Things (id:44)
(44, 15),  -- Misterio
(44, 21),  -- Suspenso
(44, 8),   -- Familia

-- Gravity (id:45)
(45, 3),   -- Ciencia Ficción
(45, 21),  -- Suspenso
(45, 7),   -- Drama

-- Apollo 13 (id:46)
(46, 7),   -- Drama
(46, 12),  -- Historia
(46, 20),  -- Suceso Real

-- La Profecía (id:47)
(47, 23),  -- Terror
(47, 21),  -- Suspenso
(47, 7),   -- Drama

-- El Exorcista (id:48)
(48, 23),  -- Terror
(48, 21),  -- Suspenso
(48, 7),   -- Drama

-- It (Eso) (id:49)
(49, 23),  -- Terror
(49, 21),  -- Suspenso
(49, 7),   -- Drama

-- The Office (id:50)
(50, 4),   -- Comedia
(50, 8),   -- Familia

-- The Good Doctor (id:51)
(51, 7),   -- Drama
(51, 8),   -- Familia

-- La Teoría del Todo (id:52)
(52, 7),   -- Drama
(52, 17),  -- Romance
(52, 20),  -- Suceso Real

-- Código Enigma (id:53)
(53, 7),   -- Drama
(53, 12),  -- Historia
(53, 21),  -- Suspenso
(53, 20),  -- Suceso Real

-- Talentos Ocultos (id:54)
(54, 7),   -- Drama
(54, 12),  -- Historia
(54, 21),  -- Suspenso
(54, 20),  -- Suceso Real

-- Una Mente Brillante (id:55)
(55, 7),   -- Drama
(55, 12),  -- Historia
(55, 17),  -- Romance
(55, 20),  -- Suceso Real

-- Passengers (2016) (id:56)
(56, 7),   -- Drama
(56, 17),  -- Romance
(56, 18),  -- Sci-Fi
(56, 3),   -- Ciencia Ficción

-- Passengers (2008) (id:57)
(57, 15),  -- Misterio
(57, 21),  -- Suspenso
(57, 7),   -- Drama
(57, 17),  -- Romance

-- Argo (id:58)
(58, 21),  -- Suspenso
(58, 7),   -- Drama
(58, 20),  -- Suceso Real

-- Prometheus (id:59)
(59, 3),   -- Ciencia Ficción
(59, 2),   -- Aventura
(59, 15),  -- Misterio

-- Alien: Covenant (id:60)
(60, 3),   -- Ciencia Ficción
(60, 2),   -- Aventura
(60, 15),  -- Misterio

-- Life: Vida inteligente (id:61)
(61, 3),   -- Ciencia Ficción
(61, 21),  -- Suspenso
(61, 23),  -- Terror

-- Madame Curie (id:62)
(62, 7),   -- Drama
(62, 17),  -- Romance
(62, 12),  -- Historia
(62, 20),  -- Suceso Real

-- The IT Crowd (id:63)
(63, 4),   -- Comedia

-- Humans (id:64)
(64, 3),   -- Ciencia Ficción
(64, 18),  -- Sci-Fi
(64, 9),   -- Fantasía
(64, 7),   -- Drama
(64, 15),  -- Misterio

-- Need for Speed (id:65)
(65, 1),   -- Acción
(65, 7),   -- Drama
(65, 21),  -- Suspenso

-- Mare of Easttown (id:66)
(66, 15),  -- Misterio
(66, 7),   -- Drama
(66, 6),   -- Crimen
(66, 21),  -- Suspenso

-- Ray (id:67)
(67, 7),   -- Drama
(67, 16),  -- Música
(67, 20),  -- Suceso Real
(67, 12),  -- Historia

-- Black Mirror (id:68)
(68, 7),   -- Drama
(68, 3),   -- Ciencia Ficción
(68, 9),   -- Fantasía

-- Detrás de sus ojos (id:69)
(69, 7),   -- Drama
(69, 21),  -- Suspenso
(69, 6),   -- Crimen

-- Her (id:70)
(70, 7),   -- Drama
(70, 18),  -- Sci-Fi
(70, 3),   -- Ciencia Ficción
(70, 17),  -- Romance

-- Misión Imposible (id:71)
(71, 7),   -- Drama
(71, 1),   -- Acción
(71, 17),  -- Romance

-- El agente de C.I.P.O.L. (id:72)
(72, 7),   -- Drama
(72, 1),   -- Acción
(72, 2),   -- Aventura
(72, 4),   -- Comedia

-- Jumanji - Bienvenidos a la jungla (id:73)
(73, 4),   -- Comedia
(73, 10),  -- Ficción
(73, 2),   -- Aventura
(73, 9),   -- Fantasía

-- Jumanji - The next level (id:21)
(21, 4),   -- Comedia
(21, 10),  -- Ficción
(21, 2),   -- Aventura
(21, 9),   -- Fantasía

-- Mujer Maravilla 1984 (id:74)
(74, 4),   -- Comedia
(74, 10),  -- Ficción
(74, 2),   -- Aventura
(74, 9),   -- Fantasía

-- El Contador (id:75)
(75, 2),   -- Aventura
(75, 1),   -- Acción
(75, 21),  -- Suspenso
(75, 6),   -- Crimen
(75, 7),   -- Drama

-- Mala Educación (id:76)
(76, 20),  -- Suceso Real
(76, 7),   -- Drama
(76, 12),  -- Historia

-- Horizonte Rojo (id:77)
(77, 7),   -- Drama
(77, 21),  -- Suspenso

-- Noche en el Museo (id:78)
(78, 2),   -- Aventura
(78, 3),   -- Ciencia Ficción
(78, 4),   -- Comedia
(78, 8),   -- Familia
(78, 1),   -- Acción

-- Bohemian Rhapsody (id:79)
(79, 20),  -- Suceso Real
(79, 7),   -- Drama
(79, 12),  -- Historia
(79, 16),  -- Música

-- Rock of ages (id:80)
(80, 16),  -- Música
(80, 4),   -- Comedia
(80, 17),  -- Romance
(80, 7),   -- Drama

-- Super 8 (id:81)
(81, 21),  -- Suspenso
(81, 15),  -- Misterio
(81, 18),  -- Sci-Fi

-- Jurassic World - El reino caido (id:82)
(82, 2),   -- Aventura
(82, 1),   -- Acción
(82, 18),  -- Sci-Fi

-- Indiana Jones (id:83)
(83, 2),   -- Aventura
(83, 1),   -- Acción

-- Los Goonies (id:84)
(84, 8),   -- Familia
(84, 2),   -- Aventura
(84, 1),   -- Acción

-- Cars (id:85)
(85, 8),   -- Familia
(85, 4),   -- Comedia
(85, 2),   -- Aventura

-- Los pingüinos de Madagascar (id:86)
(86, 8),   -- Familia
(86, 4),   -- Comedia
(86, 2),   -- Aventura

-- Cementerio de animales (id:87)
(87, 23),  -- Terror
(87, 7),   -- Drama
(87, 21),  -- Suspenso

-- Poltergeist (id:88)
(88, 23),  -- Terror
(88, 7),   -- Drama
(88, 21),  -- Suspenso

-- El código Da Vinci (id:89)
(89, 2),   -- Aventura
(89, 7),   -- Drama
(89, 21),  -- Suspenso
(89, 15),  -- Misterio

-- Johnny English (id:90)
(90, 4),   -- Comedia
(90, 8),   -- Familia
(90, 1),   -- Acción

-- Almost Famous (id:91)
(91, 7),   -- Drama
(91, 16),  -- Música
(91, 20),  -- Suceso Real

-- Escuela de Rock (id:92)
(92, 8),   -- Familia
(92, 4),   -- Comedia
(92, 16),  -- Música

-- Mi pobre angelito (id:93)
(93, 8),   -- Familia
(93, 4),   -- Comedia
(93, 16),  -- Música

-- Aprendices fuera de línea (id:94)
(94, 8),   -- Familia
(94, 4),   -- Comedia

-- Outsourced (id:95)
(95, 8),   -- Familia
(95, 4),   -- Comedia

-- Miedo Profundo (id:96)
(96, 21),  -- Suspenso
(96, 7),   -- Drama
(96, 23),  -- Terror

-- Everest (id:97)
(97, 20),  -- Suceso Real
(97, 7),   -- Drama
(97, 21),  -- Suspenso

-- La Familia Addams (id:98)
(98, 8),   -- Familia
(98, 4),   -- Comedia
(98, 9),   -- Fantasía

-- El Último Susurro (id:99)
(99, 5),   -- Conspiración
(99, 15),  -- Misterio
(99, 24),  -- Thriller
(99, 14),  -- Investigación
(99, 7),   -- Drama

-- Vecinos del Fin del Mundo (id:100)
(100, 8),  -- Familia
(100, 4),  -- Comedia
(100, 15), -- Misterio
(100, 7);  -- Drama

ALTER TABLE actores ADD UNIQUE (nombreActor);

INSERT IGNORE INTO actores (nombreActor) VALUES
-- Actores de The Crown (sin duplicados)
('Claire Fox'),
('Olivia Colman'),
('Matt Smith'),
('Tobias Menzies'),
('Vanesa Kirby'),
('Helena Bonham Carter'),

-- Actores de Riverdale (sin duplicados)
('Lili Reinhart'),
('Casey Cott'),
('Camila Mendes'),
('Marisol Nichols'),
('Madelaine Petsch'),
('Mädchen Amick'),

-- Actores de The Mandalorian (sin duplicados)
('Pedro Pascal'),
('Carl Weathers'),
('Misty Rosas'),
('Chris Bartlett'),
('Rio Hackford'),
('Giancarlo Esposito'),

-- Actores de The Umbrella Academy (sin duplicados)
('Tom Hopper'),
('David Castañeda'),
('Emmy Raver-Lampman'),
('Robert Sheehan'),
('Aidan Gallagher'),
('Elliot Page'),

-- Actores de Gambito de Dama (sin duplicados)
('Anya Taylor-Joy'),
('Thomas Brodie-Sangster'),
('Harry Melling'),
('Moses Ingram'),
('Chloe Pirrie'),
('Janina Elkin'),

-- Actores de Enola Holmes (Henry Cavill era duplicado - ahora único)
('Millie Bobby Brown'),
('Sam Claflin'),
('Louis Partridge'),
('Adeel Akhtar'),

-- Actores de Guasón (sin duplicados)
('Joaquin Phoenix'),
('Robert De Niro'),
('Zazie Beetz'),
('Frances Conroy'),
('Brett Cullen'),
('Shea Whigham'),

-- Actores de Avengers: End Game (Scarlett Johansson era duplicado - ahora único)
('Robert Downey Jr.'),
('Chris Evans'),
('Mark Ruffalo'),
('Chris Hemsworth'),
('Jeremy Renner'),

-- Actores de Juego de tronos (sin duplicados)
('Emilia Clarke'),
('Lena Headey'),
('Sophie Turner'),
('Kit Harington'),
('Peter Dinklage'),
('Nikolaj Coster-Waldau'),

-- Actores de The Flash (sin duplicados)
('Grant Gustin'),
('Carlos Valdes'),
('Danielle Panabaker'),
('Candice Patton'),
('Jesse L. Martin'),
('Tom Cavanagh'),

-- Actores de The Big Bang Theory (Jim Parsons era duplicado - ahora único)
('Johnny Galecki'),
('Kaley Cuoco'),
('Simon Helberg'),
('Kunal Nayyar'),
('Melissa Rauch'),
('Mayim Bialik'),

-- Actores de Friends (sin duplicados)
('Jennifer Aniston'),
('Courteney Cox'),
('Lisa Kudrow'),
('David Schwimmer'),
('Matthew Perry'),
('Matt LeBlanc'),

-- Actores de Anne with an E (sin duplicados)
('Amybeth McNulty'),
('Geraldine James'),
('R. H. Thomson'),
('Corrine Koslo'),
('Dalila Bela'),
('Lucas Jade Zumann'),

-- Actores de The X-Files (sin duplicados)
('Gillian Anderson'),
('David Duchovny'),
('Mitch Pileggi'),
('Robert Patrick'),
('Tom Braidwood'),
('Bruce Harwood'),

-- Actores de Chernobyl (Emily Watson era duplicado - ahora único)
('Jared Harris'),
('Stellan Skarsgård'),
('Paul Ritter'),
('Jessie Buckley'),
('Adam Nagaitis'),

-- Actores de Westworld (Ed Harris era duplicado - ahora único)
('Evan Rachel Wood'),
('Thandiwe Newton'),
('Jeffrey Wright'),
('Tessa Thompson'),
('Luke Hemsworth'),
('Rodrigo Santoro'),
('Simon Quarterman'),
('Clifton Collins Jr.'),
('Anthony Hopkins'),
('Ingrid Bolsø Berdal'),
('Angela Sarafyan'),
('Shannon Woodward'),
('Talulah Riley'),
('Louis Herthum'),
('Ben Barnes'),
('Jimmi Simpson'),
('Leonardo Nam'),
('Aaron Paul'),
('Vincent Cassel'),
('Izabella Alvarez'),
('Jeff Daniel Phillips'),

-- Actores de Halt and Catch Fire (Scoot McNairy y Kerry Bishé eran duplicados - ahora únicos)
('Lee Pace'),
('Mackenzie Davis'),
('Toby Huss'),
('Alana Cavanaugh'),

-- Actores de The Huntsman: Winter's War (Jessica Chastain era duplicado - ahora único)
('John Malkovich'),
('Colin Farrell'),
('Common'),
('Geena Davis'),
('Ioan Gruffudd'),

-- Actores de Birds of Prey (sin duplicados)
('Margot Robbie'),
('Ewan McGregor'),
('Mary Elizabeth Winstead'),
('Jurnee Smollett'),
('Rosie Perez'),
('Chris Messina'),

-- Actores de Archive (sin duplicados)
('Stacy Martin'),
('Rhona Mitra'),
('Theo James'),
('Peter Ferdinando'),
('Lia Williams'),
('Toby Jones'),

-- Actores de Awake (sin duplicados)
('Miranda Cosgrove'),
('Kate Walsh'),
('Omar Epps'),
('Angus Macfadyen'),
('Jorja Fox'),
('Enver Gjokaj'),

-- Actores de It Chapter Two (Jessica Chastain era duplicado - ya incluido)
('Bill Skarsgård'),
('Bill Hader'),
('James McAvoy'),
('Isaiah Mustafa'),
('Jay Ryan'),

-- Actores de Black Panther (sin duplicados)
('Chadwick Boseman'),
('Michael B. Jordan'),
('Lupita Nyong''o'),
('Danai Gurira'),
('Martin Freeman'),
('Daniel Kaluuya'),

-- Actores de Ford v Ferrari (Matt Damon y Josh Lucas eran duplicados - ahora únicos)
('Christian Bale'),
('Caitriona Balfe'),
('Noah Jupe'),
('Jon Bernthal'),

-- Actores de Big Gold Brick (sin duplicados)
('Génesis Rodríguez'),
('Vincent Piazza'),
('Benjamin Sokolow'),
('Emily Bayiokos'),

-- Actores de The Tank (sin duplicados)
('Amy Manson'),
('Luke Allen-Gale'),
('Nina Bergman'),
('Dominic Mafham'),
('James Weber Brown'),
('Lorina Kamburova'),

-- Actores de Contagion (Matt Damon y Laurence Fishburne eran duplicados - ahora únicos)
('Marion Cotillard'),
('Jude Law'),
('Kate Winslet'),
('Jennifer Ehle'),
('Gwyneth Paltrow'),

-- Actores de Black Widow (Scarlett Johansson y David Harbour eran duplicados - ahora únicos)
('Florence Pugh'),
('O.T. Fagbenle'),
('Rachel Weisz'),
('William Hurt'),
('Ray Winstone'),

-- Actores de The Martian (Matt Damon y Jessica Chastain eran duplicados - ya incluidos)
('Kristen Wiig'),
('Jeff Daniels'),
('Michael Peña'),
('Sean Bean'),
('Kate Mara'),

-- Actores de Ex Machina (sin duplicados)
('Alicia Vikander'),
('Domhnall Gleeson'),
('Oscar Isaac'),
('Sonoya Mizuno'),
('Corey Johnson'),
('Claire Selby'),
('Gana Bayarsaikhan'),

-- Actores de Jurassic World (Chris Pratt era duplicado - ahora único)
('Bryce Dallas Howard'),
('Irrfan Khan'),
('Vincent D''Onofrio'),
('Omar Sy'),
('Nick Robinson'),
('Judy Greer'),

-- Actores de I Am Legend (sin duplicados)
('Will Smith'),
('Alice Braga'),
('Charlie Tahan'),
('Dash Mihok'),
('Salli Richardson-Whitfield'),
('Willow Smith'),
('Emma Thompson'),

-- Actores de First Man (sin duplicados)
('Ryan Gosling'),
('Claire Foy'),
('Jason Clarke'),
('Kyle Chandler'),
('Corey Stoll'),
('Patrick Fugit'),

-- Actores de Pacific Rim: Uprising (sin duplicados)
('John Boyega'),
('Scott Eastwood'),
('Cailee Spaeny'),
('Jing Tian'),
('Rinko Kikuchi'),
('Burn Gorman'),

-- Actores de Jobs (sin duplicados)
('Ashton Kutcher'),
('Dermot Mulroney'),
('Josh Gad'),
('Lukas Haas'),
('Matthew Modine'),
('J.K. Simmons'),
('Lesley Ann Warren'),

-- Actores de Pirates of Silicon Valley (sin duplicados)
('Noah Wyle'),
('Anthony Michael Hall'),
('Joey Slotnick'),
('J.G. Hertzler'),
('Wayne Pére'),
('Sheila Shaw'),
('Gemma Zamprogna'),
('John DiMaggio'),

-- Actores de The Social Network (sin duplicados)
('Jesse Eisenberg'),
('Andrew Garfield'),
('Justin Timberlake'),
('Armie Hammer'),
('Max Minghella'),
('Rooney Mara'),
('Brenda Song'),
('Rashida Jones'),
('John Getz'),

-- Actores de AntiTrust (sin duplicados)
('Ryan Phillippe'),
('Rachael Leigh Cook'),
('Tim Robbins'),
('Claire Forlani'),
('Richard Roundtree'),
('Tygh Runyan'),
('Ned Bellamy'),
('Tyler Labine'),

-- Actores de Stowaway (sin duplicados)
('Anna Kendrick'),
('Daniel Dae Kim'),
('Shamier Anderson'),
('Toni Collette'),

-- Actores de Justice League (Ben Affleck y Henry Cavill eran duplicados - ahora únicos)
('Gal Gadot'),
('Jason Momoa'),
('Ezra Miller'),
('Ray Fisher'),
('Amy Adams'),
('Jeremy Irons'),
('Connie Nielsen'),

-- Actores de Two and a Half Men (sin duplicados)
('Charlie Sheen'),
('Jon Cryer'),
('Angus T. Jones'),
('Conchata Ferrel'),
('Holland Taylor'),
('Marin Hinkle'),
('Jennifer Bini Taylor'),
('Melanie Lynskey'),
('Amber Tamblyn'),

-- Actores de La Casa de Papel (sin duplicados)
('Úrsula Corberó'),
('Álvaro Morte'),
('Itziar Ituño'),
('Pedro Alonso'),
('Alba Flores'),
('Miguel Herrán'),
('Jaime Lorente'),
('Esther Acebo'),
('Enrique Arce'),

-- Actores de Stranger Things (David Harbour y Finn Wolfhard eran duplicados - ahora únicos)
('Winona Ryder'),
('Gaten Matarazzo'),
('Caleb McLaughlin'),
('Natalia Dyer'),
('Charlie Heaton'),
('Joe Keery'),

-- Actores de Gravity (Ed Harris era duplicado - ya incluido)
('Sandra Bullock'),
('George Clooney'),
('Orto Ignatiussen'),
('Phaldut Sharma'),
('Amy Warren'),
('Basher Savage'),
('Adam Cozens'),

-- Actores de It (Finn Wolfhard era duplicado - ya incluido)
('Jaeden Martell'),
('Jeremy Ray'),
('Sophia Lillis'),
('Chosen Jacobs'),
('Jack Dylan'),
('Wyatt Oleff'),
('Nicholas Hamilton'),

-- Actores de Apollo 13 (sin duplicados)
('Tom Hanks'),
('Bill Paxton'),
('Kevin Bacon'),
('Gary Sinise'),
('Kathleen Quinlan'),
('Roger Corman'),
('Chris Ellis'),
('Xander Berkeley'),

-- Actores de The Omen (sin duplicados)
('Liev Schreiber'),
('Julia Stiles'),
('Seamus Davey-Fitzpatrick'),
('David Thewils'),
('Pete Postlethwaite'),
('Mia Farrow'),
('Predrag Bjelac'),
('Carlo Sabatini'),
('Amy Huck'),

-- Actores de The Exorcist (sin duplicados)
('Ellen Burstyn'),
('Linda Blair'),
('Max von Sydow'),
('Lee J. Cobb'),
('Kitty Winn'),
('Jack MacGowran'),
('Jason Miller'),
('William O''Malley'),
('Barton Heyman'),

-- Actores de The Office (sin duplicados)
('Rainn Wilson'),
('Steve Carell'),
('Jenna Fischer'),
('John Krasinski'),
('B.J. Novak'),
('Kate Flannery'),
('Brian Baumgartner'),
('Leslie David Baker'),
('Mindy Kaling'),
('Angela Kinsey'),

-- Actores de The Good Doctor (sin duplicados)
('Freddie Highmore'),
('Antonia Thomas'),
('Hill Harper'),
('Richard Schiff'),
('Christina Chang'),
('Paige Spara'),
('Fiona Gubelmann'),
('Will Yun Lee'),
('Nicholas Gonzalez'),

-- Actores de The Theory of Everything (Emily Watson era duplicado - ya incluido)
('Eddie Redmayne'),
('Felicity Jones'),
('Charlie Cox'),
('Simon McBurney'),
('David Thewlis'),
('Maxine Peake'),
('Harry Lloyd'),
('Tom Prior'),

-- Actores de The Imitation Game (sin duplicados)
('Benedict Cumberbatch'),
('Keira Knightley'),
('Matthew Goode'),
('Rory Kinnear'),
('Allen Leech'),
('Matthew Beard'),
('Charles Dance'),
('Mark Strong'),
('James Northcote'),

-- Actores de Hidden Figures (Jim Parsons era duplicado - ya incluido)
('Taraji P. Henson'),
('Octavia Spencer'),
('Janelle Monáe'),
('Kevin Costner'),
('Kirsten Dunst'),
('Mahershala Ali'),
('Glen Powell'),
('Ariana Neal'),

-- Actores de A Beautiful Mind (Ed Harris y Josh Lucas eran duplicados - ya incluidos)
('Russell Crowe'),
('Jennifer Connelly'),
('Paul Bettany'),
('Christopher Plummer'),
('Adam Goldberg'),
('Anthony Rapp'),
('Judd Hirsch'),

-- Actores de Passengers (Chris Pratt y Laurence Fishburne eran duplicados - ya incluidos)
('Jennifer Lawrence'),
('Michael Sheen'),
('Andy García'),
('Aurora Perrineau'),
('Kristin Brock'),
('Julee Cerda'),
('Fred Melamed'),

-- Actores de The Devil's Advocate (sin duplicados)
('Anne Hathaway'),
('Patrick Wilson'),
('Andre Braugher'),
('Dianne Wiest'),
('David Morse'),
('William B. Davis'),
('Ryan Robbins'),
('Clea DuVall'),
('Don Thompson'),

-- Actores de Argo (Ben Affleck y Scoot McNairy eran duplicados - ya incluidos)
('Bryan Cranston'),
('Alan Arkin'),
('John Goodman'),
('Victor Garber'),
('Tate Donovan'),
('Rory Cochrane'),

-- Actores de Prometheus (Michael Fassbender y Guy Pearce eran duplicados - ya incluidos)
('Noomi Rapace'),
('Charlize Theron'),
('Logan Marshall-Green'),
('Idris Elba'),
('Sean Harris'),
('Rafe Spall'),
('Kate Dickie'),
('Emun Elliott'),
('Benedict Wong'),
('Lucy Hutchinson'),
('Ian Whyte'),
('Branwell Donaghey'),
('Vladimir Furdik'),
('C.C. Smiff'),
('Shane Steyn'),
('John Lebar'),

-- Actores de Alien: Covenant (Michael Fassbender y Guy Pearce eran duplicados - ya incluidos)
('Katherine Waterston'),
('Billy Crudup'),
('Danny McBride'),
('Demián Bichir'),
('Carmen Ejogo'),
('Jussie Smollett'),
('Callie Hernandez'),
('Amy Seimetz'),
('Nathaniel Dean'),
('Alexander England'),
('Benjamin Rigby'),
('Uli Latukefu'),
('Tess Haubrich'),
('Andrew Crawford'),
('James Franco'),
('Javier Botet'),

-- Actores que eran duplicados (ahora aparecen UNA SOLA VEZ al inicio):
('Henry Cavill'),
('Scarlett Johansson'),
('Jim Parsons'),
('Emily Watson'),
('Ed Harris'),
('Scoot McNairy'),
('Kerry Bishé'),
('Jessica Chastain'),
('Matt Damon'),
('Josh Lucas'),
('Laurence Fishburne'),
('David Harbour'),
('Chris Pratt'),
('Ben Affleck'),
('Finn Wolfhard'),
('Michael Fassbender'),
('Guy Pearce'),

-- Actores de 'Life' (2017) - ID: 61
('Jake Gyllenhaal'),
('Rebecca Ferguson'),
('Ryan Reynolds'),
('Hiroyuki Sanada'),
('Ariyon Bakare'),
('Olga Dihovichnaya'),
('Naoko Mori'),
('Haruka Kuroda'),
('Camiel Warren-Taylor'),

-- Actores de 'Madame Curie' - ID: 62
('Rosamund Pike'),
('Sam Riley'),
('Aneurin Barnard'),
('Anya Taylor-Joy'),
('Simon Russell Beale'),
('Jonathan Aris'),
('Corey Johnson'),
('Tim Woodward'),
('Katherine Parkinson'),

-- Actores de 'The IT Crowd' - ID: 63
('Chris O''Dowd'),
('Richard Ayoade'),
('Matt Berry'),
('Noel Fielding'),
('Peter Serafinowicz'),
('Graham Linehan'),
('Tom Binns'),
('Lewis Macleod'),
-- Katherine Parkinson ya incluida

-- Actores de 'Humans' - ID: 64
('Gemma Chan'),
('Emily Berrington'),
('Lucy Carless'),
('Colin Morgan'),
('Theo Stevenson'),
('Pixie Davies'),
('Tom Goodman-Hill'),
('Ivanno Jeremiah'),
('Ruth Bradley'),
('Will Tudor'),
('Neil Maskell'),
('Billy Jenkins'),
('Bella Dayne'),
('Thusitha Jayasundera'),
('Danny Webb'),
('Carrie-Anne Moss'),
('William Hurt'),

-- Actores de 'Need for Speed' - ID: 65
('Aaron Paul'),
('Dominic Cooper'),
('Imogen Poots'),
('Ramón Rodríguez'),
('Michael Keaton'),
('Kid Cudi'),
('Dakota Johnson'),
('Harrison Gilbertson'),
('Carmela Zumbado'),
('Jalil Jay Lynch'),
('Nick Chinlund'),
('Chad Randall'),

-- Actores de 'Mare of Easttown' - ID: 66
('Kate Winslet'),
('Julianne Nicholson'),
('Angourie Rice'),
('Evan Peters'),
('Sosie Bacon'),
('David Denman'),
('Neal Huff'),
('James McArdle'),
('Guy Pearce'),
('Cailee Spaeny'),
('John Douglas Thompson'),
('Joe Tippett'),
('Cameron Mann'),
('Chinasa Ogbuagu'),

-- Actores de 'Ray' - ID: 67
('Jamie Foxx'),
('Kerry Washington'),
('Regina King'),
('Harry Lennix'),
('Clifton Powell'),
('Bokeem Woodbine'),
('Sharon Warren'),
('C.J. Sanders'),
('Curtis Armstrong'),

-- Actores de 'Black Mirror' - ID: 68
('Michaela Coel'),
('Daniel Lapaine'),
('Hannah John-Kamen'),
('Andrew Roux'),
('Claire Keelan'),
('Sinéad Matthews'),
('Anna Wilson-Jones'),
('Paul Popplewell'),
('Julia Davis'),
('Ashley Thomas'),
('Kerrie Hayes'),
('Amy Beth Hayes'),
('Rebekah Staton'),
('Rhashan Stone'),
('Phoebe Fox'),
('Jimi Mistry'),
('Cherry Jones'),
('Alice Eve'),
('Susannah Fielding'),
('Demetri Goritsas'),
('Kadiff Kirwan'),
('Sope Dirisu'),
('Jackson Bews'),
('Annabel Davis'),
('Billy Griffin Jr.'),
('Paul Lawrence Kitson'),
('Jeff Mash'),
('Patrick Kennedy'),
('Lydia Wilson'),
('Alastair Mackenzie'),
('Chetna Pandya'),
('Tuppence Middleton'),
('Ian Bonar'),
('Elisabeth Hopper'),
('Nick Bartlett'),
('Wunmi Mosaku'),
('Alex Lawther'),
('Jerome Flynn'),
('Susannah Doyle'),
('Madeline Brewer'),
('Ariane Labed'),
('Sarah Snook'),
('Michael Kelly'),
('Jola Bokinni'),
('Faye Marsay'),
('Benedict Wong'),
('Jonas Karlsson'),
('Eugene O''Hare'),
('Indira Ainger'),
('James Lance'),
('David Ajala'),
('Sarah Abbott'),
('Jake Davies'),
('Clint Dyer'),
('Letitia Wright'),
('Babs Olusanmokun'),
('Georgina Campbell'),
('Jesse Plemons'),
('Aldis Hodge'),
('Kiran Sonia Sawar'),
('Miley Cyrus'),
('Anthony Mackie'),
('Nicole Beharie'),
('Gugu Mbatha-Raw'),
('Gugu Mbatha-Raw'),

-- Actores de 'Detrás de sus ojos' - ID: 69
('Simona Brown'),
('Eve Hewson'),
('Tom Bateman'),
('Robert Aramayo'),
('Tyler Howitt'),
('Georgie Glen'),
('Kamontip Krissy Ashton'),
('Rob Horrocks'),
('Joakim Skarli'),

-- Actores de 'Her' - ID: 70
('Joaquin Phoenix'),
('Scarlett Johansson'),
('Amy Adams'),
('Rooney Mara'),
('Olivia Wilde'),
('Chris Pratt'),
('Matt Letscher'),
('Portia Doubleday'),
('Spike Jonze'),

-- Actores de 'Misión Imposible' - ID: 71
('Tom Cruise'),
('Jon Voight'),
('Emmanuelle Béart'),
('Henry Czerny'),
('Jean Reno'),
('Ving Rhames'),
('Kristin Scott Thomas'),
('Vanessa Redgrave'),
('Ingeborga Dapkūnaitè'),

-- Actores de 'El agente de C.I.P.O.L.' - ID: 72
('Henry Cavill'),
('Armie Hammer'),
('Alicia Vikander'),
('Elizabeth Debicki'),
('Luca Calvani'),
('Sylvester Groth'),
('Hugh Grant'),
('Jared Harris'),
('Christian Berkel'),
('Misha Kuznetsov'),
('Guy Williams'),
('Marianna Di Martino'),

-- Actores de 'Jumanji - Bienvenidos a la jungla' - ID: 73
('Dwayne Johnson'),
('Kevin Hart'),
('Jack Black'),
('Karen Gillan'),
('Nick Jonas'),
('Rhys Darby'),
('Bobby Cannavale'),
('Alex Wolff'),
('Ser''Darius Blain'),
('Madison Iseman'),
('Morgan Turner'),
('Sean Buxton'),
('Mason Guccione'),
('Marin Hinkle'),
('Colin Hanks'),

-- Actores de 'Jumanji - The next level' - ID: 21
('Awkwafina'),
('Danny DeVito'),
('Danny Glover'),
-- Demás actores principales ya incluidos en Jumanji anterior

-- Actores de 'Mujer Maravilla 1984' - ID: 74
('Gal Gadot'),
('Chris Pine'),
('Kristen Wiig'),
('Pedro Pascal'),
('Robin Wright'),
('Connie Nielsen'),
('Lilly Aspell'),
('Amr Waked'),
('Kristoffer Polaha'),

-- Actores de 'El Contador' - ID: 75
('Ben Affleck'),
('Anna Kendrick'),
('J.K. Simmons'),
('Jon Bernthal'),
('Jeffrey Tambor'),
('Cynthia Addai-Robinson'),
('John Lithgow'),
('Andy Umberger'),
('Alison Wright'),
('Daeg Faerch'),
('Seth Lee'),
('Tait Fletcher'),
('Angel Giuffria'),
('Ron Yuan'),
('Scott Hunter'),
('Dennis Keiffer'),
('Jake Presley'),
('Jean Smart'),

-- Actores de 'Mala Educación' - ID: 76
('Hugh Jackman'),
('Allison Janney'),
('Geraldine Viswanathan'),
('Rafael Casal'),
('Stephen Spinella'),
('Annaleigh Ashford'),
('Ray Romano'),
('Hari Dhillon'),
('Jerremy Shamos'),
('Stephanie Kurtzuba'),
('Catherine Curtin'),
('Kathrine Narducci'),
('Ray Abruzzo'),
-- Alex Wolff ya incluido en Jumanji

-- actores de Horizonte Rojo - 77
('Anya Taylor-Joy'),
('Thomas Brodie-Sangster'),
('Harry Melling'),
('Moses Ingram'),
('Chloe Pirrie'),
('Janina Elkin'),

-- Actores de 'Noche en el Museo' - ID: 78
('Ben Stiller'),
('Robin Williams'),
('Carla Gugino'),
('Dick Van Dyke'),
('Steve Coogan'),
('Jake Cherry'),
('Mickey Rooney'),
('Bill Cobbs'),
('Owen Wilson'),
('Ricky Gervais'),
('Kim Raver'),
('Mizuo Peck'),
-- Rami Malek ya incluido

-- Actores de 'Bohemian Rhapsody' - ID: 79
('Rami Malek'),
('Gwilym Lee'),
('Ben Hardy'),
('Joseph Mazzello'),
('Lucy Boynton'),
('Aidan Gillen'),
('Allen Leech'),
('Tom Hollander'),
('Mike Myers'),

-- Actores de 'Rock of ages' - ID: 80
('Julianne Hough'),
('Diego Boneta'),
('Alec Baldwin'),
('Russell Brand'),
('Malin Åkerman'),
('Paul Giamatti'),
('Bryan Cranston'),
('Catherine Zeta-Jones'),
('Mary J. Blige'),
('Erica Frene'),
('Shane Hartline'),
('James Martin Kelly'),
('Will Forte'),
('Eli Roth'),
-- Tom Cruise ya incluido

-- Actores de 'Super 8' - ID: 81
('Joel Courtney'),
('Elle Fanning'),
('Riley Griffiths'),
('Kyle Chandler'),
('Noah Emmerich'),
('AJ Michalka'),
('Ryan Lee'),
('Ron Eldard'),
('Gabriel Basso'),

-- Actores de 'Jurassic World - El reino caido' - ID: 82
('Bryce Dallas Howard'),
('Rafe Spall'),
('Justice Smith'),
('Daniella Pineda'),
('James Cromwell'),
('Toby Jones'),
('Ted Levine'),
('Jeff Goldblum'),
('BD Wong'),
('Geraldine Chaplin'),
('Isabella Sermon'),
('Kevin Layne'),
-- Chris Pratt ya incluido en Her

-- Actores de 'Indiana Jones - y el Reino de la Calavera de Cristal' - ID: 83
('Harrison Ford'),
('Shia LaBeouf'),
('Cate Blanchett'),
('Karen Allen'),
('Ray Winstone'),
('John Hurt'),
('Jim Broadbent'),
('Igor Jijikine'),
('Dimitri Diatchenko'),

-- Actores de 'Los Goonies' - ID: 84
('Sean Astin'),
('Josh Brolin'),
('Jeff Cohen'),
('Corey Feldman'),
('Kerri Green'),
('Martha Plimpton'),
('Jonathan Ke Quan'),
('John Matuszak'),
('Robert Davi'),

-- Actores de 'Cars' - ID: 85
('Owen Wilson'),
('Bonnie Hunt'),
('Paul Newman'),
('Larry the Cable Guy'),
('Tony Shalhoub'),
('Cheech Marin'),
('Michael Wallis'),
('George Carlin'),
('Paul Dooley'),

-- Actores de 'Los pingüinos de Madagascar' - ID: 86
('John DiMaggio'),
('Chris Miller'),
('Tom McGrath'),
('Danny Jacobs'),
('Andy Richter'),
('Nicole Sullivan'),
('Christopher Knights'),
('Wayne Knight'),

-- Actores de 'Cementerio de animales' - ID: 87
('Dale Midkiff'),
('Fred Gwynne'),
('Denise Crosby'),
('Brad Greenquist'),
('Michael Lombard'),
('Miko Hughes'),
('Blaze Berdahl'),
('Susan Blommaert'),
('Mara Clark'),

-- Actores de 'Poltergeist' - ID: 88
('Craig T. Nelson'),
('JoBeth Williams'),
('Beatrice Straight'),
('Dominique Dunne'),
('Oliver Robins'),
('Heather O''Rourke'),
('Michael McManus'),
('Virginia Kiser'),
('Martin Casella'),

-- Actores de 'El código Da Vinci' - ID: 89
('Tom Hanks'),
('Audrey Tautou'),
('Ian McKellen'),
('Jean Reno'),
('Paul Bettany'),
('Alfred Molina'),
('Jürgen Prochnow'),
('Jean-Yves Berteloot'),
('Etienne Chicot'),

-- Actores de 'Johnny English' - ID: 90
('Rowan Atkinson'),
('Natalie Imbruglia'),
('Ben Miller'),
('John Malkovich'),
('Greg Wise'),
('Tasha de Vasconcelos'),
('Douglas McFerran'),
('Steve Nicolson'),
('Terence Harvey'),

-- Actores de 'Almost Famous' - ID: 91
('Billy Crudup'),
('Frances McDormand'),
('Kate Hudson'),
('Patrick Fugit'),
('Jason Lee'),
('Zoey Deschanel'),
('Michael Angarano'),
('Anna Paquin'),
('Fairuza Balk'),

-- Actores de 'Escuela de Rock' - ID: 92
('Jack Black'),
('Joan Cusack'),
('Mike White'),
('Sarah Silverman'),
('Lee Wilkof'),
('Kate McGregor-Stewart'),
('Adam Pascal'),
('Suzanne Douglas'),
('Miranda Cosgrove'),

-- Actores de 'Mi pobre angelito' - ID: 93
('Macaulay Culkin'),
('Joe Pesci'),
('Daniel Stern'),
('John Heard'),
('Catherine O''Hara'),
('Roberts Blossom'),
('Devin Ratray'),
('Michael C. Maronna'),
('Hillary Wolf'),

-- Actores de 'Aprendices fuera de línea' - ID: 94
('Vince Vaughn'),
('Will Ferrell'),
('Rose Byrne'),
('Aasif Mandvi'),
('Max Minghella'),
('Josh Brener'),
('Dylan O''Brien'),
('Tiya Sircar'),
('Tobit Raphael'),
('Josh Gad'),
('Jessica Szohr'),
('Rob Riggle'),
('Eric André'),
('Harvey Guillén'),
('Gary Anthony Williams'),
('Bruno Amato'),
('B.J. Novak'),
('Karen Ceesay'),
('John Goodman'),
-- Owen Wilson ya incluido

-- Actores de 'Outsourced' - ID: 95
('Rebecca Hazlewood'),
('Sacha Dhawan'),
('Diedrich Bader'),
('Pippa Black'),
('Parvesh Ceena'),
('Thushari Jayasekera'),
('Ben Rappaport'),
('Guru Singh'),
('Rizwan Manji'),
('Anisha Nagarajan'),
('Carla Gallo'),
('Radhika Chaudhari'),
('Nicholas Logan'),

-- Actores de 'Miedo Profundo' - ID: 96
('Blake Lively'),
('Óscar Jaenada'),
('Janelle Bailley'),
('Chelsea Moody'),
('Angelo Josue Lozano Corzo'),
('José Manuel Trujillo Salas'),
('Brett Cullen'),
('Sedona Legge'),
('Pablo Calva'),

-- Actores de 'Everest' - ID: 97
('Jason Clarke'),
('John Hawkes'),
('Sam Worthington'),
('Emily Watson'),
('Martin Henderson'),
('Michael Kelly'),
('Keira Knightley'),
('Thomas M. Wright'),
('Clive Standen'),
('Mia Goth'),
('Vanessa Kirby'),
-- Josh Brolin y Jake Gyllenhaal ya incluidos
-- Robin Wright ya incluida
-- Naoko Mori ya incluida
-- Elizabeth Debicki ya incluida
-- Tom Goodman-Hill ya incluido

-- Actores de 'La Familia Addams' - ID: 98
('Raúl Juliá'),
('Anjelica Huston'),
('Christopher Lloyd'),
('Christina Ricci'),
('Carel Struycken'),
('Dan Hedaya'),
('Jimmy Workman'),
('Elizabeth Wilson'),
('Dana Ivey'),

-- Actores de 'El Último Susurro' - ID: 99
('Leonardo Sbaraglia'),
('Cecilia Roth'),
('Nahuel Pérez Biscayart'),
('Érica Rivas'),
('Daniel Hendler'),
('Julieta Díaz'),
('Luis Machín'),

-- Actores de 'Vecinos del Fin del Mundo' - ID: 100
('Luis Brandoni'),
('Graciela Borges'),
('Peto Menahem'),
('Pilar Gamboa'),
('Martín Piroyansky'),
('Verónica Llinás'),
('Chino Darín');

-- Reparto para The Crown (idContenido: 1)
INSERT INTO reparto (idContenido, idActor) VALUES
(1, (SELECT idActor FROM actores WHERE nombreActor = 'Claire Fox')),
(1, (SELECT idActor FROM actores WHERE nombreActor = 'Olivia Colman')),
(1, (SELECT idActor FROM actores WHERE nombreActor = 'Matt Smith')),
(1, (SELECT idActor FROM actores WHERE nombreActor = 'Tobias Menzies')),
(1, (SELECT idActor FROM actores WHERE nombreActor = 'Vanesa Kirby')),
(1, (SELECT idActor FROM actores WHERE nombreActor = 'Helena Bonham Carter'));

-- Reparto para Riverdale (idContenido: 2)
INSERT INTO reparto (idContenido, idActor) VALUES
(2, (SELECT idActor FROM actores WHERE nombreActor = 'Lili Reinhart')),
(2, (SELECT idActor FROM actores WHERE nombreActor = 'Casey Cott')),
(2, (SELECT idActor FROM actores WHERE nombreActor = 'Camila Mendes')),
(2, (SELECT idActor FROM actores WHERE nombreActor = 'Marisol Nichols')),
(2, (SELECT idActor FROM actores WHERE nombreActor = 'Madelaine Petsch')),
(2, (SELECT idActor FROM actores WHERE nombreActor = 'Mädchen Amick'));

-- Reparto para The Mandalorian (idContenido: 3)
INSERT INTO reparto (idContenido, idActor) VALUES
(3, (SELECT idActor FROM actores WHERE nombreActor = 'Pedro Pascal')),
(3, (SELECT idActor FROM actores WHERE nombreActor = 'Carl Weathers')),
(3, (SELECT idActor FROM actores WHERE nombreActor = 'Misty Rosas')),
(3, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Bartlett')),
(3, (SELECT idActor FROM actores WHERE nombreActor = 'Rio Hackford')),
(3, (SELECT idActor FROM actores WHERE nombreActor = 'Giancarlo Esposito'));

-- Reparto para The Umbrella Academy (idContenido: 4)
INSERT INTO reparto (idContenido, idActor) VALUES
(4, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Hopper')),
(4, (SELECT idActor FROM actores WHERE nombreActor = 'David Castañeda')),
(4, (SELECT idActor FROM actores WHERE nombreActor = 'Emmy Raver-Lampman')),
(4, (SELECT idActor FROM actores WHERE nombreActor = 'Robert Sheehan')),
(4, (SELECT idActor FROM actores WHERE nombreActor = 'Aidan Gallagher')),
(4, (SELECT idActor FROM actores WHERE nombreActor = 'Elliot Page'));

-- Reparto para Gambito de Dama (idContenido: 5)
INSERT INTO reparto (idContenido, idActor) VALUES
(5, (SELECT idActor FROM actores WHERE nombreActor = 'Anya Taylor-Joy')),
(5, (SELECT idActor FROM actores WHERE nombreActor = 'Thomas Brodie-Sangster')),
(5, (SELECT idActor FROM actores WHERE nombreActor = 'Harry Melling')),
(5, (SELECT idActor FROM actores WHERE nombreActor = 'Moses Ingram')),
(5, (SELECT idActor FROM actores WHERE nombreActor = 'Chloe Pirrie')),
(5, (SELECT idActor FROM actores WHERE nombreActor = 'Janina Elkin'));

-- Reparto para Enola Holmes (idContenido: 6)
INSERT INTO reparto (idContenido, idActor) VALUES
(6, (SELECT idActor FROM actores WHERE nombreActor = 'Millie Bobby Brown')),
(6, (SELECT idActor FROM actores WHERE nombreActor = 'Henry Cavill')),
(6, (SELECT idActor FROM actores WHERE nombreActor = 'Sam Claflin')),
(6, (SELECT idActor FROM actores WHERE nombreActor = 'Helena Bonham Carter')),
(6, (SELECT idActor FROM actores WHERE nombreActor = 'Louis Partridge')),
(6, (SELECT idActor FROM actores WHERE nombreActor = 'Adeel Akhtar'));

-- Reparto para Guasón (idContenido: 7)
INSERT INTO reparto (idContenido, idActor) VALUES
(7, (SELECT idActor FROM actores WHERE nombreActor = 'Joaquin Phoenix')),
(7, (SELECT idActor FROM actores WHERE nombreActor = 'Robert De Niro')),
(7, (SELECT idActor FROM actores WHERE nombreActor = 'Zazie Beetz')),
(7, (SELECT idActor FROM actores WHERE nombreActor = 'Frances Conroy')),
(7, (SELECT idActor FROM actores WHERE nombreActor = 'Brett Cullen')),
(7, (SELECT idActor FROM actores WHERE nombreActor = 'Shea Whigham'));

-- Reparto para Avengers: End Game (idContenido: 8)
INSERT INTO reparto (idContenido, idActor) VALUES
(8, (SELECT idActor FROM actores WHERE nombreActor = 'Robert Downey Jr.')),
(8, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Evans')),
(8, (SELECT idActor FROM actores WHERE nombreActor = 'Mark Ruffalo')),
(8, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Hemsworth')),
(8, (SELECT idActor FROM actores WHERE nombreActor = 'Scarlett Johansson')),
(8, (SELECT idActor FROM actores WHERE nombreActor = 'Jeremy Renner'));

-- Reparto para Juego de tronos (idContenido: 9)
INSERT INTO reparto (idContenido, idActor) VALUES
(9, (SELECT idActor FROM actores WHERE nombreActor = 'Emilia Clarke')),
(9, (SELECT idActor FROM actores WHERE nombreActor = 'Lena Headey')),
(9, (SELECT idActor FROM actores WHERE nombreActor = 'Sophie Turner')),
(9, (SELECT idActor FROM actores WHERE nombreActor = 'Kit Harington')),
(9, (SELECT idActor FROM actores WHERE nombreActor = 'Peter Dinklage')),
(9, (SELECT idActor FROM actores WHERE nombreActor = 'Nikolaj Coster-Waldau'));

-- Reparto para The Flash (idContenido: 10)
INSERT INTO reparto (idContenido, idActor) VALUES
(10, (SELECT idActor FROM actores WHERE nombreActor = 'Grant Gustin')),
(10, (SELECT idActor FROM actores WHERE nombreActor = 'Carlos Valdes')),
(10, (SELECT idActor FROM actores WHERE nombreActor = 'Danielle Panabaker')),
(10, (SELECT idActor FROM actores WHERE nombreActor = 'Candice Patton')),
(10, (SELECT idActor FROM actores WHERE nombreActor = 'Jesse L. Martin')),
(10, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Cavanagh'));

INSERT INTO reparto (idContenido, idActor) VALUES
(11, (SELECT idActor FROM actores WHERE nombreActor = 'Jim Parsons')),
(11, (SELECT idActor FROM actores WHERE nombreActor = 'Johnny Galecki')),
(11, (SELECT idActor FROM actores WHERE nombreActor = 'Kaley Cuoco')),
(11, (SELECT idActor FROM actores WHERE nombreActor = 'Simon Helberg')),
(11, (SELECT idActor FROM actores WHERE nombreActor = 'Kunal Nayyar')),
(11, (SELECT idActor FROM actores WHERE nombreActor = 'Melissa Rauch')),
(11, (SELECT idActor FROM actores WHERE nombreActor = 'Mayim Bialik'));

INSERT INTO reparto (idContenido, idActor) VALUES
(12, (SELECT idActor FROM actores WHERE nombreActor = 'Jennifer Aniston')),
(12, (SELECT idActor FROM actores WHERE nombreActor = 'Courteney Cox')),
(12, (SELECT idActor FROM actores WHERE nombreActor = 'Lisa Kudrow')),
(12, (SELECT idActor FROM actores WHERE nombreActor = 'David Schwimmer')),
(12, (SELECT idActor FROM actores WHERE nombreActor = 'Matthew Perry')),
(12, (SELECT idActor FROM actores WHERE nombreActor = 'Matt LeBlanc'));

INSERT INTO reparto (idContenido, idActor) VALUES
(13, (SELECT idActor FROM actores WHERE nombreActor = 'Amybeth McNulty')),
(13, (SELECT idActor FROM actores WHERE nombreActor = 'Geraldine James')),
(13, (SELECT idActor FROM actores WHERE nombreActor = 'R. H. Thomson')),
(13, (SELECT idActor FROM actores WHERE nombreActor = 'Corrine Koslo')),
(13, (SELECT idActor FROM actores WHERE nombreActor = 'Dalila Bela')),
(13, (SELECT idActor FROM actores WHERE nombreActor = 'Lucas Jade Zumann'));

INSERT INTO reparto (idContenido, idActor) VALUES
(14, (SELECT idActor FROM actores WHERE nombreActor = 'Gillian Anderson')),
(14, (SELECT idActor FROM actores WHERE nombreActor = 'David Duchovny')),
(14, (SELECT idActor FROM actores WHERE nombreActor = 'Mitch Pileggi')),
(14, (SELECT idActor FROM actores WHERE nombreActor = 'Robert Patrick')),
(14, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Braidwood')),
(14, (SELECT idActor FROM actores WHERE nombreActor = 'Bruce Harwood'));

INSERT INTO reparto (idContenido, idActor) VALUES
(15, (SELECT idActor FROM actores WHERE nombreActor = 'Jared Harris')),
(15, (SELECT idActor FROM actores WHERE nombreActor = 'Stellan Skarsgård')),
(15, (SELECT idActor FROM actores WHERE nombreActor = 'Emily Watson')),
(15, (SELECT idActor FROM actores WHERE nombreActor = 'Paul Ritter')),
(15, (SELECT idActor FROM actores WHERE nombreActor = 'Jessie Buckley')),
(15, (SELECT idActor FROM actores WHERE nombreActor = 'Adam Nagaitis'));

INSERT INTO reparto (idContenido, idActor) VALUES
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Evan Rachel Wood')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Thandiwe Newton')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Jeffrey Wright')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Tessa Thompson')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Ed Harris')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Luke Hemsworth')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Rodrigo Santoro')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Simon Quarterman')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Clifton Collins Jr.')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Anthony Hopkins')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Ingrid Bolsø Berdal')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Angela Sarafyan')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Shannon Woodward')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Talulah Riley')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Louis Herthum')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Ben Barnes')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Jimmi Simpson')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Leonardo Nam')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Aaron Paul')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Vincent Cassel')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Izabella Alvarez')),
(16, (SELECT idActor FROM actores WHERE nombreActor = 'Jeff Daniel Phillips'));

-- Reparto para "Halt and Catch Fire" (idContenido = 17)
INSERT INTO reparto (idContenido, idActor) VALUES
(17, (SELECT idActor FROM actores WHERE nombreActor = 'Lee Pace')),
(17, (SELECT idActor FROM actores WHERE nombreActor = 'Scoot McNairy')),
(17, (SELECT idActor FROM actores WHERE nombreActor = 'Mackenzie Davis')),
(17, (SELECT idActor FROM actores WHERE nombreActor = 'Kerry Bishé')),
(17, (SELECT idActor FROM actores WHERE nombreActor = 'Toby Huss')),
(17, (SELECT idActor FROM actores WHERE nombreActor = 'Alana Cavanaugh'));

-- Reparto para "Ava" (idContenido = 18)
INSERT INTO reparto (idContenido, idActor) VALUES
(18, (SELECT idActor FROM actores WHERE nombreActor = 'Jessica Chastain')),
(18, (SELECT idActor FROM actores WHERE nombreActor = 'John Malkovich')),
(18, (SELECT idActor FROM actores WHERE nombreActor = 'Colin Farrell')),
(18, (SELECT idActor FROM actores WHERE nombreActor = 'Common')),
(18, (SELECT idActor FROM actores WHERE nombreActor = 'Geena Davis')),
(18, (SELECT idActor FROM actores WHERE nombreActor = 'Ioan Gruffudd'));


INSERT INTO reparto (idContenido, idActor) VALUES
(19, (SELECT idActor FROM actores WHERE nombreActor = 'Margot Robbie')),
(19, (SELECT idActor FROM actores WHERE nombreActor = 'Ewan McGregor')),
(19, (SELECT idActor FROM actores WHERE nombreActor = 'Mary Elizabeth Winstead')),
(19, (SELECT idActor FROM actores WHERE nombreActor = 'Jurnee Smollett')),
(19, (SELECT idActor FROM actores WHERE nombreActor = 'Rosie Perez')),
(19, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Messina'));

INSERT INTO reparto (idContenido, idActor) VALUES
(20, (SELECT idActor FROM actores WHERE nombreActor = 'Stacy Martin')),
(20, (SELECT idActor FROM actores WHERE nombreActor = 'Rhona Mitra')),
(20, (SELECT idActor FROM actores WHERE nombreActor = 'Theo James')),
(20, (SELECT idActor FROM actores WHERE nombreActor = 'Peter Ferdinando')),
(20, (SELECT idActor FROM actores WHERE nombreActor = 'Lia Williams')),
(20, (SELECT idActor FROM actores WHERE nombreActor = 'Toby Jones'));

INSERT INTO reparto (idContenido, idActor) VALUES
(22, (SELECT idActor FROM actores WHERE nombreActor = 'Miranda Cosgrove')),
(22, (SELECT idActor FROM actores WHERE nombreActor = 'Kate Walsh')),
(22, (SELECT idActor FROM actores WHERE nombreActor = 'Omar Epps')),
(22, (SELECT idActor FROM actores WHERE nombreActor = 'Angus Macfadyen')),
(22, (SELECT idActor FROM actores WHERE nombreActor = 'Jorja Fox')),
(22, (SELECT idActor FROM actores WHERE nombreActor = 'Enver Gjokaj'));

INSERT INTO reparto (idContenido, idActor) VALUES
(23, (SELECT idActor FROM actores WHERE nombreActor = 'Bill Skarsgård')),
(23, (SELECT idActor FROM actores WHERE nombreActor = 'Jessica Chastain')),
(23, (SELECT idActor FROM actores WHERE nombreActor = 'Bill Hader')),
(23, (SELECT idActor FROM actores WHERE nombreActor = 'James McAvoy')),
(23, (SELECT idActor FROM actores WHERE nombreActor = 'Isaiah Mustafa')),
(23, (SELECT idActor FROM actores WHERE nombreActor = 'Jay Ryan'));
 
INSERT INTO reparto (idContenido, idActor) VALUES
(24, (SELECT idActor FROM actores WHERE nombreActor = 'Chadwick Boseman')),
(24, (SELECT idActor FROM actores WHERE nombreActor = 'Michael B. Jordan')),
(24, (SELECT idActor FROM actores WHERE nombreActor = 'Lupita Nyong''o')),
(24, (SELECT idActor FROM actores WHERE nombreActor = 'Danai Gurira')),
(24, (SELECT idActor FROM actores WHERE nombreActor = 'Martin Freeman')),
(24, (SELECT idActor FROM actores WHERE nombreActor = 'Daniel Kaluuya'));

INSERT INTO reparto (idContenido, idActor) VALUES
(25, (SELECT idActor FROM actores WHERE nombreActor = 'Christian Bale')),
(25, (SELECT idActor FROM actores WHERE nombreActor = 'Matt Damon')),
(25, (SELECT idActor FROM actores WHERE nombreActor = 'Caitriona Balfe')),
(25, (SELECT idActor FROM actores WHERE nombreActor = 'Josh Lucas')),
(25, (SELECT idActor FROM actores WHERE nombreActor = 'Noah Jupe')),
(25, (SELECT idActor FROM actores WHERE nombreActor = 'Jon Bernthal'));

INSERT INTO reparto (idContenido, idActor) VALUES
(26, (SELECT idActor FROM actores WHERE nombreActor = 'Génesis Rodríguez')),
(26, (SELECT idActor FROM actores WHERE nombreActor = 'Vincent Piazza')),
(26, (SELECT idActor FROM actores WHERE nombreActor = 'Benjamin Sokolow')),
(26, (SELECT idActor FROM actores WHERE nombreActor = 'Emily Bayiokos'));

INSERT INTO reparto (idContenido, idActor) VALUES
(27, (SELECT idActor FROM actores WHERE nombreActor = 'Amy Manson')),
(27, (SELECT idActor FROM actores WHERE nombreActor = 'Luke Allen-Gale')),
(27, (SELECT idActor FROM actores WHERE nombreActor = 'Nina Bergman')),
(27, (SELECT idActor FROM actores WHERE nombreActor = 'Dominic Mafham')),
(27, (SELECT idActor FROM actores WHERE nombreActor = 'James Weber Brown')),
(27, (SELECT idActor FROM actores WHERE nombreActor = 'Lorina Kamburova'));

INSERT INTO reparto (idContenido, idActor) VALUES
(28, (SELECT idActor FROM actores WHERE nombreActor = 'Marion Cotillard')),
(28, (SELECT idActor FROM actores WHERE nombreActor = 'Matt Damon')),
(28, (SELECT idActor FROM actores WHERE nombreActor = 'Laurence Fishburne')),
(28, (SELECT idActor FROM actores WHERE nombreActor = 'Jude Law')),
(28, (SELECT idActor FROM actores WHERE nombreActor = 'Kate Winslet')),
(28, (SELECT idActor FROM actores WHERE nombreActor = 'Jennifer Ehle')),
(28, (SELECT idActor FROM actores WHERE nombreActor = 'Gwyneth Paltrow'));

INSERT INTO reparto (idContenido, idActor) VALUES
(29, (SELECT idActor FROM actores WHERE nombreActor = 'Scarlett Johansson')),
(29, (SELECT idActor FROM actores WHERE nombreActor = 'Florence Pugh')),
(29, (SELECT idActor FROM actores WHERE nombreActor = 'David Harbour')),
(29, (SELECT idActor FROM actores WHERE nombreActor = 'O.T. Fagbenle')),
(29, (SELECT idActor FROM actores WHERE nombreActor = 'Rachel Weisz')),
(29, (SELECT idActor FROM actores WHERE nombreActor = 'William Hurt')),
(29, (SELECT idActor FROM actores WHERE nombreActor = 'Ray Winstone'));

INSERT INTO reparto (idContenido, idActor) VALUES
(30, (SELECT idActor FROM actores WHERE nombreActor = 'Matt Damon')),
(30, (SELECT idActor FROM actores WHERE nombreActor = 'Jessica Chastain')),
(30, (SELECT idActor FROM actores WHERE nombreActor = 'Kristen Wiig')),
(30, (SELECT idActor FROM actores WHERE nombreActor = 'Jeff Daniels')),
(30, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Peña')),
(30, (SELECT idActor FROM actores WHERE nombreActor = 'Sean Bean')),
(30, (SELECT idActor FROM actores WHERE nombreActor = 'Kate Mara'));

INSERT INTO reparto (idContenido, idActor) VALUES
(31, (SELECT idActor FROM actores WHERE nombreActor = 'Alicia Vikander')),
(31, (SELECT idActor FROM actores WHERE nombreActor = 'Domhnall Gleeson')),
(31, (SELECT idActor FROM actores WHERE nombreActor = 'Oscar Isaac')),
(31, (SELECT idActor FROM actores WHERE nombreActor = 'Sonoya Mizuno')),
(31, (SELECT idActor FROM actores WHERE nombreActor = 'Corey Johnson')),
(31, (SELECT idActor FROM actores WHERE nombreActor = 'Claire Selby')),
(31, (SELECT idActor FROM actores WHERE nombreActor = 'Gana Bayarsaikhan'));

INSERT INTO reparto (idContenido, idActor) VALUES
(32, (SELECT idActor FROM actores WHERE nombreActor = 'Bryce Dallas Howard')),
(32, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Pratt')),
(32, (SELECT idActor FROM actores WHERE nombreActor = 'Irrfan Khan')),
(32, (SELECT idActor FROM actores WHERE nombreActor = 'Vincent D''Onofrio')),
(32, (SELECT idActor FROM actores WHERE nombreActor = 'Omar Sy')),
(32, (SELECT idActor FROM actores WHERE nombreActor = 'Nick Robinson')),
(32, (SELECT idActor FROM actores WHERE nombreActor = 'Judy Greer'));

INSERT INTO reparto (idContenido, idActor) VALUES
(33, (SELECT idActor FROM actores WHERE nombreActor = 'Will Smith')),
(33, (SELECT idActor FROM actores WHERE nombreActor = 'Alice Braga')),
(33, (SELECT idActor FROM actores WHERE nombreActor = 'Charlie Tahan')),
(33, (SELECT idActor FROM actores WHERE nombreActor = 'Dash Mihok')),
(33, (SELECT idActor FROM actores WHERE nombreActor = 'Salli Richardson-Whitfield')),
(33, (SELECT idActor FROM actores WHERE nombreActor = 'Willow Smith')),
(33, (SELECT idActor FROM actores WHERE nombreActor = 'Emma Thompson'));

INSERT INTO reparto (idContenido, idActor) VALUES
(34, (SELECT idActor FROM actores WHERE nombreActor = 'Ryan Gosling')),
(34, (SELECT idActor FROM actores WHERE nombreActor = 'Claire Foy')),
(34, (SELECT idActor FROM actores WHERE nombreActor = 'Jason Clarke')),
(34, (SELECT idActor FROM actores WHERE nombreActor = 'Kyle Chandler')),
(34, (SELECT idActor FROM actores WHERE nombreActor = 'Corey Stoll')),
(34, (SELECT idActor FROM actores WHERE nombreActor = 'Patrick Fugit'));

INSERT INTO reparto (idContenido, idActor) VALUES
(35, (SELECT idActor FROM actores WHERE nombreActor = 'John Boyega')),
(35, (SELECT idActor FROM actores WHERE nombreActor = 'Scott Eastwood')),
(35, (SELECT idActor FROM actores WHERE nombreActor = 'Cailee Spaeny')),
(35, (SELECT idActor FROM actores WHERE nombreActor = 'Jing Tian')),
(35, (SELECT idActor FROM actores WHERE nombreActor = 'Rinko Kikuchi')),
(35, (SELECT idActor FROM actores WHERE nombreActor = 'Burn Gorman'));

INSERT INTO reparto (idContenido, idActor) VALUES
(36, (SELECT idActor FROM actores WHERE nombreActor = 'Ashton Kutcher')),
(36, (SELECT idActor FROM actores WHERE nombreActor = 'Dermot Mulroney')),
(36, (SELECT idActor FROM actores WHERE nombreActor = 'Josh Gad')),
(36, (SELECT idActor FROM actores WHERE nombreActor = 'Lukas Haas')),
(36, (SELECT idActor FROM actores WHERE nombreActor = 'Matthew Modine')),
(36, (SELECT idActor FROM actores WHERE nombreActor = 'J.K. Simmons')),
(36, (SELECT idActor FROM actores WHERE nombreActor = 'Lesley Ann Warren'));

INSERT INTO reparto (idContenido, idActor) VALUES
(37, (SELECT idActor FROM actores WHERE nombreActor = 'Noah Wyle')),
(37, (SELECT idActor FROM actores WHERE nombreActor = 'Anthony Michael Hall')),
(37, (SELECT idActor FROM actores WHERE nombreActor = 'Joey Slotnick')),
(37, (SELECT idActor FROM actores WHERE nombreActor = 'J.G. Hertzler')),
(37, (SELECT idActor FROM actores WHERE nombreActor = 'Wayne Pére')),
(37, (SELECT idActor FROM actores WHERE nombreActor = 'Sheila Shaw')),
(37, (SELECT idActor FROM actores WHERE nombreActor = 'Gemma Zamprogna')),
(37, (SELECT idActor FROM actores WHERE nombreActor = 'John DiMaggio'));

INSERT INTO reparto (idContenido, idActor) VALUES
(38, (SELECT idActor FROM actores WHERE nombreActor = 'Jesse Eisenberg')),
(38, (SELECT idActor FROM actores WHERE nombreActor = 'Andrew Garfield')),
(38, (SELECT idActor FROM actores WHERE nombreActor = 'Justin Timberlake')),
(38, (SELECT idActor FROM actores WHERE nombreActor = 'Armie Hammer')),
(38, (SELECT idActor FROM actores WHERE nombreActor = 'Max Minghella')),
(38, (SELECT idActor FROM actores WHERE nombreActor = 'Rooney Mara')),
(38, (SELECT idActor FROM actores WHERE nombreActor = 'Brenda Song')),
(38, (SELECT idActor FROM actores WHERE nombreActor = 'Rashida Jones')),
(38, (SELECT idActor FROM actores WHERE nombreActor = 'John Getz'));

INSERT INTO reparto (idContenido, idActor) VALUES
(39, (SELECT idActor FROM actores WHERE nombreActor = 'Ryan Phillippe')),
(39, (SELECT idActor FROM actores WHERE nombreActor = 'Rachael Leigh Cook')),
(39, (SELECT idActor FROM actores WHERE nombreActor = 'Tim Robbins')),
(39, (SELECT idActor FROM actores WHERE nombreActor = 'Claire Forlani')),
(39, (SELECT idActor FROM actores WHERE nombreActor = 'Richard Roundtree')),
(39, (SELECT idActor FROM actores WHERE nombreActor = 'Tygh Runyan')),
(39, (SELECT idActor FROM actores WHERE nombreActor = 'Ned Bellamy')),
(39, (SELECT idActor FROM actores WHERE nombreActor = 'Tyler Labine'));

INSERT INTO reparto (idContenido, idActor) VALUES
(40, (SELECT idActor FROM actores WHERE nombreActor = 'Anna Kendrick')),
(40, (SELECT idActor FROM actores WHERE nombreActor = 'Daniel Dae Kim')),
(40, (SELECT idActor FROM actores WHERE nombreActor = 'Shamier Anderson')),
(40, (SELECT idActor FROM actores WHERE nombreActor = 'Toni Collette'));

INSERT INTO reparto (idContenido, idActor) VALUES
(41, (SELECT idActor FROM actores WHERE nombreActor = 'Ben Affleck')),
(41, (SELECT idActor FROM actores WHERE nombreActor = 'Henry Cavill')),
(41, (SELECT idActor FROM actores WHERE nombreActor = 'Gal Gadot')),
(41, (SELECT idActor FROM actores WHERE nombreActor = 'Jason Momoa')),
(41, (SELECT idActor FROM actores WHERE nombreActor = 'Ezra Miller')),
(41, (SELECT idActor FROM actores WHERE nombreActor = 'Ray Fisher')),
(41, (SELECT idActor FROM actores WHERE nombreActor = 'Amy Adams')),
(41, (SELECT idActor FROM actores WHERE nombreActor = 'Jeremy Irons')),
(41, (SELECT idActor FROM actores WHERE nombreActor = 'Connie Nielsen'));

INSERT INTO reparto (idContenido, idActor) VALUES
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Charlie Sheen')),
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Jon Cryer')),
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Angus T. Jones')),
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Conchata Ferrel')),
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Holland Taylor')),
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Marin Hinkle')),
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Jennifer Bini Taylor')),
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Melanie Lynskey')),
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Ashton Kutcher')),
(42, (SELECT idActor FROM actores WHERE nombreActor = 'Amber Tamblyn'));

INSERT INTO reparto (idContenido, idActor) VALUES
(43, (SELECT idActor FROM actores WHERE nombreActor = 'Úrsula Corberó')),
(43, (SELECT idActor FROM actores WHERE nombreActor = 'Álvaro Morte')),
(43, (SELECT idActor FROM actores WHERE nombreActor = 'Itziar Ituño')),
(43, (SELECT idActor FROM actores WHERE nombreActor = 'Pedro Alonso')),
(43, (SELECT idActor FROM actores WHERE nombreActor = 'Alba Flores')),
(43, (SELECT idActor FROM actores WHERE nombreActor = 'Miguel Herrán')),
(43, (SELECT idActor FROM actores WHERE nombreActor = 'Jaime Lorente')),
(43, (SELECT idActor FROM actores WHERE nombreActor = 'Esther Acebo')),
(43, (SELECT idActor FROM actores WHERE nombreActor = 'Enrique Arce'));

INSERT INTO reparto (idContenido, idActor) VALUES
(44, (SELECT idActor FROM actores WHERE nombreActor = 'Winona Ryder')),
(44, (SELECT idActor FROM actores WHERE nombreActor = 'David Harbour')),
(44, (SELECT idActor FROM actores WHERE nombreActor = 'Finn Wolfhard')),
(44, (SELECT idActor FROM actores WHERE nombreActor = 'Millie Bobby Brown')),
(44, (SELECT idActor FROM actores WHERE nombreActor = 'Gaten Matarazzo')),
(44, (SELECT idActor FROM actores WHERE nombreActor = 'Caleb McLaughlin')),
(44, (SELECT idActor FROM actores WHERE nombreActor = 'Natalia Dyer')),
(44, (SELECT idActor FROM actores WHERE nombreActor = 'Charlie Heaton')),
(44, (SELECT idActor FROM actores WHERE nombreActor = 'Joe Keery'));

INSERT INTO reparto (idContenido, idActor) VALUES
(45, (SELECT idActor FROM actores WHERE nombreActor = 'Sandra Bullock')),
(45, (SELECT idActor FROM actores WHERE nombreActor = 'George Clooney')),
(45, (SELECT idActor FROM actores WHERE nombreActor = 'Ed Harris')),
(45, (SELECT idActor FROM actores WHERE nombreActor = 'Orto Ignatiussen')),
(45, (SELECT idActor FROM actores WHERE nombreActor = 'Phaldut Sharma')),
(45, (SELECT idActor FROM actores WHERE nombreActor = 'Amy Warren')),
(45, (SELECT idActor FROM actores WHERE nombreActor = 'Basher Savage')),
(45, (SELECT idActor FROM actores WHERE nombreActor = 'Adam Cozens'));

INSERT INTO reparto (idContenido, idActor) VALUES
(49, (SELECT idActor FROM actores WHERE nombreActor = 'Jaeden Martell')),
(49, (SELECT idActor FROM actores WHERE nombreActor = 'Jeremy Ray')),
(49, (SELECT idActor FROM actores WHERE nombreActor = 'Sophia Lillis')),
(49, (SELECT idActor FROM actores WHERE nombreActor = 'Finn Wolfhard')),
(49, (SELECT idActor FROM actores WHERE nombreActor = 'Chosen Jacobs')),
(49, (SELECT idActor FROM actores WHERE nombreActor = 'Jack Dylan')),
(49, (SELECT idActor FROM actores WHERE nombreActor = 'Wyatt Oleff')),
(49, (SELECT idActor FROM actores WHERE nombreActor = 'Bill Skarsgård')),
(49, (SELECT idActor FROM actores WHERE nombreActor = 'Nicholas Hamilton'));

INSERT INTO reparto (idContenido, idActor) VALUES
(46, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Hanks')),
(46, (SELECT idActor FROM actores WHERE nombreActor = 'Bill Paxton')),
(46, (SELECT idActor FROM actores WHERE nombreActor = 'Kevin Bacon')),
(46, (SELECT idActor FROM actores WHERE nombreActor = 'Gary Sinise')),
(46, (SELECT idActor FROM actores WHERE nombreActor = 'Ed Harris')),
(46, (SELECT idActor FROM actores WHERE nombreActor = 'Kathleen Quinlan')),
(46, (SELECT idActor FROM actores WHERE nombreActor = 'Roger Corman')),
(46, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Ellis')),
(46, (SELECT idActor FROM actores WHERE nombreActor = 'Xander Berkeley'));

INSERT INTO reparto (idContenido, idActor) VALUES
(47, (SELECT idActor FROM actores WHERE nombreActor = 'Liev Schreiber')),
(47, (SELECT idActor FROM actores WHERE nombreActor = 'Julia Stiles')),
(47, (SELECT idActor FROM actores WHERE nombreActor = 'Seamus Davey-Fitzpatrick')),
(47, (SELECT idActor FROM actores WHERE nombreActor = 'David Thewils')),
(47, (SELECT idActor FROM actores WHERE nombreActor = 'Pete Postlethwaite')),
(47, (SELECT idActor FROM actores WHERE nombreActor = 'Mia Farrow')),
(47, (SELECT idActor FROM actores WHERE nombreActor = 'Predrag Bjelac')),
(47, (SELECT idActor FROM actores WHERE nombreActor = 'Carlo Sabatini')),
(47, (SELECT idActor FROM actores WHERE nombreActor = 'Amy Huck'));

INSERT INTO reparto (idContenido, idActor) VALUES
(48, (SELECT idActor FROM actores WHERE nombreActor = 'Ellen Burstyn')),
(48, (SELECT idActor FROM actores WHERE nombreActor = 'Linda Blair')),
(48, (SELECT idActor FROM actores WHERE nombreActor = 'Max von Sydow')),
(48, (SELECT idActor FROM actores WHERE nombreActor = 'Lee J. Cobb')),
(48, (SELECT idActor FROM actores WHERE nombreActor = 'Kitty Winn')),
(48, (SELECT idActor FROM actores WHERE nombreActor = 'Jack MacGowran')),
(48, (SELECT idActor FROM actores WHERE nombreActor = 'Jason Miller')),
(48, (SELECT idActor FROM actores WHERE nombreActor = 'William O''Malley')),
(48, (SELECT idActor FROM actores WHERE nombreActor = 'Barton Heyman'));

INSERT INTO reparto (idContenido, idActor) VALUES
(50, (SELECT idActor FROM actores WHERE nombreActor = 'Rainn Wilson')),
(50, (SELECT idActor FROM actores WHERE nombreActor = 'Steve Carell')),
(50, (SELECT idActor FROM actores WHERE nombreActor = 'Jenna Fischer')),
(50, (SELECT idActor FROM actores WHERE nombreActor = 'John Krasinski')),
(50, (SELECT idActor FROM actores WHERE nombreActor = 'B.J. Novak')),
(50, (SELECT idActor FROM actores WHERE nombreActor = 'Kate Flannery')),
(50, (SELECT idActor FROM actores WHERE nombreActor = 'Brian Baumgartner')),
(50, (SELECT idActor FROM actores WHERE nombreActor = 'Leslie David Baker')),
(50, (SELECT idActor FROM actores WHERE nombreActor = 'Mindy Kaling')),
(50, (SELECT idActor FROM actores WHERE nombreActor = 'Angela Kinsey'));

INSERT INTO reparto (idContenido, idActor) VALUES
(51, (SELECT idActor FROM actores WHERE nombreActor = 'Freddie Highmore')),
(51, (SELECT idActor FROM actores WHERE nombreActor = 'Antonia Thomas')),
(51, (SELECT idActor FROM actores WHERE nombreActor = 'Hill Harper')),
(51, (SELECT idActor FROM actores WHERE nombreActor = 'Richard Schiff')),
(51, (SELECT idActor FROM actores WHERE nombreActor = 'Christina Chang')),
(51, (SELECT idActor FROM actores WHERE nombreActor = 'Paige Spara')),
(51, (SELECT idActor FROM actores WHERE nombreActor = 'Fiona Gubelmann')),
(51, (SELECT idActor FROM actores WHERE nombreActor = 'Will Yun Lee')),
(51, (SELECT idActor FROM actores WHERE nombreActor = 'Nicholas Gonzalez'));

INSERT INTO reparto (idContenido, idActor) VALUES
(52, (SELECT idActor FROM actores WHERE nombreActor = 'Eddie Redmayne')),
(52, (SELECT idActor FROM actores WHERE nombreActor = 'Felicity Jones')),
(52, (SELECT idActor FROM actores WHERE nombreActor = 'Charlie Cox')),
(52, (SELECT idActor FROM actores WHERE nombreActor = 'Emily Watson')),
(52, (SELECT idActor FROM actores WHERE nombreActor = 'Simon McBurney')),
(52, (SELECT idActor FROM actores WHERE nombreActor = 'David Thewlis')),
(52, (SELECT idActor FROM actores WHERE nombreActor = 'Maxine Peake')),
(52, (SELECT idActor FROM actores WHERE nombreActor = 'Harry Lloyd')),
(52, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Prior'));

INSERT INTO reparto (idContenido, idActor) VALUES
(53, (SELECT idActor FROM actores WHERE nombreActor = 'Benedict Cumberbatch')),
(53, (SELECT idActor FROM actores WHERE nombreActor = 'Keira Knightley')),
(53, (SELECT idActor FROM actores WHERE nombreActor = 'Matthew Goode')),
(53, (SELECT idActor FROM actores WHERE nombreActor = 'Rory Kinnear')),
(53, (SELECT idActor FROM actores WHERE nombreActor = 'Allen Leech')),
(53, (SELECT idActor FROM actores WHERE nombreActor = 'Matthew Beard')),
(53, (SELECT idActor FROM actores WHERE nombreActor = 'Charles Dance')),
(53, (SELECT idActor FROM actores WHERE nombreActor = 'Mark Strong')),
(53, (SELECT idActor FROM actores WHERE nombreActor = 'James Northcote'));

INSERT INTO reparto (idContenido, idActor) VALUES
(54, (SELECT idActor FROM actores WHERE nombreActor = 'Taraji P. Henson')),
(54, (SELECT idActor FROM actores WHERE nombreActor = 'Octavia Spencer')),
(54, (SELECT idActor FROM actores WHERE nombreActor = 'Janelle Monáe')),
(54, (SELECT idActor FROM actores WHERE nombreActor = 'Kevin Costner')),
(54, (SELECT idActor FROM actores WHERE nombreActor = 'Kirsten Dunst')),
(54, (SELECT idActor FROM actores WHERE nombreActor = 'Jim Parsons')),
(54, (SELECT idActor FROM actores WHERE nombreActor = 'Mahershala Ali')),
(54, (SELECT idActor FROM actores WHERE nombreActor = 'Glen Powell')),
(54, (SELECT idActor FROM actores WHERE nombreActor = 'Ariana Neal'));

INSERT INTO reparto (idContenido, idActor) VALUES
(55, (SELECT idActor FROM actores WHERE nombreActor = 'Russell Crowe')),
(55, (SELECT idActor FROM actores WHERE nombreActor = 'Jennifer Connelly')),
(55, (SELECT idActor FROM actores WHERE nombreActor = 'Ed Harris')),
(55, (SELECT idActor FROM actores WHERE nombreActor = 'Paul Bettany')),
(55, (SELECT idActor FROM actores WHERE nombreActor = 'Christopher Plummer')),
(55, (SELECT idActor FROM actores WHERE nombreActor = 'Josh Lucas')),
(55, (SELECT idActor FROM actores WHERE nombreActor = 'Adam Goldberg')),
(55, (SELECT idActor FROM actores WHERE nombreActor = 'Anthony Rapp')),
(55, (SELECT idActor FROM actores WHERE nombreActor = 'Judd Hirsch'));

INSERT INTO reparto (idContenido, idActor) VALUES
(56, (SELECT idActor FROM actores WHERE nombreActor = 'Jennifer Lawrence')),
(56, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Pratt')),
(56, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Sheen')),
(56, (SELECT idActor FROM actores WHERE nombreActor = 'Laurence Fishburne')),
(56, (SELECT idActor FROM actores WHERE nombreActor = 'Andy García')),
(56, (SELECT idActor FROM actores WHERE nombreActor = 'Aurora Perrineau')),
(56, (SELECT idActor FROM actores WHERE nombreActor = 'Kristin Brock')),
(56, (SELECT idActor FROM actores WHERE nombreActor = 'Julee Cerda')),
(56, (SELECT idActor FROM actores WHERE nombreActor = 'Fred Melamed'));

INSERT INTO reparto (idContenido, idActor) VALUES
(57, (SELECT idActor FROM actores WHERE nombreActor = 'Anne Hathaway')),
(57, (SELECT idActor FROM actores WHERE nombreActor = 'Patrick Wilson')),
(57, (SELECT idActor FROM actores WHERE nombreActor = 'Andre Braugher')),
(57, (SELECT idActor FROM actores WHERE nombreActor = 'Dianne Wiest')),
(57, (SELECT idActor FROM actores WHERE nombreActor = 'David Morse')),
(57, (SELECT idActor FROM actores WHERE nombreActor = 'William B. Davis')),
(57, (SELECT idActor FROM actores WHERE nombreActor = 'Ryan Robbins')),
(57, (SELECT idActor FROM actores WHERE nombreActor = 'Clea DuVall')),
(57, (SELECT idActor FROM actores WHERE nombreActor = 'Don Thompson'));

INSERT INTO reparto (idContenido, idActor) VALUES
(58, (SELECT idActor FROM actores WHERE nombreActor = 'Ben Affleck')),
(58, (SELECT idActor FROM actores WHERE nombreActor = 'Bryan Cranston')),
(58, (SELECT idActor FROM actores WHERE nombreActor = 'Alan Arkin')),
(58, (SELECT idActor FROM actores WHERE nombreActor = 'John Goodman')),
(58, (SELECT idActor FROM actores WHERE nombreActor = 'Victor Garber')),
(58, (SELECT idActor FROM actores WHERE nombreActor = 'Tate Donovan')),
(58, (SELECT idActor FROM actores WHERE nombreActor = 'Clea DuVall')),
(58, (SELECT idActor FROM actores WHERE nombreActor = 'Scoot McNairy')),
(58, (SELECT idActor FROM actores WHERE nombreActor = 'Rory Cochrane')),
(58, (SELECT idActor FROM actores WHERE nombreActor = 'Kerry Bishé'));

INSERT INTO reparto (idContenido, idActor) VALUES
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Noomi Rapace')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Fassbender')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Charlize Theron')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Logan Marshall-Green')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Guy Pearce')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Idris Elba')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Sean Harris')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Rafe Spall')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Kate Dickie')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Emun Elliott')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Benedict Wong')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Lucy Hutchinson')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Patrick Wilson')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Ian Whyte')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Branwell Donaghey')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Vladimir Furdik')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'C.C. Smiff')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'Shane Steyn')),
(59, (SELECT idActor FROM actores WHERE nombreActor = 'John Lebar'));

INSERT INTO reparto (idContenido, idActor) VALUES
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Fassbender')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Katherine Waterston')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Billy Crudup')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Danny McBride')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Demián Bichir')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Carmen Ejogo')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Jussie Smollett')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Callie Hernandez')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Amy Seimetz')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Nathaniel Dean')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Alexander England')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Benjamin Rigby')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Uli Latukefu')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Tess Haubrich')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Andrew Crawford')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Guy Pearce')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'James Franco')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Noomi Rapace')),
(60, (SELECT idActor FROM actores WHERE nombreActor = 'Javier Botet'));

-- Life: Vida inteligente (ID: 61)
INSERT INTO reparto (idContenido, idActor) VALUES
(61, (SELECT idActor FROM actores WHERE nombreActor = 'Jake Gyllenhaal')),
(61, (SELECT idActor FROM actores WHERE nombreActor = 'Rebecca Ferguson')),
(61, (SELECT idActor FROM actores WHERE nombreActor = 'Ryan Reynolds')),
(61, (SELECT idActor FROM actores WHERE nombreActor = 'Hiroyuki Sanada')),
(61, (SELECT idActor FROM actores WHERE nombreActor = 'Ariyon Bakare')),
(61, (SELECT idActor FROM actores WHERE nombreActor = 'Olga Dihovichnaya')),
(61, (SELECT idActor FROM actores WHERE nombreActor = 'Naoko Mori')),
(61, (SELECT idActor FROM actores WHERE nombreActor = 'Haruka Kuroda')),
(61, (SELECT idActor FROM actores WHERE nombreActor = 'Camiel Warren-Taylor'));

-- Madame Curie (ID: 62)
INSERT INTO reparto (idContenido, idActor) VALUES
(62, (SELECT idActor FROM actores WHERE nombreActor = 'Rosamund Pike')),
(62, (SELECT idActor FROM actores WHERE nombreActor = 'Sam Riley')),
(62, (SELECT idActor FROM actores WHERE nombreActor = 'Aneurin Barnard')),
(62, (SELECT idActor FROM actores WHERE nombreActor = 'Anya Taylor-Joy')),
(62, (SELECT idActor FROM actores WHERE nombreActor = 'Simon Russell Beale')),
(62, (SELECT idActor FROM actores WHERE nombreActor = 'Jonathan Aris')),
(62, (SELECT idActor FROM actores WHERE nombreActor = 'Corey Johnson')),
(62, (SELECT idActor FROM actores WHERE nombreActor = 'Tim Woodward')),
(62, (SELECT idActor FROM actores WHERE nombreActor = 'Katherine Parkinson'));

-- The IT Crowd (ID: 63)
INSERT INTO reparto (idContenido, idActor) VALUES
(63, (SELECT idActor FROM actores WHERE nombreActor = 'Chris O''Dowd')),
(63, (SELECT idActor FROM actores WHERE nombreActor = 'Richard Ayoade')),
(63, (SELECT idActor FROM actores WHERE nombreActor = 'Katherine Parkinson')),
(63, (SELECT idActor FROM actores WHERE nombreActor = 'Matt Berry')),
(63, (SELECT idActor FROM actores WHERE nombreActor = 'Noel Fielding')),
(63, (SELECT idActor FROM actores WHERE nombreActor = 'Peter Serafinowicz')),
(63, (SELECT idActor FROM actores WHERE nombreActor = 'Graham Linehan')),
(63, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Binns')),
(63, (SELECT idActor FROM actores WHERE nombreActor = 'Lewis Macleod'));

-- Humans (ID: 64)
INSERT INTO reparto (idContenido, idActor) VALUES
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Katherine Parkinson')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Gemma Chan')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Emily Berrington')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Lucy Carless')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Colin Morgan')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Theo Stevenson')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Pixie Davies')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Goodman-Hill')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Ivanno Jeremiah')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Ruth Bradley')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Will Tudor')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Neil Maskell')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Billy Jenkins')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Bella Dayne')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Thusitha Jayasundera')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Danny Webb')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'Carrie-Anne Moss')),
(64, (SELECT idActor FROM actores WHERE nombreActor = 'William Hurt'));

-- Need for Speed (ID: 65)
INSERT INTO reparto (idContenido, idActor) VALUES
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Aaron Paul')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Dominic Cooper')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Imogen Poots')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Ramón Rodríguez')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Keaton')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Rami Malek')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Kid Cudi')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Dakota Johnson')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Harrison Gilbertson')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Carmela Zumbado')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Jalil Jay Lynch')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Nick Chinlund')),
(65, (SELECT idActor FROM actores WHERE nombreActor = 'Chad Randall'));

-- Mare of Easttown (ID: 66)
INSERT INTO reparto (idContenido, idActor) VALUES
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Kate Winslet')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Julianne Nicholson')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Jean Smart')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Angourie Rice')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Evan Peters')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Sosie Bacon')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'David Denman')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Neal Huff')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'James McArdle')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Guy Pearce')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Cailee Spaeny')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'John Douglas Thompson')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Joe Tippett')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Cameron Mann')),
(66, (SELECT idActor FROM actores WHERE nombreActor = 'Chinasa Ogbuagu'));

-- Ray (ID: 67)
INSERT INTO reparto (idContenido, idActor) VALUES
(67, (SELECT idActor FROM actores WHERE nombreActor = 'Jamie Foxx')),
(67, (SELECT idActor FROM actores WHERE nombreActor = 'Kerry Washington')),
(67, (SELECT idActor FROM actores WHERE nombreActor = 'Regina King')),
(67, (SELECT idActor FROM actores WHERE nombreActor = 'Harry Lennix')),
(67, (SELECT idActor FROM actores WHERE nombreActor = 'Clifton Powell')),
(67, (SELECT idActor FROM actores WHERE nombreActor = 'Bokeem Woodbine')),
(67, (SELECT idActor FROM actores WHERE nombreActor = 'Sharon Warren')),
(67, (SELECT idActor FROM actores WHERE nombreActor = 'C.J. Sanders')),
(67, (SELECT idActor FROM actores WHERE nombreActor = 'Curtis Armstrong'));

-- Black Mirror (ID: 68)
INSERT INTO reparto (idContenido, idActor) VALUES
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Michaela Coel')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Daniel Lapaine')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Hannah John-Kamen')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Andrew Roux')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Claire Keelan')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Sinéad Matthews')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Anna Wilson-Jones')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Paul Popplewell')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Julia Davis')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Ashley Thomas')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Kerrie Hayes')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Amy Beth Hayes')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Rebekah Staton')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Rhashan Stone')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Phoebe Fox')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Jimi Mistry')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Tobias Menzies')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Cherry Jones')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Alice Eve')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Susannah Fielding')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Demetri Goritsas')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Kadiff Kirwan')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Sope Dirisu')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Jackson Bews')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Annabel Davis')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Billy Griffin Jr.')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Paul Lawrence Kitson')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Jeff Mash')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Patrick Kennedy')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Lydia Wilson')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Alastair Mackenzie')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Chetna Pandya')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Tuppence Middleton')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Ian Bonar')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Elisabeth Hopper')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Nick Bartlett')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Wunmi Mosaku')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Alex Lawther')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Jerome Flynn')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Susannah Doyle')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Madeline Brewer')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Ariane Labed')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Sarah Snook')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Kelly')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Jola Bokinni')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Faye Marsay')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Benedict Wong')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Jonas Karlsson')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Chloe Pirrie')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Eugene O''Hare')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Indira Ainger')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'James Lance')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'David Ajala')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Sarah Abbott')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Maxine Peake')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Jake Davies')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Clint Dyer')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Letitia Wright')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Babs Olusanmokun')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Georgina Campbell')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Jesse Plemons')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Jimmi Simpson')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Aaron Paul')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Aldis Hodge')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Kiran Sonia Sawar')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Miley Cyrus')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Anthony Mackie')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Nicole Beharie')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Bryce Dallas Howard')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Mackenzie Davis')),
(68, (SELECT idActor FROM actores WHERE nombreActor = 'Gugu Mbatha-Raw'));

-- Detrás de sus ojos (ID: 69)
INSERT INTO reparto (idContenido, idActor) VALUES
(69, (SELECT idActor FROM actores WHERE nombreActor = 'Simona Brown')),
(69, (SELECT idActor FROM actores WHERE nombreActor = 'Eve Hewson')),
(69, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Bateman')),
(69, (SELECT idActor FROM actores WHERE nombreActor = 'Robert Aramayo')),
(69, (SELECT idActor FROM actores WHERE nombreActor = 'Tyler Howitt')),
(69, (SELECT idActor FROM actores WHERE nombreActor = 'Georgie Glen')),
(69, (SELECT idActor FROM actores WHERE nombreActor = 'Kamontip Krissy Ashton')),
(69, (SELECT idActor FROM actores WHERE nombreActor = 'Rob Horrocks')),
(69, (SELECT idActor FROM actores WHERE nombreActor = 'Joakim Skarli'));

-- Her (ID: 70)
INSERT INTO reparto (idContenido, idActor) VALUES
(70, (SELECT idActor FROM actores WHERE nombreActor = 'Joaquin Phoenix')),
(70, (SELECT idActor FROM actores WHERE nombreActor = 'Scarlett Johansson')),
(70, (SELECT idActor FROM actores WHERE nombreActor = 'Amy Adams')),
(70, (SELECT idActor FROM actores WHERE nombreActor = 'Rooney Mara')),
(70, (SELECT idActor FROM actores WHERE nombreActor = 'Olivia Wilde')),
(70, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Pratt')),
(70, (SELECT idActor FROM actores WHERE nombreActor = 'Matt Letscher')),
(70, (SELECT idActor FROM actores WHERE nombreActor = 'Portia Doubleday')),
(70, (SELECT idActor FROM actores WHERE nombreActor = 'Spike Jonze'));

-- Misión Imposible (ID: 71)
INSERT INTO reparto (idContenido, idActor) VALUES
(71, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Cruise')),
(71, (SELECT idActor FROM actores WHERE nombreActor = 'Jon Voight')),
(71, (SELECT idActor FROM actores WHERE nombreActor = 'Emmanuelle Béart')),
(71, (SELECT idActor FROM actores WHERE nombreActor = 'Henry Czerny')),
(71, (SELECT idActor FROM actores WHERE nombreActor = 'Jean Reno')),
(71, (SELECT idActor FROM actores WHERE nombreActor = 'Ving Rhames')),
(71, (SELECT idActor FROM actores WHERE nombreActor = 'Kristin Scott Thomas')),
(71, (SELECT idActor FROM actores WHERE nombreActor = 'Vanessa Redgrave')),
(71, (SELECT idActor FROM actores WHERE nombreActor = 'Ingeborga Dapkūnaitè'));

-- El agente de C.I.P.O.L. (ID: 72)
INSERT INTO reparto (idContenido, idActor) VALUES
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Henry Cavill')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Armie Hammer')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Alicia Vikander')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Elizabeth Debicki')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Luca Calvani')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Sylvester Groth')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Hugh Grant')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Jared Harris')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Christian Berkel')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Misha Kuznetsov')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Guy Williams')),
(72, (SELECT idActor FROM actores WHERE nombreActor = 'Marianna Di Martino'));

-- Jumanji - Bienvenidos a la jungla (ID: 73)
INSERT INTO reparto (idContenido, idActor) VALUES
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Dwayne Johnson')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Kevin Hart')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Jack Black')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Karen Gillan')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Nick Jonas')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Rhys Darby')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Bobby Cannavale')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Alex Wolff')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Ser''Darius Blain')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Madison Iseman')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Morgan Turner')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Sean Buxton')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Mason Guccione')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Marin Hinkle')),
(73, (SELECT idActor FROM actores WHERE nombreActor = 'Colin Hanks'));

-- Jumanji - The next level (ID: 21)
INSERT INTO reparto (idContenido, idActor) VALUES
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Dwayne Johnson')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Kevin Hart')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Jack Black')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Karen Gillan')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Awkwafina')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Nick Jonas')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Rhys Darby')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Bobby Cannavale')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Alex Wolff')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Ser''Darius Blain')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Madison Iseman')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Morgan Turner')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Sean Buxton')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Mason Guccione')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Marin Hinkle')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Colin Hanks')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Danny DeVito')),
(21, (SELECT idActor FROM actores WHERE nombreActor = 'Danny Glover'));

-- Mujer Maravilla 1984 (ID: 74)
INSERT INTO reparto (idContenido, idActor) VALUES
(74, (SELECT idActor FROM actores WHERE nombreActor = 'Gal Gadot')),
(74, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Pine')),
(74, (SELECT idActor FROM actores WHERE nombreActor = 'Kristen Wiig')),
(74, (SELECT idActor FROM actores WHERE nombreActor = 'Pedro Pascal')),
(74, (SELECT idActor FROM actores WHERE nombreActor = 'Robin Wright')),
(74, (SELECT idActor FROM actores WHERE nombreActor = 'Connie Nielsen')),
(74, (SELECT idActor FROM actores WHERE nombreActor = 'Lilly Aspell')),
(74, (SELECT idActor FROM actores WHERE nombreActor = 'Amr Waked')),
(74, (SELECT idActor FROM actores WHERE nombreActor = 'Kristoffer Polaha'));

-- El Contador (ID: 75)
INSERT INTO reparto (idContenido, idActor) VALUES
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Ben Affleck')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Anna Kendrick')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'J.K. Simmons')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Jon Bernthal')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Jeffrey Tambor')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Cynthia Addai-Robinson')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'John Lithgow')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Jean Smart')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Andy Umberger')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Alison Wright')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Daeg Faerch')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Seth Lee')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Tait Fletcher')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Angel Giuffria')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Ron Yuan')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Scott Hunter')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Dennis Keiffer')),
(75, (SELECT idActor FROM actores WHERE nombreActor = 'Jake Presley'));

-- Mala Educación (ID: 76)
INSERT INTO reparto (idContenido, idActor) VALUES
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Hugh Jackman')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Allison Janney')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Geraldine Viswanathan')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Alex Wolff')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Rafael Casal')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Stephen Spinella')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Annaleigh Ashford')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Ray Romano')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Hari Dhillon')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Jerremy Shamos')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Stephanie Kurtzuba')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Catherine Curtin')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Kathrine Narducci')),
(76, (SELECT idActor FROM actores WHERE nombreActor = 'Ray Abruzzo'));

-- Horizonte Rojo (ID: 77)
INSERT INTO reparto (idContenido, idActor) VALUES
(77, (SELECT idActor FROM actores WHERE nombreActor = 'Anya Taylor-Joy')),
(77, (SELECT idActor FROM actores WHERE nombreActor = 'Thomas Brodie-Sangster')),
(77, (SELECT idActor FROM actores WHERE nombreActor = 'Harry Melling')),
(77, (SELECT idActor FROM actores WHERE nombreActor = 'Moses Ingram')),
(77, (SELECT idActor FROM actores WHERE nombreActor = 'Chloe Pirrie')),
(77, (SELECT idActor FROM actores WHERE nombreActor = 'Janina Elkin'));

-- Noche en el Museo (ID: 78)
INSERT INTO reparto (idContenido, idActor) VALUES
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Ben Stiller')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Robin Williams')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Carla Gugino')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Dick Van Dyke')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Steve Coogan')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Jake Cherry')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Mickey Rooney')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Bill Cobbs')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Owen Wilson')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Ricky Gervais')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Kim Raver')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Rami Malek')),
(78, (SELECT idActor FROM actores WHERE nombreActor = 'Mizuo Peck'));

-- Bohemian Rhapsody (ID: 79)
INSERT INTO reparto (idContenido, idActor) VALUES
(79, (SELECT idActor FROM actores WHERE nombreActor = 'Rami Malek')),
(79, (SELECT idActor FROM actores WHERE nombreActor = 'Gwilym Lee')),
(79, (SELECT idActor FROM actores WHERE nombreActor = 'Ben Hardy')),
(79, (SELECT idActor FROM actores WHERE nombreActor = 'Joseph Mazzello')),
(79, (SELECT idActor FROM actores WHERE nombreActor = 'Lucy Boynton')),
(79, (SELECT idActor FROM actores WHERE nombreActor = 'Aidan Gillen')),
(79, (SELECT idActor FROM actores WHERE nombreActor = 'Allen Leech')),
(79, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Hollander')),
(79, (SELECT idActor FROM actores WHERE nombreActor = 'Mike Myers'));

-- Rock of ages (ID: 80)
INSERT INTO reparto (idContenido, idActor) VALUES
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Julianne Hough')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Diego Boneta')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Cruise')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Alec Baldwin')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Russell Brand')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Malin Åkerman')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Paul Giamatti')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Bryan Cranston')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Catherine Zeta-Jones')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Mary J. Blige')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Erica Frene')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Shane Hartline')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'James Martin Kelly')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Will Forte')),
(80, (SELECT idActor FROM actores WHERE nombreActor = 'Eli Roth'));

-- Super 8 (ID: 81)
INSERT INTO reparto (idContenido, idActor) VALUES
(81, (SELECT idActor FROM actores WHERE nombreActor = 'Joel Courtney')),
(81, (SELECT idActor FROM actores WHERE nombreActor = 'Elle Fanning')),
(81, (SELECT idActor FROM actores WHERE nombreActor = 'Riley Griffiths')),
(81, (SELECT idActor FROM actores WHERE nombreActor = 'Kyle Chandler')),
(81, (SELECT idActor FROM actores WHERE nombreActor = 'Noah Emmerich')),
(81, (SELECT idActor FROM actores WHERE nombreActor = 'AJ Michalka')),
(81, (SELECT idActor FROM actores WHERE nombreActor = 'Ryan Lee')),
(81, (SELECT idActor FROM actores WHERE nombreActor = 'Ron Eldard')),
(81, (SELECT idActor FROM actores WHERE nombreActor = 'Gabriel Basso'));

-- Jurassic World - El reino caido (ID: 82)
INSERT INTO reparto (idContenido, idActor) VALUES
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Pratt')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Bryce Dallas Howard')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Rafe Spall')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Justice Smith')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Daniella Pineda')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'James Cromwell')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Toby Jones')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Ted Levine')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Jeff Goldblum')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'BD Wong')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Geraldine Chaplin')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Isabella Sermon')),
(82, (SELECT idActor FROM actores WHERE nombreActor = 'Kevin Layne'));

-- Indiana Jones - y el Reino de la Calavera de Cristal (ID: 83)
INSERT INTO reparto (idContenido, idActor) VALUES
(83, (SELECT idActor FROM actores WHERE nombreActor = 'Harrison Ford')),
(83, (SELECT idActor FROM actores WHERE nombreActor = 'Shia LaBeouf')),
(83, (SELECT idActor FROM actores WHERE nombreActor = 'Cate Blanchett')),
(83, (SELECT idActor FROM actores WHERE nombreActor = 'Karen Allen')),
(83, (SELECT idActor FROM actores WHERE nombreActor = 'Ray Winstone')),
(83, (SELECT idActor FROM actores WHERE nombreActor = 'John Hurt')),
(83, (SELECT idActor FROM actores WHERE nombreActor = 'Jim Broadbent')),
(83, (SELECT idActor FROM actores WHERE nombreActor = 'Igor Jijikine')),
(83, (SELECT idActor FROM actores WHERE nombreActor = 'Dimitri Diatchenko'));

-- Los Goonies (ID: 84)
INSERT INTO reparto (idContenido, idActor) VALUES
(84, (SELECT idActor FROM actores WHERE nombreActor = 'Sean Astin')),
(84, (SELECT idActor FROM actores WHERE nombreActor = 'Josh Brolin')),
(84, (SELECT idActor FROM actores WHERE nombreActor = 'Jeff Cohen')),
(84, (SELECT idActor FROM actores WHERE nombreActor = 'Corey Feldman')),
(84, (SELECT idActor FROM actores WHERE nombreActor = 'Kerri Green')),
(84, (SELECT idActor FROM actores WHERE nombreActor = 'Martha Plimpton')),
(84, (SELECT idActor FROM actores WHERE nombreActor = 'Jonathan Ke Quan')),
(84, (SELECT idActor FROM actores WHERE nombreActor = 'John Matuszak')),
(84, (SELECT idActor FROM actores WHERE nombreActor = 'Robert Davi'));

-- Cars (ID: 85)
INSERT INTO reparto (idContenido, idActor) VALUES
(85, (SELECT idActor FROM actores WHERE nombreActor = 'Owen Wilson')),
(85, (SELECT idActor FROM actores WHERE nombreActor = 'Bonnie Hunt')),
(85, (SELECT idActor FROM actores WHERE nombreActor = 'Paul Newman')),
(85, (SELECT idActor FROM actores WHERE nombreActor = 'Larry the Cable Guy')),
(85, (SELECT idActor FROM actores WHERE nombreActor = 'Tony Shalhoub')),
(85, (SELECT idActor FROM actores WHERE nombreActor = 'Cheech Marin')),
(85, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Wallis')),
(85, (SELECT idActor FROM actores WHERE nombreActor = 'George Carlin')),
(85, (SELECT idActor FROM actores WHERE nombreActor = 'Paul Dooley'));

-- Los pingüinos de Madagascar (ID: 86)
INSERT INTO reparto (idContenido, idActor) VALUES
(86, (SELECT idActor FROM actores WHERE nombreActor = 'John DiMaggio')),
(86, (SELECT idActor FROM actores WHERE nombreActor = 'Chris Miller')),
(86, (SELECT idActor FROM actores WHERE nombreActor = 'Tom McGrath')),
(86, (SELECT idActor FROM actores WHERE nombreActor = 'Danny Jacobs')),
(86, (SELECT idActor FROM actores WHERE nombreActor = 'Andy Richter')),
(86, (SELECT idActor FROM actores WHERE nombreActor = 'Nicole Sullivan')),
(86, (SELECT idActor FROM actores WHERE nombreActor = 'Christopher Knights')),
(86, (SELECT idActor FROM actores WHERE nombreActor = 'Wayne Knight'));

-- Cementerio de animales (ID: 87)
INSERT INTO reparto (idContenido, idActor) VALUES
(87, (SELECT idActor FROM actores WHERE nombreActor = 'Dale Midkiff')),
(87, (SELECT idActor FROM actores WHERE nombreActor = 'Fred Gwynne')),
(87, (SELECT idActor FROM actores WHERE nombreActor = 'Denise Crosby')),
(87, (SELECT idActor FROM actores WHERE nombreActor = 'Brad Greenquist')),
(87, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Lombard')),
(87, (SELECT idActor FROM actores WHERE nombreActor = 'Miko Hughes')),
(87, (SELECT idActor FROM actores WHERE nombreActor = 'Blaze Berdahl')),
(87, (SELECT idActor FROM actores WHERE nombreActor = 'Susan Blommaert')),
(87, (SELECT idActor FROM actores WHERE nombreActor = 'Mara Clark'));

-- Poltergeist (ID: 88)
INSERT INTO reparto (idContenido, idActor) VALUES
(88, (SELECT idActor FROM actores WHERE nombreActor = 'Craig T. Nelson')),
(88, (SELECT idActor FROM actores WHERE nombreActor = 'JoBeth Williams')),
(88, (SELECT idActor FROM actores WHERE nombreActor = 'Beatrice Straight')),
(88, (SELECT idActor FROM actores WHERE nombreActor = 'Dominique Dunne')),
(88, (SELECT idActor FROM actores WHERE nombreActor = 'Oliver Robins')),
(88, (SELECT idActor FROM actores WHERE nombreActor = 'Heather O''Rourke')),
(88, (SELECT idActor FROM actores WHERE nombreActor = 'Michael McManus')),
(88, (SELECT idActor FROM actores WHERE nombreActor = 'Virginia Kiser')),
(88, (SELECT idActor FROM actores WHERE nombreActor = 'Martin Casella'));

-- El código Da Vinci (ID: 89)
INSERT INTO reparto (idContenido, idActor) VALUES
(89, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Hanks')),
(89, (SELECT idActor FROM actores WHERE nombreActor = 'Audrey Tautou')),
(89, (SELECT idActor FROM actores WHERE nombreActor = 'Ian McKellen')),
(89, (SELECT idActor FROM actores WHERE nombreActor = 'Jean Reno')),
(89, (SELECT idActor FROM actores WHERE nombreActor = 'Paul Bettany')),
(89, (SELECT idActor FROM actores WHERE nombreActor = 'Alfred Molina')),
(89, (SELECT idActor FROM actores WHERE nombreActor = 'Jürgen Prochnow')),
(89, (SELECT idActor FROM actores WHERE nombreActor = 'Jean-Yves Berteloot')),
(89, (SELECT idActor FROM actores WHERE nombreActor = 'Etienne Chicot'));

-- Johnny English (ID: 90)
INSERT INTO reparto (idContenido, idActor) VALUES
(90, (SELECT idActor FROM actores WHERE nombreActor = 'Rowan Atkinson')),
(90, (SELECT idActor FROM actores WHERE nombreActor = 'Natalie Imbruglia')),
(90, (SELECT idActor FROM actores WHERE nombreActor = 'Ben Miller')),
(90, (SELECT idActor FROM actores WHERE nombreActor = 'John Malkovich')),
(90, (SELECT idActor FROM actores WHERE nombreActor = 'Greg Wise')),
(90, (SELECT idActor FROM actores WHERE nombreActor = 'Tasha de Vasconcelos')),
(90, (SELECT idActor FROM actores WHERE nombreActor = 'Douglas McFerran')),
(90, (SELECT idActor FROM actores WHERE nombreActor = 'Steve Nicolson')),
(90, (SELECT idActor FROM actores WHERE nombreActor = 'Terence Harvey'));

-- Almost Famous (ID: 91)
INSERT INTO reparto (idContenido, idActor) VALUES
(91, (SELECT idActor FROM actores WHERE nombreActor = 'Billy Crudup')),
(91, (SELECT idActor FROM actores WHERE nombreActor = 'Frances McDormand')),
(91, (SELECT idActor FROM actores WHERE nombreActor = 'Kate Hudson')),
(91, (SELECT idActor FROM actores WHERE nombreActor = 'Patrick Fugit')),
(91, (SELECT idActor FROM actores WHERE nombreActor = 'Jason Lee')),
(91, (SELECT idActor FROM actores WHERE nombreActor = 'Zoey Deschanel')),
(91, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Angarano')),
(91, (SELECT idActor FROM actores WHERE nombreActor = 'Anna Paquin')),
(91, (SELECT idActor FROM actores WHERE nombreActor = 'Fairuza Balk'));

-- Escuela de Rock (ID: 92)
INSERT INTO reparto (idContenido, idActor) VALUES
(92, (SELECT idActor FROM actores WHERE nombreActor = 'Jack Black')),
(92, (SELECT idActor FROM actores WHERE nombreActor = 'Joan Cusack')),
(92, (SELECT idActor FROM actores WHERE nombreActor = 'Mike White')),
(92, (SELECT idActor FROM actores WHERE nombreActor = 'Sarah Silverman')),
(92, (SELECT idActor FROM actores WHERE nombreActor = 'Lee Wilkof')),
(92, (SELECT idActor FROM actores WHERE nombreActor = 'Kate McGregor-Stewart')),
(92, (SELECT idActor FROM actores WHERE nombreActor = 'Adam Pascal')),
(92, (SELECT idActor FROM actores WHERE nombreActor = 'Suzanne Douglas')),
(92, (SELECT idActor FROM actores WHERE nombreActor = 'Miranda Cosgrove'));

-- Mi pobre angelito (ID: 93)
INSERT INTO reparto (idContenido, idActor) VALUES
(93, (SELECT idActor FROM actores WHERE nombreActor = 'Macaulay Culkin')),
(93, (SELECT idActor FROM actores WHERE nombreActor = 'Joe Pesci')),
(93, (SELECT idActor FROM actores WHERE nombreActor = 'Daniel Stern')),
(93, (SELECT idActor FROM actores WHERE nombreActor = 'John Heard')),
(93, (SELECT idActor FROM actores WHERE nombreActor = 'Catherine O''Hara')),
(93, (SELECT idActor FROM actores WHERE nombreActor = 'Roberts Blossom')),
(93, (SELECT idActor FROM actores WHERE nombreActor = 'Devin Ratray')),
(93, (SELECT idActor FROM actores WHERE nombreActor = 'Michael C. Maronna')),
(93, (SELECT idActor FROM actores WHERE nombreActor = 'Hillary Wolf'));

-- Aprendices fuera de línea (ID: 94)
INSERT INTO reparto (idContenido, idActor) VALUES
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Owen Wilson')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Vince Vaughn')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Will Ferrell')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Rose Byrne')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Aasif Mandvi')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Max Minghella')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Josh Brener')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Dylan O''Brien')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Tiya Sircar')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Tobit Raphael')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Josh Gad')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Jessica Szohr')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Rob Riggle')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Eric André')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Harvey Guillén')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Gary Anthony Williams')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Bruno Amato')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'B.J. Novak')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'Karen Ceesay')),
(94, (SELECT idActor FROM actores WHERE nombreActor = 'John Goodman'));

-- Outsourced (ID: 95)
INSERT INTO reparto (idContenido, idActor) VALUES
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Rebecca Hazlewood')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Sacha Dhawan')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Diedrich Bader')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Pippa Black')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Parvesh Ceena')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Thushari Jayasekera')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Ben Rappaport')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Guru Singh')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Rizwan Manji')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Anisha Nagarajan')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Carla Gallo')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Radhika Chaudhari')),
(95, (SELECT idActor FROM actores WHERE nombreActor = 'Nicholas Logan'));

-- Miedo Profundo (ID: 96)
INSERT INTO reparto (idContenido, idActor) VALUES
(96, (SELECT idActor FROM actores WHERE nombreActor = 'Blake Lively')),
(96, (SELECT idActor FROM actores WHERE nombreActor = 'Óscar Jaenada')),
(96, (SELECT idActor FROM actores WHERE nombreActor = 'Janelle Bailley')),
(96, (SELECT idActor FROM actores WHERE nombreActor = 'Chelsea Moody')),
(96, (SELECT idActor FROM actores WHERE nombreActor = 'Angelo Josue Lozano Corzo')),
(96, (SELECT idActor FROM actores WHERE nombreActor = 'José Manuel Trujillo Salas')),
(96, (SELECT idActor FROM actores WHERE nombreActor = 'Brett Cullen')),
(96, (SELECT idActor FROM actores WHERE nombreActor = 'Sedona Legge')),
(96, (SELECT idActor FROM actores WHERE nombreActor = 'Pablo Calva'));

-- Everest (ID: 97)
INSERT INTO reparto (idContenido, idActor) VALUES
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Jason Clarke')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Josh Brolin')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Jake Gyllenhaal')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'John Hawkes')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Sam Worthington')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Emily Watson')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Martin Henderson')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Michael Kelly')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Keira Knightley')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Robin Wright')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Thomas M. Wright')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Clive Standen')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Naoko Mori')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Mia Goth')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Elizabeth Debicki')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Tom Goodman-Hill')),
(97, (SELECT idActor FROM actores WHERE nombreActor = 'Vanessa Kirby'));

-- La Familia Addams (ID: 98)
INSERT INTO reparto (idContenido, idActor) VALUES
(98, (SELECT idActor FROM actores WHERE nombreActor = 'Raúl Juliá')),
(98, (SELECT idActor FROM actores WHERE nombreActor = 'Anjelica Huston')),
(98, (SELECT idActor FROM actores WHERE nombreActor = 'Christopher Lloyd')),
(98, (SELECT idActor FROM actores WHERE nombreActor = 'Christina Ricci')),
(98, (SELECT idActor FROM actores WHERE nombreActor = 'Carel Struycken')),
(98, (SELECT idActor FROM actores WHERE nombreActor = 'Dan Hedaya')),
(98, (SELECT idActor FROM actores WHERE nombreActor = 'Jimmy Workman')),
(98, (SELECT idActor FROM actores WHERE nombreActor = 'Elizabeth Wilson')),
(98, (SELECT idActor FROM actores WHERE nombreActor = 'Dana Ivey'));

-- Reparto para "El Último Susurro" (idContenido = 99)
INSERT INTO reparto (idContenido, idActor) VALUES
(99, (SELECT idActor FROM actores WHERE nombreActor = 'Leonardo Sbaraglia')),
(99, (SELECT idActor FROM actores WHERE nombreActor = 'Cecilia Roth')),
(99, (SELECT idActor FROM actores WHERE nombreActor = 'Nahuel Pérez Biscayart')),
(99, (SELECT idActor FROM actores WHERE nombreActor = 'Érica Rivas')),
(99, (SELECT idActor FROM actores WHERE nombreActor = 'Daniel Hendler')),
(99, (SELECT idActor FROM actores WHERE nombreActor = 'Julieta Díaz')),
(99, (SELECT idActor FROM actores WHERE nombreActor = 'Luis Machín'));

-- Reparto para "Vecinos del Fin del Mundo" (idContenido = 100)
INSERT INTO reparto (idContenido, idActor) VALUES
(100, (SELECT idActor FROM actores WHERE nombreActor = 'Luis Brandoni')),
(100, (SELECT idActor FROM actores WHERE nombreActor = 'Graciela Borges')),
(100, (SELECT idActor FROM actores WHERE nombreActor = 'Peto Menahem')),
(100, (SELECT idActor FROM actores WHERE nombreActor = 'Pilar Gamboa')),
(100, (SELECT idActor FROM actores WHERE nombreActor = 'Martín Piroyansky')),
(100, (SELECT idActor FROM actores WHERE nombreActor = 'Verónica Llinás')),
(100, (SELECT idActor FROM actores WHERE nombreActor = 'Chino Darín'));


CREATE VIEW contenido_completo AS -- Crea la tabla 
SELECT 
    c.idContenido,
    c.titulo,
    c.resumen,
    c.temporadas,
    c.poster,
    c.trailer,
    cat.nombreCategoria AS categoria,
    g.nombreGenero AS genero,
    GROUP_CONCAT(DISTINCT t.nombreTag) AS tags,
    GROUP_CONCAT(DISTINCT a.nombreActor) AS reparto
FROM contenido c
JOIN categorias cat ON c.idCategoria = cat.idCategoria
JOIN generos g ON c.idGenero = g.idGenero
LEFT JOIN contenido_tags ct ON c.idContenido = ct.idContenido -- LEFT JOIN asegura que incluso si no hay tags, el contenido igual se muestre.
LEFT JOIN tags t ON ct.idTag = t.idTag
LEFT JOIN reparto r ON c.idContenido = r.idContenido
LEFT JOIN actores a ON r.idActor = a.idActor
GROUP BY c.idContenido;




