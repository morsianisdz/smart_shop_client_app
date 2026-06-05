import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/features/home/components/product_card.component.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductWrapLayout extends StatelessWidget {
  const ProductWrapLayout({super.key, required this.products, this.spacing = 8});

  final List<Product> products;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;
        final cardWidth = (parentWidth - spacing) / 2;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
              children: products.map((product) => ProductCard(product: product).w(cardWidth)).toList());
      },
    );
  }
}