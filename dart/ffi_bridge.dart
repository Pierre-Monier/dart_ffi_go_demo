import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:path/path.dart' as path;

class FFIBridge {
  /// Holds the symbol lookup function.
  late final ffi.Pointer<T> Function<T extends ffi.NativeType>(
      String symbolName) _lookup;

  FFIBridge() {
    _lookup = _getDynamicLibrary().lookup;
  }

  ffi.DynamicLibrary _getDynamicLibrary() {
    final libraryPath = path.join(Directory.current.path, 'go', 'lib.a');

    return ffi.DynamicLibrary.open(libraryPath);
  }

  // int sum(int a, int b) {
  //   final _sum = _lookup<ffi.NativeFunction<ffi.Int32 Function()>>('Sum')
  //       .asFunction<int Function()>();
  //   return _sum();
  // }

  int sum(int a, int b) {
    final _sum = _lookup<
            ffi.NativeFunction<
                ffi.Int32 Function(ffi.Int32 a, ffi.Int32 b)>>('Sum')
        .asFunction<int Function(int a, int b)>();
    return _sum(a, b);
  }
}

// class FFIBridge {}
