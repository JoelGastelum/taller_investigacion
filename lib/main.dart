import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: Inicio( ),
    );
  }
}

class Inicio extends StatefulWidget {


  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        bottomNavigationBar: BottomNavigationBar(

          backgroundColor: Color.fromARGB(180,234,244,255) ,
        items: [
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('hablar.jpeg') , width: 118 , height:  118,),
            title: Text('') ,
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('estudiar.jpeg') , width: 118 , height:  118,),
            title: Text(""),

          )
        ],
          onTap: (index){
            if(index==0)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
            else
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EducacionMain()),
              );
          }
          ,
      ),
     body:Container(
         child:   Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Image.asset("fondo.jpeg"),
             ]
         )
     )
    );
        }
}


class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title:Text("Beta 2.0"),
        centerTitle: true,
      ),
      body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
               child: Row(
                 children: [
                   FlatButton(
                      onPressed:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Emociones()),
                        );
                      },
                       child: CuadroData('yo.jpeg','Yo')
                   )
                 ],
               ),
             )


          ],
        )
    );
  }
}

class Emociones extends StatefulWidget {
  @override
  _EmocionesState createState() => _EmocionesState();
}

class _EmocionesState extends State<Emociones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:Text("Emociones"),
          centerTitle: true,
        ),
        body:
        ListView(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CuadroData('asustado.jpeg',''),
                  CuadroData('enojado.jpeg','')
                ],
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CuadroData('feliz.jpeg',''),
                  CuadroData('triste.jpeg','')
                ],
              ),
            ),
          ],
        )
    );
  }
}


class CuadroData extends StatelessWidget {
  String imagen;
  String descripcion;

  CuadroData(this.imagen,this.descripcion);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Image(image: AssetImage(this.imagen),
          width: 200,
        ),
        if(this.descripcion != '')
        Container(
          width: 50,
          child: Center(child:Text(this.descripcion)),
          decoration: BoxDecoration(
          border: Border.all(
          color:Colors.black,
          width: 4
            )
          ),
        )
      ]);
  }
}
class EducacionMain extends StatefulWidget {
  @override
  _EducacionMainState createState() => _EducacionMainState();
}

class _EducacionMainState extends State<EducacionMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:Text("Educación"),
          centerTitle: true,
        ),
        body:
        ListView(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                FlatButton(onPressed: ()  => {
                    Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Curso1()),
                   )
                }, child:  CuadroData('curso1.png',''))


                ],
              ),
            ),
          ],
        )
    );
  }
}

class Curso1 extends StatefulWidget {
  @override
  _Curso1State createState() => _Curso1State();
}

class _Curso1State extends State<Curso1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Curso 1"),
          centerTitle: true,
        ),
        body:
        ListView(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(padding: EdgeInsets.all(85),
                      child: CuadroData('hambriento.jpg', ''))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 135),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RaisedButton(onPressed: () {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      text: 'Has acertado!',
                      title: 'Es correcto!',
                      autoCloseDuration: Duration(seconds: 2),
                    );
                  }, child: Text("Hambriento"),),
                    RaisedButton(onPressed: () {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: 'Has fallado!',
                        title: 'Piensalo 2 veces para la proxima!',
                        autoCloseDuration: Duration(seconds: 100),
                      );
                    }, child: Text("Triste"),)
                ],
              ),
            )
          ],
        )
    );
  }
}

