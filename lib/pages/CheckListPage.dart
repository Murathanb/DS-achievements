import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/items.dart';
import '../models/item_model.dart';
import '../l10n/app_localizations.dart';
import '../services/firestore_service.dart';

/// =======================================================
/// PLATFORM MESAJI (iOS Toast / Android Snackbar)
/// =======================================================
class PlatformMessage {
  static void show(BuildContext context, String message) {
    if (Platform.isIOS) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 14,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

class CheckListPage extends StatefulWidget {
  final void Function(Locale) onLocaleChange;
  final bool isDarkMode;
  final void Function(bool) onThemeChange;

  const CheckListPage({
    super.key,
    required this.onLocaleChange,
    required this.isDarkMode,
    required this.onThemeChange,
  });

  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirestoreService _firestore = FirestoreService();

  int _currentIndex = 0;
  bool _isTurkish = false;

  final Set<int> _shownMilestones = {};
  final List<ItemModel> completedItems = [];

  List<ItemModel> get items =>
      allItems.where((e) => !completedItems.contains(e)).toList();

  // ================== AUDIO ==================
  Future<void> playCheckSound() async {
    await _audioPlayer.play(AssetSource('sounds/check.mp3'));
  }

  Future<void> playNavSound() async {
    await _audioPlayer.play(AssetSource('sounds/nav.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // ================== GOOGLE LOGIN ==================
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      PlatformMessage.show(context, 'Google ile giriş başarılı');

      // Load Firestore data for the signed-in user
      _loadFromFirestore();

      setState(() {});
    } catch (e) {
      PlatformMessage.show(context, 'Google giriş hatası');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    PlatformMessage.show(context, 'Çıkış yapıldı');
    setState(() {});
  }

  // ================== MILESTONE ==================
  void _checkMilestoneAndShowMessage() {
    final count = completedItems.length;
    final lang = Localizations.localeOf(context).languageCode;

    for (final m in [3, 10, 15]) {
      if (count == m && !_shownMilestones.contains(m)) {
        _shownMilestones.add(m);

        final msg = lang == 'tr'
            ? '$m başarım tamamlandı 🎉'
            : '$m achievements completed 🎉';

        WidgetsBinding.instance.addPostFrameCallback((_) {
          PlatformMessage.show(context, msg);
        });
        break;
      }
    }

    for (final m in [3, 10, 15]) {
      if (count < m) _shownMilestones.remove(m);
    }
  }

  void updateCompletedList(ItemModel item) {
    final fullyChecked =
        item.isChecked && item.subItemsChecked.every((c) => c);

    if (fullyChecked) {
      if (!completedItems.contains(item)) {
        completedItems.add(item);
      }
    } else {
      completedItems.remove(item);
    }

    _checkMilestoneAndShowMessage();
  }

  // ================== SETTINGS ==================
  void toggleLanguage(bool value) {
    setState(() {
      _isTurkish = value;
      widget.onLocaleChange(Locale(value ? 'tr' : 'en'));
    });
  }

  void toggleTheme(bool value) {
    setState(() {
      widget.onThemeChange(value);
    });
  }

  // ================== INIT ==================
  @override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    final locale = Localizations.localeOf(context).languageCode;

    setState(() {
      _isTurkish = locale == 'tr';
    });
  });

  _loadFromFirestore();
}

  Future<void> _loadFromFirestore() async {
    final user = _auth.currentUser;
    if (user == null) return;

    for (final item in allItems) {
      final data = await _firestore.getItem(item.id);
      if (data != null) {
        setState(() {
          item.loadFromFirestore(data);
        });
        updateCompletedList(item);
      }
    }
  }

  // ================== UI ==================
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isDark = widget.isDarkMode;
    final textColor = isDark ? Colors.orange : Colors.brown[900]!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loc.appTitle),
        backgroundColor: isDark ? Colors.black : Colors.white,
        foregroundColor: textColor,
        leading: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset('assets/png/Ds3.Splash.png'),
        ),
      ),
      body: _currentIndex == 0
          ? buildChecklist(items, loc, textColor)
          : _currentIndex == 1
              ? buildChecklist(completedItems, loc, textColor)
              : buildSettings(loc, textColor),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) async {
          await playNavSound();
          setState(() => _currentIndex = i);
        },
        backgroundColor: isDark ? Colors.grey[900] : Colors.brown[50],
        selectedItemColor: isDark ? Colors.orange : Colors.brown[900],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.list_alt), label: loc.menuList),
          BottomNavigationBarItem(
              icon: const Icon(Icons.done_all), label: loc.menuCompleted),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: loc.menuSettings),
        ],
      ),
    );
  }

  // ================== CHECKLIST ==================
  Widget buildChecklist(
      List<ItemModel> source, AppLocalizations loc, Color textColor) {
    return ListView.builder(
      itemCount: source.length,
      itemBuilder: (context, index) {
        final item = source[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => setState(() => item.isExpanded = !item.isExpanded),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                child: Row(
                  children: [
                    Checkbox(
                      value: item.isChecked,
                      fillColor: MaterialStateProperty.all(textColor),
                      onChanged: (val) async {
                        final checked = val ?? false;

                        setState(() {
                          item.isChecked = checked;
                          for (int i = 0;
                              i < item.subItemsChecked.length;
                              i++) {
                            item.subItemsChecked[i] = checked;
                          }
                          updateCompletedList(item);
                        });

                        await _firestore.saveItem(
                            item.id, item.isChecked, item.subItemsChecked);

                        if (checked) playCheckSound();
                      },
                    ),
                    Expanded(
                      child: Text(
                        getItemLocalizedName(item.title, loc),
                        style: TextStyle(
                          color: textColor,
                          decoration: item.isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                    Image.asset(item.imagePath, height: 60, width: 60),
                  ],
                ),
              ),
            ),
            if (item.isExpanded)
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  children: List.generate(item.subItems.length, (i) {
                    return Row(
                      children: [
                        Checkbox(
                          value: item.subItemsChecked[i],
                          fillColor: MaterialStateProperty.all(textColor),
                          onChanged: (val) async {
                            final checked = val ?? false;
                            setState(() {
                              item.subItemsChecked[i] = checked;
                              item.isChecked =
                                  item.subItemsChecked.every((c) => c);
                              updateCompletedList(item);
                            });

                            await _firestore.saveItem(
                                item.id, item.isChecked, item.subItemsChecked);

                            if (item.isChecked) playCheckSound();
                          },
                        ),
                        Expanded(
                          child: Text(
                            getSubItemLocalizedName(
                                item.title, item.subItems[i], loc),
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
          ],
        );
      },
    );
  }

  // ================== SETTINGS ==================
  Widget buildSettings(AppLocalizations loc, Color textColor) {
    final user = _auth.currentUser;
    final photoUrl = user?.photoURL;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================== LOGIN ==================
          Text(
            loc.menuSettings,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          user == null
              ? ElevatedButton.icon(
                  onPressed: signInWithGoogle,
                  icon: const Icon(Icons.login),
                  label: const Text('Google ile Giriş Yap'),
                )
              : Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          photoUrl != null ? NetworkImage(photoUrl) : null,
                      child: photoUrl == null
                          ? const Icon(Icons.person, size: 28)
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        user.email ?? '',
                        style: TextStyle(color: textColor, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: signOut,
                      icon: const Icon(Icons.logout),
                      tooltip: 'Çıkış Yap',
                    ),
                  ],
                ),

          const Divider(height: 40),

          // ================== LANGUAGE ==================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(loc.languageLabel, style: TextStyle(color: textColor)),
              Switch(value: _isTurkish, onChanged: toggleLanguage),
            ],
          ),

          const SizedBox(height: 16),

          // ================== DARK MODE ==================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark Mode', style: TextStyle(color: textColor)),
              Switch(
                value: widget.isDarkMode,
                onChanged: toggleTheme,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================== LOCALIZATION ==================
  String getItemLocalizedName(String key, AppLocalizations loc) {
    switch (key) {
      case 'The Dark Soul':
        return loc.theDarkSoul;
      case 'To Link the First Flame':
        return loc.toLinkTheFirstFlame;
      case 'The End of Fire':
        return loc.theEndOfFire;
      case 'The Usurpation of Fire':
        return loc.theUsurpationOfFire;
      default:
        return key;
    }
  }

  String getSubItemLocalizedName(
      String itemKey, String subItem, AppLocalizations loc) {
    switch (itemKey) {
      case 'The Dark Soul':
        return loc.theDarkSoulDesc;
      case 'To Link the First Flame':
        return loc.toLinkTheFirstFlameDesc;
      case 'The End of Fire':
        return loc.theEndOfFireDesc;
      case 'The Usurpation of Fire':
        return loc.theUsurpationOfFireDesc;
      default:
        return subItem;
    }
  }
}
