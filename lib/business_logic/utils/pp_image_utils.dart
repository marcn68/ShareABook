// import 'dart:html';

// import 'package:path/path.dart' as path;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageUtils {
//   void _showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return SafeArea(
//             child: Container(
//               child: new Wrap(
//                 children: <Widget>[
//                   new ListTile(
//                       leading: new Icon(Icons.photo_library),
//                       title: new Text('Photo Library'),
//                       onTap: () {
//                         _imgFromGallery();
//                         Navigator.of(context).pop();
//                       }),
//                   new ListTile(
//                     leading: new Icon(Icons.photo_camera),
//                     title: new Text('Camera'),
//                     onTap: () {
//                       _imgFromCamera();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   _imgFromCamera() async {
//     // ignore: deprecated_member_use
//     File image = await ImagePicker.pickImage(
//         source: ImageSource.camera, imageQuality: 50);

//     String dir = path.dirname(image.path);
//     String newPath = path.join(dir, widget.contact.id.toString() + '.jpg');
//     File file = new File(newPath);
//     if (file.existsSync()) {
//       file.deleteSync();
//     }
//     image.renameSync(newPath);

//     setState(() {
//       _image = file;
//     });
//   }

//   _imgFromGallery() async {
//     // ignore: deprecated_member_use
//     File image = await ImagePicker.pickImage(
//         source: ImageSource.gallery, imageQuality: 50);

//     String dir = path.dirname(image.path);
//     String newPath = path.join(dir, widget.contact.id.toString() + '.jpg');
//     image.renameSync(newPath);

//     File file = new File(newPath);

//     setState(() {
//       _image = file;
//     });
//   }
// }
