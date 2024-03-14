import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:srs555/generated/locale_keys.g.dart';

class RegistrationLoginPage extends StatefulWidget {
  @override
  _RegistrationLoginPageState createState() => _RegistrationLoginPageState();
}

class _RegistrationLoginPageState extends State<RegistrationLoginPage> {
  final _formKey = GlobalKey<FormState>(); 
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  bool _isRegistering = false; 

  @override
  void dispose() {
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isRegistering ? LocaleKeys.registration.tr() : LocaleKeys.login.tr()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              ToggleButtons(
                children: <Widget>[
                  Text(LocaleKeys.login_button.tr(),),
                  Text('Login'),
                ],
                isSelected: [_isRegistering, !_isRegistering],
                onPressed: (index) {
                  setState(() {
                    _isRegistering = index == 0;
                  });
                },
              ),
              
              if (_isRegistering)
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        
                        return null;
                      },
                    ),
                  ],
                ),
              // Форма входа
              if (!_isRegistering)
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Username / Email'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  
                  return null;
                },
              ),
              if (_isRegistering) 
                TextFormField(
                  decoration: InputDecoration(labelText: 'Repeat Password'),
                  obscureText: true,
                  controller: _repeatPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please repeat your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    
                    return null;
                  },
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    
                    Navigator.pushNamed(context, '/home');
                  }
                },
                child: Text(_isRegistering ? 'Register' : 'Login'), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
