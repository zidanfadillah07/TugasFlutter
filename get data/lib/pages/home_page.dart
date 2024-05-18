import 'package:flutter_application_4/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/widgets/bottom_navigasi.dart';

class Homepage extends StatelessWidget {
  final List<item> items = [
    item(
        name: 'RTX 4070',
        price: 15000000,
        description:
            'Get equipped for supercharged gaming and creating with NVIDIA® GeForce RTX™ 4070 Ti SUPER, RTX 4070 SUPER, RTX 4070 Ti, and RTX 4070 graphics cards. They’re built with the ultra-efficient NVIDIA Ada Lovelace architecture. Experience super fast ray tracing, AI-accelerated performance with DLSS 3, new ways to create, and much more.',
        ImagePath:
            'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/5/4/6bb9d3a9-cbe5-46ae-b428-f2b1b3b00617.png'),
    item(
        name: 'GTX 1650 Super',
        price: 3000000,
        description:
            'Nikmati performa grafis tangguh dari arsitektur NVIDIA Turing pemenang penghargaan dengan kartu grafis dan laptop GeForce® GTX 16 Series.',
        ImagePath:
            'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/9/12/08e4d3cc-3adb-4d2e-b989-b6edffc2af55.jpg'),
    item(
        name: 'RTX 3080 TI',
        price: 10000000,
        ImagePath:
            'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/11/6/704213b2-5c9a-4664-92e8-a71a15721d39.png',
        description:
            'Kartu grafis GeForce RTX™ 3080 Ti dan RTX 3080 menghadirkan performa super yang sangat diinginkan para penggemar game dan didukung oleh Ampere, arsitektur RTX generasi ke-2 NVIDIA. Dibangun dengan RT Core dan Tensor Core yang disempurnakan, multiprosesor streaming baru, dan memori G6X super cepat untuk pengalaman game yang luar biasa.'),
    item(
        name: 'RTX 3080',
        price: 10000000,
        ImagePath:
            'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/11/6/704213b2-5c9a-4664-92e8-a71a15721d39.png',
        description:
            'Kartu grafis GeForce RTX™ 3080 Ti dan RTX 3080 menghadirkan performa super yang sangat diinginkan para penggemar game dan didukung oleh Ampere, arsitektur RTX generasi ke-2 NVIDIA. Dibangun dengan RT Core dan Tensor Core yang disempurnakan, multiprosesor streaming baru, dan memori G6X super cepat untuk pengalaman game yang luar biasa.'),
    item(
        name: 'RTX 3080',
        price: 10000000,
        ImagePath:
            'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/11/6/704213b2-5c9a-4664-92e8-a71a15721d39.png',
        description:
            'Kartu grafis GeForce RTX™ 3080 Ti dan RTX 3080 menghadirkan performa super yang sangat diinginkan para penggemar game dan didukung oleh Ampere, arsitektur RTX generasi ke-2 NVIDIA. Dibangun dengan RT Core dan Tensor Core yang disempurnakan, multiprosesor streaming baru, dan memori G6X super cepat untuk pengalaman game yang luar biasa.'),
    item(
        name: 'RTX 3080',
        price: 10000000,
        ImagePath:
            'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/11/6/704213b2-5c9a-4664-92e8-a71a15721d39.png',
        description:
            'Kartu grafis GeForce RTX™ 3080 Ti dan RTX 3080 menghadirkan performa super yang sangat diinginkan para penggemar game dan didukung oleh Ampere, arsitektur RTX generasi ke-2 NVIDIA. Dibangun dengan RT Core dan Tensor Core yang disempurnakan, multiprosesor streaming baru, dan memori G6X super cepat untuk pengalaman game yang luar biasa.')
  ];

  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Tokomedia"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            var itemData = {
              "name": item.name,
              "price": item.price,
              "description": item.description,
              "ImagePath": item.ImagePath,
            };
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: itemData);
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(item.ImagePath),
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 8),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.name,
                          style: TextStyle(
                            fontSize:
                                20, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.price.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize:
                                20, 
                            fontWeight: FontWeight
                                .bold, 
                          ),
                        ),
                      ),  
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNav(selectedItem: 0),
    );
  }
}
