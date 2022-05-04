import 'dart/ffi_bridge.dart';

void main() {
  final ffibridge = FFIBridge();
  final result = ffibridge.sum(2, 2);
  print(result);
}
