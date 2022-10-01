import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
        height: 280,
        width: 300,
        color: Colors.white,
        child: Column(children: [
          Container(
            height: 100,
            color: Colors.grey.withOpacity(.2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-photo/smile-happiness-nurse-medical-arab-strong_1291-31.jpg?w=996&t=st=1664639131~exp=1664639731~hmac=f4365a866d8d9ee7b13c866efcbf8f088f9ab92a1946e722b697021248ccb61d"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: "دكتور",
                                  children: [
                                    TextSpan(
                                        text: " محمد محمود توفيق",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF5a8ebd),
                                            fontWeight: FontWeight.bold)),
                                  ],
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xFF2070ab)))),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  text:
                                      " استشاري جراحات الكلى و المسالك البولية و التناسلية",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star_half,
                                color: Colors.blue,
                                size: 15,
                              ),
                            ],
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "التقييم العام من ١٠٤ زاروا الدكتور ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF7c7c7c),
                                  )))
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          Row(
            children: [
              Image(
                  height: 50,
                  width: 50,
                  image: AssetImage(
                      'assets/assets_phone_round2/icons/doctor_headphone.png')),
              Flexible(
                child: new Container(
                  padding: new EdgeInsets.only(right: 13.0),
                  child: new Text(
                    """ دكتور اسنان متخصص في زراعة اسنان، اسنان مسنين، تركيبات اسنان، تقويم اسنان، حشو وعلاج الجذور والاعصاب، تجميل اسنان، علاج اللثة، اسنان اطفال و اسنان بالغين """,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF939393),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Image(
                    height: 30,
                    width: 30,
                    image: AssetImage(
                        'assets/assets_phone_round2/icons/dollar.png')),
                Flexible(
                  child: new Container(
                    padding: new EdgeInsets.only(right: 13.0),
                    child: new Text(
                      """  150 """,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF939393),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(Icons.comment),
                Flexible(
                  child: new Container(
                    padding: new EdgeInsets.only(right: 13.0),
                    child: new Text(
                      """  ٦٦٧٦ - سعر مكالمة عادية """,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF939393),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                      height: 50,
                      color: Colors.grey.withOpacity(0.1),
                      child: Center(child: Text("متاح اليوم الساعة 12م")))),
              Container(
                  height: 50,
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () => null,
                    child: Text("احجز الان",
                        style: TextStyle(color: Colors.white)),
                  ))
            ],
          )
        ]));
  }
}

//استشاري جراحات الكلى و المسالك البولية و التناسلية
class DoctorsScreen extends StatelessWidget {
  DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(title: Text("عظام"),
            leading: Icon(Icons.arrow_back),
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 34, 107, 235).withOpacity(0.9),
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "ابحث  باسم الدكتور او المستشفي",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder()),
                    )),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey)),
                        child: TextButton.icon(
                          icon: Icon(Icons.filter_alt, color: Colors.grey),
                          onPressed: () => null,
                          label: Text("التصفية",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.8))),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey)),
                        height: 50,
                        child: TextButton(
                          onPressed: () => null,
                          child: Text("احجز الان",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.8))),
                        )),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20);
                    },
                    itemBuilder: (context, index) {
                      return ItemList();
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Colors.blue, Colors.red],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
