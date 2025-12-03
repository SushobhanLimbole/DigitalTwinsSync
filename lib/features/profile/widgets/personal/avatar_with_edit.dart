import 'package:flutter/material.dart';

class AvatarWithEdit extends StatelessWidget {
  const AvatarWithEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 128,
          height: 128,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCfLtoQTZz2vbaTj2EPmOAAf-q3A-kblu8TyIiLr9s9YJc6lwBH1MGBSg_7hJvXzg-1IBtDeEPPab1ra3y2iH_nCwGR9BH0PC9Q-8J9IxFWmbls9Q3gqydFXlXRTfy5P_3vBr1kLBuyqWbJZBf-hy5NM7hbZxaEX7y3oD9pwgGX0NvIaxBK1X8PtJIeEhQ9WVX6wOaYo11rXZXgVxYgGnvBRlOBs3DNzXdDQn2xvA1zkCZjp1dZxZPMv6voJFQpXndpYhmewHG1zcE',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF4D9FFF),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF121212), width: 4),
            ),
            child: const Icon(Icons.edit, color: Color(0xFF121212), size: 20),
          ),
        ),
      ],
    );
  }
}