class Api {
  //* Creating instance constructor;
  static Api instance = Api();
  //* Base API URL

  static const domain = "http://192.168.8.101/Dempster-Shafer-Laravel/public";

  // static const domain = "https://rini.lp2muniprima.ac.id";

  static const baseURL = domain + "/api";
  static const imageURL = "$domain/public/storage/product_photos_thumb";
  static const imageUserURL = "$domain/public/storage/user_photos_thumb";

  String getPenyakits = "$baseURL/penyakits";
  String getGejalas = "$baseURL/gejalas";
  String getUser = "$baseURL/user";
  String getBasis = "$baseURL/basis";
  String laporanUrl = "$baseURL/laporan";
}
