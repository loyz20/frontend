# frontend

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

lib/
├── main.dart                       # Entry point aplikasi
├── core/                          # Modul core untuk utilitas dan konfigurasi umum
│   ├── constants/                 # Konstanta, misal warna, string, api endpoint
│   ├── utils/                     # Helper, extension functions, formatter
│   └── widgets/                   # Widget UI reusable, misal Button, LoadingIndicator
│
├── data/                          # Layer data, pengelolaan API, database, model data
│   ├── models/                    # Model data (entity)
│   ├── repositories/              # Repository interface & implementasi pengambilan data
│   ├── datasources/               # Data source: API service, local db service, dll
│
├── domain/                        # (Optional) Untuk business logic dan usecase, bisa untuk skala besar
│   ├── usecases/                  # Use case bisnis (misal: GetOrders, LoginUser)
│   └── repositories/              # Interface repository (jika pakai clean architecture)
│
├── presentation/                  # Semua UI & state management
│   ├── features/                  # Folder per fitur/module aplikasi
│   │   ├── auth/                  # Login, register, profile
│   │   │   ├── models/            # Model khusus fitur auth jika ada
│   │   │   ├── viewmodels/        # ViewModel (ChangeNotifier) auth
│   │   │   ├── views/             # Halaman Login, Register, dll
│   │   │   └── widgets/           # Widget khusus auth
│   │   │
│   │   ├── orders/                # Modul order
│   │   │   ├── models/
│   │   │   ├── viewmodels/
│   │   │   ├── views/
│   │   │   └── widgets/
│   │   │
│   │   ├── products/              # Modul produk
│   │   └── dashboard/             # Dashboard utama
│   │
│   ├── shared/                   # UI/Widget, provider/state management yang dipakai lintas fitur
│   └── app.dart                  # Widget root MaterialApp, routing, theme
│
└── routes/                       # Routing/navigation management

#   f r o n t e n d  
 