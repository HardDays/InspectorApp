import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';

class SpeechToTextButton extends StatefulWidget {
  final TextEditingController textEditingController;

  const SpeechToTextButton(this.textEditingController);

  @override
  _SpeechToTextButtonState createState() => _SpeechToTextButtonState();
}

class _SpeechToTextButtonState extends State<SpeechToTextButton> {
  final SpeechToText _speech = SpeechToText();
  SpeechToTextProvider _speechProvider;
  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _speechProvider = SpeechToTextProvider(_speech);
    _streamSubscription = _speechProvider.stream.listen((event) {
      widget.textEditingController.text = event.recognitionResult?.recognizedWords;
    });

    initSpeechState();
  }

  Future<void> initSpeechState() async {
    await _speechProvider.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SpeechToTextProvider>.value(value: _speechProvider, child: SpeechProviderWidget());
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}

class SpeechProviderWidget extends StatefulWidget {
  @override
  _SpeechProviderWidgetState createState() => _SpeechProviderWidgetState();
}

class _SpeechProviderWidgetState extends State<SpeechProviderWidget> {
  String _currentLocaleId = '';

  @override
  Widget build(BuildContext context) {
    var speechProvider = Provider.of<SpeechToTextProvider>(context);
    _setCurrentLocale(speechProvider);
    return IconButton(
      icon: Icon(
        Icons.mic,
        color: speechProvider.isListening ? ProjectColors.mediumBlue : ProjectColors.blue,
      ),
      onPressed: () {
        if (speechProvider.isListening) {
          speechProvider.stop();
        }
        !speechProvider.isAvailable || speechProvider.isListening
            ? null
            : speechProvider.listen(
                partialResults: true,
                localeId: _currentLocaleId,
                soundLevel: true,
              );
      },
    );
  }

  void _setCurrentLocale(SpeechToTextProvider speechProvider) {
    if (speechProvider.isAvailable && _currentLocaleId.isEmpty) {
      _currentLocaleId = speechProvider.systemLocale?.localeId ?? '';
    }
  }
}
