import 'package:finance/data/current_activity_mock.dart';
import 'package:finance/data/send_recent_mock.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _account(),
            _promotion(),
            _recentsend(context),
            _currentActivity()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MaterialButton(
        onPressed: () {},
        color: primaryColor,
        height: 54,
        minWidth: 40,
        elevation: 10,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Iconsax.barcode,
                color: Colors.white,
              ),
            ),
            Text(
              'New Payment',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Iconsax.add,
                size: 24,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _currentActivity() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Activity',
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(14),
                      hintText: 'Search Transaction',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      prefixIcon: const Icon(
                        Iconsax.search_favorite,
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
                minWidth: 48,
                child: const Icon(
                  Iconsax.filter,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            itemCount: currentActivity.length,
            itemExtent: 64,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ListTile(
              onTap: () {},
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: currentActivity[index].expenseType == 1
                        ? Colors.green
                        : Colors.red.withOpacity(0.7),
                    shape: BoxShape.circle),
                child: const Icon(
                  Iconsax.add,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${currentActivity[index].profileName}',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${currentActivity[index].date}',
                    style: GoogleFonts.poppins(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${currentActivity[index].amount}',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    currentActivity[index].expenseType == 1
                        ? 'Incomming transfers'
                        : 'Outing transfers',
                    style: GoogleFonts.poppins(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _recentsend(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xff0a1a34)),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 8,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            Text(
              'Recent Send',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 86,
              child: ListView.builder(
                itemCount: sendRecentMock.length,
                shrinkWrap: true,
                itemExtent: 78,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: SizedBox(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                              '${sendRecentMock[index].profileUrl}'),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${sendRecentMock[index].profileName}',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _promotion() {
    return Container(
      decoration: BoxDecoration(color: primaryColor),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff0a1a34),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              'You have saved \$10 in the last 30 days',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Container _account() {
    return Container(
      decoration: BoxDecoration(color: primaryColor),
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage('assets/mahdi.jpg')),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning.',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Montree MT',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {},
                  color: const Color(0xff2656c3),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Iconsax.notification5,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TabBar(
              isScrollable: true,
              indicatorPadding: const EdgeInsets.only(top: 4, bottom: 5),
              controller: _tabController,
              padding: EdgeInsets.only(bottom: 10),
              indicatorColor: Colors.white,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              labelStyle: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              indicator: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24))),
              tabs: const [
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Tab(
                    text: 'Dashboard',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Tab(
                    text: 'Cards',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Tab(
                    text: 'Analytics',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Tab(
                    text: 'Recurring',
                  ),
                )
              ],
            ),
            const SizedBox(height: 34),
            Column(
              children: [
                Text(
                  'Balance',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '\$376,600',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 46,
                      fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
