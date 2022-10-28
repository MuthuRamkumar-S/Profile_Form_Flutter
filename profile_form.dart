import 'package:digisailor/MyDrawer.dart';
import 'package:digisailor/colour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState(emailid: '' );
}

class _profileState extends State<profile> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  } on PlatformException catch (e) {
      print('Failled to pick image: $e');
    }
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        drawer: MyDrawer(),

        //AppBor

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Profile",
            style: TextStyle(color: primaryColor),),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(
                     children: [Padding(
                       padding: EdgeInsets.only(top: 20.0),
                       child: Container(
                           child: CircleAvatar(
                             radius: 85,
                             backgroundColor: primaryColor,
                             child: ClipOval(
                               child:SizedBox(
                                 height: 160.0,
                                 width: 160.0,
                                 child: image !=null? Image.file(
                                     image!,
                                 width: 160,
                                 height: 160,
                                 fit: BoxFit.cover,) 
                                     : Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNL_ZnOTpXSvhf1UaK7beHey2BX42U6solRA&usqp=CAU")
                               ),
                             ),
                           )
                       ),
                     ),
                       Positioned(
                         right: 10,
                         bottom: 10,
                           child:InkWell(
                             child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.add_a_photo,
                              color: Colors.white,
                                  size: 25,
                              ),
                              decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(100),
                                color: primaryColor
                              ),
                            ),
                            onTap: () {
                               showDialog(
                  context: context, builder: (BuildContext){
                               return SimpleDialog(
                                 title: Text("Choose"),
                                 children: <Widget>[
                                   TextButton.icon(
                                   icon: Icon(Icons.camera_alt,
                                   color: primaryColor
                                     ,),
                                   onPressed: () {
                                     pickImage(ImageSource.camera);
                                     Navigator.of(context).pop();
                                   },
                                   label: Text("Camera",
                                   style: TextStyle(
                                       color: primaryColor,
                                   fontSize: 20
                                   ),
                                   ),
                                 ),
                                   TextButton.icon(
                                       onPressed: () async{
                                         pickImage(ImageSource.gallery );
                                         Navigator.of(context).pop();
                                       },
                                       icon: Icon(Icons.photo
                                         ,color: primaryColor,),
                                       label: Text("Gallery",
                                       style: TextStyle(
                                           color: primaryColor,
                                       fontSize: 20),
                                      )
                                   ),
                                 ],
                                 );
                                  }
                               );
                             },
                           ) ,
                       )
                    ]
                ),

                Padding(
                  padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20, 30,MediaQuery.of(context).size.width/20, 0),
                  child: TextFormField(
              decoration: InputDecoration(
              labelText:"Name",
                  labelStyle: TextStyle(color: primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:primaryColor )
                  ),
                  prefixIcon: Icon(Icons.person,color: primaryColor),
              ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20, 30,MediaQuery.of(context).size.width/20, 0),
                  child: TextFormField(
              decoration: InputDecoration(
              labelText:"Phone No.",
                  labelStyle: TextStyle(color: primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:primaryColor )
                  ),
                  prefixIcon: Icon(Icons.phone_outlined,color: primaryColor),
              ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20, 30,MediaQuery.of(context).size.width/20, 0),
                  child: TextFormField(
              decoration: InputDecoration(
              labelText:"Age",
                  labelStyle: TextStyle(color: primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:primaryColor )
                  ),
                  prefixIcon: Icon(Icons.access_time_filled,color: primaryColor),
              ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20, 30,MediaQuery.of(context).size.width/20, 0),
                  child: TextFormField(
              decoration: InputDecoration(
              labelText:"Gender",
                  labelStyle: TextStyle(color: primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:primaryColor )
                  ),
                  prefixIcon: Icon(Icons.face,color: primaryColor),
              ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20, 30,MediaQuery.of(context).size.width/20, 0),
                  child: TextFormField(
              decoration: InputDecoration(
              labelText:"DOB",
                  labelStyle: TextStyle(color: primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:primaryColor )
                  ),
                  prefixIcon: Icon(Icons.date_range_outlined,color: primaryColor),
              ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: (){},
                          child:Text("Cancel",
                          style: TextStyle(
                            fontSize: 20
                          ),),

                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    ElevatedButton(
                        style:ElevatedButton.styleFrom(primary: primaryColor),
                        onPressed: (){},
                        child: Text("Save",
                          style:TextStyle(fontSize: 20) ,))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
