import 'package:get/get.dart';

class InformasiController extends GetxController {
  final count = 0.obs;

  List<dynamic> listDetail = <dynamic>[].obs;
  List<dynamic> listDetailResult = <dynamic>[].obs;
  List<dynamic> listTitle = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    init();
    initTitle();
    listDetailResult = listDetail;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  Future<List<dynamic>> runFilter(String keyword) async {
    List<dynamic> results = [];
    if (keyword.isEmpty) {
      var list = listDetail;
      results = list;
    } else {
      results = listDetail
          .where((element) => element['title_id'] == keyword)
          .toList();
    }
    return results;
    // listDetailResult = results;
  }

  init() {
    listDetail.addAll([
      {
        'title_id': '1',
        'detail': 'Gejala',
        'desc': [
          'Nyeri tenggorokan',
          'Demam',
          'Mual',
          'Muntah',
          'Menggigil',
          'Sakit kepala',
          'Sulit bernafas',
          'Detak jantung meningkat',
        ]
      },
      {
        'title_id': '1',
        'detail': 'Ciri-ciri',
        'desc': [
          'Pembengkakan kelenjar getah bening di leher',
          'Hidung meler',
          'Pembengkakan langit-langit mulut',
          'Bercak putih ditenggorokan',
        ]
      },
      {
        'title_id': '1',
        'detail': 'Penanganan',
        'desc': [
          'Pencegahan pertama agar terhindar dari penyakit ini dengan memberikan vaksin difteri (DPT). Akan tetapi apabila sudah terlanjur sakit, penderita sebaiknya dirawat di rumah sakit secara intensif. Pemulihan penderita difteri berat akan berlangsung perlahan-lahan. Biasanya anak tidak boleh terlalu banyak bergerak, karena kelelahan bisa melukai jantung yang meradang.'
        ]
      },
      {
        'title_id': '2',
        'detail': 'Gejala',
        'desc': [
          'Nyeri saat mengunyah',
          'Demam',
          'Mulut kering',
          'Sakit kepala',
        ]
      },
      {
        'title_id': '2',
        'detail': 'Ciri-ciri',
        'desc': [
          'Daun telinga agak terdorong ke atas dan keluar',
          'Kelenjar ludah membengkak',
        ]
      },
      {
        'title_id': '2',
        'detail': 'Penanganan',
        'desc': [
          'Memperbanyak istirahat dan mencukupkan tidur',
          'Memperbanyak minum air putih',
          'Mengompres area yang membengkak dengan air hangat atau air dingin',
          'Mengonsumsi makanan lunak',
          'Mengonsumsi pereda demam dan nyeri, seperti ibuprofen dan paracetamol',
        ]
      },
      {
        'title_id': '3',
        'detail': 'Gejala',
        'desc': [
          'Batuk',
          'Pilek',
          'Demam',
          'Diare',
        ]
      },
      {
        'title_id': '3',
        'detail': 'Ciri-ciri',
        'desc': [
          'Mata tampak kemerah-merahan dan berair',
          'Muncul bintik-bintik putih dalam mulut',
          'Timbul ruam kemerahan di wajah seiring waktu, ruam bisa menyebar hampir ke seluruh bagian tubuh.',
        ]
      },
      {
        'title_id': '3',
        'detail': 'Penanganan',
        'desc': [
          'Anak yang menderita campak perlu dirawat di tempat tersendiri agar tidak menularkan penyakitnya kepada orang lain.',
          'Penderita harus diberi asupan makanan yang bergizi agar meningkatkan daya tahan tubuh.',
          'Pengobatan dilakukan dengan berkonsultasi kepada dokter.',
          'Menjaga kebersihan tubuh anak',
          'Beristirahat dengan cukup',
        ]
      },
      {
        'title_id': '4',
        'detail': 'Gejala',
        'desc': [
          'Otot rahang, wajah dan leher menjadi kaku',
          'Sulit menelan',
          'Demam',
          'Kejang',
        ]
      },
      {
        'title_id': '4',
        'detail': 'Ciri-ciri',
        'desc': [
          'Perut keras bila disentuh',
          'Mulut seperti mulut ikan',
        ]
      },
      {
        'title_id': '4',
        'detail': 'Penanganan',
        'desc': [
          'Tetanus belum dapat diobati, tetapi gejalanya dapat diredakan dengan suntik anti-tetanus, obat-obatan, dan vaksin tetanus. Imunisasi tetanus juga merupakan salah satu upaya untuk mencegah penyakit ini.'
        ]
      },
      {
        'title_id': '5',
        'detail': 'Gejala',
        'desc': [
          'Demam',
          'Muntah',
          'Batuk',
          'Nafsu makan yang kurang',
          'Berat badan yang sulit naik bahkan malah turun',
          'Leher kaku',
          'Kesadaran menurun',
          'Keringat banyak',
        ]
      },
      {
        'title_id': '5',
        'detail': 'Ciri-ciri',
        'desc': [
          'Pembesaran kelenjar superfisial di daerah leher',
          'Benjolan di punggung (gibbas)',
          'Pincang',
          'Pembengkakan sendi',
        ]
      },
      {
        'title_id': '5',
        'detail': 'Penanganan',
        'desc': [
          'Apabila anak positif terkena TBC, dokter akan memberikan obat anti biotik khusus TBC yang harus diminum dalam jangka panjang dan berlangsung minimal 6 bulan.'
        ]
      },
      {
        'title_id': '6',
        'detail': 'Gejala',
        'desc': [
          'Demam ',
          'Rasa lelah',
          'Sakit kepala',
          'Muntah-muntah',
          'Leher kaku',
          'Sakit pada kaki atau tangan',
          'Kaki dan tangan lunglai',
        ]
      },
      {'title_id': '6', 'detail': 'Ciri-ciri', 'desc': []},
      {
        'title_id': '6',
        'detail': 'Penanganan',
        'desc': [
          ' Polio memang tidak dapat disembuhkan, namun dapat dicegah dengan imunisasi. Imunisasi yang tepat untuk polio menggunakan vaksin yang aman dan efektif yaitu Oral Polio Vaksin (OVP).'
        ]
      },
      {
        'title_id': '7',
        'detail': 'Gejala',
        'desc': [
          'Rasa tidak enak di perut',
          'Nafsu makan hilang',
          'Mual ',
          'Muntah',
          'Demam',
          'Nyeri sendi',
        ]
      },
      {
        'title_id': '7',
        'detail': 'Ciri-ciri',
        'desc': [
          'Bengkak pada bagian perut kanan atas',
          'Bagian mata putih tampak kuning',
          'Kulit seluruh tubuh tampak kuning',
          'Air seni berwarna coklat seperti teh',
        ]
      },
      {
        'title_id': '7',
        'detail': 'Penanganan',
        'desc': [
          'Penyakit hepatitis B sebaiknya diatasi dengan cepat agar tidak mengalami masalah pada fungsi hati yang akan semakin memburuk. Tujuan pengobatan hepatitis B adalah untuk mengurangi gejala dengan obat pereda sakit. Adapun pengobatan untuk hepatitis B kronis bergantung pada tingkat keparahan infeksi pada hati. Obat-obatan yang digunakan dalam penanganan penyakit ini berfungsi untuk menghambat produksi virus serta mencegah kerusakan hati.'
        ]
      },
      {
        'title_id': '8',
        'detail': 'Gejala',
        'desc': [
          'Demam ',
          'Mual',
          'Sakit kepala',
        ]
      },
      {
        'title_id': '8',
        'detail': 'Ciri-ciri',
        'desc': [
          'Air seni kemerahan ',
          'Bagian mata putih tampak kuning',
          'Bengkak pada bagian perut kanan atas',
        ]
      },
      {
        'title_id': '8',
        'detail': 'Penanganan',
        'desc': [
          'Penderita harus beristirahat total sekitar 1-4 minggu',
          'Makan makanan yang cukup protein tetapi rendah lemak',
        ]
      },
      {
        'title_id': '9',
        'detail': 'Gejala',
        'desc': [
          'Demam',
          'Mencret',
          'Mual berat',
          'Muntah',
          'Tidur pasif',
          'Susah BAB',
        ]
      },
      {
        'title_id': '9',
        'detail': 'Ciri-ciri',
        'desc': [
          'Lidah tampak berwarna putih',
          'Pinggir lidah berwarna merah',
        ]
      },
      {
        'title_id': '9',
        'detail': 'Penanganan',
        'desc': [
          'Mengkonsumsi air minum yang higienis',
          'Vaksinasi typhim',
          'Membasmi lalat di rumah hingga tuntas agar makanan tidak dihinggapi lalat pembawa bakteri.',
        ]
      },
      {
        'title_id': '10',
        'detail': 'Gejala',
        'desc': [
          'Demam',
          'Sakit kepala',
          'Nyeri tulang',
          'Mual ',
          'Nyeri ulu hati',
          'Gelisah',
          'Keringat banyak',
          'Ujung kaki dan tangan dingin',
        ]
      },
      {
        'title_id': '10',
        'detail': 'Ciri-ciri',
        'desc': [
          'Muncul ruam kemerahan di kulit',
          'Bercak-bercak merah di muka',
        ]
      },
      {
        'title_id': '10',
        'detail': 'Penanganan',
        'desc': [
          'Jika anak mengalami demam tinggi lebih dari 2 hari segera periksa ke dokter, dengan tetap memberikan cairan yang cukup dan obat penurun panas.',
          'Jika anak dinyatakan positif demam berdarah tetapi dirawat di rumah maka: mengontrol setiap hari ke rumah sakit selama masih demam, memberikan obat penurun panas bila diperlukan, memberikan minum sedikitnya 4-6 gelas per hari, disamping air putih dapat diberikan teh manis, sirup, jus buah, oralit, dan lain-lain. Apabila gejala yang dirasakan anak gawat maka segera dibawa kembali ke rumah sakit.',
        ]
      },
      {
        'title_id': '11',
        'detail': 'Gejala',
        'desc': [
          'Sakit kepala',
          'Batuk ',
          'Mual',
          'Muntah',
          'Diare',
          'Demam ',
          'Menggigil ',
        ]
      },
      {
        'title_id': '11',
        'detail': 'Ciri-ciri',
        'desc': [
          'Pembengkakan hati',
          'Pembesaran limpa',
          'Ikterik ',
          'Pendarahan  ',
          'Bercak-bercak merah di muka  ',
        ]
      },
      {
        'title_id': '11',
        'detail': 'Penanganan',
        'desc': [
          'Obat utama yang digunakan untuk mengobati malaria yaitu klorokuim. Umumnya, tiga hari setelah diobati, darah penderita diperiksa untuk mengetahui keadaan parasit malaria dalam tubuhnya.'
        ]
      },
      {
        'title_id': '12',
        'detail': 'Gejala',
        'desc': [
          'Suhu tubuh meningkat',
          'Lemah ',
          'Lesu',
          'Sakit kepala',
          'Mual',
          'Muntah',
          'Kesadaran menurun',
          'Menggigil ',
          'Demam'
        ]
      },
      {
        'title_id': '12',
        'detail': 'Ciri-ciri',
        'desc': ['Keluar cairan hijau dari telinga']
      },
      {
        'title_id': '12',
        'detail': 'Penanganan',
        'desc': [
          'Apabila terjadi seperti di atas, anak harus dibawa ke dokter THT. Congekan apabila sudah parah dapat menyebar ke otak dan merusak saraf di otak.'
        ]
      },
    ]);
  }

  initTitle() {
    listTitle.addAll([
      {
        'id': '1',
        'title': 'Difteri',
        'subtitle':
            'Difteri merupakan penyakit infeksi akut dengan gambaran klinis berupa inflamasi sekitar fokal infeksi dan gambaran sistemik yang dihubungkan dengan penyebaran dan efek toksin difteri. Difteri mudah menular melalui udara dengan masa inkubasi antara 1-10 (tersering 2-5) hari dan biasanya menyerang anak-anak.'
      },
      {
        'id': '2',
        'title': 'Gondongan',
        'subtitle':
            'Gondongan merupakan penyakit infeksi karena virus yang menyerang kelenjar parotis secara mendadak. Gondongan banyak menyerang anak-anak, khususnya usia 5-19 tahun. Gondongan disebabkan oleh infeksi virus dari golongan paramyxovirus.'
      },
      {
        'id': '3',
        'title': 'Campak Morbili',
        'subtitle':
            'Campak atau morbili merupakan infeksi yang umum terjadi pada anak-anak dan menyebar melalui droplet. Morbili merupakan salah satu penyebab kematian meskipun telah ditemukan vaksin terhadap virus campak.'
      },
      {
        'id': '4',
        'title': 'Tetanus',
        'subtitle':
            'Tetanus merupakan salah satu penyakit yang paling berisiko mengakibatkan kematian. Infeksi tetanus terjadi karena luka. Sekecil apapun luka dapat menjadi tempat berkembang biaknya bakteri tetanus.'
      },
      {
        'id': '5',
        'title': 'Tuberkulosis (TBC)',
        'subtitle':
            'TBC merupakan penyakit yang disebabkan bakteri Mycobacterium tuberculosis.'
      },
      {
        'id': '6',
        'title': 'Polio',
        'subtitle':
            'Polio merupakan penyakit yang disebabkan oleh virus polio dan menyerang sistem saraf serta dapat menyebabkan kelumpuhan.'
      },
      {
        'id': '7',
        'title': 'Hepatitis B',
        'subtitle':
            'Hepatitis B merupakan penyakit hati yang dapat menyebabkan peradangan hati akut atau menahun. Hepatitis ini juga dapat berlanjut menjadi sérosis hati dan kanker hati (hepatoma). Hepatitis B disebabkan oleh virus hepatitis B (VHB).'
      },
      {
        'id': '8',
        'title': 'Hepatitis A',
        'subtitle':
            'Hepatitis A merupakan penyakit yang disebabkan oleh virus hepatitis tipe A dan menyerang sel-sel hati manusia. Penyakit ini juga dikenal dengan penyakit kuning (jaundice).'
      },
      {
        'id': '9',
        'title': 'Tifoid',
        'subtitle':
            'Demam tifoid merupakan penyakit infeksi akut yang disebabkan bakteri Salmonella typhi. Bakteri ini biasanya hidup di lingkungan kumuh, pada makanan dan minuman yang tidak higienis.'
      },
      {
        'id': '10',
        'title': 'Demam Berdarah',
        'subtitle':
            'Demam berdarah merupakan penyakit yang disebabkan oleh virus dengue dan ditularkan melalui gigitan nyamuk Aedes aegypti.'
      },
      {
        'id': '11',
        'subtitle':
            'Malaria adalah penyakit infeksi yang ditularkan melalui gigitan nyamuk Anopheles betina. Penyebab penyakit malaria sebenarnya adalah parasit protozoa genus plasmodium yang menginfeksi manusia.',
        'title': 'Malaria'
      },
      {
        'id': '12',
        'title': 'Congekan',
        'subtitle':
            'Congekan merupakan penyakit radang kronis supuratif telinga tengah. Penyakit ini sering menyerang anak-anak karena tuba eustachi (saluran penghubung telinga tengah dengan tenggorokan) letaknya lebih mendatar.'
      },
    ]);
  }
}
