import 'package:platform_screener/platform_screener.dart';
import 'package:breathing_card/Card_Design.dart';
import 'package:flutter/material.dart';

class BreathingCards extends StatefulWidget {
  const BreathingCards({super.key});

  @override
  State<BreathingCards> createState() => _BreathingCardsState();
}

class _BreathingCardsState extends State<BreathingCards>
    with TickerProviderStateMixin {
  late Animation<double> ScaleSize1, ScaleSize2;
  late AnimationController controller1, controller2;
  late CurvedAnimation curvedAnimation1, curvedAnimation2;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      duration: Duration(milliseconds: 1231),
      vsync: this,
    )..repeat(reverse: true);
    controller2 = AnimationController(
      duration: Duration(milliseconds: 1031),
      vsync: this,
    )..repeat(reverse: true);

    curvedAnimation1 = CurvedAnimation(
      parent: controller1,
      curve: Curves.ease,
    );
    curvedAnimation2 = CurvedAnimation(
      parent: controller2,
      curve: Curves.ease,
    );

    ScaleSize1 = Tween<double>(
      begin: 1.01,
      end: 1.14,
    ).animate(curvedAnimation1);
    ScaleSize2 = Tween<double>(
      begin: 1.01,
      end: 1.14,
    ).animate(curvedAnimation2);
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    final width = ScreenSize.width;
    final height = ScreenSize.height;
    final fontSize = [17.0, 10.2];
    final iconSize = 23.0;
    final CardWitdh = (width / 100) * 40;
    final CardHieght = (height / 100) * 25.7;
    final position = width * 0.06;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 7,
                  bottom: 30,
                  left: 17,
                  right: 17,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Breathing Cards",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [Colors.lightBlue.shade200, Color(0xFF0014DD)],
                      ).createShader(Rect.fromLTWH(0, 0, 350, 100)),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: (height / 100) * 31,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: controller1,
                      builder: (_, __) {
                        return Positioned(
                          left: position,
                          child: Transform.scale(
                            scale: ScaleSize1.value,
                            child: CardDesign(
                              Context: context,
                              Width: CardWitdh,
                              Height: CardHieght,
                              Gradients: [Color(0xF400C6FF), Color(0xE85064C8)],
                              ShadeColor: Color(0x7C5064C8),
                              Texts: [
                                "Mindful\nBreathing",
                                "Find your center",
                                "Breathe in peace, Breathe\nout stress",
                              ],
                              FontSize: fontSize,
                              IconName: Icons.self_improvement,
                              IconSize: iconSize,
                              //IconSize: iconScale.value,
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: controller2,
                      builder: (_, __) {
                        return Positioned(
                          right: position,
                          child: Transform.scale(
                            scale: ScaleSize2.value,
                            child: CardDesign(
                              Context: context,
                              Width: CardWitdh,
                              Height: CardHieght,
                              Gradients: [Color(0xFFFF5959), Color(0xC8FF8C42)],
                              ShadeColor: Color(0x80FF8C42),
                              Texts: [
                                "\nInner Balance",
                                "Harmony within",
                                "Balance is not something\nyou find, it's something...",
                              ],
                              FontSize: fontSize,
                              IconName: Icons.balance,
                              IconSize: iconSize,
                              //IconSize: iconScale2.value,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width,
                height: (height / 100) * 31,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: controller1,
                      builder: (_, __) {
                        return Positioned(
                          left: position,
                          child: Transform.scale(
                            scale: ScaleSize1.value,
                            child: CardDesign(
                              Context: context,
                              Width: CardWitdh,
                              Height: CardHieght,
                              Gradients: [Color(0xE500D2A8), Color(0xF417917C)],
                              ShadeColor: Color(0x8317917C),
                              Texts: [
                                "\nDigital Zen",
                                "Modern meditation",
                                "In stillness, find your\nstrength",
                              ],
                              FontSize: fontSize,
                              IconName: Icons.spa,
                              IconSize: iconSize,
                              // IconSize: iconScale.value,
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: controller2,
                      builder: (_, __) {
                        return Positioned(
                          right: position,
                          child: Transform.scale(
                            scale: ScaleSize2.value,
                            child: CardDesign(
                              Context: context,
                              Width: CardWitdh,
                              Height: CardHieght,
                              Gradients: [Color(0xB21146CB), Color(0xB36A11CB)],
                              ShadeColor: Color(0x776A11CB),
                              Texts: [
                                "\nCosmic Flow",
                                "Universal rhythm",
                                "You are the universe\nexperiencing itself",
                              ],
                              FontSize: fontSize,
                              IconName: Icons.blur_circular,
                              IconSize: iconSize,
                              //IconSize: iconScale2.value,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
