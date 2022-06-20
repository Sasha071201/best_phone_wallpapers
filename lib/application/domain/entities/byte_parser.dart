import 'dart:math' as math;

String parseByteToString(int bytes) {
  const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
  const decimals = 1;
  const k = 1024;

  final i = (math.log(bytes) / math.log(k)).floor();

  return '${(bytes / math.pow(k, i)).toStringAsFixed(decimals)} ${sizes[i]}';
}
