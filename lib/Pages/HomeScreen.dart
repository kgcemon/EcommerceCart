import 'package:ecomui/Widget/MyAppBar.dart';
import 'package:flutter/material.dart';

import '../Widget/Serachbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> productList = [
    {
      "product_name": 'T-shirt',
      "price": 50,
      "color": 'Gray',
      "size": 'L',
      "totalitem": 1,
      "image_url": 'https://img.freepik.com/free-vector/blue-packages-cosmetics-set_1284-12683.jpg?',
      "counter": 1
    },
    {
      "product_name": 'Jeans',
      "price": 75,
      "color": 'Blue',
      "size": 'M',
      "totalitem": 1,
      "image_url": 'https://img.freepik.com/free-vector/blue-packages-cosmetics-set_1284-12684.jpg?',
      "counter": 1
    },
    {
      "product_name": 'Sweater',
      "price": 60,
      "color": 'Black',
      "size": 'XL',
      "totalitem": 1,
      "image_url": 'https://img.freepik.com/free-vector/blue-packages-cosmetics-set_1284-12685.jpg?',
      "counter": 1
    },
    {
      "product_name": 'Sneakers',
      "price": 80,
      "color": 'White',
      "size": '9',
      "totalitem": 1,
      "image_url": 'https://img.freepik.com/free-vector/blue-packages-cosmetics-set_1284-12687.jpg?',
      "counter": 1
    },

  ];

  List<int> price = [];

  int get totalAmount {
    return productList.fold<int>(
        0, (total, product) => total + product['price'] as int);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total amount:'),
                  Text(
                    "\$$totalAmount",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: const Text(
                  "Checkout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),
      backgroundColor: const Color(0xF7F5F3F3),
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarIcon(),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "My Bag",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: productList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.network(
                                      productList[index]['image_url'],
                                      fit: BoxFit.cover,
                                      height: 90, width: 120,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          productList[index]['product_name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            const Text("Color:",
                                                style: TextStyle(fontSize: 7)),
                                            Text(
                                              productList[index]['color'],
                                              style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(width: 5,),

                                            const Text("Size:",
                                                style: TextStyle(fontSize: 7)),
                                            Text(
                                              productList[index]['size'],
                                              style: const TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (productList[index]['counter'] >
                                                    1) {
                                                  productList[index]['counter'] -=
                                                  1;
                                                  productList[index]['price'] =
                                                      productList[index]['price'] -
                                                          price[index];
                                                  setState(() {});
                                                }
                                              },

                                              child: Image.asset(
                                                  'myImages/-.png', height: 50),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(horizontal: 8.0),
                                              child: Text(
                                                  productList[index]['counter']
                                                      .toString()),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                price.add(
                                                    productList[index]['price']);
                                                setState(() {
                                                });
                                                productList[index]['counter'] +=
                                                1;
                                                productList[index]['price'] =
                                                    price[index] *
                                                        productList[index]['counter'];
                                                if (productList[index]['counter'] ==
                                                    5) {
                                                  showDialog(context: context,
                                                    builder: (context) {
                                                      return  AlertDialog(
                                                        backgroundColor: Colors.white,
                                                        surfaceTintColor: Colors.white,
                                                        title: const Center(
                                                            child: Text(
                                                                'Congratulations',
                                                                style: TextStyle(
                                                                    fontSize: 15,fontWeight: FontWeight.bold))),
                                                        content: Text('You have added 5 ${productList[index]['product_name']} on your bag!'),
                                                        actions: [Center(
                                                          child: SizedBox(
                                                            width: double.infinity,
                                                            child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                                onPressed: () {
                                                                Navigator.pop(context);
                                                            }, child: const Text("OKEY",style: TextStyle(color: Colors.white),)),
                                                          ),
                                                        )],
                                                      );
                                                    },);
                                                }
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                  'myImages/+.png', height: 50),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    const Icon(Icons.more_vert_sharp),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text("\$${productList[index]['price']} "),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
