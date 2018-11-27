import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

class ScanerPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _ScanerPageState();
}

class _ScanerPageState extends State<ScanerPage> with SingleTickerProviderStateMixin {

  QRReaderController controller;

  AnimationController animationController;

  Animation<double> verticalPosition;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Timer timer;

  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 2500),
    );

    animationController.addListener(() {
      this.setState(() {});
    });

    animationController.forward();
    
    verticalPosition = Tween<double>(begin: 0.0, end: 280.0).animate(CurvedAnimation(parent: animationController, curve: Curves.linear))
    ..addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        animationController.reverse();
      } else if (state == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    // 初始化相机
    availableCameras().then((List<CameraDescription> cameras) async {
      var cameraDescription = cameras[0];
      if (controller != null) {
        await controller.dispose();
      }
      controller = new QRReaderController(cameraDescription, ResolutionPreset.high, [CodeFormat.qr, CodeFormat.pdf417], (dynamic value) {
        print(value.toString());
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('扫码内容'),
              content: new Text(value.toString()),
              actions: <Widget>[
                Container(
                  color: Colors.white,
                  child: new FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text('知道了', style: TextStyle(color: Theme.of(context).primaryColor),)
                  ),
                )
              ],
            );
          }
        );
        timer = new Timer(const Duration(seconds: 3), () {
          controller.startScanning();
        });
      });

      controller.addListener(() {
        if (mounted) setState(() {});
        if (controller.value.hasError) {
          print(controller.value.errorDescription);
        }
      });

      try {
        await controller.initialize();
      } on QRReaderException catch (e) {
        print('Error: $e');
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('提示'),
              content: new Text('相机初始化失败\n使用扫一扫功能，需要相机权限'),
              actions: <Widget>[
                Container(
                  color: Colors.white,
                  child: new FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: new Text('去设置', style: TextStyle(color: Theme.of(context).primaryColor),)
                  ),
                )
              ],
            );
          }
        );
      }

      if (mounted) {
        controller.startScanning();
      }
    })
    ..catchError((QRReaderException e) {
      var code = e.code;
      var description = e.description;
      print('Error: $code, message: $description');
    });
    
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    timer?.cancel();
    super.dispose();
  }

  Widget _cameraPreviewWidget() {
    // var deviceSize = MediaQuery.of(context).size;
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'No camera selected',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return new AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: new QRReaderPreview(controller),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
            new Container(
              child: new Padding(
                padding: const EdgeInsets.all(0.0),
                child: new Center(
                  child: _cameraPreviewWidget(),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                AppBar(
                  elevation: 0.0,
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
                  title: new Text('扫一扫'),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 280.0,
                          width: 280.0,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2.0)
                            ),
                          ),
                        ),
                        Positioned(
                          top: verticalPosition.value,
                          child: Container(
                            width: 280.0,
                            height: 2.0,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]
      ),
    );
  }
}