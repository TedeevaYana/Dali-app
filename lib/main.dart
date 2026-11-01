import 'package:flutter/material.dart';
import 'dart:async';

// запуск приложения
void main() {
  runApp(const DaliApp());
}

class DaliApp extends StatelessWidget {
  const DaliApp({super.key});

  // основные цвета приложения
  static const Color myBlue = Color(0xFF5394a3); 
  static const Color myBeige = Color(0xFFffffff); 

  @override
  Widget build(BuildContext context) {
    // настройка всего приложения (тема, стартовый экран)
    return MaterialApp(
      title: 'Dali App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: myBeige, // фон экранов по умолчанию
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(), // первый экран при запуске
    );
  }
}

// экран заставки
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // таймер на 3 секунды, после которого переход на главный экран
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // разметка заставки
    return Scaffold(
      backgroundColor: DaliApp.myBlue, // синий фон заставки
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // круг с иконкой палитры
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
              child: const Icon(
                Icons.palette,
                size: 80,
                color: DaliApp.myBlue,
              ),
            ),
            const SizedBox(height: 30),
            // название приложения
            const Text(
              'Dali App',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            // подзаголовок
            Text(
              'Изучай искусство',
              style: TextStyle(fontSize: 18, color: Colors.white.withValues(alpha: 0.8)),
            ),
            const SizedBox(height: 50),
            // индикатор загрузки
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// главный экран со списком направлений
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // список данных о направлениях живописи
  final List<Map<String, dynamic>> movements = const [
    {
      // картина: "Оплакивание Христа" (Lamentation), Джотто ди Бондоне
      'title': 'Готика',
      'years': 'IX–XIV вв.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Giotto_-_Scrovegni_-_-36-_-_Lamentation_%28The_Mourning_of_Christ%29_adj.jpg/400px-Giotto_-_Scrovegni_-_-36-_-_Lamentation_%28The_Mourning_of_Christ%29_adj.jpg',
    },
    {
      // картина: "Мона Лиза" (Джоконда), Леонардо да Винчи
      'title': 'Ренессанс',
      'years': 'XIV–XVI вв.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/400px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg',
    },
    {
       // картина: "Христос во время шторма на Галилейском море", Рембрандт
      'title': 'Барокко',
      'years': 'XVI–XVIII вв.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Rembrandt_Christ_in_the_Storm_on_the_Lake_of_Galilee.jpg/400px-Rembrandt_Christ_in_the_Storm_on_the_Lake_of_Galilee.jpg',
    },
    {
      // картина: "Аркадские пастухи" (Et in Arcadia ego), Никола Пуссен
      'title': 'Классицизм',
      'years': 'XVII–XIX вв.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Nicolas_Poussin_-_Et_in_Arcadia_ego_%28deuxi%C3%A8me_version%29.jpg/400px-Nicolas_Poussin_-_Et_in_Arcadia_ego_%28deuxi%C3%A8me_version%29.jpg',
    },
    {
      // картина: "Странник над морем тумана", Каспар Давид Фридрих
      'title': 'Романтизм',
      'years': 'XVIII–XIX вв.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Caspar_David_Friedrich_-_Wanderer_above_the_sea_of_fog.jpeg/400px-Caspar_David_Friedrich_-_Wanderer_above_the_sea_of_fog.jpeg',
    },
    {
      // картина: "Похороны в Орнане", Гюстав Курбе
      'title': 'Реализм',
      'years': 'XIX в.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Gustave_Courbet_-_A_Burial_at_Ornans_-_Google_Art_Project_2.jpg/400px-Gustave_Courbet_-_A_Burial_at_Ornans_-_Google_Art_Project_2.jpg',
    },
    {
       // картина: "Впечатление. Восходящее солнце", Клод Моне
      'title': 'Импрессионизм',
      'years': 'XIX – нач. XX в.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Claude_Monet%2C_Impression%2C_soleil_levant.jpg/400px-Claude_Monet%2C_Impression%2C_soleil_levant.jpg',
    },
    {
      // картина: "Звёздная ночь", Винсент Ван Гог
      'title': 'Постимпрессионизм',
      'years': 'кон. XIX – нач. XX в.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/400px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg',
    },
    {
      // картина: "Поцелуй", Густав Климт
      'title': 'Модерн',
      'years': 'кон. XIX – нач. XX в.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Gustav_Klimt_016.jpg/400px-Gustav_Klimt_016.jpg',
    },
    {
      // картина: "Постоянство памяти" ("Мягкие часы"), Сальвадор Дали
      'title': 'Сюрреализм',
      'years': 'XX в.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/The_Persistence_of_Memory.jpg/400px-The_Persistence_of_Memory.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // каркас главного экрана
    return Scaffold(
      // верхняя панель с заголовком
      appBar: AppBar(
        title: const Text(
          'Направления живописи',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: DaliApp.myBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // список карточек
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: movements.length,
        itemBuilder: (context, index) {
          final item = movements[index]; // берем данные одной карточки
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              // анимация перехода на экран с картинами
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    pageBuilder: (_, __, ___) => MovementDetailScreen(movement: item),
                    transitionsBuilder: (_, animation, __, child) {
                      // эффект появления и увеличения
                      final curvedAnimation = CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      );
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
              // содержимое карточки
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: DaliApp.myBlue,
                ),
                child: Row(
                  children: [
                    // картинка слева
                    Image.network(
                      item['image'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                      // заглушка во время загрузки
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          width: 100,
                          height: 100,
                          color: DaliApp.myBlue.withValues(alpha: 0.5),
                          child: const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        );
                      },
                      // заглушка если картинка не загрузилась
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: DaliApp.myBlue.withValues(alpha: 0.5),
                          child: const Icon(Icons.broken_image, color: Colors.white54),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    // текст внутри карточки
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // название направления
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // годы направления
                          Text(
                            item['years'],
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // стрелочка справа
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                      size: 18,
                    ),
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

// экран выбранного направления (пока заглушка)
class MovementDetailScreen extends StatelessWidget {
  final Map<String, dynamic> movement; // данные выбранного направления

  const MovementDetailScreen({super.key, required this.movement});

  @override
  Widget build(BuildContext context) {
    // разметка экрана направления
    return Scaffold(
      backgroundColor: DaliApp.myBeige,
      // верхняя панель с названием направления
      appBar: AppBar(
        title: Text(movement['title']),
        backgroundColor: DaliApp.myBlue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // большая картинка направления
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                movement['image'],
                fit: BoxFit.cover,
                webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                // заглушка если картинка не загрузилась
                errorBuilder: (context, error, stackTrace) => Container(
                  color: DaliApp.myBlue,
                  child: const Icon(Icons.broken_image, color: Colors.white, size: 50),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // название направления
            Text(
              movement['title'],
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: DaliApp.myBlue,
              ),
            ),
            const SizedBox(height: 10),
            // годы направления
            Text(
              movement['years'],
              style: TextStyle(
                fontSize: 18,
                color: DaliApp.myBlue.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 40),
            // временный текст вместо галереи
            const Text(
              'Здесь скоро появится галерея картин',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
