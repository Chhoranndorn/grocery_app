import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  static const List<_AccountMenuItem> _items = [
    _AccountMenuItem(title: 'Orders', icon: Icons.shopping_bag_outlined),
    _AccountMenuItem(title: 'My Details', icon: Icons.badge_outlined),
    _AccountMenuItem(
      title: 'Delivery Address',
      icon: Icons.location_on_outlined,
    ),
    _AccountMenuItem(title: 'Payment Methods', icon: Icons.credit_card),
    _AccountMenuItem(
      title: 'Promo Cord',
      icon: Icons.confirmation_num_outlined,
    ),
    _AccountMenuItem(title: 'Notifications', icon: Icons.notifications_none),
    _AccountMenuItem(title: 'Help', icon: Icons.help_outline),
    _AccountMenuItem(title: 'About', icon: Icons.error_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 52),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=160&q=80',
                      width: 82,
                      height: 82,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 82,
                          height: 82,
                          color: const Color(0xFFEFF8F2),
                          child: const Icon(
                            Icons.person,
                            color: Color(0xFF53B175),
                            size: 42,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Flexible(
                              child: Text(
                                'Afsar Hossen',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF181725),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              constraints: const BoxConstraints.tightFor(
                                width: 32,
                                height: 32,
                              ),
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF53B175),
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'lmshuvo97@gmail.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF7C7C7C),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 46),
            const Divider(height: 1, color: Color(0xFFE2E2E2)),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: _items.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 1,
                    color: Color(0xFFE2E2E2),
                    indent: 24,
                    endIndent: 24,
                  );
                },
                itemBuilder: (context, index) {
                  return _AccountMenuRow(item: _items[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 30),
              child: SizedBox(
                width: double.infinity,
                height: 76,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2F3F2),
                    foregroundColor: const Color(0xFF53B175),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  onPressed: () {},
                  child: const SizedBox.expand(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          child: Icon(Icons.logout, size: 32),
                        ),
                        Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountMenuRow extends StatelessWidget {
  final _AccountMenuItem item;

  const _AccountMenuRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 74,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              SizedBox(
                width: 38,
                child: Icon(
                  item.icon,
                  color: const Color(0xFF181725),
                  size: 30,
                ),
              ),
              const SizedBox(width: 28),
              Expanded(
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF181725),
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF181725),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccountMenuItem {
  final String title;
  final IconData icon;

  const _AccountMenuItem({required this.title, required this.icon});
}
