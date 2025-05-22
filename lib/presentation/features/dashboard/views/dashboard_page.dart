import 'package:flutter/material.dart';
import 'package:frontend/presentation/features/dashboard/models/dashboard_menu.dart';
import 'package:frontend/presentation/features/dashboard/viewmodels/dashboard_viewmodel.dart';
import 'package:frontend/presentation/features/dashboard/widgets/dashboard_menu_card.dart';
import 'package:frontend/presentation/features/dashboard/widgets/recent_orders_list.dart';
import 'package:frontend/presentation/features/dashboard/widgets/stats_card.dart';
import 'package:frontend/presentation/features/product/view/product_list_page.dart';
import 'package:provider/provider.dart';



class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardViewModel vm;

  final List<DashboardMenu> menus = [
    DashboardMenu('Produk', Icons.medication, Colors.green),
    DashboardMenu('Pesanan', Icons.shopping_cart, Colors.blue),
    DashboardMenu('Pelanggan', Icons.people, Colors.orange),
    DashboardMenu('Laporan', Icons.bar_chart, Colors.purple),
    DashboardMenu('Supplier', Icons.local_shipping, Colors.teal),
    DashboardMenu('Pengaturan', Icons.settings, Colors.grey),
  ];

  @override
  void initState() {
    super.initState();
    vm = DashboardViewModel();
    // Load dashboard data setelah frame build selesai
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.loadDashboard();
    });
  }

  void onMenuTap(String menu) {
    switch (menu) {
      case 'Produk':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProductListPage()),
        );
        break;
      
      // Tambah case lain sesuai menu
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Menu $menu belum tersedia')),
        );
    }
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardViewModel>(
    create: (_) {
      final vm = DashboardViewModel();
      vm.loadDashboard(); // langsung load data
      return vm;
    },
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Consumer<DashboardViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.summary == null) {
            return const Center(child: Text("Belum ada data"));
          }

          final data = vm.summary!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    StatsCard(
                      title: 'Total Orders',
                      value: data.totalOrders.toString(),
                      icon: Icons.shopping_cart,
                      color: Colors.blue,
                    ),
                    StatsCard(
                      title: 'Total Products',
                      value: data.totalProducts.toString(),
                      icon: Icons.medication,
                      color: Colors.green,
                    ),
                    StatsCard(
                      title: 'Total Customers',
                      value: data.totalCustomers.toString(),
                      icon: Icons.people,
                      color: Colors.orange,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: menus.map((menu) {
                    return DashboardMenuCard(
                      title: menu.title,
                      icon: menu.icon,
                      color: menu.color,
                      onTap: () => onMenuTap(menu.title),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32),
                RecentOrdersList(orders: data.recentOrders),
              ],
            ),
          );
        },
      ),
    )
    );
  }
}
