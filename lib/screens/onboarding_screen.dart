import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenManifest = [
      "High-Fidelity ( Onboarding )",
      "High-Fidelity ( Home )",
      "High-Fidelity ( Detail Item )",
      "High-Fidelity ( Order )"
    ];
    // This is brittle. A better approach would be to get the current route.
    // However, for this specific onboarding screen, it's the first one.
    final currentScreenName = "High-Fidelity ( Onboarding )";

    void navigateToNextScreen() {
      // Per instructions, using GoRouterState to get the current route
      // String currentPath = GoRouterState.of(context).uri.toString();
      // For this example, we stick to the provided manifest logic
      final currentIndex = screenManifest.indexOf(currentScreenName);

      if (currentIndex != -1) {
        final nextIndex = (currentIndex + 1) % screenManifest.length;
        String nextScreenName = screenManifest[nextIndex];

        // The original logic sends to home after the last item.
        // Assuming 'home' is the intended destination after onboarding.
        if (currentIndex == 0) {
           final homeScreen = screenManifest.firstWhere((name) => name.toLowerCase().contains('home'), orElse: () => screenManifest[1]);
           nextScreenName = homeScreen;
        }

        final routeName = '/${nextScreenName.toLowerCase().replaceAll(' ', '_').replaceAll('-', '_').replaceAll('(', '').replaceAll(')', '').replaceAll('__', '_')}';
        context.go(routeName);
      }
    }
    
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/I216_106_417_719.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topCenter,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0x00050505).withOpacity(0),
                    const Color(0xFF050505).withOpacity(0.8),
                    const Color(0xFF050505),
                  ],
                  stops: const [0.0, 0.25, 0.6],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, MediaQuery.of(context).padding.bottom + 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Fall in Love with Coffee in Blissful Delight!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFA2A2A2),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: navigateToNextScreen,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC67C4E),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}