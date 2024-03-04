import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailNewsScreen extends StatefulWidget {
  final String source;
  final String image;
  final String description;
  final String date;
  final String title;

  DetailNewsScreen(
      this.source, this.image, this.description, this.date, this.title);

  @override
  State<DetailNewsScreen> createState() =>
      _DetailNewsScreenState(source, image, description, date, title);
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  final String source;
  final String image;
  final String description;
  final String date;
  final String title;

  _DetailNewsScreenState(
      this.source, this.image, this.description, this.date, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade400,
          title: Center(
              child: Text(
            source,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  )),
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SpinKitRing(
                    color: Colors.deepPurple.shade400,
                    size: 40,
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error_outline, color: Colors.red.shade400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(source,
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(date,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(description,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
        ));
  }
}
