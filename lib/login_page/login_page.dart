import 'package:ecommerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool animateLoginButton = false;//due to this animation on login page, changed to stateful.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool viewPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text("Big Cart"),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0
      )),
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                      mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Image.asset('images/login_image.png', width: 200.0),const Text("Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 40.0,
                        )
                      ),
                Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text("Username",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                          hintStyle: TextStyle(
                              ),
                          hintText: "Enter the username",
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                            {
                              return "Username cannot be empty";
                            }
                            if(value.isNotEmpty && (value.contains('@') && (value.contains('.in') || value.contains('.com')))) {
                            return  null;
                            }
                            else
                            {
                            return "Please enter correct email ID";
                            }
                          //return null;
                        },
                        )),
                      //Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children:[
                        Padding(padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: viewPassword,
                              strutStyle: const StrutStyle(
                                height: 1.5,
                                  ),
                              decoration: const InputDecoration(
                                  label: Text("Password",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  hintText: "Enter the password",
                                  suffix: Icon(Icons.remove_red_eye)
                              ),
                              onTap: ()
                              {
                                setState(() {
                                  viewPassword = !viewPassword;
                                });
                              },
                              validator: (value){
                                if(value!.isEmpty)
                                  {
                                    return "Password cannot be empty";
                                  }
                                else if(value.length<8)
                                  {
                                    return "Password length cannot be less than 8 character";
                                  }
                                else
                                {
                                  return null;
                                }
                              },
                            )),
                      Padding(padding: const EdgeInsets.symmetric(vertical:20.0, horizontal: 0.0),
                      child: /*GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, MyRoutes.homepage);
                        }*/
                      Material(
                        color: Colors.blue,
                        borderRadius: animateLoginButton? const BorderRadius.all(Radius.circular(70)) : const BorderRadius.all(Radius.circular(15.0)),
                        child: InkWell(
                            onTap: () async {
                              try {
                                if (_formKey.currentState != null &&
                                    _formKey.currentState!.validate()) {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                  if (credential != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Welcome!"),
                                          backgroundColor: Colors.green,
                                        ));
                                      setState(() {
                                      animateLoginButton = true;
                                      });
                                      await Future.delayed(const Duration(milliseconds: 1400));
                                      Navigator.pushReplacementNamed(context, MyRoutes.homepage);
                                      setState(() {
                                      animateLoginButton = false;
                                      });
                                  }
                                }
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Username does not exist, please signup"),
                                    backgroundColor: Colors.redAccent,
                                  ));
                                } else if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Password wrong, try again"),
                                    backgroundColor: Colors.redAccent,
                                  ));
                                }
                              }
                              },/*async{
                              setState(() {
                                animateLoginButton = true;
                              });
                            await Future.delayed(const Duration(milliseconds: 1400));
                            await Navigator.pushNamed(context, MyRoutes.homepage);
                            setState(() {
                              animateLoginButton = false;
                            });
                        },*/
                                  child: AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                  width: animateLoginButton? 50 : 150,
                                  height: 50,
                                  /*decoration: BoxDecoration(//decoration on here will overlap material decoration, instead describe decoration under material to have repel effect.
                                    color: Colors.blue,
                                    borderRadius: animateLoginButton? const BorderRadius.all(Radius.circular(70)) : const BorderRadius.all(Radius.circular(15.0))
                                  ),*/
                                  /*child: Container(
                                width: 150,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadiusDirectional.all(Radius.circular(15.0)),*/
                                  child: Center(child: animateLoginButton? const Icon(Icons.done_outline_rounded, color: Colors.white,) : const Text("Login",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  )
                                  )
                              )
                              ),
                            )),
                      GestureDetector(
                          child: const Text("Don't have a account, Sign Up"),
                        onTap: ()
                          {
                            Navigator.pushNamed(context, MyRoutes.signuppage);
                          }
                      ),
                ],
          ),
                    )
                )

            ));
        }
      }
