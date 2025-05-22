import 'package:flutter/material.dart';
import 'package:frontend/presentation/features/product/models/product_model.dart';
import 'package:frontend/presentation/features/product/view/product_form_page.dart';
import 'package:frontend/presentation/features/product/viewmodels/product_detail_viewmodel.dart';
import 'package:frontend/presentation/features/product/viewmodels/product_viewmodel.dart';
import 'package:frontend/presentation/features/product/widgets/batch_card.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Yakin ingin menghapus produk ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Provider.of<ProductViewModel>(context, listen: false).deleteProduct(product.id);
              Navigator.pop(context); // kembali ke list setelah hapus
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Produk berhasil dihapus')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailViewModel()..fetchBatches(product.id),
      child: Scaffold(
        appBar: AppBar(
            title: Text(product.name),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                tooltip: 'Edit Produk',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductFormPage(product: product), // pastikan halaman form-nya sudah ada
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Hapus Produk',
                onPressed: () => _confirmDelete(context),
              ),
            ],
          ),

        body: Consumer<ProductDetailViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detail Produk',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text('Stok: ${product.stock}'),
                  Text('Harga: Rp${product.price.toStringAsFixed(0)}'),
                  const Divider(height: 32),
                  Text(
                    'Batch Produk',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: vm.batches.isEmpty
                        ? const Text('Belum ada batch')
                        : ListView.separated(
                            itemCount: vm.batches.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 8),
                            itemBuilder: (context, index) {
                              final batch = vm.batches[index];
                              return BatchCard(batch: batch);
                            },
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
