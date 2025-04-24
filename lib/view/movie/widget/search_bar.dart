import 'package:cine_max/constants/color.dart';
import 'package:cine_max/controllers/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaerchMovieBar extends StatefulWidget {
  const SaerchMovieBar({super.key});

  @override
  State<SaerchMovieBar> createState() => _SaerchMovieBarState();
}

class _SaerchMovieBarState extends State<SaerchMovieBar> {
  final MovieController mvCtrl = Get.put(MovieController());
  final TextEditingController searchController = TextEditingController();
  void onPressCancel() {
    searchController.clear();
    mvCtrl.searchQuery.value = '';
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 41,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: ColorCustom.SEARCHBAR),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => mvCtrl.searchQuery.value = value,
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: "Search movie",
                        hintStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() => Visibility(
                visible: mvCtrl.searchQuery.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () => onPressCancel(),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
