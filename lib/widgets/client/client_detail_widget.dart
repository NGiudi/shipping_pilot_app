import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/models.dart';

class ClientDetailWidget extends StatelessWidget {
  final Client client;
  final Address address;

  const ClientDetailWidget({
    super.key,
    required this.client,
    required this.address
  });

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: const EdgeInsets.only(left: 16), 
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Comprador",
            style: Theme.of(context).textTheme.titleLarge
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nombre: ${client.fullName()}',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                const SizedBox(height: 4),
                Text(
                  'Dirección: ${address.fullAddress()}',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                const SizedBox(height: 4),
                Text(
                  'Barrio: ${address.district}',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}