import 'package:bab_el_ezz/features/auth/view/login_view.dart';
import 'package:bab_el_ezz/features/staff/view/staff_page.dart';
import 'package:bab_el_ezz/features/workshop/view/work_shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../features/invoices/view/invoice_page.dart';
import '../../features/store/view/store_page.dart';
import '../../features/store/widget/store_table.dart';
import '../../generated/assets.dart';
import '../../shared_utils/styles/colors.dart';

class LayOut extends StatefulWidget {
  const LayOut({Key? key}) : super(key: key);

  @override
  State<LayOut> createState() => _NavBarState();
}

class _NavBarState extends State<LayOut> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const WorkShopPage(),
     const LoginView(),
    const InvoicePage(),
    const StaffPage(),
    const StorePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: ColorsAsset.kGreen),
        backgroundColor: Colors.black,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        // selectedItemColor: ColorsAsset.kGreen,
        unselectedItemColor: Colors.white,
        fixedColor: ColorsAsset.kGreen,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.imagesWorsha,
                color: _currentIndex == 0 ? ColorsAsset.kGreen : Colors.white,
              ),
              label: 'الورشة'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.imagesAnalysis,
                color: _currentIndex == 1 ? ColorsAsset.kGreen : Colors.white,
              ),
              label: 'تحليل البيانات'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.imagesFawater,
                color: _currentIndex == 2 ? ColorsAsset.kGreen : Colors.white,
              ),
              label: 'الفواتير'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.images3amelen,
                color: _currentIndex == 3 ? ColorsAsset.kGreen : Colors.white,
              ),
              label: 'العاملين'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.imagesStore,
                color: _currentIndex == 4 ? ColorsAsset.kGreen : Colors.white,
              ),
              label: 'المخزن'),
        ],
      ),
    );
  }
}
