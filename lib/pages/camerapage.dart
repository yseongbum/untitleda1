import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  //WidgetsFlutterBinding.ensureInitialized();
  //제대로 보긴 해야해
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  bool _isReady = false;
  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  _setupCamera() async {
    try {
      _cameras = await availableCameras();
      _controller = CameraController(_cameras[0], ResolutionPreset.medium);
      await _controller.initialize();
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: getFloatingButtons(),
      body: getBody(),
    );
  }

  Widget cameraPreview() {
    return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    if (_isReady == false ||
        _controller == null ||
        !_controller.value.isInitialized) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        width: size.width,
        height: size.height,
        child: Center(
            child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ))),
      );
    }
    return Container(
      width: size.width,
      height: size.height,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          child: cameraPreview()),
    );
  }

  Widget getFloatingButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        //아마 root app의 height인 90이상으로 SizedBox 넣어줘야 할듯 아래에 Row 밑에 넣음
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.flash_auto_outlined,
                    color: Colors.white,
                    size: 30,
                  )),
              //SizedBox(width: 15),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 7,
                      color: Colors.white,
                    )),
              ),
              //SizedBox(width: 15),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.autorenew,
                    color: Colors.white,
                    size: 30,
                  )),
            ],
          ),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
