import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_svg/svg.dart';

final String appName = 'Demo WAVE';
final String repoURL = 'https://github.com/glorylab/wave';


class WaveDemoHomePage extends StatefulWidget {
  WaveDemoHomePage({Key? key}) : super(key: key);


  @override
  _WaveDemoHomePageState createState() => _WaveDemoHomePageState();
}

class _WaveDemoHomePageState extends State<WaveDemoHomePage> {
  _buildCard({
    required Config config,
    Color? backgroundColor,
    DecorationImage? backgroundImage,
    double ?height,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      child: WaveWidget(
        config: config,
        backgroundColor: Colors.transparent,
        backgroundImage: backgroundImage,
        size: Size(double.infinity, double.infinity),
        waveAmplitude:30,
        waveFrequency: 1,
        duration: 5000,
      ),
    );
  }

  //double marginHorizontal = 16.0;

  void _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    // marginHorizontal = 16.0 +
    //     (MediaQuery.of(context).size.width > 512
    //         ? (MediaQuery.of(context).size.width - 512) / 2
    //         : 0);
    return Scaffold(
      body:
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     _buildCard(
      //         config: CustomConfig(
      //           colors: [
      //             Color(0xFF64b5f6),
      //             Color(0xFF90CAF9).withOpacity(0.80),
      //             Color(0xFF1976d2).withOpacity(0.20),
      //             Color(0xFF0D47A1),
      //
      //           ],
      //           durations: [5000, 21000, 18000, 32000
      //           ],
      //           heightPercentages: [0.15,
      //              0.05,
      //             0.20, 0.40
      //           ],
      //         ),
      //         height: MediaQuery.of(context).size.height*0.40,
      //         backgroundColor: Colors.transparent),
      //   ],
      // ),
        Stack(
          children: [
            // Image.asset(
            //   'images/splash_bg.png',
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/spash_bg.png'),
                  fit: BoxFit.fill
                ),
              ),
              // constraints: BoxConstraints.expand(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.15,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 100 * 90,
                  margin:EdgeInsets.only(left:  MediaQuery.of(context).size.width / 100 * 5 ),
                  child:Column(
                    children: [
                      Text("National Scholarship Portal",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Color(0xff0A58B4)
                      ),),
                      Text("Ministry of Electronics & Information Technology,",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xff3E3E3E)
                        ),),
                      Text("Government of India",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xff3E3E3E)
                        ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.10,
                      ),
                      Text("Pre & Post Metric",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                        ),),
                      Text("SC Scholarship Scheme",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.01,
                      ),
                      Text("Department Of Social Justice & Empowerment",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),),
                      Text("Ministry of Social Justice & Empowerment",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xff3E3E3E)
                        ),),
                      Text("Government of India",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xff3E3E3E)
                        ),),

                    ],
                  ),
                  // constraints: BoxConstraints.expand(),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildCard(
                    config: CustomConfig(
                      colors: [
                        Color(0xFF64b5f6),
                        Color(0xFF90CAF9).withOpacity(0.80),
                        Color(0xFF1976d2).withOpacity(0.20),
                        Color(0xFF0D47A1),

                      ],
                      durations: [5000, 10000, 18000, 32000
                      ],
                      heightPercentages: [0.15,
                        0.05,
                        0.20, 0.40
                      ],
                    ),
                    height: MediaQuery.of(context).size.height*0.40,
                    backgroundColor: Colors.transparent),
              ],
            ),
            Positioned(
              bottom: 50,
              left: MediaQuery.of(context).size.width / 4,
              child: SvgPicture.asset(
                'images/splash_digitalindia.svg',
                height: 56,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
          ],
        )
    );
  }
}