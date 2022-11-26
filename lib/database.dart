import 'utility.dart';

class animedatabase {
  static List<AnimeInfo> animeList = [
    AnimeInfo(
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
      [2022, 4, 9],
      111,
    ),
    AnimeInfo(
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
      [2022, 10, 12],
      84,
    ),
    AnimeInfo(
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
      [2013, 4, 7],
      357,
    ),
    AnimeInfo(
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
      [2019, 4, 6],
      260,
    ),
    AnimeInfo(
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
      [2016, 4, 3],
      274,
    ),
    // 5
    AnimeInfo(
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
      [2022, 10, 6],
      38,
    ),
    AnimeInfo(
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
      [2022, 10, 11],
      29,
    ),
    AnimeInfo(
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
      [2020, 10, 3],
      204,
    ),
    AnimeInfo(
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
      [2002, 10, 3],
      259,
    ),
    AnimeInfo(
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
      [1999, 10, 20],
      201,
    ),
    //10
    AnimeInfo(
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
      [2011, 10, 2],
      251,
    ),
    AnimeInfo(
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
      [2009, 4, 5],
      302,
    ),
    AnimeInfo(
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
      [2006, 10, 3],
      65,
    ),
  ];
  static List<AnimeInfo> customList = [];

  animedatabase();
}
