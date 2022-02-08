import 'package:flutter/material.dart';
import 'package:thebook_app/global/user.dart';
import 'package:thebook_app/service/repository.dart';
import 'package:thebook_app/views/home.dart';
import 'package:thebook_app/views/register.dart';
import 'package:thebook_app/views/tab_navigator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool passwordVisible = false;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text("邮箱")),
                controller: _email,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: const Text("密码"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                obscureText: !passwordVisible,
                controller: _password,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Repository.login(
                            email: _email.text, password: _password.text)
                        .then((response) {
                      if (response.code == '1') {
                        User.id = response.data.id;
                        User.username = response.data.name;
                        User.email = response.data.email;
                        User.sex = response.data.sex;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TabNavigator(),
                          ),
                        );
                      } else {
                        setState(() {
                          error = true;
                        });
                      }
                    });
                  },
                  child: const Text("登录"),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: const Text("没有账号? 立即注册")),
              Text(
                error ? '邮箱或账号错误' : '',
                style: const TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
