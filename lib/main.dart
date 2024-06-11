import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:up_product/firebase_options.dart';

// Khởi tạo Firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> uploadProducts() async {
    // Tham chiếu đến collection 'products' trên Firestore
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    // Duyệt qua từng sản phẩm và đẩy lên Firestore với ID tùy chỉnh
    for (Product product in _shop) {
      await products.doc(product.id).set(product.toMap()).then((value) {
        print('Product ${product.id} Added');
      }).catchError((error) {
        print('Failed to add product ${product.id}: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Upload Products to Firebase')),
        body: Center(
          child: ElevatedButton(
            onPressed: uploadProducts,
            child: Text('Upload Products'),
          ),
        ),
      ),
    );
  }
}

class Product {
  final String id;
  final String name;
  final int price;
  final String description;
  final String imageUrl; // Thêm thuộc tính imageUrl

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl, // Thêm tham số imageUrl vào constructor
  });

  // Chuyển đổi đối tượng Product thành map để đẩy lên Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'image_url': '$imageUrl$id.jpg?alt=media', // Thêm imageUrl vào map
    };
  }
}

final List<Product> _shop = [
  Product(
    id: 'iphone_15_pro_max',
    name: 'iPhone 15 Pro Max',
    price: 29290000,
    description:
        'iPhone 15 Pro Max sở hữu màn hình Super Retina XDR 6.7 inch, chip A17 Bionic mạnh mẽ, và hệ thống camera Pro giúp bạn chụp ảnh chất lượng chuyên nghiệp.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_15',
    name: 'iPhone 15',
    price: 18990000,
    description:
        'iPhone 15 mang đến trải nghiệm mượt mà với màn hình Super Retina XDR 6.1 inch và chip A16 Bionic, cùng với camera tiên tiến cho ảnh chụp sắc nét.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_14_pro_max',
    name: 'iPhone 14 Pro Max',
    price: 26590000,
    description:
        'iPhone 14 Pro Max đi kèm với màn hình lớn 6.7 inch, chip A16 Bionic, và hệ thống camera cải tiến, giúp bạn lưu giữ mọi khoảnh khắc với độ chi tiết tuyệt vời.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_14_plus',
    name: 'iPhone 14 Plus',
    price: 19390000,
    description:
        'iPhone 14 Plus sở hữu màn hình Super Retina XDR 6.5 inch, chip A16 Bionic và camera kép 12MP, mang đến hiệu suất và chất lượng ảnh tuyệt vời.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_14',
    name: 'iPhone 14',
    price: 16390000,
    description:
        'iPhone 14 có màn hình Super Retina XDR 6.1 inch, chip A15 Bionic và hệ thống camera kép, mang đến trải nghiệm sử dụng mượt mà và ảnh chụp rõ nét.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_13_pro_max',
    name: 'iPhone 13 Pro Max',
    price: 14390000,
    description:
        'iPhone 13 Pro Max với màn hình 6.7 inch Super Retina XDR, chip A15 Bionic và hệ thống camera Pro, cung cấp hiệu suất cao và ảnh chụp chất lượng.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_13',
    name: 'iPhone 13',
    price: 13390000,
    description:
        'iPhone 13 có màn hình 6.1 inch Super Retina XDR, chip A15 Bionic và camera kép 12MP, mang đến trải nghiệm sử dụng mượt mà và ảnh chụp đẹp.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_12_pro_max',
    name: 'iPhone 12 Pro Max',
    price: 13900000,
    description:
        'iPhone 12 Pro Max với màn hình Super Retina XDR 6.7 inch, chip A14 Bionic và hệ thống camera Pro, mang đến hiệu suất cao và ảnh chụp sắc nét.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_12',
    name: 'iPhone 12',
    price: 11390000,
    description:
        'iPhone 12 có màn hình 6.1 inch Super Retina XDR, chip A14 Bionic và camera kép 12MP, mang đến hiệu suất ổn định và ảnh chụp chất lượng cao.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_11_pro_max',
    name: 'iPhone 11 Pro Max',
    price: 10390000,
    description:
        'iPhone 11 Pro Max sở hữu màn hình Super Retina XDR 6.5 inch, chip A13 Bionic và hệ thống camera ba, mang đến hiệu suất mạnh mẽ và ảnh chụp chuyên nghiệp.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_11',
    name: 'iPhone 11',
    price: 8390000,
    description:
        'iPhone 11 có màn hình Liquid Retina 6.1 inch, chip A13 Bionic và camera kép 12MP, mang đến hiệu suất tốt và ảnh chụp sắc nét.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_xs',
    name: 'iPhone Xs',
    price: 6390000,
    description:
        'iPhone Xs với màn hình Super Retina 5.8 inch, chip A12 Bionic và camera kép 12MP, mang đến hiệu suất cao và ảnh chụp chất lượng.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_8_plus',
    name: 'iPhone 8 Plus',
    price: 4390000,
    description:
        'iPhone 8 Plus sở hữu màn hình Retina HD 5.5 inch, chip A11 Bionic và camera kép 12MP, mang đến hiệu suất ổn định và ảnh chụp đẹp.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_7_plus',
    name: 'iPhone 7 Plus',
    price: 3390000,
    description:
        'iPhone 7 Plus có màn hình Retina HD 5.5 inch, chip A10 Fusion và camera kép 12MP, mang đến hiệu suất tốt và ảnh chụp chất lượng.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
  Product(
    id: 'iphone_6_plus',
    name: 'iPhone 6 Plus',
    price: 2390000,
    description:
        'iPhone 6 Plus sở hữu màn hình Retina HD 5.5 inch, chip A8 và camera 8MP, mang đến hiệu suất ổn định và ảnh chụp đẹp.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-app-729a2.appspot.com/o/',
  ),
];
