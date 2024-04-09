import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'menuinferior.dart';

void main() {
  runApp(const EducacaoFinanceiraScreen());
}

class EducacaoFinanceiraScreen extends StatelessWidget {
  const EducacaoFinanceiraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EducacaoFinanceira(),
    );
  }
}

class EducacaoFinanceira extends StatelessWidget {
  const EducacaoFinanceira({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: const Text(
                    'Entenda como funciona:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'SELIC, PREFIXADO, IPCA+',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Center(
                    child: FlutterYoutubeView(
                      onViewCreated: _onYoutubeCreated,
                      params: const YoutubeParam(
                        videoId: 'OOEssu7j5UQ',
                        showUI: true,
                        autoPlay: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(), // Adicionando o menu inferior
    );
  }

  void _onYoutubeCreated(FlutterYoutubeViewController controller) {
    // You can use this controller to control the YouTube video playback.
    controller.pause(); // For example, pausing the video on creation.
  }
}
