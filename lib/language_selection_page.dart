import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'registration_login_page.dart'; // Импортируем страницу регистрации/входа

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await EasyLocalization.of(context)?.setLocale(Locale("en"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationLoginPage()), 
                );
              
              },
              child: Text('English'),
            ),
            ElevatedButton(
              onPressed: () async {
                await EasyLocalization.of(context)?.setLocale(Locale("ru"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationLoginPage()), 
                );
              
              },
              child: Text('Русский'),
            ),
            ElevatedButton(
              onPressed: () async {
                await EasyLocalization.of(context)?.setLocale(Locale("kz"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationLoginPage()), 
                );
                
              },
              child: Text('Қазақша'),
            ),
          ],
        ),
      ),
    );
  }
}
