import 'package:flutter/material.dart';
//نفس الكلام ال فى Login هنا
class Signup extends StatelessWidget {
  Signup({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // الخلفية
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontFamily: "myfont",
                            shadows: const [
                              Shadow(blurRadius: 8, color: Colors.black87, offset: Offset(2, 2)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),

                        // Username
                        _buildTextField(
                          icon: Icons.person,
                          hint: "Username :",
                          controller: usernameController,
                          validatorMsg: "Username is required",
                        ),
                        const SizedBox(height: 17),

                        // Email
                        _buildTextField(
                          icon: Icons.email,
                          hint: "Your Email :",
                          controller: emailController,
                          validatorMsg: "Email is required",
                        ),
                        const SizedBox(height: 17),

                        // Password
                        _buildTextField(
                          icon: Icons.lock,
                          hint: "Password :",
                          controller: passwordController,
                          validatorMsg: "Password is required",
                          obscure: true,
                          suffixIcon: Icons.visibility,
                        ),
                        const SizedBox(height: 17),

                        // Address
                        _buildTextField(
                          icon: Icons.home,
                          hint: "Address :",
                          controller: addressController,
                          validatorMsg: "Address is required",
                        ),
                        const SizedBox(height: 25),
                        //phone number
                        _buildTextField(
                          icon: Icons.phone,
                          hint: "Phone Number :",
                          controller: phonenumberController,
                          validatorMsg: "Phone Number is required",
                        ),
                        const SizedBox(height: 32),

                        // Signup Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            padding: const EdgeInsets.symmetric(horizontal: 91, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27),
                            ),
                          ),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // عندك حساب؟
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? ",style: TextStyle(color: Colors.white70, fontSize: 16),),
                            GestureDetector(// بتخلي النص اللي جوه قابل للضغط كأنه زرار
                              onTap: () {Navigator.pushNamed(context, "/login");},
                              child: const Text("Login",style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 16,),),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
    required String validatorMsg,
    bool obscure = false,
    IconData? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange[100],
        borderRadius: BorderRadius.circular(66),
      ),
      width: 266,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMsg;
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.deepOrange[800]),
          hintText: hint,
          border: InputBorder.none,
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.deepOrange[900])
              : null,
        ),
      ),
    );
  }
}
