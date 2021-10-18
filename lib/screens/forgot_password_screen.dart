import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _forgotPasswordKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 40.0),
          child: Icon(Icons.arrow_back_ios,size: 30,),
        ),
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 70.0),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Column(
                    children: [
                      const Image(image: AssetImage('assets/images/logo.png')),
                      const SizedBox(height: 50.0,),
                      const Text('Forgot Password?',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w400),),
                      const SizedBox(height: 50.0,),
                      const Text('Enter Email for Verification Code',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300),),
                      const SizedBox(height: 20.0,),
                      Form(
                        key: _forgotPasswordKey,
                        child: TextFormField(
                          validator: emailValidator,
                          controller: emailTextEditingController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person_outline),
                            labelText: 'Email',
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey,),
                            ),
                            errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent),borderRadius: BorderRadius.circular(30)),
                            focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0,),
                  GestureDetector(
                    onTap: (){
                      if(_forgotPasswordKey.currentState!.validate()){

                      }
                    },
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/resetPassword');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration:  BoxDecoration(
                          color: const Color(0xFFfd941e),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: Text('SEND CODE',style: GoogleFonts.recursive(color: const Color(0xFFfff6ed),fontSize: 18,fontWeight: FontWeight.w500))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 60.0),
          child: GestureDetector(onTap: (){
                    Navigator.pop(context);
                 },
              child: const Icon(Icons.arrow_back_ios,size: 30,)),
        )
      ],
    );
  }
}
