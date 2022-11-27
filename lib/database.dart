import 'package:flutter/material.dart';
import 'utility.dart';
import 'profileUtility.dart';
import 'lists.dart';

class animedatabase {
  static List<AnimeInfo> animeList = [
    AnimeInfo(
      0,
      'SPY x FAMILY',
      'Tatsuya Endo',
      'Kazuhiro Furuhashi',
      [
        {
          'name': 'Atsumi Tanezaki',
          'role': 'Anya Forger',
          'img': 'SPYxFamilyC1.jpg'
        },
        {
          'name': 'Saori Hayami',
          'role': 'Yor Forger',
          'img': 'SPYxFamilyC2.jpg'
        },
        {
          'name': 'Takuya Eguchi',
          'role': 'Loid Forger',
          'img': 'SPYxFamilyC3.jpg'
        },
        {
          'name': 'Natsumi Fujiwara',
          'role': 'Damian Desmond',
          'img': 'SPYxFamilyC4.jpg'
        },
        {
          'name': 'Kensho Ono',
          'role': 'Yuri Briar',
          'img': 'SPYxFamilyC5.jpg'
        },
        {
          'name': 'Kazuhiro Yamaji',
          'role': 'Henry Henderson',
          'img': 'SPYxFamilyC6.jpg'
        },
        {
          'name': 'Hiroyuki Yoshino',
          'role': 'Franky Franklin',
          'img': 'SPYxFamilyC7.jpg'
        },
        {
          'name': 'Emiri Katou',
          'role': 'Becky Blackbell',
          'img': 'SPYxFamilyC8.jpg'
        },
        {
          'name': 'Yuuko Kaida',
          'role': 'Sylvia	Sherwood',
          'img': 'SPYxFamilyC9.jpg'
        },
      ],
      ['action', 'comedy', 'school'],
      'SPYxFamily.jpeg',
      ['SPYxFamily00.jpg', 'SPYxFamily01.jpg'],
      4.3,
      'A spy on an undercover mission gets married and adopts a child as part of his cover. His wife and daughter have secrets of their own, and all three must strive to keep together.',
      DateTime.utc(2022, 4, 9),
      ['new season', 'in progress'],
      111,
      [
        Comment(0, DateTime.utc(2022, 11, 2), 788, 4.5,
            "Spy x Family is an oddball tonal mashup that blends the action-packed and high-stakes world of spies with a heartwarming, family-friendly comedy."),
        Comment(1, DateTime.utc(2022, 11, 7), 211, 5.0,
            "Spy x Family is an anime of the year candidate. Yes, I say this with confidence for it managed to exemplify entertainment at consistent quality. It's an anime that sells itself as exactly what it is without misleading the audience."),
        Comment(4, DateTime.utc(2022, 11, 24), 433, 4.5,
            "You could not have possibly missed this, Spy x Family has taken the community by storm. It is everywhere, be it in the form of Yor and Anya fanarts (with an appalling lack of Loid ones) or Anya smug face memes."),
      ],
    ),
    AnimeInfo(
      1,
      'Chainsaw Man',
      'Tatsuki Fujimoto',
      'Ryu Nakayama',
      [
        {
          'name': 'Tomori Kusunoki',
          'role': 'Makima',
          'img': 'ChainsawManC1.jpg'
        },
        {
          'name': 'Ai Fairouz',
          'role': 'Power',
          'img': 'ChainsawManC2.jpg'
        },
        {
          'name': 'Kikunosuke Toya',
          'role': 'Denji',
          'img': 'ChainsawManC3.jpg'
        },
        {
          'name': 'Shougo Sakata',
          'role': 'Aki Hayakawa',
          'img': 'ChainsawManC4.jpg'
        },
        {
          'name': 'Karin Takahashi',
          'role': 'Kobeni Higashiyama',
          'img': 'ChainsawManC5.jpg'
        },
        {
          'name': 'Shiori Izawa',
          'role': 'Pochita',
          'img': 'ChainsawManC6.jpg'
        },
      ],
      ['adventure', 'action', 'monster'],
      'ChainsawMan.jpg',
      [
        'ChainsawMan00.jpg',
        'ChainsawMan01.jpg',
      ],
      4.4,
      'Following a betrayal, a young man left for the dead is reborn as a powerful devil-human hybrid after merging with his pet devil and is soon enlisted into an organization dedicated to hunting devils.',
      DateTime.utc(2022, 10, 12),
      ['new season', 'in progress'],
      84,
      [
        Comment(5, DateTime.utc(2022, 11, 22), 493, 4,
            "Chainsaw Man is one of the most hyped and waited animes of the year, and let me tell you that its fans have a point."),
        Comment(8, DateTime.utc(2022, 11, 15), 77, 3,
            "Perhaps I could have given it a better rate, had it not been the fact that the freaking hype about this anime was absolutely unprecedented."),
        Comment(11, DateTime.utc(2022, 11, 6), 695, 4,
            "Chainsaw Man or CSM for short is undoubtedly the biggest anime this year with over 500k people having it in their PTW before its release."),
      ],
    ),
    AnimeInfo(
      2,
      'Attack on Titan',
      'Hajime Isayama',
      'Tetsurô Araki',
      [
        {
          'name': 'Yuuki Kaji',
          'role': 'Eren Yeager',
          'img': 'AttackOnTitanC1.jpg'
        },
        {
          'name': 'Yui Ishikawa',
          'role': 'Mikasa Ackerman',
          'img': 'AttackOnTitanC2.jpg'
        },
        {
          'name': 'Marina Inoue',
          'role': 'Armin Arlert',
          'img': 'AttackOnTitanC3.jpg'
        },
        {
          'name': 'Hiroshi Kamiya',
          'role': 'Levi',
          'img': 'AttackOnTitanC4.jpg'
        },
      ],
      ['monster', 'action', 'adventure'],
      'AttackOnTitan.jpg',
      ['AttackOnTitan00.jpg', 'AttackOnTitan01.jpg', 'AttackOnTitan02.jpg'],
      4.5,
      'After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.',
      DateTime.utc(2013, 4, 7),
      ['ended'],
      357,
      [
        Comment(1, DateTime.utc(2022, 11, 9), 875, 4.5,
            "I started to follow the manga after watching the anime and quite frankly I don't see where and how the plot of Shingeki no Kyojin can suck, which in my humble opinion is awesome."),
        Comment(2, DateTime.utc(2022, 11, 16), 577, 5,
            "Attack on Titan is such a well-done product that it has all the key strong points we all dream every series could have. By this I mean the story, characters, animation, OST, opening/ending sequences, art, directing, narrative, character development, and, most importantly, the it factor. These are all present with A grade production values."),
        Comment(3, DateTime.utc(2022, 11, 26), 56, 5,
            "Why is it popular? Well that's simply because it's stunningly amazing. Those people that call Shingeki no Kyojin overrated may not have the same taste as me, and that's perfectly fine, but in my honest opinion, Shingeki no Kyojin is one of if not the greatest anime to be made."),
      ],
    ),
    AnimeInfo(
      3,
      'Demon Slayer',
      'Koyoharu Gotōge',
      'Sotozaki Haruo',
      [
        {
          'name': 'Natsuki Hanae',
          'role': 'Tanjirou Kamado',
          'img': 'DemonSlayerC1.jpg'
        },
        {
          'name': 'Hiro Shimono',
          'role': 'Zenitsu Agatsuma',
          'img': 'DemonSlayerC2.jpg'
        },
        {
          'name': 'Akari Kitou',
          'role': 'Nezuko Kamado',
          'img': 'DemonSlayerC3.jpg'
        },
      ],
      ['action', 'monster', 'adventure'],
      'DemonSlayer.jpg',
      ['DemonSlayer00.jpg', 'DemonSlayer01.jpg', 'DemonSlayer02.jpg'],
      4.4,
      'A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.',
      DateTime.utc(2019, 4, 6),
      ['in progress'],
      260,
      [
        Comment(7, DateTime.utc(2022, 11, 20), 836, 4,
            "Demon Slayer has some of the best animation of this generation, but I can’t recommend the entire show because the writing is… pretty bad."),
        Comment(9, DateTime.utc(2022, 11, 25), 770, 5,
            "Ah ufotable, the studio that keeps on giving. Before Kimetsu no Yaiba aired, news broke out that we’d get them animating the show. And to my delight, it’s a studio that earned its praise for its high caliber animation and consistently delivering quality content. Being their first 2-cour show (without a split cour break), Kimetsu no Yaiba is a special gift not just for the manga fans but anyone ready to experience a world of demons and dark fantasy."),
        Comment(10, DateTime.utc(2022, 11, 24), 503, 1.5,
            "Oh boy, the seasonal battle shounen that everyone raves about, what does it do right? Well to be completely honest, nothing, the only thing it got going for it is the production quality from ufotable."),
      ],
    ),
    AnimeInfo(
      4,
      'My Hero Academia',
      'Kôhei Horikoshi',
      'Kenji Nagasaki',
      [
        {
          'name': 'Daiki Yamashita',
          'role': 'Izuku Midoriya',
          'img': 'MyHeroAcademiaC1.jpg'
        },
        {
          'name': 'Nobuhiko Okamoto',
          'role': 'Katsuki Bakugou',
          'img': 'MyHeroAcademiaC2.jpg'
        },
        {
          'name': 'Kenta Miyake',
          'role': 'All Might',
          'img': 'MyHeroAcademiaC3.jpg'
        },
      ],
      ['action', 'adventure', 'school'],
      'MyHeroAcademia.jpg',
      ['MyHeroAcademia00.jpeg', 'MyHeroAcademia01.jpg'],
      4.2,
      'A superhero-loving boy without any powers is determined to enroll in a prestigious hero academy and learn what it really means to be a hero.',
      DateTime.utc(2016, 4, 3),
      ['in progress'],
      274,
      [
        Comment(2, DateTime.utc(2022, 11, 18), 114, 4.5,
            "My Hero Academia is regularly billed as The New One Piece or The New Naruto. There's certainly some truth to that - even setting aside meta comparisons like its status as Jump's new cash cow, it clearly draws inspiration from both, with its distinctive cartoony character designs and action scenes owing much to One Piece, and its school setting and ensemble cast resembling early Naruto."),
        Comment(6, DateTime.utc(2022, 11, 18), 108, 5,
            "Perhaps the next “big thing” by Shounen Jump. It was inevitable that Boku no Hero Academia (My Hero Academia) would get an anime adaptation."),
        Comment(7, DateTime.utc(2022, 11, 26), 644, 3.5,
            "Boku no Hero Academia is an anime that lives and dies by the conventional. While that could be seen as a negative feature in most scenarios, for a superhero shounen that understands its limitations, it's actually quite refreshing."),
      ],
    ),
    // 5
    AnimeInfo(
      5,
      "Mob Psycho 100",
      'Yuzuru Tachikawa',
      'Takahiro Hasui',
      [
        {
          'name': 'Takahiro Sakurai',
          'role': 'Arataka Reigen',
          'img': 'MobPsychoC1.jpg'
        },
        {
          'name': 'Setsuo Itou',
          'role': 'Shigeo Kageyama',
          'img': 'MobPsychoC2.jpg'
        },
        {
          'name': 'Akio Ootsuka',
          'role': 'Ekubo',
          'img': 'MobPsychoC3.jpg'
        },
      ],
      ['action', 'comedy', 'supernatural'],
      'MobPsycho100.jpg',
      ['MobPsycho00.jpg', 'MobPsycho01.jpg'],
      4.4,
      'After foiling a world-threatening plot, Shigeo "Mob" Kageyama returns to tackle the more exhausting aspects of his mundane life—starting with filling out his school\'s nerve-racking career form.',
      DateTime.utc(2022, 10, 6),
      ['new season', 'in progress'],
      38,
      [
        Comment(0, DateTime.utc(2022, 11, 18), 450, 5,
            "Have you ever watched an anime that had 12 episodes that had very interesting visuals, great characters (and development) and story that was charming in its own nature? No? Well Mob Psycho 100 is right here for you to watch!"),
        Comment(4, DateTime.utc(2022, 11, 24), 366, 4.5,
            "Funny, whimsical, charming, and oddly enough, thoughtful."),
        Comment(11, DateTime.utc(2022, 11, 17), 653, 5,
            "There’s probably a million ways to describe Mob Psycho 100. One simple word is just exciting."),
      ],
    ),
    AnimeInfo(
      6,
      'Bleach-Sennen Kessen-hen',
      'Tite Kubo',
      'Tomohisa Taguchi',
      [
        {
          'name': 'Masakazu Morita',
          'role': 'Ichigo Kurosaki',
          'img': 'Bleach-SennenKessen-henC1.jpg'
        },
        {
          'name': 'Fumiko Orikasa',
          'role': 'Rukia Kuchiki',
          'img': 'Bleach-SennenKessen-henC2.jpg'
        },
        {
          'name': 'Kentarou Itou',
          'role': 'RenjiAbarai',
          'img': 'Bleach-SennenKessen-henC3.jpg'
        },
      ],
      ['action', 'adventure', 'fantasy'],
      'Bleach-SennenKessen-hen.jpg',
      [
        'Bleach-SennenKessen-hen00.jpg',
        'Bleach-SennenKessen-hen01.jpg',
        'Bleach-SennenKessen-hen02.jpg'
      ],
      4.6,
      'Substitute Soul Reaper Ichigo Kurosaki spends his days fighting against Hollows, dangerous evil spirits that threaten Karakura Town.',
      DateTime.utc(2022, 10, 11),
      ['new season', 'in progress'],
      29,
      [
        Comment(5, DateTime.utc(2022, 11, 7), 591, 4,
            "BLEACH has finally made its great return to the mainstream."),
        Comment(6, DateTime.utc(2022, 11, 12), 285, 4.5,
            "This season of Bleach is one that i waited for a long time.The animation is something else, something good."),
        Comment(9, DateTime.utc(2022, 11, 19), 178, 4.5,
            "Even in the best that Bleach has to offer, some still won't be able to appreciate it. It's bad, shallow, no writing..and the nitpicks go on. To those saying nothing is happening at all, are you even watching the show, because a goddamn war is actually taking place, which goes beyond just (oh look..there's a new big baddy now)."),
      ],
    ),
    AnimeInfo(
      7,
      'Jujutsu Kaisen',
      'Gege Akutami',
      'Seong-Hu Park',
      [
        {
          'name': 'Yuuichi Nakamura',
          'role': 'Satoru Gojou',
          'img': 'JujutsuKaisenC1.jpg'
        },
        {
          'name': 'Junya Enoki',
          'role': 'Yuuji Itadori',
          'img': 'JujutsuKaisenC2.jpg'
        },
        {
          'name': 'Yuuma Uchida',
          'role': 'Megumi Fushiguro',
          'img': 'JujutsuKaisenC3.jpg'
        },
      ],
      ['action', 'fantasy', 'school'],
      'JujutsuKaisen.jpg',
      ['JujutsuKaisen00.jpg', 'JujutsuKaisen01.jpg'],
      4.4,
      'Idly indulging in baseless paranormal activities with the Occult Club, high schooler Yuuji Itadori spends his days at either the clubroom or the hospital, where he visits his bedridden grandfather.',
      DateTime.utc(2020, 10, 3),
      ['in progress'],
      204,
      [
        Comment(6, DateTime.utc(2022, 11, 21), 343, 3.5,
            "Jujutsu Kaisen is unlike any other anime I have seen before."),
        Comment(10, DateTime.utc(2022, 11, 14), 660, 5,
            "After the ridiculous success of Demon Slayer, the shounen industry is finally taking notes on how to make a successful adaption. "),
        Comment(11, DateTime.utc(2022, 11, 17), 196, 4,
            "I rate shit on enjoyment because that is what's important.")
      ],
    ),
    AnimeInfo(
      8,
      'Naruto',
      'Masashi Kishimoto',
      'Hayato Date',
      [
        {
          'name': 'Junko Takeuchi',
          'role': 'Naruto Uzumaki',
          'img': 'NarutoC1.jpg'
        },
        {
          'name': 'Kazuhiko Inoue',
          'role': 'Kakashi Hatake',
          'img': 'NarutoC2.jpg'
        },
        {
          'name': 'Noriaki Sugiyama',
          'role': 'Sasuke Uchiha',
          'img': 'NarutoC3.jpg'
        },
      ],
      ['action', 'adventure', 'fantasy'],
      'Naruto.jpg',
      ['Naruto00.jpg', 'Naruto01.jpg', 'Naruto02.jpg'],
      4.0,
      'Moments prior to Naruto Uzumaki\'s birth, a huge demon known as the Kyuubi, the Nine-Tailed Fox, attacked Konohagakure, the Hidden Leaf Village, and wreaked havoc.',
      DateTime.utc(2002, 10, 3),
      ['ended'],
      259,
      [
        Comment(0, DateTime.utc(2022, 11, 3), 455, 4.5,
            "Naruto, yes Naruto. One of the series that has defined the cultural shonen’s of the last generation in the history of anime."),
        Comment(3, DateTime.utc(2022, 11, 8), 990, 5,
            "To be honest, Naruto is the most overhyped show in existence."),
        Comment(5, DateTime.utc(2022, 11, 24), 271, 4,
            "Naruto was the first anime I ever watched. And I'm glad it was."),
      ],
    ),
    AnimeInfo(
      9,
      'One Piece',
      'Eiichiro Oda',
      'Megumi Ishitani',
      [
        {
          'name': 'Mayumi Tanaka',
          'role': 'Monkey D., Luffy',
          'img': 'OnePieceC1.jpg'
        },
        {
          'name': 'Kazuya Nakai',
          'role': 'Roronoa, Zoro',
          'img': 'OnePieceC2.jpg'
        },
        {
          'name': 'Hiroaki Hirata',
          'role': 'Sanji',
          'img': 'OnePieceC3.jpg'
        },
      ],
      ['action', 'adventure', 'fantasy'],
      'OnePiece.jpg',
      ['OnePiece00.jpg', 'OnePiece01.jpg', 'OnePiece02.jpg'],
      4.4,
      'Gol D. Roger was known as the "Pirate King," the strongest and most infamous being to have sailed the Grand Line.',
      DateTime.utc(1999, 10, 20),
      ['in progress'],
      201,
      [
        Comment(7, DateTime.utc(2022, 11, 24), 263, 5,
            "ONE OF THE BEST ANIMES (IF NOT THE BEST) EVER !!! "),
        Comment(8, DateTime.utc(2022, 11, 12), 183, 4.5,
            "I never write reviews but I think this series deserves it."),
        Comment(10, DateTime.utc(2022, 11, 25), 866, 5,
            "One Piece is by far the best shounen anime out there that I have watched."),
      ],
    ),
    //10
    AnimeInfo(
      10,
      'Hunter x Hunter',
      'Yoshihiro Togashi',
      'Hiroshi Koujina',
      [
        {
          'name': 'Mariya Ise',
          'role': 'Killua Zoldyck',
          'img': 'HunterxHunterC1.jpg'
        },
        {
          'name': 'Miyuki Sawashiro',
          'role': 'Kurapika',
          'img': 'HunterxHunterC2.jpg'
        },
        {
          'name': 'Megumi Han',
          'role': 'Gon Freecss',
          'img': 'HunterxHunterC3.jpg'
        },
        {
          'name': 'Keiji Fujiwara',
          'role': 'Leorio Paladiknight',
          'img': 'HunterxHunterC4.jpg'
        },
      ],
      ['action', 'adventure', 'fantasy'],
      'HunterxHunter.jpg',
      ['HunterxHunter00.jpg', 'HunterxHunter01.jpg'],
      4.7,
      'Hunters devote themselves to accomplishing hazardous tasks, all from traversing the world\'s uncharted territories to locating rare items and monsters.',
      DateTime.utc(2011, 10, 2),
      ['in progress'],
      251,
      [
        Comment(3, DateTime.utc(2022, 11, 16), 157, 4,
            "Fans of harem anime or fan service may want to avoid; fans of good character, interesting plot and colourful action with the odd touch of the strange and sinister should watch at the next opportune moment."),
        Comment(4, DateTime.utc(2022, 11, 3), 435, 4.5,
            "Hunter X Hunter is one of the best shonen animes I have ever seen."),
        Comment(8, DateTime.utc(2022, 11, 11), 388, 5,
            "No matter the version, HxH is my favorite shounen series of all time."),
      ],
    ),
    AnimeInfo(
      11,
      'Fullmetal Alchemist',
      'Hiromu Arakawa',
      'Yasuhiro Irie',
      [
        {
          'name': 'Romi Park',
          'role': 'Edward Elric',
          'img': 'FullmetalAlchemistC1.jpg'
        },
        {
          'name': 'Rie Kugimiya',
          'role': 'Alphonse Elric',
          'img': 'FullmetalAlchemistC2.jpg'
        },
        {
          'name': 'Tooru Ookawa',
          'role': 'Roy Mustang',
          'img': 'FullmetalAlchemistC3.jpg'
        },
      ],
      ['action', 'adventure', 'fantasy'],
      'FullmetalAlchemist.jpg',
      ['FullmetalAlchemist00.jpg', 'FullmetalAlchemist01.jpg'],
      4.6,
      'After a horrific alchemy experiment goes wrong in the Elric household, brothers Edward and Alphonse are left in a catastrophic new reality.',
      DateTime.utc(2009, 4, 5),
      ['ended'],
      302,
      [
        Comment(1, DateTime.utc(2022, 11, 6), 404, 4.5,
            "I highly recommend it to anime fans and non-anime fans alike."),
        Comment(2, DateTime.utc(2022, 11, 18), 271, 4.5,
            "Great Story and nice characters. Good art as well."),
        Comment(9, DateTime.utc(2022, 11, 24), 110, 5,
            "I'm a big fan of Fullmetal Alchemist, so it's a-must for me to write a review."),
      ],
    ),
    AnimeInfo(
      12,
      'D.Gray-man',
      'Katsura Hoshino',
      'Christopher Sabat',
      [
        {
          'name': 'Sanae Kobayashi',
          'role': 'Allen Walker',
          'img': 'DGray-manC1.jpg'
        },
        {
          'name': 'Kenichi Suzumura',
          'role': 'Lavi',
          'img': 'DGray-manC2.jpg'},
        {
          'name': 'Takahiro Sakurai',
          'role': 'Yuu Kanda',
          'img': 'DGray-manC3.jpg'
        },
        {
          'name': 'Shizuka Itou',
          'role': 'Lenalee Lee',
          'img': 'DGray-manC4.jpg'
        },
      ],
      ['action', 'adventure', 'comedy'],
      'DGray-man.jpg',
      ['DGray-man00.jpg', 'DGray-man01.jpg'],
      4.0,
      'Losing a loved one is so painful that one may sometimes wish to be able to resurrect them—a weakness that the enigmatic Millennium Earl exploits.',
      DateTime.utc(2006, 10, 3),
      ['ended'],
      65,
      [
        Comment(4, DateTime.utc(2022, 11, 22), 562, 4,
            "I think D.Gray-man is one of those animes you don't expect to be a masterpiece, yet you fall in love with it the more you watch it."),
        Comment(7, DateTime.utc(2022, 11, 22), 180, 5,
            "Worthy watch! It can be compared with the popular shounen anime Naruto and Bleach "),
        Comment(11, DateTime.utc(2022, 11, 7), 363, 4,
            "All in all, the show is well worth watching, even if you don't usually commit to long running shounen."),
      ],
    ),
    AnimeInfo(
      13,
      'Busou Renkin',
      'Nobuhiro Watsuki',
      'Takao Kato',
      [
        {
          'name': 'Ryouka Yuzuki',
          'role': 'Tokiko Tsumura',
          'img': 'BusouRenkinC1.jpg'
        },
        {
          'name': 'Jun Fukuyama',
          'role': 'Kazuki Muto',
          'img': 'BusouRenkinC2.jpg'
        },
        {
          'name': 'Mitsuaki Madono',
          'role': 'Koushaku Chouno',
          'img': 'BusouRenkinC3.jpg'
        },
      ],
      ['action', 'comedy', 'supernatural'],
      'BusouRenkin.jpg',
      ['BusouRenkin00.jpg'],
      4.5,
      'A high-schooler saves a strange girl from a monster, but gets killed. The girl revives him with a magic medallion that also creates a weapon for its owner to fight these monsters. They team up to stop the monsters and their master.',
      DateTime.utc(2006, 10, 5),
      ['ended'],
      65,
      [
        Comment(3, DateTime.utc(2022, 11, 20), 52, 4,
            "We all have those series. Which for some unknown reason we can't help to love. We know we shouldn't, we know it's not good."),
        Comment(2, DateTime.utc(2022, 10, 31), 90, 5,
            "Busou Renkin is a story that takes many of its elements from other anime. You'll see elements of Fullmetal Alchemist, Ruroui Kenshin, Shakugan no Shana, Fate/Stay Night, and probably a bunch more."),
        Comment(10, DateTime.utc(2022, 9, 17), 213, 4,
            "The first three episodes is like the mini-arc going into the main arc, setting the scene, and making the expression known."),
      ],
    ),
    AnimeInfo(
      14,
      'Blue Lock',
      'Muneyuki Kaneshiro (Story), Yuusuke Nomura (Art)',
      'Tetsuaki Watanabe',
      [
        {
          'name': 'Tasuku Kaito',
          'role': 'Meguru Bachira',
          'img': 'BlueLockC1.jpg'
        },
        {
          'name': 'Kazuki Ura',
          'role': 'Yoichi Isagi',
          'img': 'BlueLockC2.jpg'
        },
        {
          'name': 'Souma Saitou',
          'role': 'Hyouma Chigiri',
          'img': 'BlueLockC3.jpg'
        },
      ],
      [
        'sports',
      ],
      'BlueLock.jpg',
      ['BlueLock00.jpg', 'BlueLock01.jpg'],
      3.4,
      'Japan keeps losing the World Cup, over and over. After Isagi Yoichi, a forward for a high school team, gets eliminated in the last game in the qualifier for nationals, gets invited to a program called "Blue Lock" Their coach will be Ego Jinpachi, who intends to "destroy Japanese loser football" by introducing a radical new training regimen: isolate 300 young forwards in a prison-like institution called "Blue Lock" and put them through rigorous training aimed at creating "the world\'s greatest egotist striker."',
      DateTime.utc(2022, 10, 9),
      ['new season', 'in progress'],
      80,
      [
        Comment(8, DateTime.utc(2022, 11, 12), 45, 4,
            "Blue Lock is literally a sports series who can only offer good animation and good looking characters. Now, that's not totally a bad thing cuz I, myself is a sucker for animanga with good looking and all boys characters whom I can ship with each other."),
        Comment(4, DateTime.utc(2022, 11, 11), 36, 2,
            "And what can I say - it's one of those anime catered towards the \"14-year old Tumblr-Girls\" of the community. I can't express how much I dislike this side of the anime audience."),
        Comment(1, DateTime.utc(2022, 10, 17), 55, 3.5,
            "Blue Lock's plot is simple. To produce the greatest striker in the world and to make a football team consist only of best strikers and win the world cup."),
      ],
    ),
    AnimeInfo(
      15,
      'Grand Blue',
      'Kenji Inoue (Story), Kimitake Yoshioka (Art)',
      'Shinji Takamatsu',
      [
        {
          'name': 'Chika Anzai',
          'role': 'Chisa Kotegawa',
          'img': 'GrandBlueC1.jpg'
        },
        {
          'name': 'Yuuma Uchida',
          'role': '	Iori Kitahara',
          'img': 'GrandBlueC2.jpg'
        },
        {
          'name': 'Ryouhei Kimura',
          'role': 'Kouhei Imamura',
          'img': 'GrandBlueC3.jpg'
        },
      ],
      ['comedy', 'sports'],
      'GrandBlue.jpg',
      ['GrandBlue00.jpg', 'GrandBlue01.jpg'],
      4.2,
      'A college student spends his year at the seaside town of Izu, having fun on the beach with his school friends.',
      DateTime.utc(2018, 7, 14),
      ['in progress'],
      72,
      [
        Comment(3, DateTime.utc(2022, 9, 21), 5, 4.5,
            "College life is a bit different from high school. For those who don’t know, it’s like venturing into a society where some people live by the rules and others makes them."),
        Comment(6, DateTime.utc(2022, 8, 1), 12, 5,
            "Hello everyone , this is my review of funniest show of this season and one of the best gag comedy i had ever seen in anime .."),
        Comment(12, DateTime.utc(2022, 6, 27), 42, 2,
            "To be honest, this season as a whole has been remarkably unremarkable given the obvious trends that take place in the anime community."),
      ],
    ),
    AnimeInfo(
      16,
      'Gintama',
      'Hideaki Sorachi',
      'Shinji Takamatsu',
      [
        {
          'name': 'Tomokazu Sugita',
          'role': 'Gintoki Sakata',
          'img': 'GintamaC1.jpg'
        },
        {
          'name': 'Rie Kugimiya',
          'role': 'Kagura',
          'img': 'GintamaC2.jpg'
        },
        {
          'name': 'Daisuke Sakaguchi',
          'role': 'Shinpachi Shimura',
          'img': 'GintamaC3.jpg'
        },
      ],
      ['action', 'comedy', 'fantasy'],
      'Gintama.jpg',
      ['Gintama00.jpg', 'Gintama01.jpg', 'Gintama02.jpg'],
      4.6,
      'In an era where aliens have invaded and taken over feudal Tokyo, an unemployed samurai finds work however he can.',
      DateTime.utc(2006, 4, 6),
      ['ended'],
      80,
      [
        Comment(8, DateTime.utc(2022, 11, 22), 65, 4,
            "Now this is a show I've wrestled with for a long time. Many of my friends pledged almost fanatically this is the best anime in existence."),
        Comment(7, DateTime.utc(2022, 10, 11), 105, 3.5,
            "Gintama is an ongoing manga by Sorachi Hideaki. From 2006 to 2010, Sunrise, the same studio behind the Gundam franchise, did an anime adaptation which lasted for just over 200 episodes."),
        Comment(3, DateTime.utc(2021, 9, 30), 206, 4.5,
            "Over the years there have been a multitude of comedy shows that have graced our TV screens, from the surreal stylings of Monty Python and sarcastic wit of Blackadder, to the sci-fi tomfoolery of Red Dwarf and the strange antics of The Fast Show."),
      ],
    ),
    AnimeInfo(
      17,
      'One Punch Man',
      'Yusuke Murata (Art), ONE (Story)',
      'Shingo Natsume',
      [
        {
          'name': 'Makoto Furukawa',
          'role': 'Saitama',
          'img': 'OnePunchManC1.jpg'
        },
        {
          'name': 'Kaito Ishikawa',
          'role': 'Genos',
          'img': 'OnePunchManC2.jpg'
        },
        {
          'name': 'Aoi Yuuki',
          'role': 'Tatsumaki',
          'img': 'OnePunchManC3.jpg'
        },
      ],
      [ 'action', 'comedy', 'supernatural'],
      'OnePunchMan.jpg',
      ['OnePunchMan00.jpg', 'OnePunchMan01.jpg'],
      4.3,
      'The seemingly unimpressive Saitama has a rather unique hobby: being a hero. In order to pursue his childhood dream, Saitama relentlessly trained for three years, losing all of his hair in the process.',
      DateTime.utc(2015, 10, 5),
      ['in progress'],
      65,
      [
        Comment(4, DateTime.utc(2016, 12, 25), 68, 4.5,
            "There are only two types of people in the world: one who absolutely love One Punch Man, and other who strongly dislike it for being too predictable."),
        Comment(5, DateTime.utc(2016, 1, 13), 130, 5,
            "I remember when I was 8 years old, I used to be excited for a new Pokemon episode everyday. I used to run from school to my house so that I wouldn’t miss any single moment."),
        Comment(2, DateTime.utc(2015, 12, 22), 175, 4.5,
            "Going back to One Punch Man, I really thought of something. Something that can make or break this show to several of its viewers."),
      ],
    ),
    AnimeInfo(
      18,
      'Sakamoto desu ga?',
      'Nami Sano',
      'Shinji Takamatsu',
      [
        {
          'name': 'Hikaru Midorikawa',
          'role': 'Sakamoto',
          'img': 'SakamotodesugaC1.jpg'
        },
        {
          'name': 'Kouji Yusa',
          'role': '8823-senpai',
          'img': 'SakamotodesugaC2.jpg'
        },
        {
          'name': 'Akira Ishida',
          'role': 'Yoshinobu Kubota',
          'img': 'SakamotodesugaC3.jpg'
        },
      ],
      ['comedy', 'school'],
      'Sakamotodesuga.jpg',
      ['Sakamotodesuga00.jpg', 'Sakamotodesuga01.jpg'],
      3.8,
      'Sophisticated, suave, sublime; all words which describe the exceedingly handsome and patently perfect Sakamoto. Though it is only his first day in high school, his attractiveness, intelligence, and charm already has the girls swooning and the guys fuming with jealousy.',
      DateTime.utc(2006, 4, 8),
      ['in progress'],
      46,
      [
        Comment(9, DateTime.utc(2022, 11, 23), 6, 4.5,
            "You’d almost wish it started out like this, there’s that perpetual gnawing going on in the obscured depths of your conscience that bugs you for some normality, some profound simplicity in going about an anime you might never have even heard of."),
        Comment(3, DateTime.utc(2022, 10, 18), 10, 2,
            "Well, this is a different approach of the 3 episodes rule. If you watched the first 3 episodes, whether you liked it or not, you've seen everything the show can offer."),
        Comment(
            1, DateTime.utc(2022, 10, 17), 3, 1, "I don't like the gag in it."),
      ],
    ),
    AnimeInfo(
      19,
      'Nichijou',
      'Keiichi Arawi',
      'Tatsuya Ishihara',
      [
        {
          'name': 'Mariko Honda',
          'role': 'Yuuko Aioi',
          'img': 'NichijouC1.jpg'
        },
        {
          'name': 'Minoru Shiraishi',
          'role': 'Sakamoto',
          'img': 'NichijouC2.jpg'
        },
        {
          'name': 'Hiromi Konno',
          'role': 'Hakase Shinonome',
          'img': 'NichijouC3.jpg'
        },
      ],
      ['action', 'comedy', 'supernatural'],
      'Nichijou.jpg',
      ['Nichijou00.jpg', 'Nichijou01.jpg'],
      4.7,
      'Nichijou primarily focuses on the daily antics of a trio of childhood friends—high school girls Mio Naganohara, Yuuko Aioi and Mai Minakami—whose stories soon intertwine with the young genius Hakase Shinonome, her robot caretaker Nano, and their talking cat Sakamoto.',
      DateTime.utc(2011, 4, 3),
      ['in progress'],
      95,
      [
        Comment(5, DateTime.utc(2022, 10, 8), 36, 4.5,
            "Conventional wisdom has always taught us that more is usually better. We think that the more expensive car should have more completely unrelated features, the better ice-cream sundae should have a bigger pile of fresh fruit on top, and the better statistics report should be able to pull more numbers out of it’s arse."),
        Comment(9, DateTime.utc(2022, 10, 6), 44, 5,
            "This is an anime that I went into with high expectations. I was told OVER and OVER online that this was one of the funniest anime series to ever exist!"),
        Comment(10, DateTime.utc(2022, 9, 27), 50, 4,
            "If I had to sum up all of Nichijou in one word, it would be 'beautiful.' As a slice of life, this anime can't be for everyone, as most people like to have a story that is actually driven by the plot."),
      ],
    ),
  ];
  static List<AnimeInfo> customList = [];

  animedatabase();
}

class userdatabase {
  static List<PersonalInfo> userList = [
    PersonalInfo(
      0,
      "Daan Aniki",
      "person.jpg",
      10,
      24,
      "A typical anime lover from Daan.",
      "Daan Aniki",
      "@Daan Aniki",
      "@Daan Aniki",
      [0, 5, 8, 9, 2],
      [],
      [3, 9, 0, 2, 12],
      [
        Review(
          0,
          DateTime.utc(2022, 11, 2),
          788,
          4.5,
          "Spy x Family is an oddball tonal mashup that blends the action-packed and high-stakes world of spies with a heartwarming, family-friendly comedy.",
        ),
        Review(
          5,
          DateTime.utc(2022, 11, 18),
          450,
          5,
          "Have you ever watched an anime that had 12 episodes that had very interesting visuals, great characters (and development) and story that was charming in its own nature? No? Well Mob Psycho 100 is right here for you to watch!",
        ),
        Review(
          8,
          DateTime.utc(2022, 11, 3),
          455,
          4.5,
          "Naruto, yes Naruto. One of the series that has defined the cultural shonen’s of the last generation in the history of anime.",
        ),
      ],
    ),
    PersonalInfo(
      1,
      "Neihu Aniki",
      "person.jpg",
      98,
      59,
      "A typical anime lover from Neihu.",
      "Neihu Aniki",
      "@Neihu Aniki",
      "@Neihu Aniki",
      [0, 2, 11, 3],
      [],
      [12, 11, 1, 2, 3],
      [
        Review(
          0,
          DateTime.utc(2022, 11, 7),
          211,
          5.0,
          "Spy x Family is an anime of the year candidate. Yes, I say this with confidence for it managed to exemplify entertainment at consistent quality. It's an anime that sells itself as exactly what it is without misleading the audience.",
        ),
        Review(
          2,
          DateTime.utc(2022, 11, 9),
          875,
          4.5,
          "I started to follow the manga after watching the anime and quite frankly I don't see where and how the plot of Shingeki no Kyojin can suck, which in my humble opinion is awesome.",
        ),
        Review(
          11,
          DateTime.utc(2022, 11, 6),
          404,
          4.5,
          "I highly recommend it to anime fans and non-anime fans alike.",
        ),
      ],
    ),
    PersonalInfo(
      2,
      "Xinyi Aniki",
      "person.jpg",
      22,
      38,
      "A typical anime lover from Xinyi.",
      "Xinyi Aniki",
      "@Xinyi Aniki",
      "@Xinyi Aniki",
      [2, 11, 4, 3, 6, 7],
      [],
      [2, 9, 12, 4, 9],
      [
        Review(
          2,
          DateTime.utc(2022, 11, 16),
          577,
          5,
          "Attack on Titan is such a well-done product that it has all the key strong points we all dream every series could have. By this I mean the story, characters, animation, OST, opening/ending sequences, art, directing, narrative, character development, and, most importantly, the it factor. These are all present with A grade production values.",
        ),
        Review(
          4,
          DateTime.utc(2022, 11, 18),
          114,
          4.5,
          "My Hero Academia is regularly billed as The New One Piece or The New Naruto. There's certainly some truth to that - even setting aside meta comparisons like its status as Jump's new cash cow, it clearly draws inspiration from both, with its distinctive cartoony character designs and action scenes owing much to One Piece, and its school setting and ensemble cast resembling early Naruto.",
        ),
        Review(
          11,
          DateTime.utc(2022, 11, 18),
          271,
          4.5,
          "Great Story and nice characters. Good art as well.",
        ),
      ],
    ),
    PersonalInfo(
      3,
      "Beitou Aniki",
      "person.jpg",
      50,
      47,
      "A typical anime lover from Beitou.",
      "Beitou Aniki",
      "@Beitou Aniki",
      "@Beitou Aniki",
      [3, 8, 10, 5],
      [],
      [7, 8, 6, 9, 5],
      [
        Review(
          2,
          DateTime.utc(2022, 11, 26),
          56,
          5,
          "Why is it popular? Well that's simply because it's stunningly amazing. Those people that call Shingeki no Kyojin overrated may not have the same taste as me, and that's perfectly fine, but in my honest opinion, Shingeki no Kyojin is one of if not the greatest anime to be made.",
        ),
        Review(8, DateTime.utc(2022, 11, 8), 990, 5,
            "To be honest, Naruto is the most overhyped show in existence."),
        Review(
          10,
          DateTime.utc(2022, 11, 16),
          157,
          4,
          "Fans of harem anime or fan service may want to avoid; fans of good character, interesting plot and colourful action with the odd touch of the strange and sinister should watch at the next opportune moment.",
        ),
      ],
    ),
    PersonalInfo(
      4,
      "Datong Aniki",
      "person.jpg",
      32,
      69,
      "A typical anime lover from Datong.",
      "Datong Aniki",
      "@Datong Aniki",
      "@Datong Aniki",
      [0, 5, 10, 2, 4],
      [],
      [3, 6, 10, 0, 1],
      [
        Review(
          0,
          DateTime.utc(2022, 11, 24),
          433,
          4.5,
          "You could not have possibly missed this, Spy x Family has taken the community by storm. It is everywhere, be it in the form of Yor and Anya fanarts (with an appalling lack of Loid ones) or Anya smug face memes.",
        ),
        Review(
          5,
          DateTime.utc(2022, 11, 24),
          366,
          4.5,
          "Funny, whimsical, charming, and oddly enough, thoughtful.",
        ),
        Review(
          10,
          DateTime.utc(2022, 11, 3),
          435,
          4.5,
          "Hunter X Hunter is one of the best shonen animes I have ever seen.",
        ),
        Review(
          12,
          DateTime.utc(2022, 11, 22),
          562,
          4,
          "I think D.Gray-man is one of those animes you don't expect to be a masterpiece, yet you fall in love with it the more you watch it.",
        ),
      ],
    ),
    PersonalInfo(
      5,
      "Nangang Aniki",
      "person.jpg",
      77,
      23,
      "A typical anime lover from Nangang.",
      "Nangang Aniki",
      "@Nangang Aniki",
      "@Nangang Aniki",
      [1, 6, 8, 3, 10],
      [],
      [9, 7, 8, 5, 3],
      [
        Review(
          1,
          DateTime.utc(2022, 11, 22),
          493,
          4,
          "Chainsaw Man is one of the most hyped and waited animes of the year, and let me tell you that its fans have a point.",
        ),
        Review(
          6,
          DateTime.utc(2022, 11, 7),
          591,
          4,
          "BLEACH has finally made its great return to the mainstream.",
        ),
        Review(
          8,
          DateTime.utc(2022, 11, 24),
          271,
          4,
          "Naruto was the first anime I ever watched. And I'm glad it was.",
        ),
      ],
    ),
    PersonalInfo(
      6,
      "Shilin Aniki",
      "person.jpg",
      61,
      29,
      "A typical anime lover from Shilin.",
      "Shilin Aniki",
      "@Shilin Aniki",
      "@Shilin Aniki",
      [4, 6, 5, 8, 10, 12],
      [],
      [8, 12, 11, 6, 3],
      [
        Review(
          4,
          DateTime.utc(2022, 11, 18),
          108,
          5,
          "Perhaps the next “big thing” by Shounen Jump. It was inevitable that Boku no Hero Academia (My Hero Academia) would get an anime adaptation.",
        ),
        Review(
          6,
          DateTime.utc(2022, 11, 12),
          285,
          4.5,
          "This season of Bleach is one that i waited for a long time.The animation is something else, something good.",
        ),
        Review(
          7,
          DateTime.utc(2022, 11, 21),
          343,
          3.5,
          "Jujutsu Kaisen is unlike any other anime I have seen before.",
        ),
      ],
    ),
    PersonalInfo(
      7,
      "Songshan Aniki",
      "person.jpg",
      60,
      23,
      "A typical anime lover from Songshan.",
      "Songshan Aniki",
      "@Songshan Aniki",
      "@Songshan Aniki",
      [3, 4, 9, 12],
      [],
      [9, 1, 7, 11, 2],
      [
        Review(
          3,
          DateTime.utc(2022, 11, 20),
          836,
          4,
          "Demon Slayer has some of the best animation of this generation, but I can’t recommend the entire show because the writing is… pretty bad.",
        ),
        Review(
          4,
          DateTime.utc(2022, 11, 26),
          644,
          3.5,
          "Boku no Hero Academia is an anime that lives and dies by the conventional. While that could be seen as a negative feature in most scenarios, for a superhero shounen that understands its limitations, it's actually quite refreshing.",
        ),
        Review(
          9,
          DateTime.utc(2022, 11, 24),
          263,
          5,
          "ONE OF THE BEST ANIMES (IF NOT THE BEST) EVER !!! ",
        ),
        Review(
          12,
          DateTime.utc(2022, 11, 22),
          180,
          5,
          "Worthy watch! It can be compared with the popular shounen anime Naruto and Bleach ",
        ),
      ],
    ),
    PersonalInfo(
      8,
      "Wanhua Aniki",
      "person.jpg",
      38,
      89,
      "A typical anime lover from Wanhua.",
      "Wanhua Aniki",
      "@Wanhua Aniki",
      "@Wanhua Aniki",
      [3, 9, 10],
      [],
      [10, 4, 5, 9, 3],
      [
        Review(
          1,
          DateTime.utc(2022, 11, 15),
          77,
          3,
          "Perhaps I could have given it a better rate, had it not been the fact that the freaking hype about this anime was absolutely unprecedented.",
        ),
        Review(
          9,
          DateTime.utc(2022, 11, 12),
          183,
          4.5,
          "I never write reviews but I think this series deserves it.",
        ),
        Review(
          10,
          DateTime.utc(2022, 11, 11),
          388,
          5,
          "No matter the version, HxH is my favorite shounen series of all time.",
        ),
      ],
    ),
    PersonalInfo(
      9,
      "Wenshan Aniki",
      "person.jpg",
      93,
      98,
      "A typical anime lover from Wenshan.",
      "Wenshan Aniki",
      "@Wenshan Aniki",
      "@Wenshan Aniki",
      [5, 6, 11],
      [],
      [11, 7, 1, 12, 0],
      [
        Review(
          3,
          DateTime.utc(2022, 11, 25),
          770,
          5,
          "Ah ufotable, the studio that keeps on giving. Before Kimetsu no Yaiba aired, news broke out that we’d get them animating the show. And to my delight, it’s a studio that earned its praise for its high caliber animation and consistently delivering quality content. Being their first 2-cour show (without a split cour break), Kimetsu no Yaiba is a special gift not just for the manga fans but anyone ready to experience a world of demons and dark fantasy.",
        ),
        Review(
          6,
          DateTime.utc(2022, 11, 19),
          178,
          4.5,
          "Even in the best that Bleach has to offer, some still won't be able to appreciate it. It's bad, shallow, no writing..and the nitpicks go on. To those saying nothing is happening at all, are you even watching the show, because a goddamn war is actually taking place, which goes beyond just (oh look..there's a new big baddy now).",
        ),
        Review(
          11,
          DateTime.utc(2022, 11, 24),
          110,
          5,
          "I'm a big fan of Fullmetal Alchemist, so it's a-must for me to write a review.",
        ),
      ],
    ),
    PersonalInfo(
      10,
      "Zhongshan Aniki",
      "person.jpg",
      40,
      0,
      "A typical anime lover from Zhongshan.",
      "Zhongshan Aniki",
      "@Zhongshan Aniki",
      "@Zhongshan Aniki",
      [7, 9, 6, 1],
      [],
      [5, 10, 9, 8, 11],
      [
        Review(
          3,
          DateTime.utc(2022, 11, 24),
          503,
          1.5,
          "Oh boy, the seasonal battle shounen that everyone raves about, what does it do right? Well to be completely honest, nothing, the only thing it got going for it is the production quality from ufotable.",
        ),
        Review(
          7,
          DateTime.utc(2022, 11, 14),
          660,
          5,
          "After the ridiculous success of Demon Slayer, the shounen industry is finally taking notes on how to make a successful adaption. ",
        ),
        Review(
          9,
          DateTime.utc(2022, 11, 25),
          866,
          5,
          "One Piece is by far the best shounen anime out there that I have watched.",
        ),
      ],
    ),
    PersonalInfo(
      11,
      "Zhongzheng Aniki",
      "person.jpg",
      36,
      14,
      "A typical anime lover from Zhongzheng.",
      "Zhongzheng Aniki",
      "@Zhongzheng Aniki",
      "@Zhongzheng Aniki",
      [1, 5, 7, 12, 3, 6, 8, 10],
      [],
      [8, 6, 7, 4, 12],
      [
        Review(
          1,
          DateTime.utc(2022, 11, 6),
          695,
          4,
          "Chainsaw Man or CSM for short is undoubtedly the biggest anime this year with over 500k people having it in their PTW before its release.",
        ),
        Review(
          5,
          DateTime.utc(2022, 11, 17),
          653,
          5,
          "There’s probably a million ways to describe Mob Psycho 100. One simple word is just exciting.",
        ),
        Review(
          7,
          DateTime.utc(2022, 11, 17),
          196,
          4,
          "I rate shit on enjoyment because that is what's important.",
        ),
        Review(12, DateTime.utc(2022, 11, 7), 363, 4,
            "All in all, the show is well worth watching, even if you don't usually commit to long running shounen."),
      ],
    ),
  ];
}

class userdata {
  static PersonalInfo userData = PersonalInfo(
    -1,
    "User",
    "person.jpg",
    0,
    0,
    "I love anime.\nAttack on Titan best anime.",
    "facebook",
    "",
    "@twitter",
    animedatabase.animeList
        .where((anime) => anime.Score > 4.3)
        .toList()
        .map(((favorite) => animedatabase.animeList.indexOf(favorite)))
        .toList(),
    [
      UserList('My favorite',
          animedatabase.animeList.where((anime) => anime.Score > 4.3).toList()),
      UserList(
          'Relax',
          animedatabase.animeList
              .where((anime) => anime.Tags.contains('comedy'))
              .toList()),
      UserList(
          'Satisfying',
          animedatabase.animeList
              .where((anime) => anime.Tags.contains('monster'))
              .toList()),
    ],
    [8, 6, 7, 4, 12],
    [
      Review(
        0,
        DateTime.utc(2022, 11, 6),
        113,
        4.0,
        "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot..",
      ),
      Review(
        1,
        DateTime.utc(2022, 11, 24),
        257,
        3.5,
        "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.",
      ),
      Review(
        2,
        DateTime.utc(2022, 11, 17),
        446,
        5.0,
        "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.",
      ),
      Review(3, DateTime.utc(2022, 11, 20), 335, 2.5,
          "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot."),
    ],
  );
}
