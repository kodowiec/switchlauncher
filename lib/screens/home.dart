import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme.dart';
import '../widgets/appcircle.dart';
import '../widgets/apptile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    double devicePixelRatio =  MediaQuery.of(context).size.height / 720 ;
    double kAspectRatio = MediaQuery.of(context).size.aspectRatio;
    double kScreenWidth = MediaQuery.of(context).size.width;
    double kScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: basicWhite.background,
        body: Center(
            child: SizedBox(
          child: Column(children: [
            SizedBox(
                height: (130 * devicePixelRatio),
                child: Container(
                  // color: basicBlack.accent,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(devicePixelRatio.toString()),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, (55 * devicePixelRatio), (63 * devicePixelRatio), (55 * devicePixelRatio)),
                        child: Row(children: [
                          Text("21:37", style: TextStyle(fontSize: (20 * devicePixelRatio))),
                          Padding(
                            padding: EdgeInsets.fromLTRB((24 * devicePixelRatio), 0, (26 * devicePixelRatio), 0),
                            child: Icon(
                              Icons.wifi,
                              size: (20 * devicePixelRatio),
                              color: basicWhite.fontColor,
                            ),
                          ),
                          Text("100%", style: TextStyle(fontSize: (20 * devicePixelRatio))),
                          Icon(Icons.battery_full_outlined, size: (20 * devicePixelRatio))
                        ]))
                  ]),
                )),
            SizedBox(
                height: (374 * devicePixelRatio),
                child: Container(
                    // color: basicBlack.highlight,
                    child: SizedBox(
                        height: 140,
                        child:
                        PageView.builder(
                            padEnds: true,
                            pageSnapping: true,
                            allowImplicitScrolling: true,

                          physics: BouncingScrollPhysics(),
                            controller: PageController(
                                initialPage: 0,
                                keepPage: false,
                                viewportFraction: 0.185),
                            itemCount: 10,
                            itemBuilder: ((context, index) =>
                                AppTile(screenscale: devicePixelRatio, text: "number " + index.toString()))
                                ,
                                ),
                ))),
            SizedBox(
                height: (143 * devicePixelRatio),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                       Padding(
                          padding: EdgeInsets.symmetric(horizontal: 11 * devicePixelRatio),
                          child: AppCircle(text: "", screenscale: devicePixelRatio, index: 0),
                      ),
                       Padding(
                          padding: EdgeInsets.symmetric(horizontal: 11 * devicePixelRatio),
                          child: AppCircle(text: "", screenscale: devicePixelRatio, index: 1),
                       ),
                       Padding(
                          padding: EdgeInsets.symmetric(horizontal: 11 * devicePixelRatio),
                          child: AppCircle(text: "", screenscale: devicePixelRatio, index: 2),
                       ),
                       Padding(
                          padding: EdgeInsets.symmetric(horizontal: 11 * devicePixelRatio),
                          child: AppCircle(text: "", screenscale: devicePixelRatio, index: 3),
                       ),
                       Padding(
                          padding: EdgeInsets.symmetric(horizontal: 11 * devicePixelRatio),
                          child: AppCircle(text: "", screenscale: devicePixelRatio, index: 4),
                       ),
                       Padding(
                          padding: EdgeInsets.symmetric(horizontal: 11 * devicePixelRatio),
                          child: AppCircle(text: "", screenscale: devicePixelRatio, index: 5),
                       ),
                       Padding(
                          padding: EdgeInsets.symmetric(horizontal: 11 * devicePixelRatio),
                          child: AppCircle(text: "", screenscale: devicePixelRatio, index: 6),),
                  ],
                ),),
            SizedBox(
                height: (73 * devicePixelRatio),
                width: 1280,
                child: Column(
                  children: [
                    Divider(
                      height: 0.5,
                      indent: 17.1,
                      endIndent: 17.1,
                      color: basicWhite.fontColor,
                    ),
                    Row(children: [
                      //
    // double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    // double kAspectRatio = MediaQuery.of(context).size.aspectRatio;
    // double kScreenWidth = MediaQuery.of(context).size.width;
    // double kScreenHeight = MediaQuery.of(context).size.height;
                      Text("  pixel ratio: " + devicePixelRatio.toString()),
                      Text("  aspect ratio: " + kAspectRatio.toString()),
                      Text("  width " + kScreenWidth.toString()),
                      Text("  height " + kScreenHeight.toString()),
                    ],)
                  ],
                ))
          ]),
        )));
  }
}
