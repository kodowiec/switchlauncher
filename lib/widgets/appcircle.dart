import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_animations/simple_animations.dart';
import '../theme.dart';

class AppCircle extends StatefulWidget {
  final String text;
  final int index;
  final double screenscale;
  const AppCircle(
      {Key? key,
      required this.text,
      required this.screenscale,
      this.index = -1})
      : super(key: key);

  @override
  _AppCircleState createState() => _AppCircleState();
}

class _AppCircleState extends State<AppCircle> with TickerProviderStateMixin {
  late FocusNode _node;
  // ignore: unused_field
  late FocusAttachment _attachment;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
    _attachment = _node.attach(context, onKey: _handleKeyPress);
  }

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      if (_node.hasFocus) {
        _focused = _node.hasFocus;
      } else {
        _focused = _node.hasFocus;
      }
      setState(() {
        _focused = _node.hasFocus;
        //print(_focused.toString() + _node.debugLabel);
      });
    }
  }

  KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    double devicePixelRatio = widget.screenscale;
    return MirrorAnimation<double>(
        tween: Tween(begin: 0, end: 1),
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 450),
        builder: ((context, child, value) {
          return ButtonTheme(
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))) ,
              padding: const EdgeInsets.all(0),
              splashColor: null,
              focusColor: null,
              hoverColor: null,
              colorScheme: const ColorScheme(
                  brightness: Brightness.light,
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent,
                  secondary: Colors.transparent,
                  onSecondary: Colors.transparent,
                  error: Colors.transparent,
                  onError: Colors.transparent,
                  background: Colors.transparent,
                  onBackground: Colors.transparent,
                  surface: Colors.transparent,
                  onSurface: Colors.transparent),
              highlightColor: null,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: RawMaterialButton(
                  splashColor: null,
                  fillColor: const Color.fromARGB(0, 255, 255, 255),
                  highlightColor: null,
                  focusColor: const Color.fromARGB(0, 255, 255, 255),
                  highlightElevation: 0,
                  focusNode: _node,
                  elevation: 0,
                  focusElevation: 0,
                  onPressed: (){
                    if (!_focused) 
                    {
                      _node.requestFocus();
                    }
                  },
                  child: Column(children: [
                    SizedBox(
                      height: 87 * widget.screenscale,
                      width: 87 * widget.screenscale,
                      child: Container(
                        child: SizedBox(
                          height: 87 * widget.screenscale,
                          width: 87 * widget.screenscale,
                          child: Container(
                            child:
                            Padding(padding: EdgeInsets.all( 2 * widget.screenscale) ,
                            child: SizedBox(
                              height: 85 * widget.screenscale,
                              width: 85 * widget.screenscale,
                              child: Container(
                                child: Text(""),
                                decoration: BoxDecoration(
                                    color: (widget.index == 0)
                                        ? Color.fromARGB(255, 242, 16, 31)
                                        : basicWhite.iconbg,
                                    shape: BoxShape.circle),
                              ),
                            ),),
                            decoration: (_focused)
                                ? BoxDecoration(
                                    color: Color.fromRGBO(
                                        basicWhite.highlightFade.red,
                                        basicWhite.highlightFade.green,
                                        basicWhite.highlightFade.blue,
                                        value),
                                    shape: BoxShape.circle)
                                : null,
                          ),
                        ),
                        decoration: (_focused)
                            ? BoxDecoration(
                                color: basicWhite.highlight,
                                shape: BoxShape.circle)
                            : null,
                      ),
                    ),
                  ]),)
              );
        }));
    //
  }
}
