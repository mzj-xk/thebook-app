import 'package:flutter/material.dart';
import 'package:thebook_app/models/book_info.dart';

class BookDetail extends StatefulWidget {
  final BookInfo data;

  const BookDetail(this.data, {Key? key}) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
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
                      widget.data.name ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                      child:
                          Image.network(widget.data.cover ?? '', height: 200),
                    ),
                    Container(
                      height: 200,
                      padding: const EdgeInsets.only(left: 10.0, top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '作者: ${widget.data.author ?? ''}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            '出版方: ${widget.data.press ?? ''}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            '出品方: ${widget.data.producer ?? ''}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            '页数: ${widget.data.pagesNumber ?? ''}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            '定价: ${widget.data.price ?? ''}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'ISBN: ${widget.data.isbn ?? ''}',
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
                    children: [
                      const Text(
                        '短评',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      GestureDetector(
                        child: const Text(
                          '我来说两句',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green,
                          ),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.all(8.0),
                                  height: 350,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: TextFormField(
                                          maxLines: 10,
                                          minLines: 1,
                                          maxLength: 200,
                                          cursorColor: Colors.green,
                                          style: TextStyle(fontSize: 20),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(8.0),
                                          ),
                                        ),
                                      ),
                                      Score((score) {
                                        print(score.toString());
                                      }),
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        width: 100,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('提交'),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 400,
                    padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: ListView.separated(
                        itemCount: 20,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return _item();
                        })),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '长评',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
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
                  ),
                ),
              ],
            ),
          ),
        ));
      }),
    );
  }
}

Widget _item() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    height: 100,
    child: Column(
      children: [
        Row(
          children: [
            Text(
              'username',
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
            _star(2),
            Text(
              '2021-08-31 10:10:36',
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    ),
  );
}

Widget _star(int quantity) {
  return Container(
    padding: const EdgeInsets.only(left: 5),
    width: 150,
    height: 20,
    child: ListView.builder(
      itemCount: quantity,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Icon(Icons.star, color: Colors.yellow[800], size: 15);
      },
    ),
  );
}

class Score extends StatefulWidget {
  final ValueChanged<int> score;
  const Score(this.score, {Key? key}) : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  late int score;
  @override
  void initState() {
    score = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 20,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: index < score
                ? Icon(Icons.star, color: Colors.yellow[800], size: 30)
                : const Icon(Icons.star_outline, size: 30, color: Colors.grey),
            onTap: () {
              setState(() {
                score = index + 1;
              });
              widget.score(index + 1);
            },
          );
        },
      ),
    );
  }
}
