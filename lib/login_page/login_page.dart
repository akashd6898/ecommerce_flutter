import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool animateLoginButton = false;//due to this animation on login page, extends is changed to stateful.
  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context)async
  {
    if(_formKey.currentState!.validate())
    {
        setState(() {
          animateLoginButton = true;
        });
        await Future.delayed(const Duration(milliseconds: 1400));
        await Navigator.pushNamed(context, MyRoutes.homepage);
        setState(() {
          animateLoginButton = false;
        });
    }
  }
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
            mainAxisAlignment: MainAxisAlignment.start,
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
                  validator: (value) {
                    if(value!.isEmpty)
                      {
                        return "Username cannot be empty";
                      }
                    return null;
                  },
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
            )
          ),
                //Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children:[
                  Padding(padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                      child: TextFormField(
                  obscureText: true,
                  strutStyle: const StrutStyle(
                    height: 1.5,
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                      {
                        return "Password cannot be empty";
                      }
                    else if(value.length<8)
                      {
                        return "Password length cannot be less than 8 character";
                      }
                    return null;

                  },
                  decoration: const InputDecoration(
                  label: Text("Password",
                  style: TextStyle(
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold,
                  )),
                    hintText: "Enter the password",
                  ),
                )),
                /*Padding(padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 0.0),
                child: ElevatedButton(onPressed: (){
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()));
                  Navigator.pushNamed(context, MyRoutes.homepage);
                },
                  child: const Text("Login"),
                )
                  ),*/

                Padding(padding: const EdgeInsets.symmetric(vertical:20.0, horizontal: 0.0),
                child: /*GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.homepage);
                  }*/
                Material(
                  color: Colors.blue,
                  borderRadius: animateLoginButton? const BorderRadius.all(Radius.circular(70)) : const BorderRadius.all(Radius.circular(15.0)),
                  child: InkWell(
                      onTap: () => moveToHome(context),/*async{
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
                ))
          ]
    ),
              ))));
  }
}
