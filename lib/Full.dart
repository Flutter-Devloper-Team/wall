import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FullPage extends StatefulWidget {
  const FullPage({Key? key}) : super(key: key);

  @override
  State<FullPage> createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {
  RewardedAd? rewardedAd;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          print("RewardedAd Ad Loaded");
          setState(() {
            rewardedAd = ad;
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (error) {
          print("RewardedAd Ad Failed to Load");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    // int columnCount = 3;
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Full Ads"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {
            // Get.to(PhotoScreen());
            rewardedAd!.show(onUserEarnedReward: (ad, reward) {
              print("User Watched complete video\n User Earned Reward");
            });
          },
          child: GridView.builder(
            itemCount: photos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return Image.network(
                photos[index],
                fit: BoxFit.cover,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  return child;
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Home screen"),
    //   ),
    //   body: AnimationLimiter(
    //     child: GridView.count(
    //       crossAxisSpacing: 5,
    //       mainAxisSpacing: 5,
    //       physics: BouncingScrollPhysics(
    //           parent: AlwaysScrollableScrollPhysics()),
    //       padding: EdgeInsets.all(w / 60),
    //       crossAxisCount: columnCount,
    //       children: List.generate(photos.length, (index) {
    //         return AnimationConfiguration.staggeredGrid(
    //           position: index,
    //           duration: Duration(seconds: 1),
    //           columnCount: columnCount,
    //           child: ScaleAnimation(
    //             duration: Duration(seconds: 2),
    //             curve: Curves.fastLinearToSlowEaseIn,
    //             scale: 1.5,
    //             child: FadeInAnimation(
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   // color: Colors.grey,
    //                   border: Border.all(color: Colors.black,width: 2),
    //                   image: DecorationImage(
    //                       image: NetworkImage(
    //                         photos[index],
    //                       ),
    //                       fit: BoxFit.cover),
    //                   // color: Colors.white,
    //                   borderRadius: BorderRadius.all(Radius.circular(20)),
    //                   boxShadow: [
    //                     BoxShadow(
    //                         color: Colors.grey.withOpacity(0.3),
    //                         blurRadius: 80,
    //                         spreadRadius: 10),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       }),
    //     ),
    //   ),
    // );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Home Full Ads"),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(5),
    //     child: GestureDetector(
    //       onTap: () {
    //         // Get.to(PhotoScreen());
    //         rewardedAd!.show(onUserEarnedReward: (ad, reward) {
    //           print("User Watched complete video\n User Earned Reward");
    //         });
    //       },
    //       child: GridView.builder(
    //         itemCount: photos.length,
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 5,
    //           mainAxisSpacing: 5,
    //         ),
    //         itemBuilder: (context, index) {
    //           return Image.network(
    //             photos[index],
    //             fit: BoxFit.cover,
    //             frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
    //               return child;
    //             },
    //             loadingBuilder: (context, child, loadingProgress) {
    //               if (loadingProgress == null) {
    //                 return child;
    //               } else {
    //                 return Center(
    //                   child: CircularProgressIndicator(),
    //                 );
    //               }
    //             },
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}

List photos = [
  'https://images.pexels.com/photos/13221455/pexels-photo-13221455.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14558307/pexels-photo-14558307.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14175961/pexels-photo-14175961.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14417243/pexels-photo-14417243.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14156051/pexels-photo-14156051.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13633612/pexels-photo-13633612.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14320966/pexels-photo-14320966.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14430248/pexels-photo-14430248.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13539516/pexels-photo-13539516.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/10515556/pexels-photo-10515556.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14549885/pexels-photo-14549885.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14320969/pexels-photo-14320969.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14501747/pexels-photo-14501747.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14557288/pexels-photo-14557288.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14148025/pexels-photo-14148025.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14448251/pexels-photo-14448251.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14375895/pexels-photo-14375895.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13790634/pexels-photo-13790634.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13927178/pexels-photo-13927178.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14339163/pexels-photo-14339163.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14530144/pexels-photo-14530144.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/4722014/pexels-photo-4722014.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/8419256/pexels-photo-8419256.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/6663594/pexels-photo-6663594.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/5950741/pexels-photo-5950741.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/5328300/pexels-photo-5328300.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/2904619/pexels-photo-2904619.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/6076455/pexels-photo-6076455.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/4586899/pexels-photo-4586899.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13766972/pexels-photo-13766972.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/12320015/pexels-photo-12320015.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/10134609/pexels-photo-10134609.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/6614225/pexels-photo-6614225.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/5253705/pexels-photo-5253705.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/12354694/pexels-photo-12354694.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/4113634/pexels-photo-4113634.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14020212/pexels-photo-14020212.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/10897657/pexels-photo-10897657.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14024306/pexels-photo-14024306.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14428779/pexels-photo-14428779.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/12197229/pexels-photo-12197229.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/11664908/pexels-photo-11664908.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/7242492/pexels-photo-7242492.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/6045384/pexels-photo-6045384.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/8916595/pexels-photo-8916595.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/8851505/pexels-photo-8851505.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14029041/pexels-photo-14029041.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/4226107/pexels-photo-4226107.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14464893/pexels-photo-14464893.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14344777/pexels-photo-14344777.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14532811/pexels-photo-14532811.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13771250/pexels-photo-13771250.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14506446/pexels-photo-14506446.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14544821/pexels-photo-14544821.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13660395/pexels-photo-13660395.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14524017/pexels-photo-14524017.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14320924/pexels-photo-14320924.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/5669066/pexels-photo-5669066.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/6821323/pexels-photo-6821323.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14518599/pexels-photo-14518599.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14197334/pexels-photo-14197334.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14413853/pexels-photo-14413853.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/4453710/pexels-photo-4453710.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14501733/pexels-photo-14501733.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14513726/pexels-photo-14513726.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13950924/pexels-photo-13950924.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/10214701/pexels-photo-10214701.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14353716/pexels-photo-14353716.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13876686/pexels-photo-13876686.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14538638/pexels-photo-14538638.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13794447/pexels-photo-13794447.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14365634/pexels-photo-14365634.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14020091/pexels-photo-14020091.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14353076/pexels-photo-14353076.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/12068705/pexels-photo-12068705.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14277722/pexels-photo-14277722.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13991587/pexels-photo-13991587.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/4586873/pexels-photo-4586873.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14084841/pexels-photo-14084841.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14353056/pexels-photo-14353056.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14055574/pexels-photo-14055574.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14286903/pexels-photo-14286903.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14538431/pexels-photo-14538431.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14481421/pexels-photo-14481421.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14353713/pexels-photo-14353713.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/7235331/pexels-photo-7235331.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14504613/pexels-photo-14504613.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/8214192/pexels-photo-8214192.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/12938820/pexels-photo-12938820.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14320918/pexels-photo-14320918.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14491787/pexels-photo-14491787.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14437082/pexels-photo-14437082.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13449836/pexels-photo-13449836.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/10460969/pexels-photo-10460969.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13301571/pexels-photo-13301571.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/11919862/pexels-photo-11919862.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/7539367/pexels-photo-7539367.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14531185/pexels-photo-14531185.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14313933/pexels-photo-14313933.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13463127/pexels-photo-13463127.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13379797/pexels-photo-13379797.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/6963605/pexels-photo-6963605.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13768449/pexels-photo-13768449.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/6496270/pexels-photo-6496270.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14353079/pexels-photo-14353079.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14398103/pexels-photo-14398103.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14491786/pexels-photo-14491786.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/4502462/pexels-photo-4502462.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14417252/pexels-photo-14417252.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/12032336/pexels-photo-12032336.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13080762/pexels-photo-13080762.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/5214329/pexels-photo-5214329.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/4791254/pexels-photo-4791254.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14341504/pexels-photo-14341504.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14344662/pexels-photo-14344662.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13023407/pexels-photo-13023407.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14522888/pexels-photo-14522888.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14213909/pexels-photo-14213909.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13413558/pexels-photo-13413558.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/7723821/pexels-photo-7723821.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14218611/pexels-photo-14218611.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14165336/pexels-photo-14165336.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14434280/pexels-photo-14434280.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/11877627/pexels-photo-11877627.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14455743/pexels-photo-14455743.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/8602413/pexels-photo-8602413.png?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14518598/pexels-photo-14518598.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14271136/pexels-photo-14271136.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13780970/pexels-photo-13780970.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/11295494/pexels-photo-11295494.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14250724/pexels-photo-14250724.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/5507251/pexels-photo-5507251.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/14413854/pexels-photo-14413854.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/13878011/pexels-photo-13878011.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/5953762/pexels-photo-5953762.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/9465701/pexels-photo-9465701.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
];
