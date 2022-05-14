class Api {
  //* Creating instance constructor;
  static Api instance = Api();
  //* Base API URL

  static const domain = "http://192.168.189.131/Dempster-Shafer-Laravel";
  static const baseURL = domain + "/public/api";
  static const imageURL = "$domain/public/storage/product_photos_thumb";
  static const imageUserURL = "$domain/public/storage/user_photos_thumb";

  // static const domain = "https://rsm.lp2muniprima.ac.id";
  // static const baseURL = domain + "/api";
  // static const imageURL = "$domain/storage/product_photos_thumb";
  // static const imageUserURL = "$domain/public/storage/user_photos_thumb";

  String getGejalas = "$baseURL/gejalas";
  String getPenyakits = "$baseURL/penyakits";
}
