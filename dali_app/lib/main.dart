import 'package:flutter/material.dart';
import 'dart:async';

// главная функция, с которой начинается запуск приложения
void main() {
  runApp(const DaliApp());
}

// основной класс приложения, здесь настраиваем цвета и тему
class DaliApp extends StatelessWidget {
  const DaliApp({super.key});

  // фирменные цвета приложения
  static const Color myBlue = Color(0xFF5394a3); 
  static const Color myBeige = Color(0xFFffffff); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dali App',
      debugShowCheckedModeBanner: false, // убираем красную плашку "debug" в углу
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: myBeige, // цвет фона для всех экранов
        fontFamily: 'Roboto', // основной шрифт
      ),
      home: const SplashScreen(), // первый экран при запуске
    );
  }
}

// экран заставки (показывается при загрузке)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // таймер: ждем 3 секунды и переходим на главный экран
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DaliApp.myBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // белый круг с тенью для иконки палитры
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: DaliApp.myBeige,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(Icons.palette, size: 80, color: DaliApp.myBlue),
            ),
            const SizedBox(height: 30),
            // название приложения
            const Text(
              'Dali App',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
            ),
            const SizedBox(height: 10),
            // подзаголовок
            Text(
              'Изучай искусство',
              style: TextStyle(fontSize: 18, color: Colors.white.withValues(alpha: 0.8)),
            ),
            const SizedBox(height: 50),
            // крутящийся индикатор загрузки
            const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
          ],
        ),
      ),
    );
  }
}

// главный экран (список направлений)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // общая заглушка для направлений, которые пока без локальных картинок
  static const String phCover = 'https://via.placeholder.com/330x400/5394a3/ffffff.png?text=Скоро+появится';

  // база данных направлений с подробными описаниями
  final List<Map<String, dynamic>> movements = const [
    {
      'title': 'Готика',
      'years': 'IX–XIV вв.',
      'description': 'Величественный и мистический стиль Средневековья, устремленный к небесам. Для готической живописи характерны глубокий религиозный символизм, сияющие золотые фоны, изящные, слегка вытянутые пропорции фигур и невероятное внимание к деталям. Это искусство, призванное внушать трепет и отрывать мысли от земного.',
      'image': 'assets/images/gothic_cover.jpg', // локальная картинка
    },
    {
      'title': 'Ренессанс',
      'years': 'XIV–XVI вв.',
      'description': 'Великая эпоха Возрождения, перевернувшая взгляд на мир. Художники вновь обратились к античным идеалам красоты, воспевая гармонию и величие человека. Именно в это время были открыты законы линейной перспективы, светотени и точной анатомии, что сделало картины невероятно реалистичными и глубокими.',
      'image': 'assets/images/ren_cover.jpg', // локальная картинка
    },
    {
      'title': 'Барокко',
      'years': 'XVI–XVIII вв.',
      'description': 'Эпоха страсти, роскоши и театрального драматизма. Барокко поражает зрителя динамичными композициями, мощными контрастами света и глубокой тени, а также бурей эмоций. Картины этого периода словно выхватывают кульминационный момент действия, заставляя нас стать его соучастниками.',
      'image': phCover,
    },
    {
      'title': 'Классицизм',
      'years': 'XVII–XIX вв.',
      'description': 'Торжество разума, порядка и идеальной гармонии. Классицизм опирается на строгие каноны античного искусства, где композиция выверена до миллиметра, а сюжеты воспевают гражданский долг, героизм и высокие моральные идеалы. Эмоции здесь всегда подчинены холодному рассудку.',
      'image': phCover,
    },
    {
      'title': 'Романтизм',
      'years': 'XVIII–XIX вв.',
      'description': 'Бунт против строгих правил в пользу свободы чувств и индивидуальности. Романтики искали вдохновение в необузданной мощи природы, мистике, экзотических странах и героическом прошлом. Их полотна наполнены сильными страстями, трагизмом и глубокими душевными переживаниями одинокого героя.',
      'image': phCover,
    },
    {
      'title': 'Реализм',
      'years': 'XIX в.',
      'description': 'Искусство суровой правды жизни. Отказавшись от мифологии и идеализации, реалисты сделали главными героями своих картин простых людей — крестьян, рабочих, горожан. Они стремились показать мир таким, какой он есть, со всеми его социальными проблемами, тяжелым трудом и неброской красотой повседневности.',
      'image': phCover,
    },
    {
      'title': 'Импрессионизм',
      'years': 'XIX – нач. XX в.',
      'description': 'Революция света и цвета. Импрессионисты вышли из душных мастерских на пленэр, чтобы поймать ускользающее мгновение. Они отказались от четких контуров, создавая картины из тысяч мелких, ярких мазков. Их главная цель — передать вибрацию воздуха, игру солнечных лучей и живое впечатление от увиденного.',
      'image': phCover,
    },
    {
      'title': 'Постимпрессионизм',
      'years': 'кон. XIX – нач. XX в.',
      'description': 'Поиск скрытых смыслов за пределами видимого мира. Взяв у импрессионистов яркость красок, художники этого направления пошли дальше: они начали искажать формы и использовать цвет для выражения своих глубоких внутренних переживаний. Это искусство ярких индивидуальностей, где каждый творец создавал свою собственную вселенную.',
      'image': phCover,
    },
    {
      'title': 'Модерн',
      'years': 'кон. XIX – нач. XX в.',
      'description': 'Утонченный и декоративный стиль, вдохновленный самой природой. Для модерна характерны извилистые, текучие линии (подобные стеблям растений), обилие орнаментов, асимметрия и мистическая символика. Это искусство стремилось превратить всю окружающую среду в единое, эстетически совершенное произведение.',
      'image': phCover,
    },
    {
      'title': 'Сюрреализм',
      'years': 'XX в.',
      'description': 'Погружение в загадочный мир снов, галлюцинаций и бессознательного. Сюрреалисты создавали парадоксальные, пугающие и завораживающие образы, где несовместимые предметы соединяются в абсурдные композиции. Их картины — это визуальные ребусы, бросающие вызов логике и привычному восприятию реальности.',
      'image': phCover,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // верхняя панель
      appBar: AppBar(
        title: const Text('Направления живописи', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: DaliApp.myBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // список направлений (скроллится вниз)
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: movements.length,
        itemBuilder: (context, index) {
          final item = movements[index];
          final String imagePath = item['image'];

          // карточка одного направления
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              // обработка нажатия на карточку
              onTap: () {
                // красивая анимация перехода на экран галереи (увеличение и появление)
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    pageBuilder: (_, __, ___) => MovementDetailScreen(movement: item),
                    transitionsBuilder: (_, animation, __, child) {
                      final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
                      return FadeTransition(
                        opacity: curvedAnimation,
                        child: ScaleTransition(
                          scale: Tween<double>(begin: 0.95, end: 1.0).animate(curvedAnimation),
                          child: child,
                        ),
                      );
                    },
                  ),
                );
              },
              // содержимое карточки (картинка + текст)
              child: Container(
                height: 100,
                decoration: const BoxDecoration(color: DaliApp.myBlue),
                child: Row(
                  children: [
                    // умная проверка: если ссылка из интернета - качаем, если локальная - берем из папки
                    imagePath.startsWith('http')
                        ? Image.network(
                            imagePath,
                            width: 100, height: 100, fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(width: 100, height: 100, color: DaliApp.myBlue.withValues(alpha: 0.5), child: const Icon(Icons.broken_image, color: Colors.white54)),
                          )
                        : Image.asset(
                            imagePath,
                            width: 100, height: 100, fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(width: 100, height: 100, color: DaliApp.myBlue.withValues(alpha: 0.5), child: const Icon(Icons.broken_image, color: Colors.white54)),
                          ),
                    const SizedBox(width: 16),
                    // текстовая часть карточки
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(item['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                          const SizedBox(height: 4),
                          Text(item['years'], style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.85))),
                        ],
                      ),
                    ),
                    // иконка стрелочки вправо
                    const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// экран направления (описание + галерея картин)
class MovementDetailScreen extends StatelessWidget {
  final Map<String, dynamic> movement;
  const MovementDetailScreen({super.key, required this.movement});

  // функция, которая выдает нужный список картин в зависимости от названия направления
  List<Map<String, String>> getArtworks() {
    final String title = movement['title'];
    final String ph = 'https://via.placeholder.com/330x400/5394a3/ffffff.png?text=Скоро+появится';

    if (title == 'Готика') {
      return [
        {'title': 'Маэста', 'author': 'Дуччо ди Буонинсенья', 'year': '1311', 'museum': 'Музей Опера дель Дуомо, Сиена', 'image': 'assets/images/gothic_1.jpg'},
        {'title': 'Благовещение', 'author': 'Симоне Мартини', 'year': '1333', 'museum': 'Галерея Уффици, Флоренция', 'image': 'assets/images/gothic_2.jpg'},
        {'title': 'Поклонение волхвов', 'author': 'Джентиле да Фабриано', 'year': '1423', 'museum': 'Галерея Уффици, Флоренция', 'image': 'assets/images/gothic_3.jpg'},
        {'title': 'Портрет четы Арнольфини', 'author': 'Ян ван Эйк', 'year': '1434', 'museum': 'Национальная галерея, Лондон', 'image': 'assets/images/gothic_4.jpg'},
        {'title': 'Сад земных наслаждений', 'author': 'Иероним Босх', 'year': '1500–1510', 'museum': 'Музей Прадо, Мадрид', 'image': 'assets/images/gothic_5.jpg'},
        {'title': 'Маэста', 'author': 'Чимабуэ', 'year': '1280', 'museum': 'Галерея Уффици, Флоренция', 'image': 'assets/images/gothic_6.jpg'},
      ];
    } else if (title == 'Ренессанс') {
      // добавляем картины для ренессанса
      return [
        {'title': 'Сикстинская Мадонна', 'author': 'Рафаэль Санти', 'year': '1512', 'museum': 'Галерея старых мастеров, Дрезден', 'image': 'assets/images/ren_1.jpg'},
        {'title': 'Рождение Венеры', 'author': 'Сандро Боттичелли', 'year': '1486', 'museum': 'Галерея Уффици, Флоренция', 'image': 'assets/images/ren_2.jpg'},
        {'title': 'Создание Адама', 'author': 'Микеланджело', 'year': '1512', 'museum': 'Сикстинская капелла, Ватикан', 'image': 'assets/images/ren_3.jpg'},
        {'title': 'Тайная вечеря', 'author': 'Леонардо да Винчи', 'year': '1495–1498', 'museum': 'Санта-Мария-делле-Грацие, Милан', 'image': 'assets/images/ren_4.jpg'},
        {'title': 'Афинская школа', 'author': 'Рафаэль Санти', 'year': '1511', 'museum': 'Апостольский дворец, Ватикан', 'image': 'assets/images/ren_5.jpg'},
        {'title': 'Венера Урбинская', 'author': 'Тициан', 'year': '1538', 'museum': 'Галерея Уффици, Флоренция', 'image': 'assets/images/ren_6.jpg'},
      ];
    }

    // заглушка для всех остальных направлений (по 6 картин)
    return [
      {'title': 'Картина 1', 'author': 'Неизвестен', 'year': '----', 'museum': 'Музей', 'image': ph},
      {'title': 'Картина 2', 'author': 'Неизвестен', 'year': '----', 'museum': 'Музей', 'image': ph},
      {'title': 'Картина 3', 'author': 'Неизвестен', 'year': '----', 'museum': 'Музей', 'image': ph},
      {'title': 'Картина 4', 'author': 'Неизвестен', 'year': '----', 'museum': 'Музей', 'image': ph},
      {'title': 'Картина 5', 'author': 'Неизвестен', 'year': '----', 'museum': 'Музей', 'image': ph},
      {'title': 'Картина 6', 'author': 'Неизвестен', 'year': '----', 'museum': 'Музей', 'image': ph},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final artworks = getArtworks();
    final String coverImage = movement['image'];

    return Scaffold(
      backgroundColor: DaliApp.myBeige,
      appBar: AppBar(
        title: Text(movement['title']),
        backgroundColor: DaliApp.myBlue,
        foregroundColor: Colors.white,
      ),
      // скроллируемая страница
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // большая картинка-обложка направления
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 5))],
                ),
                clipBehavior: Clip.antiAlias,
                child: coverImage.startsWith('http')
                    ? Image.network(
                        coverImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(color: DaliApp.myBlue, child: const Icon(Icons.broken_image, color: Colors.white, size: 50)),
                      )
                    : Image.asset(
                        coverImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(color: DaliApp.myBlue, child: const Icon(Icons.broken_image, color: Colors.white, size: 50)),
                      ),
              ),
              const SizedBox(height: 20),
              // название, годы и описание
              Text(movement['title'], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: DaliApp.myBlue)),
              const SizedBox(height: 5),
              Text(movement['years'], style: TextStyle(fontSize: 16, color: DaliApp.myBlue.withValues(alpha: 0.7))),
              const SizedBox(height: 15),
              Text(movement['description'] ?? 'Описание отсутствует', style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black87)),
              const SizedBox(height: 30),
              const Text('Известные картины', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: DaliApp.myBlue)),
              const SizedBox(height: 15),
              
              // сетка картин (галерея в 2 колонки)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // отключаем внутренний скролл сетки, так как скроллится вся страница
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // количество колонок
                  crossAxisSpacing: 12, // отступы между колонками
                  mainAxisSpacing: 12, // отступы между рядами
                  childAspectRatio: 0.65, // пропорции карточки картины
                ),
                itemCount: artworks.length,
                itemBuilder: (context, index) {
                  final art = artworks[index];
                  final String artImage = art['image']!;
                  
                  return GestureDetector(
                    // переход на полноэкранный просмотр при нажатии на картину
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FullScreenImage(
                            artworks: artworks,
                            initialIndex: index, // передаем индекс нажатой картины, чтобы открыть именно её
                          ),
                        ),
                      );
                    },
                    // карточка отдельной картины
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 5, offset: const Offset(0, 3))],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // сама картинка
                          Expanded(
                            child: artImage.startsWith('http')
                                ? Image.network(
                                    artImage,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(color: DaliApp.myBlue.withValues(alpha: 0.3), child: const Center(child: Icon(Icons.image, size: 40, color: Colors.white))),
                                  )
                                : Image.asset(
                                    artImage,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(color: DaliApp.myBlue.withValues(alpha: 0.3), child: const Center(child: Icon(Icons.image, size: 40, color: Colors.white))),
                                  ),
                          ),
                          // подписи под картинкой (название, автор, год)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(art['title']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 2),
                                Text(art['author']!, style: const TextStyle(fontSize: 12, color: Colors.black87), maxLines: 1, overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 2),
                                Text('${art['year']} • ${art['museum']}', style: TextStyle(fontSize: 10, color: Colors.grey[600]), maxLines: 1, overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              // кнопка для будущего теста
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DaliApp.myBlue,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Скоро здесь будет тест!')));
                  },
                  child: const Text('Пройти тест', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// экран полноэкранного просмотра (зум и свайпы)
class FullScreenImage extends StatefulWidget {
  final List<Map<String, String>> artworks;
  final int initialIndex;

  const FullScreenImage({super.key, required this.artworks, required this.initialIndex});

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late PageController _pageController; // контроллер для перелистывания страниц
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // запоминаем, какую картинку открыл пользователь
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // верхняя панель с прозрачным фоном и кнопкой закрыть
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(widget.artworks[_currentIndex]['title']!),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // листалка картинок (pageview)
                PageView.builder(
                  controller: _pageController,
                  itemCount: widget.artworks.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final art = widget.artworks[index];
                    final String artImage = art['image']!;
                    
                    return Center(
                      // виджет для приближения (зума) картинки двумя пальцами
                      child: InteractiveViewer(
                        panEnabled: true,
                        minScale: 1.0,
                        maxScale: 4.0, // максимальное увеличение в 4 раза
                        child: artImage.startsWith('http')
                            ? Image.network(
                                artImage,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.broken_image, color: Colors.white, size: 80)),
                              )
                            : Image.asset(
                                artImage,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.broken_image, color: Colors.white, size: 80)),
                              ),
                      ),
                    );
                  },
                ),
                // кнопка "назад" (показываем, если это не первая картинка)
                if (_currentIndex > 0)
                  Positioned(
                    left: 10,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white70),
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                  ),
                // кнопка "вперед" (показываем, если это не последняя картинка)
                if (_currentIndex < widget.artworks.length - 1)
                  Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // темная панель с информацией о картине внизу экрана
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.black54,
            child: Column(
              children: [
                Text(widget.artworks[_currentIndex]['title']!, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text('${widget.artworks[_currentIndex]['author']} • ${widget.artworks[_currentIndex]['year']}', style: const TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 5),
                Text(widget.artworks[_currentIndex]['museum']!, style: const TextStyle(color: Colors.white54, fontSize: 14)),
                const SizedBox(height: 15),
                // точки-индикаторы (показывают текущую картинку)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.artworks.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == index ? 12 : 8,
                      height: _currentIndex == index ? 12 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? DaliApp.myBlue : Colors.white54,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}