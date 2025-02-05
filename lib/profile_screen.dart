import 'package:animatedn_profile_screen/catagory_list.dart';
// import 'package:animatedn_profile_screen/model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final bool _isUserScrolling = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_onScroll);
    });
    
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_isUserScrolling &&
        !_scrollController.position.isScrollingNotifier.value) {
      if (_scrollController.offset > 150 && _scrollController.offset < 250) {
        _scrollTo(250);
      } else if (_scrollController.offset < 150) {
        _scrollTo(0);
      }
    }
  }

  void _scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (DragEndDetails details) {
        
        },
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 250.0,
                collapsedHeight: 100.0,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double expandedHeight = 250.0;
                    final double scrollOffset = constraints.biggest.height;
                    final double fadeStart = 100.0;
                    final double fadeEnd = 200.0;
                    // final double opacity =
                    //     ((scrollOffset - fadeStart) / (fadeEnd - fadeStart))
                    //         .clamp(0.0, 1.0);
                    final double scale = scrollOffset / expandedHeight;
                    final double clampedScale = scale.clamp(0.7, 1.0);
                    final double profilePosition =
                        (scrollOffset - fadeStart) / (fadeEnd - fadeStart);
                    final double clampedProfilePosition =
                        profilePosition.clamp(0.0, 1.0);

                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://img.jagranjosh.com/images/2024/August/2582024/janmashtami-images.webp',
                          fit: BoxFit.fill,
                        ),
                        const Positioned.fill(
                          child: ColoredBox(color: Colors.black54),
                        ),
                        Positioned(
                          left: screenWidth * 0.5 -
                              45 - 
                              (screenWidth * 0.60 - 50) *
                                  (1 - clampedProfilePosition),
                          top: screenHeight * 0.06 -
                              (screenHeight *
                                  0.10 *
                                  (1 - clampedProfilePosition)) +
                              ((1 - clampedProfilePosition) * 32),
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateZ(0)
                              ..scale(clampedScale),
                            child: CircleAvatar(
                              backgroundImage: const NetworkImage(
                                'https://pics.craiyon.com/2023-10-15/da34c385ccf947e9af7b065c7014aa5a.webp',
                              ),
                              radius: clampedProfilePosition == 1.0
                                  ? 50.0
                                  : 50.0, // Expanded: 50.0, Collapsed: 30.0
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                            clampedProfilePosition == 1.0
                                ? (screenWidth * 0.5 -
                                    58) // Expanded position X
                                : (screenWidth * 0.5 - 1) -
                                    ((screenWidth * 0.5 - 100) *
                                        (1 -
                                            clampedProfilePosition)), // Compressed position X
                            clampedProfilePosition == 1.0
                                ? (expandedHeight * 0.60) // Expanded position Y
                                : (expandedHeight * 0.20) -
                                    ((expandedHeight * 0.11) *
                                        (1 -
                                            clampedProfilePosition)), // Compressed position Y
                          ),
                          child: Text(
                            "jagat acharya",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: clampedProfilePosition == 1.0
                                  ? 27.0
                                  : 28.0, // Expanded: 24.0, Collapsed: 16.0
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: (1 - clampedProfilePosition),
                          child: Transform.translate(
                            offset: Offset(
                              (expandedHeight * 0.70) -
                                  ((expandedHeight * 0.30) *
                                      (1 - clampedProfilePosition)),
                              65,
                            ),
                            child: const Text(
                              "jagatacharya59@gmail.com ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ];
          },
            body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: categories.length + 1, // Add one for the Logout button
        itemBuilder: (context, index) {
        if (index < categories.length) {
          final category = categories[index];
          return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          shadowColor: Colors.grey.withAlpha((0.5 * 255).toInt()),
          child: ListTile(
            contentPadding: const EdgeInsets.all(1.0),
            leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(
              category.icon,
              color: Colors.blue,
              size: 20.0,
            ),
            ),
            title: Text(
            category.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            trailing: const Padding(
            padding: EdgeInsets.only(right: 13.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 18.0,
            ),
            ),
            onTap: () {
            // Navigator.pushNamed(context, category.route);
            },
          ),
          );
        } else {
          return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          shadowColor: Colors.grey.withAlpha((0.5 * 255).toInt()),
          child: ListTile(
            contentPadding: const EdgeInsets.all(1.0),
            leading: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.logout,
              color: Colors.blue,
              size: 20.0,
            ),
            ),
            title: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            trailing: const Padding(
            padding: EdgeInsets.only(right: 13.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 18.0,
            ),
            ),
            onTap: () {
            // Handle logout action
            },
          ),
          );
        }
        },
      ),
  
        ),
      ),
    );
  }
    }