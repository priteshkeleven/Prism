import 'package:Prism/auth/google_auth.dart';

GoogleAuth gAuth = GoogleAuth();
String currentAppVersion = '2.6.4';
String obsoleteAppVersion = '2.6.0';
String currentAppVersionCode = '63';
bool updateChecked = false;
bool updateAvailable = false;
Map versionInfo = {};
bool loadingAd = true;
bool updateAlerted = false;
bool hasNotch = false;
double notchSize;
bool tooltipShown = false;
bool followersTab = true;

List topTitleText = [
  "TOP-RATED",
  "BEST OF COMMUNITY",
  "FAN-FAVOURITE",
  "TRENDING",
];

List premiumCollections = [
  "space",
  "abstract",
  "flat",
  "mesh gradients",
  "fluids",
];

String topImageLink =
    'https://firebasestorage.googleapis.com/v0/b/prism-wallpapers.appspot.com/o/Replacement%20Thumbnails%2Fpost%20bg.png?alt=media&token=d708b5e3-a7ee-421b-beae-3b10946678c4';

List verifiedUsers = [
  "akshaymaurya3006@gmail.com",
  "maurya.abhay30@gmail.com",
];

String bannerText = "Join our Telegram";

String bannerURL = "https://t.me/PrismWallpapers";

String bannerTextOn = "true";

bool isPremiumWall(List premiumCollections, List wallCollections) {
  bool result = false;
  wallCollections.forEach((element) {
    if (premiumCollections.contains(element)) {
      result = true;
    } else {}
  });
  return result;
}
