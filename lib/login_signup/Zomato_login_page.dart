import 'package:flutter/material.dart';
import 'package:zomatoo/userDeatils/personal_details.dart';

class ZomatoLoginPage extends StatefulWidget {
  const ZomatoLoginPage({super.key});

  @override
  State<ZomatoLoginPage> createState() => _ZomatoLoginPageState();
}

class _ZomatoLoginPageState extends State<ZomatoLoginPage> {
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1️⃣ Top Image (1/3 Screen)
            SizedBox(
              height: height * 0.36,
              width: double.infinity,
              child: Image.asset(
                'assets/images/zomatologin.jpg',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 24),

            /// 2️⃣ Heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "India's #1 Food Delivery and Dining App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 25),

            /// 3️⃣ Login Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Log in or sign up"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 4️⃣ Phone Input Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  /// Country Code Box
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Text("🇮🇳 +91", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Phone Input
                  Expanded(
                    child: Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: const TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter phone number",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 5️⃣ Remember Me
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    activeColor: Colors.red,
                    onChanged: (val) {
                      setState(() => rememberMe = val!);
                    },
                  ),
                  const Expanded(
                    child: Text("Remember my login for faster sign-in"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            /// 6️⃣ Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPersonalDetailPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(252, 252, 253, 0.992),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 7️⃣ OR Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
            ),

            const SizedBox(height: 26),

            /// 8️⃣ Social Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon(Icons.g_mobiledata),
                const SizedBox(width: 20),
                _socialIcon(Icons.message),
              ],
            ),

            const SizedBox(height: 26),

            /// 9️⃣ Terms Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                  children: [
                    TextSpan(text: "By continuing, you agree to our\n"),
                    TextSpan(
                      text: "Terms of Service ",
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(text: "Privacy Policy "),
                    TextSpan(text: "Content Policy"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon, size: 26),
    );
  }
}
