import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:math' as Math;
import 'package:crypto/crypto.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

deg2rad(deg) {
  return deg * (Math.pi / 180);
}

double getVincentyDistance(double lat1, double lon1, lat2, lon2) {
  if (lat2 is String) {
    lat2 = double.parse(lat2);
  }
  if (lon2 is String) {
    lon2 = double.parse(lon2);
  } else {
    lon2 = lon2;
  }
  double a = 6378137, b = 6356752.314245, f = 1 / 298.257223563;

  double L = deg2rad(lon2 - lon1);

  double U1 = Math.atan((1 - f) * Math.tan(deg2rad(lat1)));

  double U2 = Math.atan((1 - f) * Math.tan(deg2rad(lat2)));

  double sinU1 = Math.sin(U1), cosU1 = Math.cos(U1);

  double sinU2 = Math.sin(U2), cosU2 = Math.cos(U2);

  double cosSqAlpha, sinSigma, cos2SigmaM, cosSigma, sigma;

  double lambda = L, lambdaP, iterLimit = 100;

  do {
    double sinLambda = Math.sin(lambda), cosLambda = Math.cos(lambda);

    sinSigma = Math.sqrt((cosU2 * sinLambda) * (cosU2 * sinLambda) +
        (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda) *
            (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda));

    if (sinSigma == 0) return 0;

    cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda;

    sigma = Math.atan2(sinSigma, cosSigma);

    double sinAlpha = cosU1 * cosU2 * sinLambda / sinSigma;

    cosSqAlpha = 1 - sinAlpha * sinAlpha;

    cos2SigmaM = cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha;

    double C = f / 16 * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha));

    lambdaP = lambda;

    lambda = L +
        (1 - C) *
            f *
            sinAlpha *
            (sigma +
                C *
                    sinSigma *
                    (cos2SigmaM +
                        C * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)));
  } while ((lambda - lambdaP).abs() > 1e-12 && --iterLimit > 0);

  if (iterLimit == 0) return 0;

  double uSq = cosSqAlpha * (a * a - b * b) / (b * b);

  double A = 1 + uSq / 16384 * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq)));

  double B = uSq / 1024 * (256 + uSq * (-128 + uSq * (74 - 47 * uSq)));

  double deltaSigma = B *
      sinSigma *
      (cos2SigmaM +
          B /
              4 *
              (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) -
                  B /
                      6 *
                      cos2SigmaM *
                      (-3 + 4 * sinSigma * sinSigma) *
                      (-3 + 4 * cos2SigmaM * cos2SigmaM)));

  double s = b * A * (sigma - deltaSigma) / 1000;
  return double.parse((s).toStringAsFixed(1));
}

int tinhTuoi(birth) {
  int presentYear = DateTime.now().year;
  int relationYear;
  if (birth is DateTime)
    relationYear = birth.year;
  else
    relationYear = DateFormat('dd/MM/yyyy').parse(birth).year;

  return presentYear - relationYear;
}

double parseCurrency(String value) {
  var _value =
      value.replaceAll(',', '').replaceAll('đ', '').replaceAll('.', '');
  try {
    double result = NumberFormat().parse(_value.trim()) as double;
    return result;
  } catch (e) {
    return 0.0;
  }
}

///Hàm format và parse number
String formatCurrency(number) {
  try {
    String _format =
        NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(number);
    return _format.replaceAll('.', ',');
  } catch (e) {
    return number;
  }
}

double ceilUpPercent(double number) {
  return ((number * 10).ceil() / 10).toDouble();
}

/// Hàm parse chuỗi base64 thành file và trả về path
Future<String> generateAndGetPath(String? _base64,
    {String fileType = 'pdf'}) async {
  final path = join(
    (await getTemporaryDirectory()).path,
    '${DateTime.now().toUtc().millisecondsSinceEpoch}',
    '.$fileType',
  );
  if (_base64 != null) {
    Uint8List bytes = base64.decode(_base64);
    final file = File(path);
    file.writeAsBytesSync(bytes);
  }

  return path;
}

bool checkStringNull(value) {
  return value != null && value != '';
}

List<dynamic> deepCopy(Iterable source) {
  return source.map((e) => e).toList();
}

// Hàm đổi số kiểu (20201221) sang (21/12/2020)
String? doubleToDateYYYYMMDD(value) {
  String _value;
  if (value is double)
    _value = value.toString();
  else
    _value = value;

  String yyyy = _value.substring(0, 4);
  String mm = _value.substring(4, 6);
  String dd = _value.substring(6, 8);
  return dd + '/' + mm + '/' + yyyy;
}

// Hàm đổi số kiểu (21122020) sang (21/12/2020)
String? doubleToDateDDMMYYYY(value) {
  if (value != null) {
    String _value;
    if (value is double)
      _value = value.toString();
    else
      _value = value;

    String dd = _value.substring(0, 2);
    String mm = _value.substring(2, 4);
    String yyyy = _value.substring(4, 8);
    return dd + '/' + mm + '/' + yyyy;
  } else {
    return null;
  }
}


/// Xoá file ảnh, video trong cachce nếu tồn tại
deleteImagePathFile(path) async {
  if (checkNullOrUndifine([path])) {
    File _file = File(path);
    if (await _file.exists()) _file.delete();
  }
}

/// Nén file ảnh
Future<File> compressFile(String path,
    {int quality = 20, int height = 1000, int width = 1000}) async {
  File compressedFile = await FlutterNativeImage.compressImage(path,
      quality: quality, targetHeight: height, targetWidth: width);
  return compressedFile;
}


/// Check null các ô input, chuyền vào mảng các value,
///
/// true - là tất cả mảng đều k null và rỗng
///
/// false - là chỉ cần 1 value null hoặc rỗng

bool checkNullOrUndifine(arrayValue) {
  for (var item in arrayValue) {
    if (item is DateTime) {
      return false;
    }
    if (item is String) {
      if (item.trim() == '') {
        return false;
      }
    } else {
      return false;
    }
  }
  return true;
}


/// HMACSHA256 function
String HMACSHA256(String raw, String key) {
  var keyByte = utf8.encode(key);
  var messageBytes = utf8.encode(raw);
  var hmacSha256 = Hmac(sha256, keyByte); // HMAC-SHA256
  var digest = hmacSha256.convert(messageBytes);
  return digest.toString().toLowerCase();
}