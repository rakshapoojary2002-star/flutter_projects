import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerLow,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 80,
color: Theme.of(context).colorScheme.surface,
                ),
              ),
              title: Container(
                height: 20,
                color: Theme.of(context).colorScheme.surface,
              ),
              subtitle: Container(
                height: 15,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          );
        },
      ),
    );
  }
}
