import 'package:flutter/material.dart';

class TimelineEvent {
  final TimeOfDay time;
  final String description;
  final String? header;
  final String? details;
  final String? mapPosition;
  final String? imageUrl;

  TimelineEvent({
    required this.time,
    required this.description,
    this.header,
    this.details,
    this.mapPosition,
    this.imageUrl,
  });
}

final List<TimelineEvent> timelineEvents = [
  TimelineEvent(
    time: TimeOfDay(hour: 9, minute: 31),
    description: "Sraz na metru Florenc",
    header: "Sraz a cesta do Vráže",
    details: "Metro Florenc v 9:31",
    imageUrl: 'assets/images/image2.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 10, minute: 00),
    description: "Přestup na autobus 384 na Zličíně",
    header: "Přestup na autobus",
    details: "Autobus č. 384 směr Vráž, odjezd v 10:00",
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 10, minute: 19),
    description: "Příjezd do Vráže",
    header: "Start turistické trasy",
    details: "Vráž u Berouna (10:19)",
    imageUrl: 'assets/images/image3.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 11, minute: 06),
    description: "Příchod do Svatého Jana pod Skalou",
    header: "Bod 1: Svatý Jan pod Skalou",
    details: "2,7 km, cca 47 minut chůze, příjezd cca 11:06",
    imageUrl: 'assets/images/image1.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 11, minute: 10),
    description: "Prohlídka kláštera a jeskyně sv. Ivana",
    header: "Hlavní atrakce ve Svatém Janu pod Skalou",
    details: "Prohlídka kláštera a jeskyně. Krátká přestávka. (11:10 - 12:00)",
    mapPosition: "49.9667° N, 14.1333° E",
    imageUrl: 'assets/images/image5.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 12, minute: 00),
    description: "Oběd v Restauraci Obecná Škola",
    header: "Oběd",
    details: "Restaurace Obecná Škola ve Svatém Janu pod Skalou (12:00 - 13:00). Posilnění před výstupem ke Kříži a návštěvou Solvayových lomů.",
    mapPosition: "49.9667° N, 14.1333° E",
    imageUrl: 'assets/images/image7.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 13, minute: 05),
    description: "Začátek výstupu ke Kříži",
    header: "Naučná stezka 'Svatojánský okruh'",
    details: "Bod 2: Kříž (1,2 km, cca 37 minut chůze, odchod cca 13:05, příjezd cca 13:42)",
    imageUrl: 'assets/images/image8.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 13, minute: 53),
    description: "Příchod k Solvayovým lomům",
    header: "Bod 3: Solvayovy lomy",
    details: "Solvayovy lomy a skanzen těžby vápence (583 m, cca 11 minut chůze, příjezd cca 13:53). Prohlídka Solvayových lomů a skanzenu (13:55 - 14:55, cca 1 hodina)",
    mapPosition: "49.9667° N, 14.1333° E",
    imageUrl: 'assets/images/image9.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 15, minute: 07),
    description: "U Styldlé vody",
    header: "Bod 4: U Styldlé vody",
    details: "633 m, cca 12 minut chůze, příjezd cca 15:07",
    mapPosition: "49.9667° N, 14.1333° E",
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 15, minute: 39),
    description: "Návrat do Svatého Jana pod Skalou",
    header: "Bod 5: Svatý Jan pod Skalou",
    details: "1,9 km, cca 32 minut chůze, příjezd cca 15:39",
    imageUrl: 'assets/images/image10.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 15, minute: 45),
    description: "Pivko v Hostinci Ve Skále",
    header: "Pivko",
    details: "Hostinec Ve Skále ve Svatém Janu pod Skalou (15:45 - 16:15)",
    mapPosition: "49.9667° N, 14.1333° E",
    imageUrl: 'assets/images/image11.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 16, minute: 20),
    description: "Začátek cesty do Srbska",
    header: "Návrat do Prahy",
    details: "Cíl: Srbsko (4,8 km, cca 1 hodina 21 minut chůze, odchod cca 16:20, příjezd cca 17:41)",
    imageUrl: 'assets/images/image12.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 17, minute: 52),
    description: "Odjezd vlakem do Prahy",
    header: "Vlak: Srbsko - Praha Hlavní nádraží",
    details: "Odjezd v 17:52, příjezd v 18:39",
    imageUrl: 'assets/images/image13.jpg',
  ),
  TimelineEvent(
    time: TimeOfDay(hour: 18, minute: 52),
    description: "Alternativní odjezd vlakem do Prahy",
    header: "Alternativní vlak",
    details: "Odjezd v 18:52, příjezd v 19:39 (v případě zdržení)",
    imageUrl: 'assets/images/image13.jpg',
  ),
];