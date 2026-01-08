import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark Souls 3 Achievements'**
  String get appTitle;

  /// No description provided for @menuList.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get menuList;

  /// No description provided for @menuCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get menuCompleted;

  /// No description provided for @menuSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get menuSettings;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @theDarkSoul.
  ///
  /// In en, this message translates to:
  /// **'The Dark Soul'**
  String get theDarkSoul;

  /// No description provided for @theDarkSoulDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete all achievements.'**
  String get theDarkSoulDesc;

  /// No description provided for @toLinkTheFirstFlame.
  ///
  /// In en, this message translates to:
  /// **'To Link the First Flame'**
  String get toLinkTheFirstFlame;

  /// No description provided for @toLinkTheFirstFlameDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach \"To Link the First Flame\" ending.'**
  String get toLinkTheFirstFlameDesc;

  /// No description provided for @theEndOfFire.
  ///
  /// In en, this message translates to:
  /// **'The End of Fire'**
  String get theEndOfFire;

  /// No description provided for @theEndOfFireDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach \"The End of Fire\" ending.'**
  String get theEndOfFireDesc;

  /// No description provided for @theUsurpationOfFire.
  ///
  /// In en, this message translates to:
  /// **'The Usurpation of Fire'**
  String get theUsurpationOfFire;

  /// No description provided for @theUsurpationOfFireDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach \"The Usurpation of Fire\" ending.'**
  String get theUsurpationOfFireDesc;

  /// No description provided for @iudexGundyr.
  ///
  /// In en, this message translates to:
  /// **'Iudex Gundyr'**
  String get iudexGundyr;

  /// No description provided for @iudexGundyrDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Iudex Gundyr.'**
  String get iudexGundyrDesc;

  /// No description provided for @vordtOfTheBorealValley.
  ///
  /// In en, this message translates to:
  /// **'Vordt of the Boreal Valley'**
  String get vordtOfTheBorealValley;

  /// No description provided for @vordtOfTheBorealValleyDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Vordt of the Boreal Valley.'**
  String get vordtOfTheBorealValleyDesc;

  /// No description provided for @curseRottedGreatwood.
  ///
  /// In en, this message translates to:
  /// **'Curse-rotted Greatwood'**
  String get curseRottedGreatwood;

  /// No description provided for @curseRottedGreatwoodDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Curse-rotted Greatwood.'**
  String get curseRottedGreatwoodDesc;

  /// No description provided for @crystalSage.
  ///
  /// In en, this message translates to:
  /// **'Crystal Sage'**
  String get crystalSage;

  /// No description provided for @crystalSageDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Crystal Sage.'**
  String get crystalSageDesc;

  /// No description provided for @deaconsOfTheDeep.
  ///
  /// In en, this message translates to:
  /// **'Deacons of the Deep'**
  String get deaconsOfTheDeep;

  /// No description provided for @deaconsOfTheDeepDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Deacons of the Deep.'**
  String get deaconsOfTheDeepDesc;

  /// No description provided for @abyssWatchers.
  ///
  /// In en, this message translates to:
  /// **'Abyss Watchers'**
  String get abyssWatchers;

  /// No description provided for @abyssWatchersDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Abyss Watchers, Lords of Cinder.'**
  String get abyssWatchersDesc;

  /// No description provided for @highLordWolnir.
  ///
  /// In en, this message translates to:
  /// **'High Lord Wolnir'**
  String get highLordWolnir;

  /// No description provided for @highLordWolnirDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat High Lord Wolnir.'**
  String get highLordWolnirDesc;

  /// No description provided for @pontiffSulyvahn.
  ///
  /// In en, this message translates to:
  /// **'Pontiff Sulyvahn'**
  String get pontiffSulyvahn;

  /// No description provided for @pontiffSulyvahnDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Pontiff Sulyvahn.'**
  String get pontiffSulyvahnDesc;

  /// No description provided for @yhormTheGiant.
  ///
  /// In en, this message translates to:
  /// **'Yhorm the Giant'**
  String get yhormTheGiant;

  /// No description provided for @yhormTheGiantDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Yhorm the Giant.'**
  String get yhormTheGiantDesc;

  /// No description provided for @aldrichDevourerOfGods.
  ///
  /// In en, this message translates to:
  /// **'Aldrich, Devourer of Gods'**
  String get aldrichDevourerOfGods;

  /// No description provided for @aldrichDevourerOfGodsDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Aldrich, Devourer of Gods.'**
  String get aldrichDevourerOfGodsDesc;

  /// No description provided for @lothricYoungerPrince.
  ///
  /// In en, this message translates to:
  /// **'Lothric, Younger Prince'**
  String get lothricYoungerPrince;

  /// No description provided for @lothricYoungerPrinceDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Lothric & Lorian (Twin Princes).'**
  String get lothricYoungerPrinceDesc;

  /// No description provided for @dragonslayerArmour.
  ///
  /// In en, this message translates to:
  /// **'Dragonslayer Armour'**
  String get dragonslayerArmour;

  /// No description provided for @dragonslayerArmourDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Dragonslayer Armour.'**
  String get dragonslayerArmourDesc;

  /// No description provided for @oceirosTheConsumedKing.
  ///
  /// In en, this message translates to:
  /// **'Oceiros, the Consumed King'**
  String get oceirosTheConsumedKing;

  /// No description provided for @oceirosTheConsumedKingDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Oceiros, the Consumed King.'**
  String get oceirosTheConsumedKingDesc;

  /// No description provided for @championGundyr.
  ///
  /// In en, this message translates to:
  /// **'Champion Gundyr'**
  String get championGundyr;

  /// No description provided for @championGundyrDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Champion Gundyr.'**
  String get championGundyrDesc;

  /// No description provided for @ancientWyvern.
  ///
  /// In en, this message translates to:
  /// **'Ancient Wyvern'**
  String get ancientWyvern;

  /// No description provided for @ancientWyvernDesc.
  ///
  /// In en, this message translates to:
  /// **'Perform the plunging attack from the ledge at Archdragon Peak.'**
  String get ancientWyvernDesc;

  /// No description provided for @theNamelessKing.
  ///
  /// In en, this message translates to:
  /// **'The Nameless King'**
  String get theNamelessKing;

  /// No description provided for @theNamelessKingDesc.
  ///
  /// In en, this message translates to:
  /// **'Defeat Nameless King.'**
  String get theNamelessKingDesc;

  /// No description provided for @covenantWarriorOfSunlight.
  ///
  /// In en, this message translates to:
  /// **'Covenant: Warrior of Sunlight'**
  String get covenantWarriorOfSunlight;

  /// No description provided for @covenantWarriorOfSunlightDesc.
  ///
  /// In en, this message translates to:
  /// **'Join Warrior of Sunlight covenant.'**
  String get covenantWarriorOfSunlightDesc;

  /// No description provided for @covenantWayOfBlue.
  ///
  /// In en, this message translates to:
  /// **'Covenant: Way of Blue'**
  String get covenantWayOfBlue;

  /// No description provided for @covenantWayOfBlueDesc.
  ///
  /// In en, this message translates to:
  /// **'Join Way of Blue covenant.'**
  String get covenantWayOfBlueDesc;

  /// No description provided for @covenantBlueSentinels.
  ///
  /// In en, this message translates to:
  /// **'Covenant: Blue Sentinels'**
  String get covenantBlueSentinels;

  /// No description provided for @covenantBlueSentinelsDesc.
  ///
  /// In en, this message translates to:
  /// **'Join Blue Sentinels covenant.'**
  String get covenantBlueSentinelsDesc;

  /// No description provided for @covenantBladeOfTheDarkmoon.
  ///
  /// In en, this message translates to:
  /// **'Covenant: Blade of the Darkmoon'**
  String get covenantBladeOfTheDarkmoon;

  /// No description provided for @covenantBladeOfTheDarkmoonDesc.
  ///
  /// In en, this message translates to:
  /// **'Join Blade of the Darkmoon covenant.'**
  String get covenantBladeOfTheDarkmoonDesc;

  /// No description provided for @covenantRosariasFingers.
  ///
  /// In en, this message translates to:
  /// **'Covenant: Rosaria\'s Fingers'**
  String get covenantRosariasFingers;

  /// No description provided for @covenantRosariasFingersDesc.
  ///
  /// In en, this message translates to:
  /// **'Join Rosaria\'s Fingers covenant.'**
  String get covenantRosariasFingersDesc;

  /// No description provided for @covenantMoundMakers.
  ///
  /// In en, this message translates to:
  /// **'Covenant: Mound-makers'**
  String get covenantMoundMakers;

  /// No description provided for @covenantMoundMakersDesc.
  ///
  /// In en, this message translates to:
  /// **'Join Mound-makers covenant.'**
  String get covenantMoundMakersDesc;

  /// No description provided for @covenantWatchdogsOfFarron.
  ///
  /// In en, this message translates to:
  /// **'Covenant: Watchdogs of Farron'**
  String get covenantWatchdogsOfFarron;

  /// No description provided for @covenantWatchdogsOfFarronDesc.
  ///
  /// In en, this message translates to:
  /// **'Join Watchdogs of Farron covenant.'**
  String get covenantWatchdogsOfFarronDesc;

  /// No description provided for @covenantAldrichFaithful.
  ///
  /// In en, this message translates to:
  /// **'Covenant: Aldrich Faithful'**
  String get covenantAldrichFaithful;

  /// No description provided for @covenantAldrichFaithfulDesc.
  ///
  /// In en, this message translates to:
  /// **'Join Aldrich Faithful covenant.'**
  String get covenantAldrichFaithfulDesc;

  /// No description provided for @supremeWeaponReinforcement.
  ///
  /// In en, this message translates to:
  /// **'Supreme Weapon Reinforcement'**
  String get supremeWeaponReinforcement;

  /// No description provided for @supremeWeaponReinforcementDesc.
  ///
  /// In en, this message translates to:
  /// **'Upgrade any weapon to maximum reinforcement level.'**
  String get supremeWeaponReinforcementDesc;

  /// No description provided for @masterOfInfusion.
  ///
  /// In en, this message translates to:
  /// **'Master of Infusion'**
  String get masterOfInfusion;

  /// No description provided for @masterOfInfusionDesc.
  ///
  /// In en, this message translates to:
  /// **'Perform all forms of infusion.'**
  String get masterOfInfusionDesc;

  /// No description provided for @masterOfSorceries.
  ///
  /// In en, this message translates to:
  /// **'Master of Sorceries'**
  String get masterOfSorceries;

  /// No description provided for @masterOfSorceriesDesc.
  ///
  /// In en, this message translates to:
  /// **'Acquire all sorceries.'**
  String get masterOfSorceriesDesc;

  /// No description provided for @masterOfPyromancies.
  ///
  /// In en, this message translates to:
  /// **'Master of Pyromancies'**
  String get masterOfPyromancies;

  /// No description provided for @masterOfPyromanciesDesc.
  ///
  /// In en, this message translates to:
  /// **'Acquire all pyromancies.'**
  String get masterOfPyromanciesDesc;

  /// No description provided for @masterOfMiracles.
  ///
  /// In en, this message translates to:
  /// **'Master of Miracles'**
  String get masterOfMiracles;

  /// No description provided for @masterOfMiraclesDesc.
  ///
  /// In en, this message translates to:
  /// **'Acquire all miracles.'**
  String get masterOfMiraclesDesc;

  /// No description provided for @masterOfRings.
  ///
  /// In en, this message translates to:
  /// **'Master of Rings'**
  String get masterOfRings;

  /// No description provided for @masterOfRingsDesc.
  ///
  /// In en, this message translates to:
  /// **'Acquire all rings.'**
  String get masterOfRingsDesc;

  /// No description provided for @masterOfExpression.
  ///
  /// In en, this message translates to:
  /// **'Master of Expression'**
  String get masterOfExpression;

  /// No description provided for @masterOfExpressionDesc.
  ///
  /// In en, this message translates to:
  /// **'Learn all gestures.'**
  String get masterOfExpressionDesc;

  /// No description provided for @ultimateBonfire.
  ///
  /// In en, this message translates to:
  /// **'Ultimate Bonfire'**
  String get ultimateBonfire;

  /// No description provided for @ultimateBonfireDesc.
  ///
  /// In en, this message translates to:
  /// **'Reinforce a bonfire to the highest level.'**
  String get ultimateBonfireDesc;

  /// No description provided for @ultimateEstus.
  ///
  /// In en, this message translates to:
  /// **'Ultimate Estus'**
  String get ultimateEstus;

  /// No description provided for @ultimateEstusDesc.
  ///
  /// In en, this message translates to:
  /// **'Reinforce the Estus Flask to the highest level.'**
  String get ultimateEstusDesc;

  /// No description provided for @archdragonPeak.
  ///
  /// In en, this message translates to:
  /// **'Archdragon Peak'**
  String get archdragonPeak;

  /// No description provided for @archdragonPeakDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach Archdragon Peak.'**
  String get archdragonPeakDesc;

  /// No description provided for @untendedGraves.
  ///
  /// In en, this message translates to:
  /// **'Untended Graves'**
  String get untendedGraves;

  /// No description provided for @untendedGravesDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach Untended Graves.'**
  String get untendedGravesDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
