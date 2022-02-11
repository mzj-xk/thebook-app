import 'package:flutter/material.dart';
import 'package:thebook_app/global/user.dart';
import 'package:thebook_app/models/book_info.dart';
import 'package:thebook_app/models/find_all_book.dart';
import 'package:thebook_app/service/repository.dart';
import 'package:thebook_app/views/book_detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 顶部搜索栏
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  width: 300,
                  height: 40,
                  child: const TextField(
                    cursorColor: Colors.white,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.email),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "所有书籍",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Row(
                          children: const [
                            Text(
                              "查看更多",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Icon(Icons.arrow_right, size: 30.0)
                          ],
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<FindAllBook>(
                      future: Repository.findAllBook(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            List<BookInfo>? books =
                                snapshot.data!.data!.records;
                            return Container(
                              padding: const EdgeInsets.all(8.0),
                              width: double.infinity,
                              height: 400,
                              child: GridView.builder(
                                itemCount: snapshot.data!.data!.records!.length,
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1.5 / 1.2,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: Image.network(
                                        books![index].cover ?? ''),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookDetail(
                                            books[index],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          } else {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 48,
                            );
                          }
                        } else {
                          return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator());
                        }
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
