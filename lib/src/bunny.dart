import 'package:flutter/material.dart';
import 'package:kapital_5/src/theme/palette.dart';
import 'dart:io' show Platform;

class Bunny extends StatelessWidget {
  const Bunny({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 0;
    double verticallPadding = 0;

    if (Platform.isIOS) {
      horizontalPadding = 112;
      verticallPadding = 50;
    } else if (Platform.isAndroid) {
      horizontalPadding = 160;
      verticallPadding = 40;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticallPadding,
          ),
          child: Text(':3'),
        ),
        title: Text('Bunny!'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Text(
            r'''                                                                                        
                                              ▒███████
            ██                                 ████     ██▒
          ▒█▒ ██▒                           ████   █████ ██▒
          ██    ███▓                      ███   ████████  ██
          ▓██   ▓  ███                   ███▓  ███████████ ██░
        ███    ▓▓  ███                ███  ▓███      ███ ██
        ▓█▒     ▓▓▓  ▒██            ███  ▒▒██     ░░  ██ ██
          ██  ░    ▓▓▓▓  ███         ░██  ▓░██     ░    ██ ██░
        ██  ░     ▒▒▒▓▓  ██       ███ ░▓░██    ▒░    ░█  ██ 
       ░██  ░      ░▒▒▓▓  ██     ░██  ▓▒░█           ██ ▒█▒
      ░██          ▓▒░▒▓  ██    ███ ▓▒░██    ░      ██ ██ 
       ██  ░       ▒▓▓▓▓▓  ██  ▓██  ▓░░█           ██  █▓
       ██  ░           ▒▓▓ ██████░ ▓▒░▒█          ▓██ ██░
       ███ ░       ░            █  ▓▒░█          ░██ ▒█░
        ▓██            ▒            ▒▒░█         ▓██  █░
        ▒██  ▒▒    ▓▓▓▓▓         ░▓▓▒░▓█    ░   ███  █▓
         ██  ▒   ▓▓▓▒▒       █▓  ▓▒▒▒░█       ████  █▒
          ██   ▓▓▒▒▒▒▒ ▒   ███  ▓▒░░░░▒▓    ░███  ██
          ███  ▒▓▒▒    ▓  █████ ▓▒░░░░░░▒▓ ▒▓██   ██
          ▓██  ▒▓▓▓▓▓▓▓  ███████▓░▒▓▓▒░░░░▒▓▓▓  ░██
          ███  ░       ▓▓█████████▒   ▒░░░░░▒▒ ███
        ░██  ░▓▓█  █   ██████████▒▓▓▓▓▓▓▓▒▒░▓  █▓
        ███  ▓▓▒░█       ██████████       ░▓░▒░ ██
      ▓███  ▓▓▒░░▓       █████████    ██    ▒░▓ ░█▒
        ▒██████     ░▓█████▓▓ ▓███████         █ ▓░░▓░ ██                              
      ░████████  ███▓▓   █████  ▓ ░███░     ██▓▒░░▒░▓  █▒                             
      ██  ▓█████▒ ░ ███░    ▒██████▓▓▒░░░░▒▓▓▓▓  █                             
          █████     ██████░ ███ █████    ░░░███▓▒       ██                            
        ███░  ███▒  █▓█████        ░███▒   ██▓   █▓▒   ░█
        █░ ██▒  ███    ▒█████████▓█████████   █████   ██░
          ▒▒   ███           ██████████████████▓     █░██
      ▓██▒      ░▒░                          ██░░
      ███       ░   ░████████▓░       ░▒▓▓▒▒   ██
          ██▒     ▓▓██████████████████████████████▓  ██
          ██▓     ▒▓░ █████████████████████████████▒   ██░
        ▒██ ░▓   ▒▓▒▓░ ░███████████████████████████▒    █▓
        ▓█  ▓▓    ▓░░ ██████████████████████████▓▒░▓  ▓  █▒
        ██ ▓▓██   ▓▒░░░░▒  █████████████████████▓░▒▓ ▒▓▒ ██
      ▒██ █████  ▓▓░░░░░▒▒█░ ████████████████░ ░░▓  ███  █▒
        ██ ░▓▒██▒  ▓▒░░░▒  ░▒▒█▓ ██████▓██▓██░▒░░▒▓  ███  █▒
        ▓█  ▓▒▓▒ ▒  ▓▒░░░▒░   ░░  ██  ▒░▓▒    ░░▒▓  ████  █▒
        ▒██  █░  ▒█  ▓▒░░▒▒▒    ▒    ░▒     ▒▒▒▒▓  ▒░███ ░█▒
        ▓██    ░     ▓▓▒▒░▒▒▒  █░   █   ▒▓▓▒▒▒▒   ▓ ▒█  ██
          ██       ▒    ▓▓▓░░░▒▒  █████ ░▓▒▒▓▓▓▓         ██
          ░██     ▓▓ ▓▓    ▓███▓         ░▓       ▓▓   ███
      ████        ██  ██ ██▒ ███ ██▓ ██ ██      ██░
        ░▓███████   ▒ ██▒    ███  █ ███    █████▒
                █████     ████░███     █████
                ░  ▒█████▓      
      ''',
            style: TextStyle(
              fontFamily: 'Menlo',
              fontSize: 8,

              color: Palette.basicBitchWhite,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
