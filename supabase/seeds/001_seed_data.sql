-- William Campiño Campaign Website — Seed Data
-- Run this in Supabase SQL Editor after running the schema migration
-- Date: 2026-03-02

-- =============================================
-- CANDIDATE INFO
-- =============================================
INSERT INTO candidate_info (name, slogan, biography, values, image_url, video_url) VALUES (
  'William Campiño',
  'Con compromiso, experiencia y amor por la tierra blanca',
  'William Campiño es un payanés de corazón, nacido y criado en Popayán, Cauca. Con más de 24 años de servicio en la Policía Nacional de Colombia, donde se destacó por su liderazgo, integridad y compromiso con la seguridad ciudadana. Durante su carrera obtuvo 19 condecoraciones institucionales y 111 felicitaciones especiales por su labor profesional. Como Jefe de Comunicaciones Estratégicas por más de 18 años, desarrolló la habilidad de escuchar a las comunidades y construir puentes de confianza entre la ciudadanía y las instituciones. Tras su retiro honorable en 2018, dedicó su vida al trabajo comunitario, recorriendo los 9 barrios y comunas de Popayán para entender las necesidades de su gente. Hoy, respaldado por su familia y su comunidad, se postula como candidato a la Alcaldía de Popayán con el firme propósito de construir la ciudad moderna, humana y sostenible que todos merecemos.',
  ARRAY['Honestidad', 'Servicio', 'Compromiso', 'Experiencia', 'Liderazgo', 'Familia'],
  NULL,
  NULL
);

-- =============================================
-- LIFE MILESTONES
-- =============================================
INSERT INTO life_milestones (year, title, description, category, sort_order) VALUES
(1975, 'Nacimiento en Popayán', 'Nació en la ciudad blanca de Colombia, Popayán, Cauca. Desde pequeño, su familia le inculcó valores de servicio, honestidad y amor por su tierra.', 'personal', 1),
(1993, 'Graduación Bachiller', 'Se graduó del colegio con honores, destacándose en actividades de liderazgo estudiantil y servicio comunitario en su institución.', 'academico', 2),
(1995, 'Ingreso a la Policía Nacional', 'Decidió servir a su país ingresando a la Policía Nacional de Colombia, comenzando una carrera de más de dos décadas dedicada a la seguridad y el bienestar de los ciudadanos.', 'profesional', 3),
(1999, 'Especialización en Comunicaciones', 'Obtuvo su especialización en Comunicaciones Estratégicas, desarrollando habilidades para conectar con las comunidades y transmitir mensajes de paz y seguridad.', 'academico', 4),
(2002, 'Matrimonio y Familia', 'Contrajo matrimonio y formó su familia, pilar fundamental que lo ha acompañado y apoyado en cada etapa de su vida y carrera profesional.', 'personal', 5),
(2005, 'Jefe de Comunicaciones Regionales', 'Fue nombrado Jefe de Comunicaciones para la región del Cauca, donde lideró equipos de trabajo y desarrolló estrategias de comunicación efectivas para la institución policial.', 'profesional', 6),
(2010, 'Primera Condecoración Nacional', 'Recibió su primera condecoración a nivel nacional por servicios distinguidos en operaciones de seguridad ciudadana, reconocimiento a su trayectoria ejemplar.', 'profesional', 7),
(2015, 'Maestría en Gestión Pública', 'Culminó su maestría en Gestión Pública, preparándose para contribuir de manera más efectiva al desarrollo y administración eficiente de su comunidad.', 'academico', 8),
(2018, 'Retiro Honorable de la Policía', 'Después de más de 24 años de servicio, se retiró de la Policía Nacional con múltiples reconocimientos y la satisfacción del deber cumplido al servicio de Colombia.', 'profesional', 9),
(2020, 'Trabajo Comunitario Intensivo', 'Inició un trabajo activo y permanente con comunidades vulnerables de Popayán, escuchando sus necesidades y buscando soluciones concretas para mejorar su calidad de vida.', 'personal', 10),
(2024, 'Candidatura a la Alcaldía', 'Con el respaldo de su comunidad, decidió postularse como candidato a la alcaldía de Popayán para servir a su ciudad natal desde esta nueva y trascendental posición.', 'politico', 11);

-- =============================================
-- CITY VISION
-- =============================================
INSERT INTO city_vision (main_message, principles) VALUES (
  'Juntos construiremos la Popayán moderna, humana y sostenible que todos merecemos. Una ciudad donde cada ciudadano tenga las oportunidades para crecer, prosperar y vivir con dignidad. Una Popayán que preserve su patrimonio histórico y cultural, que abrace el futuro con tecnología e innovación, y que nunca deje a nadie atrás en su camino hacia el desarrollo.',
  ARRAY[
    'Gobernanza transparente y participativa con rendición de cuentas a la ciudadanía',
    'Desarrollo sostenible que cuide el medio ambiente para las futuras generaciones',
    'Equidad social garantizando oportunidades para todos los popayanejos',
    'Innovación y tecnología al servicio de los ciudadanos para mejorar servicios públicos',
    'Preservación del patrimonio histórico y cultural de la ciudad blanca',
    'Fortalecimiento de la economía local y generación de empleo digno'
  ]
);

-- =============================================
-- STRATEGIC AXES
-- =============================================
INSERT INTO strategic_axes (title, description, icon, color, sort_order) VALUES
('Seguridad', 'Una ciudad segura donde puedas caminar tranquilo con tu familia. Implementaremos estrategias integrales de prevención del delito, fortalecimiento de la Policía, y trabajo conjunto con comunidades para reducir la criminalidad y garantizar la convivencia pacífica en todos los barrios de Popayán.', 'shield_tick', '#DC2626', 1),
('Economía', 'Impulso al emprendimiento y generación de empleo para todos. Crearemos un ecosistema favorable para los negocios locales, apoyaremos a los emprendedores con capital semilla y capacitación, atraeremos inversión responsable y dinamizaremos el turismo como motor de desarrollo económico.', 'chart', '#16A34A', 2),
('Educación', 'Educación de calidad como motor del desarrollo social. Mejoraremos la infraestructura educativa, dotaremos a los colegios de tecnología, apoyaremos a los maestros, crearemos programas de becas para jóvenes talentosos y estableceremos alianzas con universidades para fortalecer la educación técnica y superior.', 'teacher', '#2563EB', 3),
('Movilidad', 'Transporte eficiente y vías que conecten a toda la ciudad. Modernizaremos el sistema de transporte público, construiremos ciclovías y corredores peatonales seguros, mejoraremos el estado de las vías en todos los barrios y promoveremos la movilidad sostenible para reducir la congestión y la contaminación.', 'car', '#D97706', 4);

-- =============================================
-- PROPOSALS (linked to strategic axes)
-- =============================================
DO $$
DECLARE
  seguridad_id UUID;
  economia_id UUID;
  educacion_id UUID;
  movilidad_id UUID;
BEGIN
  SELECT id INTO seguridad_id FROM strategic_axes WHERE title = 'Seguridad' LIMIT 1;
  SELECT id INTO economia_id FROM strategic_axes WHERE title = 'Economía' LIMIT 1;
  SELECT id INTO educacion_id FROM strategic_axes WHERE title = 'Educación' LIMIT 1;
  SELECT id INTO movilidad_id FROM strategic_axes WHERE title = 'Movilidad' LIMIT 1;

  -- Seguridad proposals
  INSERT INTO proposals (axis_id, title, description, category, sort_order) VALUES
  (seguridad_id, 'Sistema Integrado de Videovigilancia', 'Instalación de 500 cámaras de seguridad en los puntos críticos de la ciudad, con sala de monitoreo 24/7 y conexión directa con la Policía Nacional para una respuesta rápida ante incidentes.', 'Seguridad', 1),
  (seguridad_id, 'Policía Comunitaria por Barrios', 'Asignación de patrullas comunitarias permanentes en cada barrio, con agentes que conozcan a los vecinos, realicen rondas preventivas y sean el primer punto de contacto ante cualquier situación.', 'Seguridad', 2),
  (seguridad_id, 'Iluminación de Zonas de Riesgo', 'Instalación de 2000 luminarias LED en zonas oscuras y de alto riesgo, especialmente en parques, calles secundarias y accesos a barrios periféricos para reducir la inseguridad nocturna.', 'Seguridad', 3),

  -- Economía proposals
  (economia_id, 'Fondo Emprendedor Popayán', 'Creación de un fondo municipal de $5.000 millones para otorgar créditos blandos y capital semilla a emprendedores locales, con acompañamiento técnico y mentoría empresarial durante los primeros 2 años.', 'Economia', 4),
  (economia_id, 'Clúster Turístico Patrimonial', 'Desarrollo de un clúster turístico que aproveche el patrimonio histórico de Popayán, con rutas turísticas certificadas, formación de guías locales y mejoramiento de la oferta hotelera y gastronómica.', 'Economia', 5),
  (economia_id, 'Mercado Campesino Permanente', 'Creación de un mercado campesino permanente en el centro de la ciudad donde los agricultores del Cauca puedan vender directamente sus productos, eliminando intermediarios y mejorando los ingresos rurales.', 'Economia', 6),

  -- Educación proposals
  (educacion_id, 'Colegios Digitales', 'Dotación de tabletas, computadores y conectividad de alta velocidad a los 60 colegios públicos de Popayán, con formación docente en pedagogía digital y actualización de los currículos para el siglo XXI.', 'Educacion', 7),
  (educacion_id, 'Programa Becas Talentos Caucanos', 'Creación de 500 becas anuales para jóvenes popayanejos de estratos 1, 2 y 3 que quieran acceder a educación técnica, tecnológica o universitaria en instituciones de la región.', 'Educacion', 8),
  (educacion_id, 'Escuelas de Arte y Cultura', 'Apertura de 9 escuelas de arte, música, danza y cultura en cada comuna de Popayán, ofreciendo formación gratuita a niños y jóvenes como alternativa de desarrollo personal y prevención del delito.', 'Educacion', 9),

  -- Movilidad proposals
  (movilidad_id, 'Red de Ciclovías Integradas', 'Construcción de 30 kilómetros de ciclovías segregadas que conecten los principales puntos de la ciudad: universidades, mercado, parques y zonas residenciales, con estacionamientos y talleres de bicicletas.', 'Movilidad', 10),
  (movilidad_id, 'Modernización del Transporte Público', 'Renovación de la flota de buses con vehículos eléctricos o a gas, implementación de paradas techadas con información en tiempo real, y creación de aplicación móvil para consultar rutas y horarios.', 'Movilidad', 11),
  (movilidad_id, 'Pavimentación de Vías Terciarias', 'Pavimentación y mejoramiento de 100 kilómetros de vías terciarias en barrios periféricos y comunas rurales, con participación comunitaria en la priorización y veeduría de las obras.', 'Movilidad', 12);
END $$;

-- =============================================
-- ENDORSEMENTS
-- =============================================
INSERT INTO endorsements (name, title, quote, organization, type, is_featured, sort_order) VALUES
('Carlos Alberto Muñoz', 'Presidente Junta de Acción Comunal - Barrio Bolívar', '"William Campiño es el candidato que nuestro barrio necesita. Lo hemos visto trabajar con nosotros, conoce nuestras necesidades y tiene la experiencia para solucionarlas."', 'JAC Barrio Bolívar', 'personal', TRUE, 1),
('María del Pilar Sánchez', 'Rectora Colegio La Sagrada Familia', '"Como educadora, apoyo a William Campiño porque sus propuestas para la educación son concretas, financiadas y pensadas para la realidad de nuestros estudiantes."', 'Colegio La Sagrada Familia', 'personal', TRUE, 2),
('Asociación de Comerciantes del Centro Histórico', 'Gremio de comerciantes del centro de Popayán', '"Las propuestas económicas de William Campiño van a revitalizar el comercio local y atraer turismo responsable que beneficiará a toda la ciudad."', 'ASOCOMERCIO Popayán', 'organizacion', TRUE, 3),
('Dr. Hernando Rivas', 'Ex Senador por el Cauca', '"La trayectoria de servicio de William Campiño en la Policía Nacional es una garantía de que administrará Popayán con honestidad, eficiencia y dedicación total."', 'Partido Político', 'politico', FALSE, 4),
('Cámara de Comercio del Cauca', 'Organización empresarial del departamento', '"El sector empresarial ve en William Campiño un aliado para el desarrollo económico de Popayán, con visión de largo plazo y respeto por las reglas del juego."', 'Cámara de Comercio del Cauca', 'empresarial', FALSE, 5),
('Liga de Madres Comunitarias del Cauca', 'Organización de madres de familia', '"William Campiño entiende los problemas de las familias caucanas porque viene de una familia como la nuestra. Lo apoyamos porque confiamos en su palabra y sus propuestas."', 'Liga de Madres Comunitarias', 'organizacion', FALSE, 6);

-- =============================================
-- EVENTS (3 upcoming from March 2026, 3 past)
-- =============================================
INSERT INTO events (title, description, event_date, event_time, location, address, latitude, longitude, is_featured, is_active) VALUES
('Gran Encuentro con Líderes Comunales', 'Reunión con más de 200 presidentes de juntas de acción comunal de los 9 corregimientos de Popayán. Espacio para escuchar las necesidades de cada barrio y presentar el plan de gobierno detallado.', '2026-03-08', '10:00:00', 'Centro de Convenciones de Popayán', 'Calle 4 # 6-59, Popayán, Cauca', 2.4420, -76.6070, TRUE, TRUE),
('Diálogo con Jóvenes Emprendedores', 'Foro-taller con emprendedores, estudiantes universitarios y jóvenes líderes para construir juntos las propuestas de desarrollo económico y empleo para Popayán.', '2026-03-15', '15:00:00', 'Universidad del Cauca - Auditorio Mayor', 'Carrera 2 # 1N-45, Popayán, Cauca', 2.4510, -76.5990, FALSE, TRUE),
('Recorrido por Barrios del Sur', 'Visita comunitaria a las comunas 8 y 9 del sur de Popayán para conocer de primera mano las necesidades de los barrios periféricos en infraestructura, seguridad y servicios públicos.', '2026-03-22', '08:00:00', 'Parque Principal - Barrio Moscopán', 'Calle 30 Sur # 12-15, Popayán, Cauca', 2.4250, -76.6080, FALSE, TRUE),
('Foro de Seguridad Ciudadana', 'Debate público sobre seguridad en Popayán con participación de expertos, líderes comunitarios y exfuncionarios de seguridad para analizar la situación actual y las propuestas de mejora.', '2026-01-20', '14:00:00', 'Teatro Municipal Guillermo Valencia', 'Calle 5 # 7-62, Popayán, Cauca', 2.4430, -76.6050, FALSE, TRUE),
('Lanzamiento Oficial de la Campaña', 'Evento de lanzamiento oficial de la campaña de William Campiño a la Alcaldía de Popayán, con presentación del plan de gobierno, música y participación ciudadana masiva.', '2025-11-15', '18:00:00', 'Parque Caldas - Centro Histórico', 'Carrera 7 # 4-22, Popayán, Cauca', 2.4448, -76.6062, TRUE, TRUE),
('Jornada Deportiva Comunitaria', 'Encuentro deportivo y cultural en el estadio municipal con participación de equipos barriales de fútbol, actividades recreativas para niños y presentaciones artísticas locales.', '2026-02-08', '09:00:00', 'Estadio Ciro López de Popayán', 'Carrera 9 # 37N-20, Popayán, Cauca', 2.4580, -76.6040, FALSE, TRUE);

-- =============================================
-- NEWS
-- =============================================
INSERT INTO news (title, summary, content, source_name, published_date, category, is_featured, is_active) VALUES
('William Campiño presenta plan integral de seguridad para Popayán', 'En rueda de prensa, el candidato presentó las principales propuestas de seguridad ciudadana que implementará de llegar a la alcaldía de Popayán, incluyendo 500 cámaras de vigilancia y policía comunitaria en cada barrio.', 'William Campiño, candidato a la Alcaldía de Popayán, presentó ante los medios de comunicación y la ciudadanía su completo plan de seguridad para transformar a Popayán en una ciudad más segura. El plan contempla la instalación de 500 cámaras de videovigilancia, la implementación de un modelo de policía comunitaria por barrios, y la iluminación de más de 2000 puntos oscuros en la ciudad. "La seguridad es el primer derecho de los ciudadanos y lo primero que garantizaremos desde la Alcaldía", afirmó el candidato durante el evento realizado en el Centro de Convenciones.', 'El Nuevo Liberal', '2026-02-28', 'Propuestas', TRUE, TRUE),
('Gran acogida en encuentro con líderes comunales de Popayán', 'Más de 200 presidentes de juntas de acción comunal asistieron al diálogo con el candidato donde se discutieron las necesidades de los barrios y las propuestas de trabajo conjunto para el mejoramiento de la ciudad.', 'El pasado viernes, William Campiño realizó un encuentro histórico con los líderes comunales de Popayán. Más de 200 presidentes de JAC de los 9 corregimientos y comunas de la ciudad participaron en el evento realizado en el Colegio Mayor del Cauca. Durante el encuentro, los líderes expusieron las principales problemáticas de sus sectores: falta de pavimentación, inseguridad, necesidad de parques y centros comunitarios. Campiño escuchó atentamente y comprometió soluciones concretas para cada barrio dentro del plan de gobierno.', 'El Popayán', '2026-02-25', 'Eventos', FALSE, TRUE),
('Campaña de voluntariado supera las 1000 personas en Popayán', 'El llamado a voluntarios para la campaña de William Campiño ha tenido una respuesta masiva. Ya son más de 1000 ciudadanos de los 9 barrios y comunas que se han sumado al equipo de trabajo voluntario.', 'La convocatoria de voluntarios lanzada hace tres semanas por la campaña de William Campiño a la Alcaldía de Popayán superó todas las expectativas. En total, más de 1000 ciudadanos popayanejos de todos los estratos sociales y comunas se han inscrito para apoyar la campaña de manera voluntaria. "Esto demuestra que los popayanejos están listos para el cambio y quieren ser parte de la solución", expresó el candidato visiblemente emocionado al conocer las cifras.', 'Noticias RCN', '2026-02-20', 'Campaña', FALSE, TRUE),
('Propuestas de movilidad de Campiño generan debate ciudadano en redes', 'Las propuestas de ciclovías integradas y modernización del transporte público generaron un amplio debate entre ciudadanos, expertos en movilidad urbana y gremios de transportadores de Popayán.', 'Las propuestas de movilidad presentadas por William Campiño han despertado un intenso debate en las redes sociales y en los foros ciudadanos de Popayán. La construcción de 30 kilómetros de ciclovías, la renovación de la flota de buses con vehículos eléctricos y la implementación de una aplicación para consultar rutas han recibido aplausos de la ciudadanía y críticas de algunos transportadores tradicionales. El candidato respondió que "la modernización del transporte es inevitable y debemos hacerla de manera participativa y justa para todos".', 'Caracol Radio Cauca', '2026-02-15', 'Propuestas', FALSE, TRUE),
('Recorrido por comunas del sur muestra la deuda histórica con Popayán', 'William Campiño realizó un extenso recorrido por las comunas 8 y 9, escuchando a los habitantes y conociendo sus necesidades en temas de vías, seguridad, servicios públicos y espacios recreativos.', 'Durante dos días completos, William Campiño recorrió a pie las comunas 8 y 9 del sur de Popayán, las más densamente pobladas y con mayores necesidades insatisfechas. El candidato visitó más de 30 barrios, escuchó a cientos de familias y constató en persona el estado de deterioro de vías, la falta de parques y espacios deportivos, y los problemas de seguridad que enfrentan a diario. "Esta ciudad nos debe una deuda histórica con el sur de Popayán y la saldaremos", prometió Campiño.', 'El Tiempo Regional', '2026-02-10', 'Comunidad', FALSE, TRUE),
('Alianza con rectores busca transformar colegios públicos de Popayán', 'Se anunció una alianza con rectores de colegios públicos para desarrollar un plan de mejoramiento de infraestructura educativa, dotación tecnológica y formación docente continua.', 'William Campiño anunció una alianza estratégica con la Asociación de Rectores de Colegios Públicos del Cauca para desarrollar conjuntamente el plan de mejoramiento educativo que implementará si gana la Alcaldía de Popayán. El plan contempla la modernización de laboratorios, la dotación de computadores y tabletas, la construcción de nuevas aulas y la formación permanente de docentes en pedagogías activas y uso de tecnología educativa.', 'El Espectador', '2026-02-05', 'Propuestas', FALSE, TRUE),
('Jornada de inscripción de cédulas fue un éxito en Popayán', 'La jornada de apoyo para la inscripción de cédulas logró que más de 500 ciudadanos popayanejos pudieran registrarse para ejercer su derecho al voto en las próximas elecciones locales.', 'La campaña de William Campiño organizó durante el fin de semana pasado una masiva jornada de apoyo para la inscripción de cédulas en los puntos habilitados por la Registraduría en Popayán. Voluntarios de la campaña acompañaron a más de 500 ciudadanos en el proceso de inscripción, con especial énfasis en adultos mayores, personas con discapacidad y habitantes de comunas periféricas que tienen dificultades para desplazarse.', 'El Colombiano', '2026-01-28', 'Campaña', FALSE, TRUE),
('Comerciantes del centro histórico respaldan propuestas económicas de Campiño', 'El gremio de comerciantes del centro histórico de Popayán expresó su respaldo a las propuestas de reactivación económica, mejoramiento del espacio público y fomento del turismo presentadas por el candidato.', 'La Asociación de Comerciantes del Centro Histórico de Popayán realizó un foro gremial donde respaldaron formalmente las propuestas económicas de William Campiño. Los comerciantes destacaron especialmente las propuestas de mejoramiento del espacio público, recuperación del turismo patrimonial y el programa Fondo Emprendedor Popayán, que destinaría 5000 millones de pesos para apoyar a pequeños y medianos empresarios de la ciudad.', 'La República', '2026-01-20', 'Comunidad', FALSE, TRUE);

-- =============================================
-- MEDIA
-- =============================================
INSERT INTO media (title, type, url, thumbnail_url, description, media_date, category, is_featured, sort_order) VALUES
('Lanzamiento de Campaña - Parque Caldas', 'image', 'https://scontent.fppn1-1.fna.fbcdn.net/v/t39.30808-6/607067791_1401151054735436_5828237345673594525_n.jpg', 'https://scontent.fppn1-1.fna.fbcdn.net/v/t39.30808-6/607067791_1401151054735436_5828237345673594525_n.jpg', 'Evento de lanzamiento oficial de la campaña de William Campiño en el emblemático Parque Caldas de Popayán.', '2025-11-15', 'Eventos', TRUE, 1),
('Encuentro con Líderes Comunales', 'image', 'https://i.ytimg.com/vi/jo9HdFIn_Ac/hq720.jpg', 'https://i.ytimg.com/vi/jo9HdFIn_Ac/hq720.jpg', 'William Campiño en el encuentro histórico con más de 200 presidentes de juntas de acción comunal de Popayán.', '2026-02-25', 'Eventos', TRUE, 2),
('Recorrido por el Sur de Popayán', 'image', 'https://scontent.fppn1-1.fna.fbcdn.net/v/t39.30808-6/607067791_1401151054735436_5828237345673594525_n.jpg', NULL, 'Candidato recorriendo a pie los barrios de las comunas 8 y 9 de Popayán, escuchando a sus habitantes.', '2026-02-10', 'Comunidad', FALSE, 3),
('Presentación Plan de Seguridad', 'image', 'https://i.ytimg.com/vi/jo9HdFIn_Ac/hq720.jpg', NULL, 'William Campiño presentando el plan integral de seguridad para Popayán en rueda de prensa.', '2026-02-28', 'Propuestas', FALSE, 4),
('Foro con Jóvenes Emprendedores', 'image', 'https://scontent.fppn1-1.fna.fbcdn.net/v/t39.30808-6/607067791_1401151054735436_5828237345673594525_n.jpg', NULL, 'Diálogo dinámico con jóvenes emprendedores y universitarios en la Universidad del Cauca.', '2026-01-15', 'Eventos', FALSE, 5),
('Propuestas de Movilidad - Ciclovías', 'image', 'https://i.ytimg.com/vi/jo9HdFIn_Ac/hq720.jpg', NULL, 'Presentación de la red de ciclovías integradas que se construirán en Popayán.', '2026-02-15', 'Propuestas', FALSE, 6),
('Mensaje de la Campaña - Video Oficial', 'video', 'https://www.youtube.com/embed/jo9HdFIn_Ac', 'https://i.ytimg.com/vi/jo9HdFIn_Ac/hq720.jpg', 'Video oficial de la campaña de William Campiño a la Alcaldía de Popayán.', '2025-11-15', 'Campaña', TRUE, 7),
('Recorrido Comunitario - Documental', 'video', 'https://www.youtube.com/embed/jo9HdFIn_Ac', 'https://i.ytimg.com/vi/jo9HdFIn_Ac/hq720.jpg', 'Documental del recorrido de William Campiño por los barrios de Popayán.', '2026-02-10', 'Comunidad', FALSE, 8),
('Debate Seguridad Ciudadana', 'video', 'https://www.youtube.com/embed/jo9HdFIn_Ac', 'https://i.ytimg.com/vi/jo9HdFIn_Ac/hq720.jpg', 'Participación de William Campiño en el debate sobre seguridad ciudadana en Popayán.', '2026-01-20', 'Propuestas', FALSE, 9),
('Entrevista RCN Cauca', 'video', 'https://www.youtube.com/embed/jo9HdFIn_Ac', 'https://i.ytimg.com/vi/jo9HdFIn_Ac/hq720.jpg', 'Entrevista exclusiva con RCN Cauca sobre el plan de gobierno para Popayán.', '2026-02-20', 'Campaña', FALSE, 10);

-- =============================================
-- COMMUNES (9 comunas de Popayán)
-- =============================================
INSERT INTO communes (name, number, description, population, neighborhoods, color, latitude, longitude) VALUES
('El Centro', 1, 'La comuna histórica y cultural de Popayán, sede del gobierno municipal, universidades y el patrimonio arquitectónico colonial de la ciudad blanca. Corazón político, comercial y cultural de la ciudad.', 45000, ARRAY['El Centro', 'San Camilo', 'La Esmeralda', 'Yanaconas', 'San José'], '#DC2626', 2.4440, -76.6060),
('El Empedrado', 2, 'Comuna residencial con amplio desarrollo urbano y comercial. Alberga importantes centros educativos, zonas comerciales y comunidades organizadas con fuerte participación ciudadana.', 52000, ARRAY['El Empedrado', 'Las Palmas', 'Santa Helena', 'Bella Vista', 'El Paraíso'], '#D97706', 2.4320, -76.6080),
('El Libertador', 3, 'Zona norte de la ciudad con crecimiento acelerado, importantes vías de acceso y comunidades activas. Sede de varios colegios públicos y parques deportivos de la ciudad.', 48000, ARRAY['El Libertador', 'Nuevo Milenio', 'La Paz', 'El Triunfo', 'Villa del Rosario'], '#16A34A', 2.4260, -76.6000),
('Comuneros', 4, 'Comuna con alta actividad comercial y empresarial. Concentra importantes centros de salud, mercados populares y zonas de pequeña industria que generan empleo local.', 61000, ARRAY['Comuneros', 'El Edén', 'Julio Rincón', 'El Rosario', 'La Paz Norte'], '#2563EB', 2.4500, -76.5950),
('Alfonso López', 5, 'Zona universitaria por excelencia, con la presencia de la Universidad del Cauca y el SENA. Alta concentración de estudiantes, cafeterías y comercio universitario animado.', 39000, ARRAY['Alfonso López', 'Lorenzo de Aldana', 'La Ladera', 'Calicanto', 'El Jardín'], '#7C3AED', 2.4560, -76.6200),
('Altos del Norte', 6, 'Comuna periurbana en la zona norte con barrios de expansión reciente, fuerte sentido comunitario y necesidades de infraestructura vial y servicios públicos prioritarios.', 35000, ARRAY['Altos del Norte', 'San Rafael', 'Villa Rosario', 'Los Pinos', 'La Esperanza Norte'], '#0891B2', 2.4700, -76.6100),
('Los Libertadores', 7, 'Extensa zona occidental con mezcla de barrios consolidados y nuevos desarrollos de vivienda popular. Requiere inversión en movilidad, seguridad y equipamientos comunitarios.', 58000, ARRAY['Los Libertadores', 'La Floresta', 'El Carmen', 'Villa del Norte', 'Nuevo Horizonte'], '#BE185D', 2.4600, -76.6150),
('El Lago', 8, 'Una de las comunas más populosas del sur, con barrios de alta densidad, problemáticas de seguridad y gran potencial de desarrollo. Comunidad organizada y propositiva en su relación con el municipio.', 72000, ARRAY['El Lago', 'Moscopán', 'La Pamba', 'Las Américas', 'Villa del Sur', 'El Recuerdo'], '#92400E', 2.4380, -76.6150),
('Escuela Nacional de Policía', 9, 'Zona sur con características especiales por la presencia de la ESNAL. Mix de barrios residenciales, zonas verdes y corredores viales importantes de la ciudad.', 41000, ARRAY['ESNAL', 'Villa María', 'El Placer', 'La Arboleda', 'San Marcos'], '#065F46', 2.4420, -76.6320);

-- =============================================
-- SOCIAL LINKS
-- =============================================
INSERT INTO social_links (platform, url, icon, sort_order, is_active) VALUES
('Facebook', 'https://www.facebook.com/williamcampino', 'facebook', 1, TRUE),
('Instagram', 'https://www.instagram.com/williamcampino', 'instagram', 2, TRUE),
('Twitter', 'https://www.twitter.com/williamcampino', 'twitter', 3, TRUE),
('YouTube', 'https://www.youtube.com/@williamcampino', 'youtube', 4, TRUE);

-- =============================================
-- SITE CONFIG
-- =============================================
INSERT INTO site_config (key, value, description) VALUES
('site_name', 'William Campiño - Alcaldía de Popayán', 'Nombre del sitio web'),
('candidate_email', 'contacto@williamcampino.com', 'Email de contacto del candidato'),
('candidate_phone', '+57 312 456 7890', 'Teléfono de contacto de la campaña'),
('campaign_slogan', 'Con compromiso, experiencia y amor por la tierra blanca', 'Slogan oficial de la campaña'),
('popayan_budget', '830000000000', 'Presupuesto anual de Popayán en pesos colombianos'),
('campaign_year', '2026', 'Año de las elecciones'),
('candidate_party', 'Movimiento Ciudadano Popayán Moderna', 'Partido o movimiento político');

-- =============================================
-- INVESTMENT PROJECTS (Citizen Calculator)
-- =============================================
INSERT INTO investment_projects (name, description, unit_cost, unit_name, icon, category, max_quantity, sort_order, is_active) VALUES
('Parque Comunitario', 'Construcción de un parque comunitario completo con juegos infantiles, canchas deportivas, zona de ejercicio adulto, iluminación LED y senderos peatonales para un barrio.', 800000000, 'parque', 'park', 'Espacios Públicos', 50, 1, TRUE),
('Cámara de Seguridad', 'Instalación de cámara de videovigilancia HD con sistema de almacenamiento, conectada al centro de monitoreo 24/7 de la Policía Nacional.', 8000000, 'cámara', 'security', 'Seguridad', 500, 2, TRUE),
('Cupo en Colegio Digital', 'Dotación tecnológica completa para un estudiante: tablet, acceso a internet, materiales digitales y plataformas educativas por un año escolar.', 1500000, 'cupo', 'school', 'Educación', 1000, 3, TRUE),
('Kilómetro de Ciclovía', 'Construcción de 1 kilómetro de ciclovía segregada con señalización, iluminación, pintura y conectividad con la red vial urbana existente.', 500000000, 'kilómetro', 'bike', 'Movilidad', 100, 4, TRUE),
('Bus Eléctrico', 'Adquisición de un bus eléctrico de 40 pasajeros con cargador, mantenimiento programado y capacitación del conductor para el sistema de transporte público.', 900000000, 'bus', 'bus', 'Movilidad', 50, 5, TRUE),
('Luminaria LED', 'Instalación de poste de iluminación LED de alta eficiencia en zona pública, con sistema de control remoto y mantenimiento por 5 años incluido.', 4000000, 'luminaria', 'lamp', 'Infraestructura', 2000, 6, TRUE),
('Crédito para Emprendedor', 'Capital semilla del Fondo Emprendedor Popayán para un pequeño empresario, incluye capacitación empresarial y acompañamiento técnico durante 2 años.', 10000000, 'crédito', 'store', 'Economía', 500, 7, TRUE),
('Centro Comunitario', 'Construcción o adecuación de un centro comunitario con salón múltiple, cocina, baños y equipamiento básico para una comunidad de más de 500 familias.', 600000000, 'centro', 'building', 'Espacios Públicos', 30, 8, TRUE);
