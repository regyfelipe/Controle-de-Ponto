import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../cards/registro_hoje.dart';
import '../cards/saldo_horas.dart';
import '../routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: (const Color(0xFF536493)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.string(
              '''<svg width="88" height="12" viewBox="0 0 88 12" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M4.5 11.15C3.8 11.15 3.17 11.065 2.61 10.895C2.05 10.715 1.515 10.405 1.005 9.965C0.875 9.855 0.775 9.73 0.705 9.59C0.635 9.45 0.6 9.31 0.6 9.17C0.6 8.94 0.68 8.74 0.84 8.57C1.01 8.39 1.22 8.3 1.47 8.3C1.66 8.3 1.83 8.36 1.98 8.48C2.36 8.79 2.735 9.025 3.105 9.185C3.485 9.345 3.95 9.425 4.5 9.425C4.87 9.425 5.21 9.37 5.52 9.26C5.83 9.14 6.08 8.985 6.27 8.795C6.46 8.595 6.555 8.37 6.555 8.12C6.555 7.82 6.465 7.565 6.285 7.355C6.105 7.145 5.83 6.97 5.46 6.83C5.09 6.68 4.62 6.565 4.05 6.485C3.51 6.405 3.035 6.285 2.625 6.125C2.215 5.955 1.87 5.745 1.59 5.495C1.32 5.235 1.115 4.935 0.975 4.595C0.835 4.245 0.765 3.855 0.765 3.425C0.765 2.775 0.93 2.22 1.26 1.76C1.6 1.3 2.055 0.949999 2.625 0.709999C3.195 0.469999 3.825 0.349999 4.515 0.349999C5.165 0.349999 5.765 0.449999 6.315 0.649999C6.875 0.84 7.33 1.085 7.68 1.385C7.97 1.615 8.115 1.88 8.115 2.18C8.115 2.4 8.03 2.6 7.86 2.78C7.69 2.96 7.49 3.05 7.26 3.05C7.11 3.05 6.975 3.005 6.855 2.915C6.695 2.775 6.48 2.645 6.21 2.525C5.94 2.395 5.655 2.29 5.355 2.21C5.055 2.12 4.775 2.075 4.515 2.075C4.085 2.075 3.72 2.13 3.42 2.24C3.13 2.35 2.91 2.5 2.76 2.69C2.61 2.88 2.535 3.1 2.535 3.35C2.535 3.65 2.62 3.9 2.79 4.1C2.97 4.29 3.225 4.445 3.555 4.565C3.885 4.675 4.28 4.775 4.74 4.865C5.34 4.975 5.865 5.105 6.315 5.255C6.775 5.405 7.155 5.6 7.455 5.84C7.755 6.07 7.98 6.365 8.13 6.725C8.28 7.075 8.355 7.505 8.355 8.015C8.355 8.665 8.175 9.225 7.815 9.695C7.455 10.165 6.98 10.525 6.39 10.775C5.81 11.025 5.18 11.15 4.5 11.15ZM16.5455 0.455C16.7755 0.455 16.9805 0.545 17.1605 0.724999C17.3505 0.894999 17.4455 1.115 17.4455 1.385C17.4455 1.475 17.4305 1.57 17.4005 1.67C17.3805 1.76 17.3405 1.85 17.2805 1.94L13.8755 6.815L14.1455 5.78V10.085C14.1455 10.345 14.0555 10.565 13.8755 10.745C13.7055 10.915 13.5055 11 13.2755 11C13.0255 11 12.8105 10.915 12.6305 10.745C12.4605 10.565 12.3755 10.345 12.3755 10.085V5.9L12.4955 6.38L9.25547 2.075C9.15547 1.945 9.08547 1.82 9.04547 1.7C9.00547 1.58 8.98547 1.47 8.98547 1.37C8.98547 1.1 9.09047 0.879999 9.30047 0.709999C9.51047 0.54 9.72547 0.455 9.94547 0.455C10.2255 0.455 10.4705 0.595 10.6805 0.875L13.5605 4.85L13.1405 4.79L15.7955 0.904999C16.0055 0.605 16.2555 0.455 16.5455 0.455ZM26.756 0.499999C26.996 0.499999 27.191 0.579999 27.341 0.74C27.491 0.899999 27.566 1.1 27.566 1.34V10.085C27.566 10.345 27.476 10.565 27.296 10.745C27.126 10.915 26.911 11 26.651 11C26.521 11 26.386 10.98 26.246 10.94C26.116 10.89 26.016 10.825 25.946 10.745L20.051 3.26L20.441 3.02V10.16C20.441 10.4 20.361 10.6 20.201 10.76C20.051 10.92 19.851 11 19.601 11C19.361 11 19.166 10.92 19.016 10.76C18.866 10.6 18.791 10.4 18.791 10.16V1.415C18.791 1.155 18.876 0.94 19.046 0.769999C19.226 0.589999 19.446 0.499999 19.706 0.499999C19.846 0.499999 19.991 0.529999 20.141 0.59C20.291 0.64 20.401 0.72 20.471 0.83L26.186 8.12L25.931 8.3V1.34C25.931 1.1 26.006 0.899999 26.156 0.74C26.306 0.579999 26.506 0.499999 26.756 0.499999ZM30.7663 11C30.4863 11 30.2563 10.915 30.0763 10.745C29.9063 10.565 29.8213 10.345 29.8213 10.085V1.415C29.8213 1.155 29.9063 0.94 30.0763 0.769999C30.2563 0.589999 30.4763 0.499999 30.7363 0.499999H35.6113C35.8713 0.499999 36.0863 0.584999 36.2563 0.755C36.4363 0.914999 36.5263 1.125 36.5263 1.385C36.5263 1.605 36.4363 1.8 36.2563 1.97C36.0863 2.14 35.8713 2.225 35.6113 2.225H31.5613L31.6963 2.045V5.06L31.5913 4.865H34.9363C35.1963 4.865 35.4113 4.95 35.5813 5.12C35.7613 5.28 35.8513 5.49 35.8513 5.75C35.8513 5.97 35.7613 6.165 35.5813 6.335C35.4113 6.505 35.1963 6.59 34.9363 6.59H31.5613L31.6963 6.455V10.085C31.6963 10.345 31.6013 10.565 31.4113 10.745C31.2313 10.915 31.0163 11 30.7663 11ZM42.5341 0.499999C43.0941 0.499999 43.5891 0.629999 44.0191 0.89C44.4491 1.14 44.7891 1.49 45.0391 1.94C45.2891 2.39 45.4141 2.905 45.4141 3.485C45.4141 4.065 45.2891 4.59 45.0391 5.06C44.7891 5.52 44.4491 5.885 44.0191 6.155C43.5891 6.425 43.0941 6.56 42.5341 6.56H39.3541L39.4291 6.41V10.55C39.4291 10.67 39.3841 10.775 39.2941 10.865C39.2041 10.955 39.0991 11 38.9791 11C38.8391 11 38.7291 10.955 38.6491 10.865C38.5691 10.775 38.5291 10.67 38.5291 10.55V0.95C38.5291 0.83 38.5741 0.724999 38.6641 0.634999C38.7541 0.544999 38.8591 0.499999 38.9791 0.499999H42.5341ZM42.5341 5.69C42.9241 5.69 43.2641 5.595 43.5541 5.405C43.8441 5.205 44.0691 4.94 44.2291 4.61C44.3991 4.27 44.4841 3.895 44.4841 3.485C44.4841 3.075 44.3991 2.715 44.2291 2.405C44.0691 2.085 43.8441 1.835 43.5541 1.655C43.2641 1.475 42.9241 1.385 42.5341 1.385H39.3541L39.4291 1.25V5.78L39.3391 5.69H42.5341ZM56.8247 5.75C56.8247 6.54 56.6997 7.265 56.4497 7.925C56.2097 8.575 55.8647 9.145 55.4147 9.635C54.9647 10.115 54.4297 10.49 53.8097 10.76C53.1997 11.02 52.5297 11.15 51.7997 11.15C51.0697 11.15 50.3947 11.02 49.7747 10.76C49.1647 10.49 48.6347 10.115 48.1847 9.635C47.7347 9.145 47.3847 8.575 47.1347 7.925C46.8947 7.265 46.7747 6.54 46.7747 5.75C46.7747 4.96 46.8947 4.24 47.1347 3.59C47.3847 2.93 47.7347 2.36 48.1847 1.88C48.6347 1.39 49.1647 1.015 49.7747 0.755C50.3947 0.484999 51.0697 0.349999 51.7997 0.349999C52.5297 0.349999 53.1997 0.484999 53.8097 0.755C54.4297 1.015 54.9647 1.39 55.4147 1.88C55.8647 2.36 56.2097 2.93 56.4497 3.59C56.6997 4.24 56.8247 4.96 56.8247 5.75ZM55.8647 5.75C55.8647 4.86 55.6897 4.08 55.3397 3.41C54.9997 2.73 54.5247 2.2 53.9147 1.82C53.3047 1.44 52.5997 1.25 51.7997 1.25C51.0097 1.25 50.3047 1.44 49.6847 1.82C49.0747 2.2 48.5947 2.73 48.2447 3.41C47.9047 4.08 47.7347 4.86 47.7347 5.75C47.7347 6.64 47.9047 7.425 48.2447 8.105C48.5947 8.775 49.0747 9.3 49.6847 9.68C50.3047 10.06 51.0097 10.25 51.7997 10.25C52.5997 10.25 53.3047 10.06 53.9147 9.68C54.5247 9.3 54.9997 8.775 55.3397 8.105C55.6897 7.425 55.8647 6.64 55.8647 5.75ZM66.6291 0.499999C66.7591 0.499999 66.8591 0.539999 66.9291 0.62C67.0091 0.7 67.0491 0.8 67.0491 0.919999V10.52C67.0491 10.67 66.9991 10.79 66.8991 10.88C66.8091 10.96 66.7041 11 66.5841 11C66.5241 11 66.4591 10.99 66.3891 10.97C66.3191 10.94 66.2641 10.9 66.2241 10.85L59.5341 1.835L59.7891 1.7V10.595C59.7891 10.705 59.7491 10.8 59.6691 10.88C59.5891 10.96 59.4891 11 59.3691 11C59.2391 11 59.1341 10.96 59.0541 10.88C58.9841 10.8 58.9491 10.705 58.9491 10.595V0.95C58.9491 0.799999 58.9941 0.689999 59.0841 0.62C59.1741 0.539999 59.2741 0.499999 59.3841 0.499999C59.4441 0.499999 59.5091 0.514999 59.5791 0.545C59.6491 0.564999 59.7041 0.604999 59.7441 0.665L66.3591 9.575L66.2091 9.845V0.919999C66.2091 0.8 66.2491 0.7 66.3291 0.62C66.4191 0.539999 66.5191 0.499999 66.6291 0.499999ZM72.9821 11C72.8421 11 72.7271 10.955 72.6371 10.865C72.5571 10.775 72.5171 10.67 72.5171 10.55V0.994999H73.4471V10.55C73.4471 10.67 73.4021 10.775 73.3121 10.865C73.2221 10.955 73.1121 11 72.9821 11ZM69.4121 1.355C69.2921 1.355 69.1871 1.315 69.0971 1.235C69.0071 1.155 68.9621 1.05 68.9621 0.919999C68.9621 0.8 69.0071 0.7 69.0971 0.62C69.1871 0.539999 69.2921 0.499999 69.4121 0.499999H76.5521C76.6721 0.499999 76.7771 0.539999 76.8671 0.62C76.9571 0.7 77.0021 0.805 77.0021 0.935C77.0021 1.065 76.9571 1.17 76.8671 1.25C76.7771 1.32 76.6721 1.355 76.5521 1.355H69.4121ZM87.9819 5.75C87.9819 6.54 87.8569 7.265 87.6069 7.925C87.3669 8.575 87.0219 9.145 86.5719 9.635C86.1219 10.115 85.5869 10.49 84.9669 10.76C84.3569 11.02 83.6869 11.15 82.9569 11.15C82.2269 11.15 81.5519 11.02 80.9319 10.76C80.3219 10.49 79.7919 10.115 79.3419 9.635C78.8919 9.145 78.5419 8.575 78.2919 7.925C78.0519 7.265 77.9319 6.54 77.9319 5.75C77.9319 4.96 78.0519 4.24 78.2919 3.59C78.5419 2.93 78.8919 2.36 79.3419 1.88C79.7919 1.39 80.3219 1.015 80.9319 0.755C81.5519 0.484999 82.2269 0.349999 82.9569 0.349999C83.6869 0.349999 84.3569 0.484999 84.9669 0.755C85.5869 1.015 86.1219 1.39 86.5719 1.88C87.0219 2.36 87.3669 2.93 87.6069 3.59C87.8569 4.24 87.9819 4.96 87.9819 5.75ZM87.0219 5.75C87.0219 4.86 86.8469 4.08 86.4969 3.41C86.1569 2.73 85.6819 2.2 85.0719 1.82C84.4619 1.44 83.7569 1.25 82.9569 1.25C82.1669 1.25 81.4619 1.44 80.8419 1.82C80.2319 2.2 79.7519 2.73 79.4019 3.41C79.0619 4.08 78.8919 4.86 78.8919 5.75C78.8919 6.64 79.0619 7.425 79.4019 8.105C79.7519 8.775 80.2319 9.3 80.8419 9.68C81.4619 10.06 82.1669 10.25 82.9569 10.25C83.7569 10.25 84.4619 10.06 85.0719 9.68C85.6819 9.3 86.1569 8.775 86.4969 8.105C86.8469 7.425 87.0219 6.64 87.0219 5.75Z" fill="white"/>
</svg>
''',
            ),
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ],
        ),
      ),
      backgroundColor: (const Color(0xFF536493)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                RegistroHoje(),
                SizedBox(height: 20),
                SaldoHoras(),
              ],
            ),
           
            SizedBox(
              height: 150, 
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCard(
                      'Histórico',
                      Icons.history,
                      Colors.blue,
                      AppRoutes.registroBatida, 
                    ),
                    const SizedBox(width: 16), 
                    _buildCard(
                      'Ocorrência',
                      Icons.warning,
                      Colors.orange,
                      null, // Sem navegação
                    ),
                    const SizedBox(width: 16),
                    _buildCard(
                      'Notificações',
                      Icons.notifications,
                      Colors.green,
                      null, // Sem navegação
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding:const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.batePonto);
                },
                child: const Text(
                  'Registra Ponto',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF536493),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Color color, String? route) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Card(
        elevation: 6, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9), 
        ),
        child: Container(
          width: 170, 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: color.withOpacity(0.1), 
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: color), 
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}