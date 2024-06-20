import 'dart:async';
import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/post/gallery_preview.dart';
import 'package:wide_clean/features/auth/presentation/widgets/post/post_preview.dart';
import 'package:wide_clean/features/auth/presentation/pages/main_page.dart';

class PhotoScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const PhotoScreen({super.key, required this.cameras});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen>
    with SingleTickerProviderStateMixin {
  late CameraController controller;
  bool isCaptured = false;
  bool isRecording = false;
  int _selectedCameraIndex = 0;
  bool isFlash = false;
  File? _capturedImage;
  String _videoPath = "";
  Timer? _storyTimer;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> isSelected = [
    true,
    false
  ]; // Initial selected state for ToggleButtons
  bool _isDropdownVisible = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  double zoomLevel = 1.0;
  double _minZoomLevel = 0.5;

  @override
  void initState() {
    super.initState();
    _initCamera(_selectedCameraIndex);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _initCamera(int cameraIndex) async {
    controller = CameraController(
      widget.cameras[cameraIndex],
      ResolutionPreset.ultraHigh,
      fps: 120,
    );

    try {
      await controller.initialize();
      // Set initial zoom level when the camera is initialized
      await controller.setZoomLevel(zoomLevel);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  void _toggleFlashLight() {
    if (isFlash) {
      controller.setFlashMode(FlashMode.off);
      setState(() {
        isFlash = false;
      });
    } else {
      controller.setFlashMode(FlashMode.torch);
      setState(() {
        isFlash = true;
      });
    }
  }

  void switchCamera() async {
    _selectedCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
    _initCamera(_selectedCameraIndex);
  }

  void capturePhoto() async {
    // Capture logic...
    try {
      final XFile capturedImage = await controller.takePicture();
      String imagePath = capturedImage.path;
      await GallerySaver.saveImage(imagePath);

      audioPlayer.open(Audio("assets/camer_shutter.mp3"));
      audioPlayer.play();

      setState(() {
        _capturedImage = File(imagePath);
      });

      // Navigate after capture
      Future.delayed(Duration(milliseconds: 100), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPreview(photoOrVideoPath: imagePath),
          ),
        );
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isCaptured = false;
      });
    }
  }

  void _toggleRecording() {
    if (isRecording) {
      _stopVideoRecording();
    } else {
      if (isSelected[1]) {
        _startStoryTimer();
      }
      _startVideoRecording();
    }
  }

  void _startVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      final directory = await getTemporaryDirectory();
      final path =
          "${directory.path}/video.${DateTime.now().millisecondsSinceEpoch}.mp4";

      try {
        await controller.initialize();

        await controller.startVideoRecording();
        setState(() {
          isRecording = true;
          _videoPath = path;
        });
      } catch (e) {
        print(e);
      }
    }
  }

  void _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      try {
        final XFile videoFile = await controller.stopVideoRecording();
        setState(() {
          isRecording = false;
        });

        if (_videoPath.isNotEmpty) {
          final File file = File(_videoPath);
          await file.copy(_videoPath);
          await GallerySaver.saveVideo(_videoPath);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void _toggleStory() {
    setState(() {
      isSelected[1] = !isSelected[1];
    });

    if (isSelected[1]) {
      _startStoryTimer();
    } else {
      _storyTimer?.cancel();
    }
  }

  void _startStoryTimer() {
    const storyDuration = Duration(seconds: 15);
    _storyTimer = Timer(storyDuration, () {
      if (isRecording) {
        _stopVideoRecording();
      }
    });
  }

  void setZoomLevel(double level) {
    setState(() {
      zoomLevel = level; // Set zoom level
    });
    controller.setZoomLevel(zoomLevel);
  }

  void decreaseZoom() {
    if (zoomLevel > 0.5) {
      double newZoomLevel = zoomLevel - 0.5;
      setZoomLevel(newZoomLevel);
    }
  }

  void _zoomOut() async {
    double newZoomLevel = zoomLevel - 0.1;
    if (newZoomLevel >= _minZoomLevel) {
      setState(() {
        zoomLevel = newZoomLevel;
      });
      await controller.setZoomLevel(newZoomLevel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            flex: 1,
            child: CameraPreview(controller),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 60,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainPage(selectedPageIndex: 3))),
                      child: SvgPicture.asset("assets/icons/home/return.svg"),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        _toggleFlashLight();
                      },
                      child: SvgPicture.asset("assets/icons/home/flash.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 150,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            switchCamera();
                          },
                          child: Image.asset("assets/images/home/flip.png",
                              scale: 5),
                        ),
                        const SizedBox(height: 50),
                        GestureDetector(
                            onLongPress: () {
                              _toggleRecording();
                            },
                            onSecondaryLongPressCancel: () {
                              isRecording = !isRecording;
                            },
                            onTap: () {
                              capturePhoto();
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  isRecording
                                      ? "assets/icons/home/stopicon.svg"
                                      : "assets/icons/home/take_photo.svg",
                                  width: 80,
                                  height: 80,
                                ),
                                if (isRecording)
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.red,
                                        width: 5,
                                      ),
                                    ),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.red),
                                      ),
                                    ),
                                  ),
                              ],
                            )),
                        const SizedBox(height: 50),
                        GestureDetector(
                          onTap: () {},
                          child: _capturedImage != null
                              ? Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: GestureDetector(
                                    onTap: () {
                                      showMediaPicker(context);
                                    },
                                    child: Image.file(
                                      _capturedImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    showMediaPicker(context);
                                  },
                                  child: Image.asset(
                                      "assets/images/home/saved.png",
                                      scale: 5),
                                ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 160,
            top: 120,
            child: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black.withOpacity(0.4),
                    child: GestureDetector(
                      onTap: () {
                        setZoomLevel(2.0);
                      },
                      child: const Text(
                        "2x",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black.withOpacity(0.4),
                    child: GestureDetector(
                      onTap: () {
                        setZoomLevel(1.0);
                      },
                      child: const Text(
                        "1x",
                        style:
                            TextStyle(color: Color(0xFFFFD50B), fontSize: 12),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black.withOpacity(0.4),
                    child: GestureDetector(
                      onTap: () {
                        _zoomOut();
                      },
                      child: const Text(
                        "0.5x",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: ToggleButtons(
                constraints: BoxConstraints(
                    minWidth: (MediaQuery.of(context).size.width - 36) / 6),
                selectedColor: const Color(0xFFF9B021),
                fillColor: const Color(0xFFF9B021),
                borderRadius: BorderRadius.circular(16),
                renderBorder: false,
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                children: const [
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Wide",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Story",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
