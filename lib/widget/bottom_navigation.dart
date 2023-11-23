import 'package:ergo_delivery/screens/Client/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientBottomNavigation extends StatelessWidget {
  const ClientBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/heroicons-solid_home.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/user.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_sharp-history.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        )
      ],
      onTap: (value) {
        if (value == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavouriteScreen(),
            ),
          );
        }

        if (value == 1) Navigator.pushNamed(context, '/extra');

        if (value == 2) Navigator.pushNamed(context, '/extra');

        if (value == 3) Navigator.pushNamed(context, '/extra');
      },
    );
  }
}
