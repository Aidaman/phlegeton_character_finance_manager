import 'dart:io';

import 'package:path_provider/path_provider.dart';

enum AppDirectories {
  appDirectory,
  userContent,
  characters,
}

extension AppDirectoriesPaths on AppDirectories {
  String get path => switch (this) {
        AppDirectories.appDirectory => 'phlegeton_purse',
        AppDirectories.userContent => 'phlegeton_purse/user_content',
        AppDirectories.characters => 'phlegeton_purse/user_content/characters',
      };
}

class AppDirectoriesService {
  static final AppDirectoriesService _singleton =
      AppDirectoriesService._internal();

  factory AppDirectoriesService() => _singleton;

  AppDirectoriesService._internal();

  Future ensureDirectories() async {
    var appDocDir = await getApplicationDocumentsDirectory();

    for (var directory in AppDirectories.values) {
      await _ensureDir(Directory('${appDocDir.path}/${directory.path}'));
    }
  }

  _ensureDir(Directory dir) async {
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
  }
}

final AppDirectoriesService appDirectoriesService = AppDirectoriesService();
