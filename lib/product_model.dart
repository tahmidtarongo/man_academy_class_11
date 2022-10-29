import 'dart:ui';

class ProductModel {
  String? productName;
  bool? isNewProduct;
  String? productPrice;
  String? productImage;
  Color? bgColor;

  ProductModel({this.productName, this.isNewProduct, this.productPrice, this.productImage, this.bgColor});
}

List<ProductModel> productList = [
  ProductModel(
      productName: 'T-Shirt',
      productPrice: '\$200',
      isNewProduct: false,
      bgColor: Color(0xFF931313),
      productImage: 'https://ih1.redbubble.net/image.55663499.4056/ssrco,classic_tee,mens,101010:01c5ca27c6,front_alt,square_product,600x600.jpg'),
  ProductModel(
      productName: 'T-Shirt',
      productPrice: '\$200',
      isNewProduct: true,
      bgColor: Color(0xFF6C2D2D),
      productImage: 'https://ih1.redbubble.net/image.55663499.4056/ssrco,classic_tee,mens,101010:01c5ca27c6,front_alt,square_product,600x600.jpg'),
  ProductModel(
      productName: 'T-Shirt',
      productPrice: '\$200',
      isNewProduct: true,
      bgColor: Color(0xFF223CC0),
      productImage: 'https://ih1.redbubble.net/image.55663499.4056/ssrco,classic_tee,mens,101010:01c5ca27c6,front_alt,square_product,600x600.jpg'),
  ProductModel(
      productName: 'T-Shirt',
      productPrice: '\$200',
      isNewProduct: false,
      bgColor: Color(0xFF930EC7),
      productImage: 'https://ih1.redbubble.net/image.55663499.4056/ssrco,classic_tee,mens,101010:01c5ca27c6,front_alt,square_product,600x600.jpg'),
  ProductModel(
      productName: 'T-Shirt',
      productPrice: '\$200',
      isNewProduct: false,
      bgColor: Color(0xFF51C008),
      productImage: 'https://ih1.redbubble.net/image.55663499.4056/ssrco,classic_tee,mens,101010:01c5ca27c6,front_alt,square_product,600x600.jpg'),
  ProductModel(
      productName: 'T-Shirt',
      productPrice: '\$200',
      isNewProduct: true,
      bgColor: Color(0xFF04AD4E),
      productImage: 'https://ih1.redbubble.net/image.55663499.4056/ssrco,classic_tee,mens,101010:01c5ca27c6,front_alt,square_product,600x600.jpg'),
];
