import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squid_games_app/models/vips.dart';
import 'package:squid_games_app/utils/app_colors.dart';
import 'package:squid_games_app/utils/widgets/custom_appbar.dart';

class VipDetails extends StatelessWidget {
  final VipModel vip;

  const VipDetails(this.vip, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isProfilePic: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50),
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInLeft(
                delay: Duration(milliseconds: 500),
                child: Text(
                  vip.vipName,
                  style: GoogleFonts.orbitron(
                      color: AppColors.whiteColor, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 2),
              FadeInLeft(
                  delay: Duration(milliseconds: 520),
                  child: Divider(color: AppColors.yellowColor, thickness: 2)),
              const SizedBox(height: 5),
              FadeInLeft(
                delay: Duration(milliseconds: 550),
                child: Text(
                  vip.vipDetails,
                  style: GoogleFonts.openSans(color: AppColors.whiteColor, fontSize: 15),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Hero(
                    tag: vip.vipImage,
                    child: Image.asset(
                      vip.vipImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
