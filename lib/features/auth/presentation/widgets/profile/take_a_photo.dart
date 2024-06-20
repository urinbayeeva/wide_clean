// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/models/profile/change_photo.dart';
import 'package:wide_clean/features/auth/presentation/pages/profile_page/edit_profile_info.dart';

class TakeAPhoto extends StatefulWidget {
  final List<CameraDescription> cameras;

  const TakeAPhoto({super.key, required this.cameras});

  @override
  State<TakeAPhoto> createState() => _TakeAPhotoState();
}

class _TakeAPhotoState extends State<TakeAPhoto>
    with SingleTickerProviderStateMixin {
  late CameraController controller;
  bool isCaptured = false;
  int _selectedCameraIndex = 0;
  bool isFlash = false;
  File? _capturedImage;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  double zoomLevel = 1.0;
  double minZoomLevel = 0.5;

  @override
  void initState() {
    super.initState();
    _initCamera(_selectedCameraIndex);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    controller.dispose();
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

  Future<void> capturePhoto() async {
    try {
      final XFile capturedImage = await controller.takePicture();
      String imagePath = capturedImage.path;
      await GallerySaver.saveImage(imagePath);

      audioPlayer.open(Audio("assets/camer_shutter.mp3"));
      audioPlayer.play();

      setState(() {
        _capturedImage = File(imagePath);
        // Initialize ChangePhoto if not already initialized
        if (ChangePhoto.changePhoto == null) {
          ChangePhoto.changePhoto = ChangePhoto(picture: imagePath);
        } else {
          ChangePhoto.changePhoto.picture = imagePath;
        }
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditProfileInfo(),
        ),
      );
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isCaptured = false;
      });
    }
  }

  void setZoomLevel(double level) {
    setState(() {
      zoomLevel = level;
    });
    controller.setZoomLevel(zoomLevel);
  }

  void _zoomOut() async {
    double newZoomLevel = zoomLevel - 0.1;
    if (newZoomLevel >= minZoomLevel) {
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
          CameraPreview(controller),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 60,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: _toggleFlashLight,
                      child: Icon(
                        isFlash ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                      ),
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
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    GestureDetector(
                        onTap: capturePhoto,
                        child: SvgPicture.asset(
                          "assets/icons/home/take_photo.svg",
                          width: 80,
                          height: 80,
                        )),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        switchCamera();
                      },
                      child:
                          Image.asset("assets/images/home/flip.png", scale: 5),
                    ),
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
          const SizedBox.expand(),
        ],
      ),
    );
  }
}
