import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String s='';String res='';
void getdata(var a){
setState(() {
  s=s+a;
  if(a=='clear'){
    s='';res='';
  }
});



}


  @override
  Widget build(BuildContext context) {
var value=['1','2','3','sin','+','4','5','6','cos','-','7','8','9',
  'tan','/','clear','0','(',')','*','.','pi','e','^','%'];

    return Scaffold(
        appBar: AppBar(


          title: Text('Calculator',style: TextStyle(fontSize: 40,fontWeight: FontWeight.normal),),
          backgroundColor: Colors.red,

        ),

        body:

           Column(
             children: [
               Expanded(flex: 1,
                 child: SingleChildScrollView(scrollDirection:Axis.horizontal ,
                   child: Container(height: 300,
                     width: 500,
                     color: Colors.black,
child: Center(child: Column(
  children: [
        Text(s,style: TextStyle(fontSize: 40,color: Colors.white),),
    Text('result: $res',style: TextStyle(fontSize: 40,color: Colors.white,),),
  ],
)),
             ),
                 ),
               ),
               Expanded(flex: 3,
                 child: Container(height: 350,color: Colors.black,
                   child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                       itemBuilder: (context, index) {
                         return
                           InkWell(onTap: (){
getdata(value[index]);
                           },
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: (
                             CircleAvatar(child: Text(value[index],style: TextStyle(fontSize: 25,color: Colors.black),),
backgroundColor: Colors.orange,
                             )
                             ),
                           ),
                         );
                       },itemCount: value.length,),
                 ),
               ),
               Expanded(
                   flex: 1,
                   child: Container(width: 500,
                       color: Colors.black,
                       child: InkWell(
                           onTap: (){
                             setState(() {
final b=s.interpret();
res=b.toString();
                             });
                           },
                           child: Center(child: Text('calculate',style: TextStyle(fontSize: 40,color: Colors.white),)))))
             ],
           )



            );

  }
}
