import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
)
void configureDependencies() {
  getIt.init();
}

@module
abstract class AppInjectionModule {
  @Named('rootNavigatorKey')
  @singleton
  GlobalKey<NavigatorState> get rootNavigatorKey {
    return GlobalKey<NavigatorState>();
  }

  @Named('addImagesGridVewKey')
  @singleton
  GlobalKey get addImagesGridVewKey {
    return GlobalKey();
  }

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseDatabase get firebaseDb => FirebaseDatabase.instance;

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  MicrosoftAuthProvider get microsoftAuthProvider => MicrosoftAuthProvider();

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  FilePicker get filePicker => FilePicker.platform;

  @lazySingleton
  Uuid get uuid => const Uuid();

  @injectable
  TextRecognizer get textRecognizer => TextRecognizer();
}
