import 'package:flutter/material.dart';

import 'package:shipping_pilot/providers/travel_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/models/index.dart';

class SidebarWidget extends ConsumerWidget {

  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User user = ref.watch(travelProdiver)['user'];

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.fullName()), 
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  user.photoUrl,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            onTap: () => {}, //TODO: add logout function.
            title: const Text('Cerrar sesión'),  
          ),
        ],
      ),
    );
  }
}
