import 'dart:io';

void main() {
  final dir = Directory('lib');
  if (!dir.existsSync()) {
    print('lib directory not found');
    exit(1);
  }

  int filesChanged = 0;

  for (final entity in dir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final content = entity.readAsStringSync();
      var newContent = content;

      // Replace hardcoded background Colors
      newContent = newContent.replaceAll(
        'const Color(0xFF101022)',
        'Theme.of(context).colorScheme.surface',
      );
      newContent = newContent.replaceAll(
        'Color(0xFF101022)',
        'Theme.of(context).colorScheme.surface',
      );

      // Replace hardcoded card colors
      newContent = newContent.replaceAll(
        'const Color(0xFF1A1A32)',
        'Theme.of(context).cardTheme.color ?? Theme.of(context).colorScheme.surface',
      );
      newContent = newContent.replaceAll(
        'Color(0xFF1A1A32)',
        'Theme.of(context).cardTheme.color ?? Theme.of(context).colorScheme.surface',
      );

      // Replace primary colors where not const (can't use Theme.of() in const Context easily)
      // For const we would need to remove const modifier using regex. Let's do a simple replace and fix compilation errors later.
      newContent = newContent.replaceAll(
        'const Color(0xFF1313EC)',
        'Theme.of(context).colorScheme.primary',
      );
      newContent = newContent.replaceAll(
        'Color(0xFF1313EC)',
        'Theme.of(context).colorScheme.primary',
      );

      // General text colors that are white in dark mode usually should be onSurface or text styles
      // This is risky for bulk replace, instead let's look for specific patterns like color: Colors.white
      // and replace with color: Theme.of(context).colorScheme.onSurface
      // where it's not overriding primary buttons.
      // Let's replace Colors.white with Theme.of(context).colorScheme.onSurface
      // and Colors.white70 with Theme.of(context).colorScheme.onSurface.withOpacity(0.7)
      // Note: We'll remove const where Colors.white is used before replacing.

      newContent = newContent.replaceAll(
        'const TextStyle(color: Colors.white)',
        'TextStyle(color: Theme.of(context).colorScheme.onSurface)',
      );
      newContent = newContent.replaceAll(
        'color: Colors.white',
        'color: Theme.of(context).colorScheme.onSurface',
      );
      newContent = newContent.replaceAll(
        'color: Colors.white70',
        'color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)',
      );
      newContent = newContent.replaceAll(
        'color: Colors.white54',
        'color: Theme.of(context).colorScheme.onSurface.withOpacity(0.54)',
      );

      // Clean up const Theme.of(...) syntax errors
      newContent = newContent.replaceAll('const Theme.of', 'Theme.of');
      newContent = newContent.replaceAll(
        'const Icon(\n            Icons.menu,\n            color: Theme.of(context)',
        'Icon(\n            Icons.menu,\n            color: Theme.of(context)',
      );
      // We will run dart fix and dart analyze later to find any broken `const` usages.

      if (content != newContent) {
        entity.writeAsStringSync(newContent);
        filesChanged++;
        print('Updated \${entity.path}');
      }
    }
  }

  print('Updated \$filesChanged files');
}
