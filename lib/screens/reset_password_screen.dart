import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  final GlobalKey<FormState> _resetPasswordKey = GlobalKey<FormState>();
  TextEditingController pwdTextEditingController = TextEditingController();
  TextEditingController confirmPwdTextEditingController = TextEditingController();
  String? pwdValidator(String? password) {
    if(pwdTextEditingController.text != confirmPwdTextEditingController.text){
      return "Password don't match";
    }
    else if (password!.isEmpty) {
      return 'Please enter password';
    } else if (password.length < 6) {
      return 'Password length must be at least 6 characters';
    }
    else {
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                      const Text('Reset Password',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w400),),
                      const SizedBox(height: 50.0,),
                      Form(
                        key: _resetPasswordKey,
                        child: Column(
                          children: [
                            TextFormField(
                              obscureText: obscurePassword?true:false,
                              controller: pwdTextEditingController,
                              validator: pwdValidator,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                  icon: Icon(
                                    obscurePassword?Icons.visibility_off:Icons.visibility
                                  )
                                ),
                                prefixIcon: const Icon(Icons.lock_outline),
                                labelText: 'New Password',
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
                              obscureText: obscureConfirmPassword?true:false,
                              controller: confirmPwdTextEditingController,
                              validator: pwdValidator,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      obscureConfirmPassword = !obscureConfirmPassword;
                                    });
                                  },
                                  icon: Icon(
                                    obscureConfirmPassword?Icons.visibility_off:Icons.visibility
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.lock_outline),
                                labelText: 'Confirm New Password',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueGrey,),
                                ),
                                errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent),borderRadius: BorderRadius.circular(30)),
                                focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 50.0,),
                  GestureDetector(
                    onTap: (){
                      if(_resetPasswordKey.currentState!.validate()){

                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: const Color(0xFFfd941e),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text('CONTINUE',style: GoogleFonts.recursive(color: const Color(0xFFfff6ed),fontSize: 18,fontWeight: FontWeight.w500),)),
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
          },child: const Icon(Icons.arrow_back_ios,size: 30,)),
        )
      ],
    );
  }
}
