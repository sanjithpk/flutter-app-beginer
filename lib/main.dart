import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/FirstScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(MaterialApp(
    title: "My New App",
    theme: ThemeData(primarySwatch: Colors.red, brightness: Brightness.light),
    home: FirstScreen()
  ));

}
class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
  
}

class _HomeWidgetState extends State<HomeWidget>{
  bool color = true;
  List apiData;

  @override
  void initState(){
    super.initState();
    print("Working");
    fetchData();
  }

  fetchData()async{
    var url = "http://dummy.restapiexample.com/api/v1/employees";
    print("before");
    var response = await http.get(url);
    print("response ${response}");
    print("after");

    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      setState(() {
       apiData = jsonResponse; 
      });
    } else {
      print("Request failed with status : ${response.statusCode}.");
    }

  }



  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        //color: color ? Colors.blue : Colors.black,
        child: apiData == null 
          ? CircularProgressIndicator()
          : ListView.builder(
            itemCount: apiData.length,
            itemBuilder: (context,index){
              return ListTile(
                leading: CircleAvatar(
                  child: Text("$index"),
                ),
                trailing: Text("${apiData[index]["employee_age"]}"),
                title: Text("${apiData[index]["employee_name"]}"),
                subtitle: Text("${apiData[index]["employee_salary"]}"),
                );
            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: (){
          setState(() {
           color = !color; 
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


// class HomeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(),
//       //backgroundColor: Colors.cyan,
//       appBar: AppBar(
//         title: Text("My Header"),
//       ),
//         body: ListView.builder(
//           itemCount: 50,
//           itemBuilder: (context,index){
//             return Card(
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundImage: // Container(decoration: BoxDecoration(image: DecorationImage(image:)),)// Image.asset("assets.pic1.jpg",),
//                 ),
//                 trailing: Text("2:10"),
//                 title: Text("User Name"),
//                 subtitle: Text("Subtitle"),
//               ),);
            
//             // return Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Row(
//             //       children:     <Widget>[                
//             //         CircleAvatar(    
//             //           backgroundColor: Colors.blue,    
//             //           child: Text("$index"),    
//             //         ),
//             //         Column(
//             //           children: <Widget>[
//             //             Padding(
//             //               padding: const EdgeInsets.all(top:8.0,left:
//             //                 Text("User Name"),
//             //               )
                           

//             //             ),
//             //             Text("")
//             //           ],
//             //         ),  
//             //       ],
//             //      ),
//             //      Padding(
//             //        padding: const EdgeInsets.all(18.0),
//             //        child: Text("2:10"),
//             //      )
//             //     ],
//             //   );
//             },
//         ),
        
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){},
//         child: Icon(Icons.add),),
//     );
//   }
// }
