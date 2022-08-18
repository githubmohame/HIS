import 'package:flutter/material.dart';
import 'package:his/themes/colors.dart';
import 'package:url_launcher/link.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: AppBar(
            leading: null,
            title: Center(
                child: Text('HIS', style: TextStyle(color: Colors.black))),
            backgroundColor: CustomeColor.silver),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CustomeButtom(
                  function: 'Registration',
                  color: CustomeColor.MainScreenButtomColorFirst,
                  text: Text('Registration'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/user.png',
                    ),
                  ),
                  topMargin: 10,
                  rightMargin: 8,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )),
                Expanded(
                    child: Link(
                  uri: Uri.parse(
                      'https://www.google.com/search?q=+css+registerbeautiful+forums&tbm=isch&ved=2ahUKEwidsY69ucn5AhUChxoKHZcaBz8Q2-cCegQIABAA&oq=+css+registerbeautiful+forums&gs_lcp=CgNpbWcQAzoECCMQJ1AAWI4MYPMOaABwAHgAgAGdAYgBkgWSAQMwLjWYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=2Iz6Yp3lIoKOape1nPgD&bih=900&biw=960&client=firefox-b-d'),
                  builder: (context, followLink) => CustomeButtom(
                    function: followLink,
                    color: CustomeColor.silver,
                    text: Text('WebSite'),
                    image: Image(
                      image: AssetImage(
                        'assets/icons/web.png',
                      ),
                    ),
                    rightMargin: 8,
                    topMargin: 8,
                    buttonMargin: 20,
                    offset: Offset(2, 2),
                  ),
                )),
                Expanded(
                    child: CustomeButtom(
                  function: 'SignIn',
                  color: CustomeColor.MainScreenButtomColorFirst,
                  text: Text('SignIn'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/user.png',
                    ),
                  ),
                  topMargin: 10,
                  rightMargin: 8,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )), 

              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CustomeButtom(
                  function: 'Patient',
                  color: CustomeColor.MainScreenButtomColorFirst,
                  text: Text('Patient'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/patient.png',
                    ),
                  ),
                  rightMargin: 8,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )),
                Expanded(
                    child: CustomeButtom(
                  function: 'DoctorScreen',
                  color: CustomeColor.silver,
                  text: Text('Doctors'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/man.png',
                    ),
                  ),
                  rightMargin: 8,
                  topMargin: 8,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )),
                Expanded(
                    child: CustomeButtom(
                  function: '',
                  color: CustomeColor.MainScreenButtomColorFirst,
                  text: Text('Ptient\n Documents'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/medical-history.png',
                    ),
                  ),
                  leftMargin: 8,
                  buttonMargin: 20,
                  rightMargin: 5,
                  topMargin: 10,
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CustomeButtom(
                  function:  "InpatientScreen",
                  color: CustomeColor.MainScreenButtomColorFirst,
                  text: Text('Inpatient'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/kindpng_828434.png',
                    ),
                  ),
                  rightMargin: 8,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )),
                Expanded(
                    child: CustomeButtom(
                  function:"UploadImageMedical",
                  color: CustomeColor.silver,
                  text: Text('Radiology\n upload'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/upload.png',
                    ),
                  ),
                  rightMargin: 8,
                  topMargin: 0,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )),
                Expanded(
                    child: CustomeButtom(
                  function: '',
                  color: CustomeColor.MainScreenButtomColorFirst,
                  text: Text('Radiology\nResults'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/x-ray.png',
                    ),
                  ),
                  leftMargin: 8,
                  buttonMargin: 20,
                  rightMargin: 5,
                  topMargin: 3,
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CustomeButtom(
                  function: '',
                  color: CustomeColor.MainScreenButtomColorFirst,
                  text: Text('Admin'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/userAdmin.png',
                    ),
                  ),
                  rightMargin: 8,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )),/*
                Expanded(
                    child: CustomeButtom(
                  function: '',
                  color: CustomeColor.silver,
                  text: Text('Medical\nImages'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/Medical_Images.png',
                    ),
                  ),
                  rightMargin: 8,
                  topMargin: 8,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )),*//*
                Expanded(
                    child: CustomeButtom(
                  function: '',
                  color: CustomeColor.MainScreenButtomColorFirst,
                  text: Text('Modalities\nSettings'),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/setting.png',
                    ),
                  ),
                  leftMargin: 8,
                  rightMargin: 5,
                  buttonMargin: 20,
                  offset: Offset(-2, 2),
                )),*/
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class CustomeButtom extends StatelessWidget {
  Map<String, double> margin;
  Color color;
  Widget image;
  Widget text;
  Offset offset;
  var function;
  CustomeButtom(
      {Offset offset = const Offset(-2, -2),
      required Widget text,
      required Widget image,
      required Color color,
      double buttonMargin = 0,
      double leftMargin = 0,
      double rightMargin = 0,
      double topMargin = 0,
      required var function,
      Key? key})
      : margin = {
          "bottomMargin": buttonMargin,
          "leftMargin": leftMargin,
          "rightMargin": rightMargin,
          "topMargin": topMargin,
          "bottonMargin": buttonMargin
        },
        function = function,
        offset = offset,
        text = text,
        color = color,
        image = image,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          Navigator.pushNamed(context, function);
        } catch (e) {
         function(); 
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            bottom: margin['bottomMargin']!,
            left: margin['leftMargin']!,
            right: margin['rightMargin']!,
            top: margin['topMargin']!),
        width: 100,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(offset: offset, color: Colors.black45)],
            color: color),
        child: Column(
          children: [image, text],
        ),
      ),
    );
  }
}
