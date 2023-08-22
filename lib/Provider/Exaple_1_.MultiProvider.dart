import 'package:async_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GioiTinh()),
        ChangeNotifierProvider(create: (_) => BangCap())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp3(),
      ),
    ),
  );
}

enum gioi_tinh { nam, nu }

enum bang_cap { CaoDang, DaiHoc, ThacSi, TienSi }

class GioiTinh with ChangeNotifier {
  gioi_tinh? _gioiTinh = gioi_tinh.nam;
  gioi_tinh? get getGioiTinh => _gioiTinh;
  set setGioiTinh(gioi_tinh? value) {
    _gioiTinh = value;
    notifyListeners();
  }
}

class BangCap with ChangeNotifier {
  bang_cap? _bangCap = bang_cap.DaiHoc;
  bang_cap? get getBangCap => _bangCap;
  set setBangCap(bang_cap? value) {
    _bangCap = value;
    notifyListeners();
  }
}

class MyApp3 extends StatefulWidget {
  const MyApp3({super.key});

  @override
  State<MyApp3> createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  gioi_tinh? GT = gioi_tinh.nam;
  bang_cap? BC = bang_cap.DaiHoc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio  Demo"),
      ),
      body: Consumer2<GioiTinh, BangCap>(
        builder: (context, infoGTinh, infoBCap, child) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Giới Tính"),
              RadioListTile<gioi_tinh>(
                value: gioi_tinh.nam,
                title: const Text('Nam'),
                secondary: const Icon(Icons.male),
                groupValue: GT,
                onChanged: (gioi_tinh? value) {
                  setState(() {
                    GT = value;
                  });
                },
              ),
              RadioListTile<gioi_tinh>(
                value: gioi_tinh.nu,
                title: const Text('Nữ'),
                secondary: const Icon(Icons.female),
                groupValue: GT,
                onChanged: (gioi_tinh? value) {
                  setState(() {
                    GT = value;
                  });
                },
              ),
              const Text("Bằng Cấp"),
              RadioListTile<bang_cap>(
                value: bang_cap.CaoDang,
                title: const Text('Cao Đẳng'),
                secondary: const Icon(Icons.female),
                groupValue: BC,
                onChanged: (bang_cap? value) {
                  setState(() {
                    BC = value;
                  });
                },
              ),
              RadioListTile<bang_cap>(
                value: bang_cap.DaiHoc,
                title: const Text('Đại Học'),
                secondary: const Icon(Icons.female),
                groupValue: BC,
                onChanged: (bang_cap? value) {
                  setState(() {
                    BC = value;
                  });
                },
              ),
              RadioListTile<bang_cap>(
                value: bang_cap.ThacSi,
                title: const Text('Thạc sĩ'),
                secondary: const Icon(Icons.female),
                groupValue: BC,
                onChanged: (bang_cap? value) {
                  setState(() {
                    BC = value;
                  });
                },
              ),
              RadioListTile<bang_cap>(
                value: bang_cap.TienSi,
                title: const Text('Tiến Sĩ'),
                secondary: const Icon(Icons.female),
                groupValue: BC,
                onChanged: (bang_cap? value) {
                  setState(() {
                    BC = value;
                  });
                },
              ),
              const Divider(height: 100),
              Center(
                child: Text("Thông tin các nhân : ${GT.toString()}"),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Text("Bằng Cấp hiện tại : ${BC.toString()}"),
              ),
            ],
          );
        },
      ),
    );
  }
}

// class MyApp2 extends StatelessWidget {
//   const MyApp2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     gioi_tinh? _character = gioi_tinh.nam;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Radio  Demo"),
//       ),
//       body: Consumer2<GioiTinh, BangCap>(
//         builder: (context, infoGTinh, infoBCap, child) {
//           return Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("Gioi Tinh"),
//               RadioListTile<gioi_tinh>(
//                 value: gioi_tinh.nam,
//                 title: const Text('Nam'),
//                 secondary: const Icon(Icons.male),
//                 groupValue: infoGTinh._gioiTinh,
//                 onChanged: (gioi_tinh? value) {
//                   setState(() {
//                     _character = value;
//                   });
//                 },
//               ),
//               RadioListTile<gioi_tinh>(
//                 value: gioi_tinh.nu,
//                 title: const Text('Nữ'),
//                 secondary: const Icon(Icons.female),
//                 groupValue: infoGTinh._gioiTinh,
//                 onChanged: (gioi_tinh? value) {
//                   setState(() {
//                     infoGTinh._gioiTinh = value;
//                   });
//                 },
//               ),
//               const Text("Bang Cap"),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
