import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController pwdTextEditingController = TextEditingController();
  TextEditingController mobileTextEditingController = TextEditingController();
  bool isObscure = true;
  String? emailValidator(String? email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern.toString());
    if (!regExp.hasMatch(email!)) {
      return 'Email format is invalid';
    }
    else{
      return null;
    }
  }
  String? usernameValidator(String? username) {
    if (username!.isEmpty) {
      return 'Please enter username';
    } else if (username.length < 3) {
      return 'username length must be at least 3 characters';
    } else {
      return null;
    }
  }
  String? pwdValidator(String? password) {
    if (password!.isEmpty) {
      return 'Please enter password';
    } else if (password.length < 6) {
      return 'Password length must be at least 6 characters';
    } else {
      return null;
    }
  }
  String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number(11 digit)';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                const Image(image: AssetImage('assets/images/logo.png')),
                const SizedBox(height: 20.0,),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: usernameValidator,
                        controller: usernameTextEditingController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          labelText: 'Username',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey,),
                          ),
                          errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent),borderRadius: BorderRadius.circular(30)),
                          focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        controller: emailTextEditingController,
                        validator: emailValidator,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey,),
                          ),
                          errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent),borderRadius: BorderRadius.circular(30)),
                          focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                          prefixIcon: const Icon(Icons.person_outline),
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        controller: pwdTextEditingController,
                        validator: pwdValidator,
                        obscureText: isObscure?true:false,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey,),
                          ),
                          errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent),borderRadius: BorderRadius.circular(30)),
                          focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: Icon(
                                isObscure?Icons.visibility_off:Icons.visibility
                            )
                          ),
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        controller: mobileTextEditingController,
                        validator: validateMobile,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey,),
                          ),
                          errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent),borderRadius: BorderRadius.circular(30)),
                          focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                          prefixIcon: const Icon(Icons.lock_outline),
                          labelText: 'Phone No',
                          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30.0,),
                GestureDetector(
                  onTap: (){
                    if(_registerFormKey.currentState!.validate()){

                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration:  BoxDecoration(
                      color: const Color(0xFFfd941e),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text('SIGNUP',style: GoogleFonts.recursive(color: const Color(0xFFfff6ed),fontSize: 18,fontWeight: FontWeight.w500),)),
                  ),
                ),
                const SizedBox(height: 100,),
                Row(
                  children: [
                    const Text("Already Have an account? ",style: TextStyle(fontSize: 15),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(' Log In',style: TextStyle(fontSize: 15,color: Colors.blueAccent),
                    ),
                    )
                  ],
                ),
                const SizedBox(height: 15.0,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    const Text('OR'),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0,),
                const Text('Sign Up with social networks',style: TextStyle(fontSize: 15),),
                const SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  const [
                    Icon(FontAwesomeIcons.facebook,color: Color(0xFF3b5999),size: 30,),
                    SizedBox(width: 30.0,),
                    Icon(FontAwesomeIcons.googlePlusG,color: Color(0xFFdd4b39),size: 30,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
