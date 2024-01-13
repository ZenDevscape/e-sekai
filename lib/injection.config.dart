// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:file_picker/file_picker.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_database/firebase_database.dart' as _i8;
import 'package:flutter/widgets.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart'
    as _i18;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:image_picker/image_picker.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:uuid/uuid.dart' as _i19;

import 'application/auth/sign_in.dart' as _i29;
import 'application/auth/sign_out.dart' as _i30;
import 'application/auth/watch_user.dart' as _i34;
import 'application/documents/add_document.dart' as _i35;
import 'application/documents/check_document.dart' as _i36;
import 'application/documents/delete_document.dart' as _i37;
import 'application/documents/extract_text_from_file.dart' as _i38;
import 'application/documents/extract_text_from_images.dart' as _i39;
import 'application/documents/get_document.dart' as _i27;
import 'application/documents/get_documents.dart' as _i28;
import 'application/documents/update_document.dart' as _i33;
import 'application/files/pick_file.dart' as _i14;
import 'application/images/pick_image_from_camera.dart' as _i15;
import 'application/images/pick_multi_images.dart' as _i16;
import 'application/images/retrieve_lost_images.dart' as _i17;
import 'domain/repositories/auth/auth_facade.dart' as _i21;
import 'domain/repositories/checks/check_facade.dart' as _i23;
import 'domain/repositories/documents/documents_repository.dart' as _i25;
import 'domain/repositories/documents/text_facade.dart' as _i31;
import 'domain/repositories/files/files_facade.dart' as _i5;
import 'domain/repositories/images/images_facade.dart' as _i12;
import 'infrastructure/datasources/core/esekai_api_data_source.dart' as _i20;
import 'infrastructure/repositories/auth/firebase_auth_facade_impl.dart'
    as _i22;
import 'infrastructure/repositories/checks/check_facade_impl.dart' as _i24;
import 'infrastructure/repositories/documents/firebase_documents_repository_impl.dart'
    as _i26;
import 'infrastructure/repositories/documents/text_facade_impl.dart' as _i32;
import 'infrastructure/repositories/files/files_facade_impl.dart' as _i6;
import 'infrastructure/repositories/images/images_facade_impl.dart' as _i13;
import 'injection.dart' as _i40;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appInjectionModule = _$AppInjectionModule();
    gh.lazySingleton<_i3.Dio>(() => appInjectionModule.dio);
    gh.lazySingleton<_i4.FilePicker>(() => appInjectionModule.filePicker);
    gh.lazySingleton<_i5.FilesFacade>(
        () => _i6.FilesFacadeImpl(gh<_i4.FilePicker>()));
    gh.lazySingleton<_i7.FirebaseAuth>(() => appInjectionModule.firebaseAuth);
    gh.lazySingleton<_i8.FirebaseDatabase>(() => appInjectionModule.firebaseDb);
    gh.singleton<_i9.GlobalKey<_i9.NavigatorState>>(
      appInjectionModule.rootNavigatorKey,
      instanceName: 'rootNavigatorKey',
    );
    gh.singleton<_i9.GlobalKey<_i9.State<_i9.StatefulWidget>>>(
      appInjectionModule.addImagesGridVewKey,
      instanceName: 'addImagesGridVewKey',
    );
    gh.lazySingleton<_i10.GoogleSignIn>(() => appInjectionModule.googleSignIn);
    gh.lazySingleton<_i11.ImagePicker>(() => appInjectionModule.imagePicker);
    gh.lazySingleton<_i12.ImagesFacade>(
        () => _i13.ImagesFacadeImpl(gh<_i11.ImagePicker>()));
    gh.lazySingleton<_i7.MicrosoftAuthProvider>(
        () => appInjectionModule.microsoftAuthProvider);
    gh.lazySingleton<_i14.PickFile>(() => _i14.PickFile(gh<_i5.FilesFacade>()));
    gh.lazySingleton<_i15.PickImageFromCamera>(
        () => _i15.PickImageFromCamera(gh<_i12.ImagesFacade>()));
    gh.lazySingleton<_i16.PickMultiImages>(
        () => _i16.PickMultiImages(gh<_i12.ImagesFacade>()));
    gh.lazySingleton<_i17.RetrieveLostImages>(
        () => _i17.RetrieveLostImages(gh<_i12.ImagesFacade>()));
    gh.factory<_i18.TextRecognizer>(() => appInjectionModule.textRecognizer);
    gh.lazySingleton<_i19.Uuid>(() => appInjectionModule.uuid);
    gh.lazySingleton<_i20.EsekaiApiDataSource>(
        () => _i20.EsekaiApiDataSourceImpl(gh<_i3.Dio>()));
    gh.lazySingleton<_i21.AuthFacade>(() => _i22.FirebaseAuthFacadeImpl(
          gh<_i7.FirebaseAuth>(),
          gh<_i10.GoogleSignIn>(),
          gh<_i7.MicrosoftAuthProvider>(),
        ));
    gh.lazySingleton<_i23.CheckFacade>(
        () => _i24.CheckFacadeImpl(gh<_i20.EsekaiApiDataSource>()));
    gh.lazySingleton<_i25.DocumentsRepository>(
        () => _i26.FirebaseDocumentsRepositoryImpl(gh<_i8.FirebaseDatabase>()));
    gh.lazySingleton<_i27.GetDocument>(() => _i27.GetDocument(
          gh<_i25.DocumentsRepository>(),
          gh<_i21.AuthFacade>(),
        ));
    gh.lazySingleton<_i28.GetDocuments>(() => _i28.GetDocuments(
          gh<_i25.DocumentsRepository>(),
          gh<_i21.AuthFacade>(),
        ));
    gh.lazySingleton<_i29.SignIn>(() => _i29.SignIn(gh<_i21.AuthFacade>()));
    gh.lazySingleton<_i30.SignOut>(() => _i30.SignOut(gh<_i21.AuthFacade>()));
    gh.lazySingleton<_i31.TextFacade>(
        () => _i32.TextFacadeImpl(gh<_i19.Uuid>()));
    gh.lazySingleton<_i33.UpdateDocument>(() => _i33.UpdateDocument(
          gh<_i25.DocumentsRepository>(),
          gh<_i21.AuthFacade>(),
        ));
    gh.lazySingleton<_i34.WatchUser>(
        () => _i34.WatchUser(gh<_i21.AuthFacade>()));
    gh.lazySingleton<_i35.AddDocument>(() => _i35.AddDocument(
          gh<_i25.DocumentsRepository>(),
          gh<_i21.AuthFacade>(),
        ));
    gh.lazySingleton<_i36.CheckDocument>(
        () => _i36.CheckDocument(gh<_i23.CheckFacade>()));
    gh.lazySingleton<_i37.DeleteDocument>(() => _i37.DeleteDocument(
          gh<_i25.DocumentsRepository>(),
          gh<_i21.AuthFacade>(),
        ));
    gh.lazySingleton<_i38.ExtractTextFromFile>(
        () => _i38.ExtractTextFromFile(gh<_i31.TextFacade>()));
    gh.lazySingleton<_i39.ExtractTextFromImages>(
        () => _i39.ExtractTextFromImages(gh<_i31.TextFacade>()));
    return this;
  }
}

class _$AppInjectionModule extends _i40.AppInjectionModule {}
