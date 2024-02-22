import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery/src/modules/home/ui/widgets/card_product.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              const SizedBox(
                height: 55,
              ),
              Align(
                alignment: const Alignment(-0.75, 1),
                child: InkWell(
                  child: Image.asset('assets/images/menu_icon.png'),
                  onTap: () => ZoomDrawer.of(context)!.toggle(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const SizedBox(width: 33),
                  Text(
                    'Delicious \nfood for you',
                    style: GoogleFonts.balooTamma2(
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 15, bottom: 45),
                child: SearchBar(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                  leading: const Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: const Color.fromARGB(234, 255, 84, 68),
                      tabs: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Foods',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.0, bottom: 5),
                          child: Text(
                            'Drinks',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.0, bottom: 5),
                          child: Text(
                            'Snacks',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.0, bottom: 5),
                          child: Text(
                            'Frutas',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.43,
                    child: TabBarView(controller: tabController, children: [
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CardProduct(),
                          CardProduct(),
                          CardProduct(),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CardProduct(),
                          CardProduct(),
                          CardProduct(),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CardProduct(),
                          CardProduct(),
                          CardProduct(),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CardProduct(),
                          CardProduct(),
                          CardProduct(),
                        ],
                      ),
                    ]),
                  ),
                                     BottomNavigationBar(
                     showSelectedLabels: false,
                     showUnselectedLabels: false,
                     items: const [
                     BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'asda'),
                     BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'asdsa'),
                     BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: 'dasda'),
                   ])
                ],
              ),

            ]),
          ],
        ),
      ),
    ));
  }
}
