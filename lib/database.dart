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
          'name': 'Tanezaki, Atsumi',
          'role': 'Forger, Anya',
          'img': 'SPYxFamilyC1.jpg'
        },
        {
          'name': 'Hayami, Saori',
          'role': 'Forger, Yor',
          'img': 'SPYxFamilyC2.jpg'
        },
        {
          'name': 'Eguchi, Takuya',
          'role': 'Forger, Loid',
          'img': 'SPYxFamilyC3.jpg'
        },
        {
          'name': 'Fujiwara, Natsumi',
          'role': 'Desmond, Damian',
          'img': 'SPYxFamilyC4.jpg'
        },
        {
          'name': 'Ono, Kensho',
          'role': 'Briar, Yuri',
          'img': 'SPYxFamilyC5.jpg'
        },
        {
          'name': 'Yamaji, Kazuhiro',
          'role': '	Henderson, Henry',
          'img': 'SPYxFamilyC6.jpg'
        },
        {
          'name': 'Yoshino, Hiroyuki',
          'role': 'Franklin, Franky',
          'img': 'SPYxFamilyC7.jpg'
        },
        {
          'name': 'Katou, Emiri',
          'role': 'Blackbell, Becky',
          'img': 'SPYxFamilyC8.jpg'
        },
        {
          'name': 'Kaida, Yuuko',
          'role': '	Sherwood, Sylvia',
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
        Comment(
          0, 
          DateTime.utc(2022, 11, 2),
          788,
          4.5,
          "Spy x Family is an oddball tonal mashup that blends the action-packed and high-stakes world of spies with a heartwarming, family-friendly comedy."
        ),
        Comment(
          1,
          DateTime.utc(2022, 11, 7),
          211,
          5.0,
          "Spy x Family is an anime of the year candidate. Yes, I say this with confidence for it managed to exemplify entertainment at consistent quality. It's an anime that sells itself as exactly what it is without misleading the audience."
        ),
        Comment(
          4,
          DateTime.utc(2022, 11, 24),
          433,
          4.5,
          "You could not have possibly missed this, Spy x Family has taken the community by storm. It is everywhere, be it in the form of Yor and Anya fanarts (with an appalling lack of Loid ones) or Anya smug face memes."
        ),
      ],
    ),
    AnimeInfo(
      1,
      'Chainsaw Man',
      'Tatsuki Fujimoto',
      'Ryu Nakayama',
      [
        {
          'name': 'Kusunoki, Tomori',
          'role': 'Makima',
          'img': 'ChainsawManC1.jpg'
        },
        {'name': 'Fairouz, Ai', 'role': 'Power', 'img': 'ChainsawManC2.jpg'},
        {
          'name': 'Toya, Kikunosuke',
          'role': 'Denji',
          'img': 'ChainsawManC3.jpg'
        },
        {
          'name': 'Sakata, Shougo',
          'role': 'Hayakawa, Aki',
          'img': 'ChainsawManC4.jpg'
        },
        {
          'name': 'Takahashi, Karin',
          'role': 'Higashiyama, Kobeni',
          'img': 'ChainsawManC5.jpg'
        },
        {
          'name': 'Izawa, Shiori',
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
        Comment(
          5,
          DateTime.utc(2022, 11, 22),
          493,
          4,
          "Chainsaw Man is one of the most hyped and waited animes of the year, and let me tell you that its fans have a point."
        ),
        Comment(
          8,
          DateTime.utc(2022, 11, 15),
          77,
          3,
          "Perhaps I could have given it a better rate, had it not been the fact that the freaking hype about this anime was absolutely unprecedented."
        ),
        Comment(
          11,
          DateTime.utc(2022, 11, 6),
          695,
          4,
          "Chainsaw Man or CSM for short is undoubtedly the biggest anime this year with over 500k people having it in their PTW before its release."
        ),
      ],
    ),
    AnimeInfo(
      2,
      'Attack on Titan',
      'Hajime Isayama',
      'Tetsurô Araki',
      [
        {
          'name': 'Kaji, Yuuki',
          'role': 'Yeager, Eren',
          'img': 'AttackOnTitanC1.jpg'
        },
        {
          'name': 'Ishikawa, Yui',
          'role': 'Ackerman, Mikasa',
          'img': 'AttackOnTitanC2.jpg'
        },
        {
          'name': 'Inoue, Marina',
          'role': 'Arlert, Armin',
          'img': 'AttackOnTitanC3.jpg'
        },
        {
          'name': 'Kamiya, Hiroshi',
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
        Comment(
          1,
          DateTime.utc(2022, 11, 9),
          875,
          4.5,
          "I started to follow the manga after watching the anime and quite frankly I don't see where and how the plot of Shingeki no Kyojin can suck, which in my humble opinion is awesome."
        ),
        Comment(
          2,
          DateTime.utc(2022, 11, 16),
          577,
          5,
          "Attack on Titan is such a well-done product that it has all the key strong points we all dream every series could have. By this I mean the story, characters, animation, OST, opening/ending sequences, art, directing, narrative, character development, and, most importantly, the it factor. These are all present with A grade production values."
        ),
        Comment(
          3,
          DateTime.utc(2022, 11, 26),
          56,
          5,
          "Why is it popular? Well that's simply because it's stunningly amazing. Those people that call Shingeki no Kyojin overrated may not have the same taste as me, and that's perfectly fine, but in my honest opinion, Shingeki no Kyojin is one of if not the greatest anime to be made."
        ),
      ],
    ),
    AnimeInfo(
      3,
      'Demon Slayer',
      'Koyoharu Gotōge',
      'Sotozaki Haruo',
      [
        {
          'name': 'Hanae, Natsuki',
          'role': 'Kamado, Tanjirou',
          'img': 'DemonSlayerC1.jpg'
        },
        {
          'name': 'Shimono, Hiro',
          'role': 'Agatsuma, Zenitsu',
          'img': 'DemonSlayerC2.jpg'
        },
        {
          'name': 'Kitou, Akari',
          'role': 'Kamado, Nezuko',
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
        Comment(
          7,
          DateTime.utc(2022, 11, 20),
          836,
          4,
          "Demon Slayer has some of the best animation of this generation, but I can’t recommend the entire show because the writing is… pretty bad."
        ),
        Comment(
          9,
          DateTime.utc(2022, 11, 25),
          770,
          5,
          "Ah ufotable, the studio that keeps on giving. Before Kimetsu no Yaiba aired, news broke out that we’d get them animating the show. And to my delight, it’s a studio that earned its praise for its high caliber animation and consistently delivering quality content. Being their first 2-cour show (without a split cour break), Kimetsu no Yaiba is a special gift not just for the manga fans but anyone ready to experience a world of demons and dark fantasy."
        ),
        Comment(
          10,
          DateTime.utc(2022, 11, 24),
          503,
          1.5,
          "Oh boy, the seasonal battle shounen that everyone raves about, what does it do right? Well to be completely honest, nothing, the only thing it got going for it is the production quality from ufotable."
        ),
      ],
    ),
    AnimeInfo(
      4,
      'My Hero Academia',
      'Kôhei Horikoshi',
      'Kenji Nagasaki',
      [
        {
          'name': 'Yamashita, Daiki',
          'role': 'Midoriya, Izuku',
          'img': 'MyHeroAcademiaC1.jpg'
        },
        {
          'name': 'Okamoto, Nobuhiko',
          'role': 'Bakugou, Katsuki',
          'img': 'MyHeroAcademiaC2.jpg'
        },
        {
          'name': 'Miyake, Kenta',
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
        Comment(
          2,
          DateTime.utc(2022, 11, 18),
          114,
          4.5,
          "My Hero Academia is regularly billed as The New One Piece or The New Naruto. There's certainly some truth to that - even setting aside meta comparisons like its status as Jump's new cash cow, it clearly draws inspiration from both, with its distinctive cartoony character designs and action scenes owing much to One Piece, and its school setting and ensemble cast resembling early Naruto."
        ),
        Comment(
          6,
          DateTime.utc(2022, 11, 18),
          108,
          5,
          "Perhaps the next “big thing” by Shounen Jump. It was inevitable that Boku no Hero Academia (My Hero Academia) would get an anime adaptation."
        ),
        Comment(
          7,
          DateTime.utc(2022, 11, 26),
          644,
          3.5,
          "Boku no Hero Academia is an anime that lives and dies by the conventional. While that could be seen as a negative feature in most scenarios, for a superhero shounen that understands its limitations, it's actually quite refreshing."
        ),
      ],
    ),
    // 5
    AnimeInfo(
      5,
      "Mob Psycho 100",
      'Tachikawa, Yuzuru',
      'Hasui, Takahiro',
      [
        {
          'name': 'Sakurai, Takahiro',
          'role': 'Reigen, Arataka',
          'img': 'MobPsychoC1.jpg'
        },
        {
          'name': 'Itou, Setsuo',
          'role': 'Kageyama, Shigeo',
          'img': 'MobPsychoC2.jpg'
        },
        {'name': 'Ootsuka, Akio', 'role': 'Ekubo', 'img': 'MobPsychoC3.jpg'},
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
        Comment(
          0, 
          DateTime.utc(2022, 11, 18),
          450,
          5,
          "Have you ever watched an anime that had 12 episodes that had very interesting visuals, great characters (and development) and story that was charming in its own nature? No? Well Mob Psycho 100 is right here for you to watch!"
        ),
        Comment(
          4, 
          DateTime.utc(2022, 11, 24),
          366,
          4.5,
          "Funny, whimsical, charming, and oddly enough, thoughtful."
        ),
        Comment(
          11, 
          DateTime.utc(2022, 11, 17),
          653,
          5,
          "There’s probably a million ways to describe Mob Psycho 100. One simple word is just exciting."
        ),
      ],
    ),
    AnimeInfo(
      6,
      'Bleach-Sennen Kessen-hen',
      'Kubo, Tite',
      'Taguchi, Tomohisa',
      [
        {
          'name': 'Morita, Masakazu',
          'role': 'Kurosaki, Ichigo',
          'img': 'Bleach-SennenKessen-henC1.jpg'
        },
        {
          'name': 'Orikasa, Fumiko',
          'role': 'Kuchiki, Rukia',
          'img': 'Bleach-SennenKessen-henC2.jpg'
        },
        {
          'name': 'Itou, Kentarou',
          'role': 'Abarai, Renji',
          'img': 'Bleach-SennenKessen-henC3.jpg'
        },
      ],
      ['action', 'adventure', 'fantasy'],
      'Bleach-SennenKessen-hen.jpg',
      ['Bleach-SennenKessen-hen00.jpg', 'Bleach-SennenKessen-hen01.jpg', 'Bleach-SennenKessen-hen02.jpg'],
      4.6,
      'Substitute Soul Reaper Ichigo Kurosaki spends his days fighting against Hollows, dangerous evil spirits that threaten Karakura Town.',
      DateTime.utc(2022, 10, 11),
      ['new season', 'in progress'],
      29,
      [
        Comment(
          5, 
          DateTime.utc(2022, 11, 7),
          591,
          4,
          "BLEACH has finally made its great return to the mainstream."
        ),
        Comment(
          6,
          DateTime.utc(2022, 11, 12),
          285,
          4.5,
          "This season of Bleach is one that i waited for a long time.The animation is something else, something good."
        ),
        Comment(
          9,
          DateTime.utc(2022, 11, 19),
          178,
          4.5,
          "Even in the best that Bleach has to offer, some still won't be able to appreciate it. It's bad, shallow, no writing..and the nitpicks go on. To those saying nothing is happening at all, are you even watching the show, because a goddamn war is actually taking place, which goes beyond just (oh look..there's a new big baddy now)."
        ),
      ],
    ),
    AnimeInfo(
      7,
      'Jujutsu Kaisen',
      'Akutami, Gege',
      'Park, Seong-Hu',
      [
        {
          'name': 'Nakamura, Yuuichi',
          'role': 'Gojou, Satoru',
          'img': 'JujutsuKaisenC1.jpg'
        },
        {
          'name': 'Enoki, Junya',
          'role': 'Itadori, Yuuji',
          'img': 'JujutsuKaisenC2.jpg'
        },
        {
          'name': 'Uchida, Yuuma',
          'role': 'Fushiguro, Megumi',
          'img': 'JujutsuKaisenC3.jpg'
        },
      ],
      ['action', 'fantasy'],
      'JujutsuKaisen.jpg',
      ['JujutsuKaisen00.jpg', 'JujutsuKaisen01.jpg'],
      4.4,
      'Idly indulging in baseless paranormal activities with the Occult Club, high schooler Yuuji Itadori spends his days at either the clubroom or the hospital, where he visits his bedridden grandfather.',
      DateTime.utc(2020, 10, 3),
      ['in progress'],
      204,
      [
        Comment(
          6, 
          DateTime.utc(2022, 11, 21),
          343,
          3.5,
          "Jujutsu Kaisen is unlike any other anime I have seen before."
        ),
        Comment(
          10, 
          DateTime.utc(2022, 11, 14),
          660,
          5,
          "After the ridiculous success of Demon Slayer, the shounen industry is finally taking notes on how to make a successful adaption. "
        ),
        Comment(
          11, 
          DateTime.utc(2022, 11, 17),
          196,
          4,
          "I rate shit on enjoyment because that is what's important."
        )
      ],
    ),
    AnimeInfo(
      8,
      'Naruto',
      'Kishimoto, Masashi',
      'Date, Hayato',
      [
        {
          'name': 'Takeuchi, Junko',
          'role': 'Uzumaki, Naruto',
          'img': 'NarutoC1.jpg'
        },
        {
          'name': 'Inoue, Kazuhiko',
          'role': 'Hatake, Kakashi',
          'img': 'NarutoC2.jpg'
        },
        {
          'name': 'Sugiyama, Noriaki',
          'role': 'Uchiha, Sasuke',
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
        Comment(
          0, 
          DateTime.utc(2022, 11, 3),
          455,
          4.5,
          "Naruto, yes Naruto. One of the series that has defined the cultural shonen’s of the last generation in the history of anime."
        ),
        Comment(
          3, 
          DateTime.utc(2022, 11, 8),
          990,
          5,
          "To be honest, Naruto is the most overhyped show in existence."
        ),
        Comment(
          5, 
          DateTime.utc(2022, 11, 24),
          271,
          4,
          "Naruto was the first anime I ever watched. And I'm glad it was."
        ),
      ],
    ),
    AnimeInfo(
      9,
      'One Piece',
      'Oda, Eiichiro',
      'Ishitani, Megumi',
      [
        {
          'name': 'Tanaka, Mayumi',
          'role': 'Monkey D., Luffy',
          'img': 'OnePieceC1.jpg'
        },
        {
          'name': 'Nakai, Kazuya',
          'role': 'Roronoa, Zoro',
          'img': 'OnePieceC2.jpg'
        },
        {'name': 'Hirata, Hiroaki', 'role': 'Sanji', 'img': 'OnePieceC3.jpg'},
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
        Comment(
          7, 
          DateTime.utc(2022, 11, 24),
          263,
          5,
          "ONE OF THE BEST ANIMES (IF NOT THE BEST) EVER !!! "
        ),
        Comment(
          8, 
          DateTime.utc(2022, 11, 12),
          183,
          4.5,
          "I never write reviews but I think this series deserves it."
        ),
        Comment(
          10, 
          DateTime.utc(2022, 11, 25),
          866,
          5,
          "One Piece is by far the best shounen anime out there that I have watched."
        ),
      ],
    ),
    //10
    AnimeInfo(
      10,
      'Hunter x Hunter',
      'Togashi, Yoshihiro',
      'Koujina, Hiroshi',
      [
        {
          'name': 'Ise, Mariya',
          'role': 'Zoldyck, Killua',
          'img': 'HunterxHunterC1.jpg'
        },
        {
          'name': 'Sawashiro, Miyuki',
          'role': 'Kurapika',
          'img': 'HunterxHunterC2.jpg'
        },
        {
          'name': 'Han, Megumi',
          'role': 'Freecss, Gon',
          'img': 'HunterxHunterC3.jpg'
        },
        {
          'name': 'Fujiwara, Keiji',
          'role': 'Paladiknight, Leorio',
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
        Comment(
          3, 
          DateTime.utc(2022, 11, 16),
          157,
          4,
          "Fans of harem anime or fan service may want to avoid; fans of good character, interesting plot and colourful action with the odd touch of the strange and sinister should watch at the next opportune moment."
        ),
        Comment(
          4, 
          DateTime.utc(2022, 11, 3),
          435,
          4.5,
          "Hunter X Hunter is one of the best shonen animes I have ever seen."
        ),
        Comment(
          8, 
          DateTime.utc(2022, 11, 11),
          388,
          5,
          "No matter the version, HxH is my favorite shounen series of all time."
        ),
      ],
    ),
    AnimeInfo(
      11,
      'Fullmetal Alchemist',
      'Arakawa, Hiromu',
      'Irie, Yasuhiro',
      [
        {
          'name': 'Park, Romi',
          'role': 'Elric, Edward',
          'img': 'FullmetalAlchemistC1.jpg'
        },
        {
          'name': 'Kugimiya, Rie',
          'role': 'Elric, Alphonse',
          'img': 'FullmetalAlchemistC2.jpg'
        },
        {
          'name': 'Ookawa, Tooru',
          'role': 'Mustang, Roy',
          'img': 'FullmetalAlchemistC3.jpg'
        },
      ],
      ['action', 'adventure', 'fantasy', 'drama'],
      'FullmetalAlchemist.jpg',
      ['FullmetalAlchemist00.jpg', 'FullmetalAlchemist01.jpg'],
      4.6,
      'After a horrific alchemy experiment goes wrong in the Elric household, brothers Edward and Alphonse are left in a catastrophic new reality.',
      DateTime.utc(2009, 4, 5),
      ['ended'],
      302,
      [
        Comment(
          1, 
          DateTime.utc(2022, 11, 6),
          404,
          4.5,
          "I highly recommend it to anime fans and non-anime fans alike."
        ),
        Comment(
          2, 
          DateTime.utc(2022, 11, 18),
          271,
          4.5,
          "Great Story and nice characters. Good art as well."
        ),
        Comment(
          9, 
          DateTime.utc(2022, 11, 24),
          110,
          5,
          "I'm a big fan of Fullmetal Alchemist, so it's a-must for me to write a review."
        ),
      ],
    ),
    AnimeInfo(
      12,
      'D.Gray-man',
      'Hoshino, Katsura',
      'Sabat, Christopher',
      [
        {
          'name': 'Kobayashi, Sanae',
          'role': 'Walker, Allen',
          'img': 'DGray-manC1.jpg'
        },
        {'name': 'Suzumura, Kenichi', 'role': 'Lavi', 'img': 'DGray-manC2.jpg'},
        {
          'name': 'Sakurai, Takahiro',
          'role': 'Kanda, Yuu',
          'img': 'DGray-manC3.jpg'
        },
        {
          'name': 'Itou, Shizuka',
          'role': 'Lee, Lenalee',
          'img': 'DGray-manC4.jpg'
        },
      ],
      ['action', 'adventure', 'comedy'],
      'DGray-man.jpg',
      ['DGray-man00.jpg'],
      4.0,
      'Losing a loved one is so painful that one may sometimes wish to be able to resurrect them—a weakness that the enigmatic Millennium Earl exploits.',
      DateTime.utc(2006, 10, 3),
      ['ended'],
      65,
      [
        Comment(
          4, 
          DateTime.utc(2022, 11, 22),
          562,
          4,
          "I think D.Gray-man is one of those animes you don't expect to be a masterpiece, yet you fall in love with it the more you watch it."
        ),
        Comment(
          7, 
          DateTime.utc(2022, 11, 22),
          180,
          5,
          "Worthy watch! It can be compared with the popular shounen anime Naruto and Bleach "
        ),
        Comment(
          11, 
          DateTime.utc(2022, 11, 7),
          363,
          4,
          "All in all, the show is well worth watching, even if you don't usually commit to long running shounen."
        ),
      ],
    ),
  ];
  static List<AnimeInfo> customList = [];

  animedatabase();
}

class userdatabase {
  static List<PersonalInfo> userList =[
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
        Review(
          8, 
          DateTime.utc(2022, 11, 8),
          990,
          5,
          "To be honest, Naruto is the most overhyped show in existence."
        ),
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
        Review(
          12, 
          DateTime.utc(2022, 11, 7),
          363,
          4,
          "All in all, the show is well worth watching, even if you don't usually commit to long running shounen."
        ),
      ],
    ),
  ];
}

class userdata{
  static PersonalInfo userData = 
  PersonalInfo(
    -1,
    "User",
    "person.jpg",
    0,
    0,
    "I love anime.\nAttack on Titan best anime.",
    "facebook",
    "",
    "@twitter",
    animedatabase.animeList.where((anime) => anime.Score>4.3).toList().map(((favorite)=> animedatabase.animeList.indexOf(favorite))).toList() ,
    [
      UserList('My favorite', animedatabase.animeList.where((anime) => anime.Score>4.3).toList()),
      UserList('Relax',animedatabase.animeList.where((anime) => anime.Tags.contains('comedy')).toList()),
      UserList('Satisfying',animedatabase.animeList.where((anime) => anime.Tags.contains('monster')).toList()),
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
      Review(
        3, 
        DateTime.utc(2022, 11, 20),
        335,
        2.5,
        "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot."
      ),
    ],
  );
}