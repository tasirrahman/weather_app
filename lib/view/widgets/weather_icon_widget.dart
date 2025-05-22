import 'package:flutter/material.dart';

class WeatherIconWidget extends StatelessWidget {
  final String iconCode;
  final double size;

  const WeatherIconWidget({Key? key, required this.iconCode, this.size = 100})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            if (iconCode.contains('01')) _buildSunnyIcon(),
            if (iconCode.contains('02') ||
                iconCode.contains('03') ||
                iconCode.contains('04'))
              _buildCloudyIcon(),
            if (iconCode.contains('09') || iconCode.contains('10'))
              _buildRainyIcon(),
            if (iconCode.contains('11')) _buildThunderstormIcon(),
            if (iconCode.contains('13')) _buildSnowyIcon(),
            if (iconCode.contains('50')) _buildMistyIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildSunnyIcon() {
    return Center(
      child: Container(
        width: size * 0.6,
        height: size * 0.6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [const Color(0xFFFFD700), const Color(0xFFFFA500)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFD700).withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloudyIcon() {
    return Center(
      child: Stack(
        children: [
          Positioned(
            top: size * 0.15,
            left: size * 0.1,
            child: Container(
              width: size * 0.35,
              height: size * 0.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFD700),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD700).withOpacity(0.3),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size * 0.25,
            left: size * 0.15,
            child: Container(
              width: size * 0.7,
              height: size * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size * 0.25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRainyIcon() {
    return Center(
      child: Stack(
        children: [
          _buildCloudyIcon(),
          Positioned(
            bottom: size * 0.1,
            left: size * 0.3,
            child: Column(
              children: List.generate(
                3,
                (index) => Container(
                  width: 3,
                  height: size * 0.15,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4FC3F7),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThunderstormIcon() {
    return _buildRainyIcon();
  }

  Widget _buildSnowyIcon() {
    return _buildCloudyIcon();
  }

  Widget _buildMistyIcon() {
    return _buildCloudyIcon();
  }
}
