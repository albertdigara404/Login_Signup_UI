import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:login_signup_ui/colors/colors.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {

bool isMale = true;
bool isSignupScreen = true;
bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bgp.png"),
                  fit: BoxFit.fill,
                  ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: const Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome to",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow[700],
                        ),
                        children: [
                          TextSpan(
                        text: isSignupScreen ? " BontyEnt" : "Back",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[700],
                        ),),
                        ]
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(isSignupScreen ? "SignUp to Continue" : "SignIn to Continue",
                    style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          buildBottomCircleContainer(true),

          Positioned(
            top: isSignupScreen ? 200 : 230,
            child: 
          AnimatedContainer(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            height: isSignupScreen? 380 : 250,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width-40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
              
                          child: Column(
                            children:  [
                              Text("Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: !isSignupScreen? Palette.activeColor :Palette.textColor1,
                                ),
                                ),
                                if(!isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
              
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
              
                          child: Column(
                            children:  [
                              Text("SignUp",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: isSignupScreen? Palette.activeColor : Palette.textColor1,
                                ),
                                ),
                                if(isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        )
              
                      ],
                    ),
                    if(isSignupScreen)
                    buildSignUp(),
                    if(!isSignupScreen)
                    buildLogin(),
                    
                  ],
                ),
              ),
            ),
          ),

          buildBottomCircleContainer(false),

          Positioned(
            top: MediaQuery.of(context).size.height-100,
            left: 0,
            right: 0,
            child: Column(
            children: [
              Text(isSignupScreen ? "Or SignUp with" : "Or SignIn with",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTextButton(MaterialCommunityIcons.facebook, "FaceBook", Palette.facebookColor),
                    buildTextButton(MaterialCommunityIcons.google, "Google", Palette.googleColor),
                  ],
                ),
              )
            ],
          ),
          ),

        ],
      ),
    );
  }

  Container buildLogin() {
    return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      buildTextField(Icons.mail_outline, "abcd@gmail.com", false, true),
                      buildTextField(MaterialCommunityIcons.lock, "*******", true, false),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                            value: isRememberMe, 
                            activeColor: Palette.textColor2,
                            onChanged: ((value) {
                            setState(() {
                              isRememberMe = !isRememberMe;
                            });
                          })),
                          const Text("Remember Me", style: TextStyle(fontSize: 12, color: Palette.textColor1),),
                        ],
                      ),
                      TextButton(onPressed: (){}, child: Text("Forgot Password", style: TextStyle(color: Palette.textColor1, fontSize: 12),),),
                            ],
                          )
                          
                    ],),
                );
  }

  Container buildSignUp() {
    return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      buildTextField(MaterialCommunityIcons.account_outline, "User Name", false, false),
                      buildTextField(MaterialCommunityIcons.email_outline, "Email", false, true),
                      buildTextField(MaterialCommunityIcons.lock_outline, "Password", true, false),

                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMale = true;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: isMale ? Palette.textColor2 : Colors.transparent,
                                      border: Border.all(
                                        width: 1,
                                        color: isMale ?Colors.transparent : Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Icon(MaterialCommunityIcons.account_outline,
                                    color: isMale ? Colors.white : Palette.iconColor,
                                    ),
                                  ),
                                  const Text("Male",style: TextStyle(color: Palette.textColor1),),
                            
                            
                                ],
                              ),
                            ),

                            const SizedBox(width: 30,),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMale = false;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: isMale ? Colors.transparent : Palette.textColor2,
                                      border: Border.all(
                                        width: 1,
                                        color: isMale ? Palette.textColor1 : Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Icon(MaterialCommunityIcons.account_outline,
                                    color: isMale ? Palette.iconColor : Colors.white,
                                    ),
                                  ),
                                  const Text("FeMale",style: TextStyle(color: Palette.textColor1),),
                            
                                  
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                      Container(
                        width: 200,
                        margin: const EdgeInsets.only(top: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: "By pressing 'Submit' you agree to our ",
                            style: TextStyle(color: Palette.textColor2,),
                            children: [
                              TextSpan(
                                //recognizer: ,
                                text: "terms and conditions",
                                style: TextStyle(color: Colors.orange),
                              )
                            ]
                          ),
                          ),
                      ),

                    ],
                  ),
                );
  }

  TextButton buildTextButton(IconData icon, String title, Color backgroundColor) {
    return TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: backgroundColor,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    minimumSize: const Size(145, 40),
                  ),
                  onPressed: (){}, 
                  child: Row(
                    children: [
                      Icon(icon),
                      const SizedBox(width: 5,),
                      Text(title),
                    ],
                  ),
                  );
  }

  Widget buildBottomCircleContainer( bool showShadow) {
    return AnimatedPositioned(
          duration: Duration(milliseconds: 700),
          curve: Curves.bounceInOut,
          top: isSignupScreen ? 535 : 430,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 90,
              width: 90,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if(showShadow)
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1.5,
                      blurRadius: 10,
                      offset: const Offset(0,1),
                    ),
                  ],
              ),
              child: !showShadow ? Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.redAccent ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    if(showShadow)
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0,1),
                    )
                  ]
                ),
                child: const Icon(Icons.arrow_forward, color: Colors.white,),
                ) : const Center(), 
            ),
          ),
        );
  }

  Widget buildTextField(IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,),
      child: TextField(
                          obscureText: isPassword,
                          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(icon,
                            color: Palette.iconColor,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Palette.textColor1),
                              ),
                              focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          hintText: hintText,
                          hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1,
                          ),
                          ),
                        ),
    );
  }
}