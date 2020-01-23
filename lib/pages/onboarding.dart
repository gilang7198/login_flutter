import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
// import 'package:prosehat/pages/Login/login_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key key}) : super(key: key);

  void _onIntroEnd(context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => LoginPage()),
    // );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,

    );

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Dukungan Asisten Kesehatan",
          body:
              "Tidak perlu bingung, apabila perlu bantuan Asisten MAYA siap membantu dengan chat kapan saja.",
          image: _buildImage('img/onboard1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tanya Jawab Dokter",
          body:
              "Langsung tanya jawab dengan ahlinya Kesehatan Anak, Pasangan atau Penyakit apa saja.",
          image: _buildImage('img/onboard2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Layanan Kesehatan di Genggaman",
          body:
              "Panggil dokter dan jasa kesehatan ke Rumah. Hati tenang karena dilayani oleh yang berijin resmi.",
          image: _buildImage('img/onboard3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Produk Dijamin Asli",
          body: "Untuk memastikan keamanan anda, semua Produk Asli, Disediakan oleh mitra Klinik, Apotek dan Distributor kesehatan berijin resmi.",
          image: _buildImage('img/onboard4'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 1,
      nextFlex: 1,
      skip: const Text('Lewati', style: TextStyle(color: Color(0xFF6CA91D), fontSize: 16.0), ),
      next: const Icon(Icons.arrow_forward, color: Color(0xFF6CA91D),),
      done: const Text('Mulai', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF6CA91D), fontSize: 16.0)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFF86BC40),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xFF6CA91D),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

