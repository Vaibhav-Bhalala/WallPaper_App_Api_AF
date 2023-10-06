import 'package:flutter/material.dart';
import 'package:wallpaper_api_app/Model/wallpaper_model.dart';
import 'package:wallpaper_api_app/Views/Components/Helpers/api_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  String searchData = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home 🏠"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextFormField(
                controller: search,
                decoration: (InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          searchData = search.text;
                        });
                        search.clear();
                      },
                      icon: Icon(Icons.search),
                    ),
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ApiHelper.apiHelper.fatchWallpaper(search: searchData),
              builder: (ctx, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  List<WallPaperModel>? AllData =
                      snapshot.data as List<WallPaperModel>?;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 5,
                      mainAxisExtent: 400,
                      // mainAxisSpacing: 5,
                    ),
                    itemBuilder: (ctx, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${AllData?[i].largeImageURL}"),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    },
                    itemCount: AllData?.length,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
