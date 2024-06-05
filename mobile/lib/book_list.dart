import 'package:flutter/material.dart';
import 'package:project_pm/Service/api_service.dart';
import 'package:project_pm/Model/model_buku.dart';
import 'package:project_pm/Response/response_databuku.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  var _searchMode = false, _isSubmitted = false;
  final _searchController = TextEditingController();

  List<BookModel> _searchBook = [];

  final ApiService apiService =
      ApiService(baseUrl: 'http://192.168.1.4/project_pm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Novel',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(height: 10),
              Container(
                  child: TextField(
                autocorrect: false,
                autofocus: false,
                cursorColor: Colors.teal,
                controller: _searchController,
                onChanged: (v) async {
                  print("onChanged: $v");

                  if (v.isEmpty) {
                    setState(() {
                      _searchMode = false;
                    });
                  } else {
                    setState(() {
                      _searchMode = true;
                    });

                    print("is Search mode: $_searchMode");

                    var bookResponse = await apiService.searchBook(v);

                    setState(() {
                      _isSubmitted = true;
                      _searchBook = bookResponse!.listBook;
                    });

                    print("Buku ditemukan: ${_searchBook.length}");
                  }
                },
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: TextButton(
                        onPressed: () {
                          if (_searchController.text.isNotEmpty) {
                            setState(() {
                              _isSubmitted = false;
                              _searchMode = false;
                              _searchController.clear();
                              _searchBook.clear();
                            });
                            //
                            print("is Search mode: $_searchMode");
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _searchController.text.isEmpty
                                  ? Colors.black
                                  : Colors.red),
                          child: Text(
                            _searchController.text.isEmpty ? "Search" : "Hapus",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 1.5, color: Colors.amber)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 1.5, color: Colors.amber)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 1.5, color: Colors.amber)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    hintText: "Cari buku",
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 15)),
              ))
            ],
          ),
        ),
      ),
      body: _searchMode
          ? _searchBook.isEmpty && _isSubmitted
              ? Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 10),
                            Container(
                                child: Text(
                              "Hasil Pencarian Buku",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                          ],
                        )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book,
                          size: 100,
                          color: Colors.white,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "buku '${_searchController.text}' tidak ditemukan",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ))
                  ],
                )
              : Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 10),
                            Container(
                                child: Text(
                              "Hasil Pencarian Buku",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                          ],
                        )),
                    Expanded(
                        child: ListView.builder(
                      itemCount: _searchBook.length,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      itemBuilder: (context, index) {
                        BookModel buku = _searchBook[index];
                        return GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.7,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  // width: 50,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.deepPurple,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 16),
                                                  child: Text(
                                                    "${buku.judulBuku}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 3),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.account_circle,
                                                          color: Colors.grey,
                                                          size: 16,
                                                        ),
                                                        SizedBox(width: 5),
                                                        Container(
                                                          // width: 50,
                                                          alignment: Alignment
                                                              .centerLeft,

                                                          decoration:
                                                              BoxDecoration(
                                                                  // color: Colors.deepPurple,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),

                                                          child: Text(
                                                            "${buku.penulis}",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        )
                                                      ],
                                                    ))
                                              ],
                                            ),
                                            Container(
                                                child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Icon(Icons.book,
                                                  size: 150,
                                                  color: Colors.amber),
                                            )),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "ID Buku:",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        "${buku.id}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 3),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Penerbit:",
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        ),
                                                        Text(
                                                          "${buku.penerbit}",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    )),
                                                SizedBox(height: 3),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Tanggal Terbit:",
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        ),
                                                        Text(
                                                          "${buku.tglTerbit}",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                    leading: Container(
                                        child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Icon(
                                        Icons.book,
                                        size: 60,
                                        color: Colors.amber,
                                      ),
                                    )),
                                    title: Text(
                                      buku.judulBuku ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Container(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          buku.penulis ?? '',
                                          style: TextStyle(
                                              color: Colors.grey[300]),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: 16,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                  'Tanggal Terbit',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              buku.tglTerbit ?? '',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        )
                                      ],
                                    )))));
                      },
                    ))
                  ],
                )
          : FutureBuilder<BookResponse?>(
              future: apiService.getBooks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white)));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData ||
                    snapshot.data!.listBook.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.list, color: Colors.white),
                              SizedBox(width: 10),
                              Container(
                                  child: Text(
                                "Data Buku",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          )),
                      Expanded(
                          child: ListView.builder(
                        itemCount: snapshot.data!.listBook.length,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        itemBuilder: (context, index) {
                          BookModel buku = snapshot.data!.listBook[index];
                          return GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.7,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    // width: 50,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                        // color: Colors.deepPurple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16),
                                                    child: Text(
                                                      "${buku.judulBuku}",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16,
                                                              vertical: 3),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .account_circle,
                                                            color: Colors.grey,
                                                            size: 16,
                                                          ),
                                                          SizedBox(width: 5),
                                                          Container(
                                                            // width: 50,
                                                            alignment: Alignment
                                                                .centerLeft,

                                                            decoration:
                                                                BoxDecoration(
                                                                    // color: Colors.deepPurple,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),

                                                            child: Text(
                                                              "${buku.penulis}",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                              Container(
                                                  child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Icon(Icons.book,
                                                    size: 150,
                                                    color: Colors.amber),

                                                //  Image.network(
                                                //     "${buku.foto}",
                                                //     fit: BoxFit.cover,
                                                //     height: 150,
                                                //     width: 150)
                                              )),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "ID Buku:",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          "${buku.id}",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 3),
                                                  Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Penerbit:",
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            "${buku.penerbit}",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      )),
                                                  SizedBox(height: 3),
                                                  Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Tanggal Terbit:",
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            "${buku.tglTerbit}",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ListTile(
                                    leading: Container(
                                        child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Icon(
                                        Icons.book,
                                        size: 60,
                                        color: Colors.amber,
                                      ),
                                    )),
                                    title: Text(
                                      buku.judulBuku ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Container(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          buku.penulis ?? '',
                                          style: TextStyle(
                                              color: Colors.grey[300]),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: 16,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                  'Tanggal Terbit',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              buku.tglTerbit ?? '',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                  )));
                        },
                      ))
                    ],
                  );
                }
              },
            ),
    );
  }
}
