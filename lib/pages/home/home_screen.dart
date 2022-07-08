import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';

class ListMenu {
  final String image;
  final String title;

  const ListMenu({required this.image, required this.title});
  
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
  List<ListMenu> menuItems = [
    const ListMenu(
      image: 'assets/images/checkin.png', 
      title: 'Absen Masuk'
    ),
    const ListMenu(
      image: 'assets/images/checkout.png', 
      title: 'Absen Pulang'
    ),
    const ListMenu(
      image: 'assets/images/money.png', 
      title: 'Slip Gaji'
    ),
    const ListMenu(
      image: 'assets/images/checkin.png', 
      title: 'Absen Masuk'
    ),
    const ListMenu(
      image: 'assets/images/checkout.png', 
      title: 'Absen Pulang'
    ),
    const ListMenu(
      image: 'assets/images/money.png', 
      title: 'Slip Gaji'
    ),
  ];
  
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -200,
              right: 0,
              left: 0,
              child: 
            Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.firebrik,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: NetworkImage('https://corenitymps-kbm.com/data/corenity/foto_profile/FARID.png'),
                          fit: BoxFit.cover
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 1
                        )
                      )
                    ),
                    const SizedBox(height: 10),
                    const Text('Hi, FARID',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Container(
                          height: 110,
                          width: size.width,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: Offset.zero
                              )
                            ]
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: menuItems.length,
                            separatorBuilder: (context, _) => const SizedBox(width: 5),
                            itemBuilder : (context , index) => buildMenu(menuItems: menuItems[index])
                          )
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            // Positioned(
            //   top: size.height * 0.08,
            //   left: 50,
            //   right: 50,
            //   child: 
            // ),
            // Positioned(
            //   top: size.height * 0.26,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     padding: const EdgeInsets.all(10),
            //     margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withOpacity(0.5),
            //           blurRadius: 10,
            //           offset: Offset.zero
            //         )
            //       ]
            //     ),
            //     child: Container(
            //       height: 70,
            //       child: ListView.separated(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: menuItems.length,
            //         separatorBuilder: (context, _) => const SizedBox(width: 10),
            //         itemBuilder: (context, index) => buildMenu(menuItems: menuItems[index]),
            //       ),
            //     )
            //   ),
            // )
          ],
        )
      ),
    );
  }

  Widget buildMenu({
    required ListMenu menuItems
  }) => Container(
    width: 70,
    padding: const EdgeInsets.only(top: 5),
    color: Colors.white,
    child: InkWell(
      onTap: () => {
        print(menuItems.title)
      },
      child: Column(
        children: [
          Center(
            child: Image.asset(menuItems.image, height: 40),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              menuItems.title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    )
  );
}