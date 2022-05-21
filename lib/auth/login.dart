import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //To Manage login Button go to ScaffoldMessenger

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _showORnot = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                child: Image.asset('assets/images/habManagerIcon.png'),
                radius: 30,
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'PoppinsBold',
                  color: Color(0xff3f414e),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(children: const [
                SizedBox(width: 25),
                Text(
                  'login to continue',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'RobotoBold',
                    color: Color(0xff030303),
                    letterSpacing: 0.12,
                  ),
                ),
              ]),
              const SizedBox(
                height: 52,
              ),
              SizedBox(
                width: 374,
                height: 63,
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your name'
                      : null,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => _emailController.clear(),
                        icon: const Icon(
                          Icons.clear,
                        ),
                      ),
                      label: Row(children: const [
                        Icon(Icons.mail_rounded),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Email address',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'PoppinsLight',
                            color: Color(0xffa1a4b2),
                            letterSpacing: 0.12,
                          ),
                        ),
                      ]),
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 238, 239, 247)),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              SizedBox(
                width: 374,
                height: 63,
                child: TextFormField(
                  controller: _passController,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your password'
                      : null,
                  obscureText: _showORnot,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => setState(() {
                          _showORnot = !_showORnot;
                        }),
                        icon: Icon(
                          _showORnot ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      label: Row(children: const [
                        Icon(Icons.lock),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'PoppinsLight',
                            color: Color(0xffa1a4b2),
                            letterSpacing: 0.12,
                          ),
                        ),
                        SizedBox(
                          width: 176,
                        ),
                      ]),
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 238, 239, 247)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RawMaterialButton(
                    onPressed: () => _formKey.currentState.validate()
                        ? Navigator.of(context).pushReplacementNamed('/')
                        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Please fill all',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'PoppinsBold',
                                      letterSpacing: 1.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          )),
                    elevation: 2.0,
                    fillColor: const Color(0xff3eb489),
                    child: const Text(
                      'LOG IN   >',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'RobotoBold',
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    constraints: const BoxConstraints(minWidth: 200),
                    shape: const StadiumBorder(),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Don\'t have any account?',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'RobotoBold',
                    letterSpacing: 0.12,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/register'),
                  //elevation: 2.0,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'RobotoBold',
                      letterSpacing: 0.12,
                      color: Color(0xff3eb489),
                    ),
                  ),
                  //shape: const StadiumBorder(),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}


/*
ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          )
*/


/*
ElevatedButton(
                onPressed: () => _formKey.currentState!.validate()
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        padding: EdgeInsets.fromLTRB(136, 10, 136, 10),
                        content: Text(
                          'Please fill all',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'PoppinsBold',
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      )),
                child: const Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'PoppinsBold',
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(300, 63)),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff3eb489),
                    )),
              ),
*/