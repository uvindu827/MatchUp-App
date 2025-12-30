import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:notehere/layout/main_layout.dart';
import 'package:notehere/constants/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  // Dots loader - updated for proper bouncing
  late final AnimationController _dotsController;
  late final List<Animation<double>> _dotOffsetAnims;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();

    // Dots animation - smooth bouncing up and down
    _dotsController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();

    // Create sequential bouncing animations for each dot (one by one)
    _dotOffsetAnims = List.generate(3, (i) {
      final double staggerDelay =
          i * 0.33; // stagger: 0, 0.33, 0.66 (each dot gets 1/3 of the cycle)
      final double startInterval = staggerDelay;
      final double endInterval =
          startInterval + 0.33; // each dot takes 1/3 of the cycle

      return TweenSequence<double>([
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0.0,
            end: -9.0,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: -9.0,
            end: 0.0,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 50,
        ),
      ]).animate(
        CurvedAnimation(
          parent: _dotsController,
          curve: Interval(startInterval, endInterval),
        ),
      );
    });

    // Navigate after delay (replace with real auth)
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      final bool isLoggedIn = false; // TODO: real auth check

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) =>
              isLoggedIn ? const MainLayout() : const LoginPage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 18,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            AppConstants.LogoPath,
                            width: width * 0.32,
                            height: width * 0.32,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // App name
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xff404b5c), Color(0xff2d3748)],
                          ).createShader(bounds),
                          blendMode: BlendMode.srcIn,
                          child: Text(
                            AppConstants.appName,
                            style: const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),

                        // Updated bouncing dots loader
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            final color = index == 1
                                ? AppConstants.secondary
                                : const Color(0xff404b5c).withOpacity(0.6);
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              child: AnimatedBuilder(
                                animation: _dotsController,
                                builder: (_, __) {
                                  return Transform.translate(
                                    offset: Offset(
                                      0,
                                      _dotOffsetAnims[index].value,
                                    ),
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: color,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Tagline at bottom - already well-aligned, minor tweak
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 28.0,
                  ), // increased a bit for better spacing
                  child: Text(
                    AppConstants.poweredBy,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppConstants.secondary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
