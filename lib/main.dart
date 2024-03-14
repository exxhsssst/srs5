import 'package:flutter/material.dart';
import 'generated/codegen_loader.g.dart';
import 'language_selection_page.dart'; // Импортируем файл выбора языка
import 'registration_login_page.dart'; // Импортируем файл регистрации/входа
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('kz'), Locale('de')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'My App',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/language_selection', // Устанавливаем начальный маршрут на выбор языка
      routes: {
        '/language_selection': (context) => LanguageSelectionPage(), // Маршрут для выбора языка
        '/registration_login': (context) => RegistrationLoginPage(), // Маршрут для регистрации/входа
        '/home': (context) => HomePage(), // Маршрут для главного меню
        '/favorites': (context) => FavoritesPage(), // Маршрут для избранного
        '/account': (context) => AccountPage(), // Маршрут для аккаунта
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Center(
        child: ListView(
          children: [
            LikeableText('Text 1'), // Добавляем текст, который можно лайкать
            LikeableText('Text 2'), // Добавляем еще один текст, который можно лайкать
            LikeableText('Text 3'), // И еще один текст
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/favorites');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/account');
          }
        },
      ),
    );
  }
}

class LikeableText extends StatefulWidget {
  final String text;

  LikeableText(this.text);

  @override
  _LikeableTextState createState() => _LikeableTextState();
}

class _LikeableTextState extends State<LikeableText> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.text),
      trailing: IconButton(
        icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Text('Favorites Page'),
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Text('Account Page'),
      ),
    );
  }
}
