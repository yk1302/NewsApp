import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/NewsChannelHeadlinesModel.dart';
import 'package:news_app/news/Categories_Screen.dart';
import 'package:news_app/news/detail_news_screen.dart';
import 'package:news_app/view_model/news_view_model.dart';

import '../models/CategoriesNewsModel.dart';

class NewsHomeScreen extends StatefulWidget {
  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

enum NewsFilterList {
  bbcNews,
  aryNews,
  independent,
  reuters,
  cnn,
  alJazeera,
  abcNews,
  afterPosten,
  ansa,
  arsTechnica,
  australianFinanceReview,
  associatedPress,
  blastingNewsBR,
  bloomberg,
  breitbartNews,
  businessInsider,
  entertainmentWeekly,
  focus,
  financialpost,
  footballItalia,
  fox,
  google,
  mtv,
  newYorkMagazine,
  liberization
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MMMM dd, yyyy');
  NewsFilterList? selectedMenu;
  String name = 'bbc-news';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              'images/category_icon.png',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()));
            },
          ),
          actions: [
            PopupMenuButton<NewsFilterList>(
                initialValue: selectedMenu,
                icon: Icon(Icons.more_vert_outlined, color: Colors.white),
                onSelected: (NewsFilterList item) {
                  if (NewsFilterList.bbcNews.name == item.name) {
                    name = 'bbc-news';
                  }
                  if (NewsFilterList.aryNews.name == item.name) {
                    name = 'ary-news';
                  }
                  if (NewsFilterList.independent.name == item.name) {
                    name = 'independent';
                  }
                  if (NewsFilterList.reuters.name == item.name) {
                    name = 'reuters';
                  }

                  if (NewsFilterList.cnn.name == item.name) {
                    name = 'cnn';
                  }
                  if (NewsFilterList.alJazeera.name == item.name) {
                    name = 'al-jazeera-english';
                  }
                  if (NewsFilterList.abcNews.name == item.name) {
                    name = 'abc-news';
                  }

                  if (NewsFilterList.afterPosten.name == item.name) {
                    name = 'aftenposten';
                  }
                  if (NewsFilterList.arsTechnica.name == item.name) {
                    name = 'ars-technica';
                  }

                  if (NewsFilterList.ansa.name == item.name) {
                    name = 'ansa';
                  }
                  if (NewsFilterList.australianFinanceReview.name ==
                      item.name) {
                    name = 'australian-financial-review';
                  }

                  if (NewsFilterList.associatedPress.name == item.name) {
                    name = 'associated-press';
                  }
                  if (NewsFilterList.blastingNewsBR.name == item.name) {
                    name = 'blasting-news-br';
                  }

                  if (NewsFilterList.bloomberg.name == item.name) {
                    name = 'bloomberg';
                  }
                  if (NewsFilterList.breitbartNews.name == item.name) {
                    name = 'breitbart-news';
                  }

                  if (NewsFilterList.businessInsider.name == item.name) {
                    name = 'business-insider';
                  }
                  if (NewsFilterList.entertainmentWeekly.name == item.name) {
                    name = 'entertainment-weekly';
                  }

                  if (NewsFilterList.focus.name == item.name) {
                    name = 'focus';
                  }
                  if (NewsFilterList.financialpost.name == item.name) {
                    name = 'financial-post';
                  }

                  if (NewsFilterList.footballItalia.name == item.name) {
                    name = 'football-italia';
                  }
                  if (NewsFilterList.fox.name == item.name) {
                    name = 'fox-news';
                  }

                  if (NewsFilterList.google.name == item.name) {
                    name = 'google-news';
                  }
                  if (NewsFilterList.mtv.name == item.name) {
                    name = 'mtv-news';
                  }

                  if (NewsFilterList.newYorkMagazine.name == item.name) {
                    name = 'new-york-magazine';
                  }
                  if (NewsFilterList.liberization.name == item.name) {
                    name = 'liberation';
                  }
                  newsViewModel.fetchNewsChannelHeadlinesApi(name);
                  setState(() {});
                },
                itemBuilder: (context) => <PopupMenuEntry<NewsFilterList>>[
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.bbcNews,
                        child: Text('BBC News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.aryNews,
                        child: Text('ARY News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.independent,
                        child: Text('The Independent News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.reuters,
                        child: Text('Reuters News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.cnn,
                        child: Text('CNN news'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.alJazeera,
                        child: Text('Al Jazerra News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.abcNews,
                        child: Text('ABC News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.afterPosten,
                        child: Text('AfterPosten News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.ansa,
                        child: Text('ANSA News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.arsTechnica,
                        child: Text('ARS Technica News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.australianFinanceReview,
                        child: Text('Australian Finance Review'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.associatedPress,
                        child: Text('Associated Press'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.blastingNewsBR,
                        child: Text('Blasting News BR'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.bloomberg,
                        child: Text('The Bloomberg'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.breitbartNews,
                        child: Text('Braitbart News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.businessInsider,
                        child: Text('The Business Insider'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.entertainmentWeekly,
                        child: Text('Entertainment Weekly'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.focus,
                        child: Text('The Focus'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.financialpost,
                        child: Text('The Financial Post'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.footballItalia,
                        child: Text('The Football Italia'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.fox,
                        child: Text('The FOX'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.google,
                        child: Text('Google News'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.mtv,
                        child: Text('The MTV'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.newYorkMagazine,
                        child: Text('The NewYork Magazine'),
                      ),
                      PopupMenuItem<NewsFilterList>(
                        value: NewsFilterList.liberization,
                        child: Text('The Liberization'),
                      ),
                    ])
          ],
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            "News",
            style: GoogleFonts.poppins(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700),
          )),
          backgroundColor: Colors.deepPurple.shade400,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: height * .5,
              width: width,
              child: FutureBuilder<NewsChannelsHeadlinesModel>(
                future: newsViewModel.fetchNewsChannelHeadlinesApi(name),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: SpinKitChasingDots(
                      size: 50,
                      color: Colors.deepPurple.shade500,
                    ));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data?.articles?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          DateTime dateTime = DateTime.parse(snapshot
                              .data!.articles![index].publishedAt
                              .toString());
                          return SizedBox(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: height * 0.6,
                                  width: width * .9,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: height * .02,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot
                                          .data!.articles![index].urlToImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          SpinKitRing(
                                        color: Colors.deepPurple.shade400,
                                        size: 40,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error_outline,
                                              color: Colors.red.shade400),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  child: Card(
                                    elevation: 5,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      height: height * .22,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailNewsScreen(
                                                        snapshot
                                                            .data!
                                                            .articles![index]
                                                            .source!
                                                            .name
                                                            .toString(),
                                                        snapshot
                                                            .data!
                                                            .articles![index]
                                                            .urlToImage
                                                            .toString(),
                                                        snapshot
                                                            .data!
                                                            .articles![index]
                                                            .description
                                                            .toString(),
                                                        format.format(dateTime),
                                                        snapshot
                                                            .data!
                                                            .articles![index]
                                                            .title
                                                            .toString(),
                                                      )));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: width * 0.7,
                                              child: Text(
                                                snapshot.data!.articles![index]
                                                    .title
                                                    .toString(),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: width * 0.7,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .articles![index]
                                                        .source!
                                                        .name
                                                        .toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    format.format(dateTime),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            ),

// SAME FORMAT AS IN CATEGORY SCREEN WE SELECT CATEGORY EQUAL TO GENERAL HERE BELOW  DATA IS GENERAL - CATEGORY NEWS
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: FutureBuilder<CategoriesNewsModel>(
                future: newsViewModel.fetchCatogiresNewsApi('General'),
                //only write BuildContext, snapshot not Asyn<dynamic>snapshot ye nahi
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: SpinKitChasingDots(
                      size: 50,
                      color: Colors.deepPurple.shade500,
                    ));
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.articles?.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          DateTime dateTime = DateTime.parse(snapshot
                              .data!.articles![index].publishedAt
                              .toString());
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data!.articles![index].urlToImage
                                        .toString(),
                                    fit: BoxFit.cover,
                                    height: height * .18,
                                    width: width * .3,
                                    placeholder: (context, url) => SpinKitRing(
                                      color: Colors.deepPurple.shade400,
                                      size: 40,
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                        Icons.error_outline,
                                        color: Colors.red.shade400),
                                  ),
                                ),
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailNewsScreen(
                                                  snapshot
                                                      .data!
                                                      .articles![index]
                                                      .source!
                                                      .name
                                                      .toString(),
                                                  snapshot
                                                      .data!
                                                      .articles![index]
                                                      .urlToImage
                                                      .toString(),
                                                  snapshot
                                                      .data!
                                                      .articles![index]
                                                      .description
                                                      .toString(),
                                                  format.format(dateTime),
                                                  snapshot.data!
                                                      .articles![index].title
                                                      .toString(),
                                                )));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(left: 15),
                                    height: height * .18,
                                    child: (Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            snapshot
                                                .data!.articles![index].title
                                                .toString(),
                                            maxLines: 3,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        // Spacer(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                snapshot.data!.articles![index]
                                                    .source!.name
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Text(format.format(dateTime),
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  // color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        )
                                      ],
                                    )),
                                  ),
                                )),
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ));
  }
}
