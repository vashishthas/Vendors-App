import 'package:flutter/material.dart';

class Promocode extends StatefulWidget {
  @override
  _PromocodeState createState() => _PromocodeState();
}

class _PromocodeState extends State<Promocode> {

   var codeList =['DSCSRM','DSCSRM','DSCSRM','DSCSRM'];
   var discount = [25, 35, 45, 55];
  double screenHeight,screenWidth;
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 19.0,
    color: Colors.yellow,
  );
  
  @override
  Widget build(BuildContext context) {
    screenHeight=MediaQuery.of(context).size.height;
    screenWidth=MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xff151515),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.black
          ),
        margin: EdgeInsets.symmetric(
          vertical:0.08*screenHeight,
          horizontal:0.05*screenWidth
          ),
        child: Column(
            children:<Widget> [
              Expanded(
                child: getPromocodes()
                ),
              Card(
                color:Colors.black,
                child: Row(
                  children:<Widget>[
                    Padding(
                      padding: EdgeInsets.only(left:10,right:10),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.yellow,),
                      onPressed: (){
                        print("Edit code");
                      },),
                    Text(
                      "Edit Promo codes",
                      style: textStyle,
                      )
                  ],
                ),
              ),
            ],
          ),
      ),
      );
    }
Widget getPromocodes() {
  var listCodes=ListView.builder(
    itemCount: codeList.length,
    itemBuilder: (context,index){
      return Card(
        color: Colors.black,
        child: ListTile(
          title: Text(
            codeList[index],
            style: textStyle
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(Icons.restaurant_menu)
            ),
          trailing: Text(
            '${discount[index]}% off',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
              color: Colors.white)
            ),
        ),
      );
    });
  return listCodes;
 }
}