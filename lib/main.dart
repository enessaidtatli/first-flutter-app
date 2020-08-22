import 'package:flutter/material.dart';
import 'package:kurulum_demo/models/student.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";
  String seciliOgrenci = "";
  List<Students> students = [
    Students("Enes", "Tatlı", 70),
    Students("Rose", "Loı", 30),
    Students("Boys", "Foll", 45)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  String sinavHesapla(int not) {
    String mesaj = "";
    if (not >= 50) {
      mesaj = "Geçti";
    } else if (not >= 40) {
      mesaj = "Bütünlemeye Kaldı";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/photos/food-background-with-assortment-of-fresh-organic-fruits-and-picture-id1203599963"),
                  ),
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Sınavdan aldığı not: " +
                      students[index].grade.toString() +
                      "[" +
                      students[index].getStatus +
                      "]"),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      seciliOgrenci = students[index].firstName +
                          " " +
                          students[index].lastName;
                    });
                  },
                );
              }),
        ),
        Text("Seçili Öğrenci:" + seciliOgrenci),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text("Yeni Öğrenci"),
                  ],
                ),
                onPressed: () {
                  var mesaj = sinavHesapla(55);
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.cyanAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  var mesaj = sinavHesapla(55);
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  var mesaj = sinavHesapla(55);
                  mesajGoster(context, mesaj);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.stop);
    } else {
      return Icon(Icons.clear);
    }
  }
}
