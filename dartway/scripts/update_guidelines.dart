import 'dart:io';

Future<void> main() async {
  print('🔄 Updating DartWay Guidelines...');

  await _ensureRemote();

  // 1. Подтянуть свежую версию через git subtree
  final pull = await Process.run('git', [
    'subtree',
    'pull',
    '--prefix=dartway/guidelines',
    'dartway_guidelines',
    'main',
    '--squash',
  ]);

  if (pull.exitCode != 0) {
    stderr.writeln('❌ Git subtree pull failed:\n${pull.stderr}');
    stderr.writeln(
      '💡 Hint: Commit or stash your changes before running update.',
    );
    exit(1);
  }
  print('✅ Guidelines updated from remote.');

  // 2. Foundations → .cursor/rules/foundations
  _copyRules(
    'dartway/guidelines/dev-guidelines/foundations',
    '.cursor/rules/dartway_rules',
  );

  // 3. Flutter → <project_name>_flutter/.cursor/rules/flutter
  final flutterDir = _findDirWithSuffix('_flutter');
  if (flutterDir != null) {
    _copyRules(
      'dartway/guidelines/dev-guidelines/flutter',
      '${flutterDir.path}/.cursor/rules/dartway_rules',
    );
  } else {
    print('⚠️ No *_flutter directory found');
  }

  // 4. Server → <project_name>_server/.cursor/rules/server
  final serverDir = _findDirWithSuffix('_server');
  if (serverDir != null) {
    _copyRules(
      'dartway/guidelines/dev-guidelines/server',
      '${serverDir.path}/.cursor/rules/dartway_rules',
    );
  } else {
    print('⚠️ No *_server directory found');
  }

  print('✨ Guidelines distributed successfully!');
}

Future<void> _ensureRemote() async {
  final result = await Process.run('git', ['remote']);
  if (result.exitCode != 0) {
    throw Exception('git remote failed: ${result.stderr}');
  }

  final remotes =
      (result.stdout as String)
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

  if (!remotes.contains('dartway_guidelines')) {
    print('➕ Adding remote dartway_guidelines...');
    final add = await Process.run('git', [
      'remote',
      'add',
      'dartway_guidelines',
      'https://github.com/dartway/dartway_guidelines.git',
    ]);
    if (add.exitCode != 0) {
      throw Exception('git remote add failed: ${add.stderr}');
    }
    print('✅ Remote dartway_guidelines added.');
  } else {
    print('✅ Remote dartway_guidelines already exists.');
  }
}

Directory? _findDirWithSuffix(String suffix) {
  final root = Directory.current;
  for (final entity in root.listSync()) {
    if (entity is Directory && entity.path.endsWith(suffix)) {
      return entity;
    }
  }
  return null;
}

void _copyRules(String source, String destination) {
  final srcDir = Directory(source);
  if (!srcDir.existsSync()) {
    print('⚠️ Source not found: $source');
    return;
  }

  final destDir = Directory(destination);
  if (destDir.existsSync()) {
    destDir.deleteSync(recursive: true);
  }
  destDir.createSync(recursive: true);

  for (final entity in srcDir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.md')) {
      final relativePath = entity.path
          .replaceFirst(srcDir.path, '')
          .replaceAll('\\', '/'); // fix for Windows

      // меняем расширение на .mdc
      final destRelative = relativePath.replaceAll(RegExp(r'\.md$'), '.mdc');
      final destFile = File('${destDir.path}$destRelative');

      destFile.parent.createSync(recursive: true);
      entity.copySync(destFile.path);

      print('📄 ${entity.path} → ${destFile.path}');
    }
  }

  print('📂 Copied rules: $source → $destination');
}
