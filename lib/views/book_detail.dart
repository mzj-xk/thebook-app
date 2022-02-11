import 'package:flutter/material.dart';
import 'package:thebook_app/models/book_info.dart';

class BookDetail extends StatelessWidget {
  final BookInfo data;

  const BookDetail(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                  child: Text(
                    data.name ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                    child: Image.network(data.cover ?? '', height: 200),
                  ),
                  Container(
                    height: 200,
                    padding: const EdgeInsets.only(left: 10.0, top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '作者: ${data.author ?? ''}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          '出版方: ${data.press ?? ''}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          '出品方: ${data.producer ?? ''}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          '页数: ${data.pagesNumber ?? ''}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          '定价: ${data.price ?? ''}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          'ISBN: ${data.isbn ?? ''}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '短评',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      '我来说两句',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 300,
                  padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Text('$index');
                    },
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '长评',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      '我要写书评',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 300,
                  padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Text('$index');
                    },
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
