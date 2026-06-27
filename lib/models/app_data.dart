class Project {
  final String title;
  final String subtitle;
  final bool isSelected;

  const Project({
    required this.title,
    required this.subtitle,
    this.isSelected = false,
  });
}

class Creator {
  final String username;
  final int artworks;
  final double rating;
  final String avatarEmoji;

  const Creator({
    required this.username,
    required this.artworks,
    required this.rating,
    required this.avatarEmoji,
  });
}

class NavItem {
  final String icon;
  final String label;
  final bool isActive;

  const NavItem({
    required this.icon,
    required this.label,
    this.isActive = false,
  });
}

class BirthdayPerson {
  final String emoji;
  final String name;

  const BirthdayPerson({required this.emoji, required this.name});
}

// Sample data
class AppData {
  static const List<Project> projects = [
    Project(
      title: 'Technology behind the Blockchain',
      subtitle: 'Project #1 • See project details',
      isSelected: true,
    ),
    Project(
      title: 'Technology behind the Blockchain',
      subtitle: 'Project #1 • See project details',
    ),
    Project(
      title: 'Technology behind the Blockchain',
      subtitle: 'Project #1 • See project details',
    ),
  ];

  static const List<Creator> creators = [
    Creator(username: '@maddison_c21', artworks: 9821, rating: 0.9, avatarEmoji: '👩'),
    Creator(username: '@karl.will02', artworks: 7032, rating: 0.75, avatarEmoji: '👨🏾'),
    Creator(username: '@maddison_c21', artworks: 9821, rating: 0.9, avatarEmoji: '👩'),
    Creator(username: '@maddison_c21', artworks: 9821, rating: 0.85, avatarEmoji: '👩'),
  ];

  static const List<BirthdayPerson> birthdayPeople = [
    BirthdayPerson(emoji: '🎂', name: 'Person 1'),
    BirthdayPerson(emoji: '🎂', name: 'Person 2'),
  ];

  static const List<BirthdayPerson> anniversaryPeople = [
    BirthdayPerson(emoji: '🎩', name: 'Person 1'),
    BirthdayPerson(emoji: '🎩', name: 'Person 2'),
    BirthdayPerson(emoji: '🎩', name: 'Person 3'),
  ];

  static List<Map<String, double>> performanceData = [
    {'year': 2015, 'pending': 32, 'done': 22},
    {'year': 2016, 'pending': 28, 'done': 25},
    {'year': 2017, 'pending': 42, 'done': 35},
    {'year': 2018, 'pending': 38, 'done': 55},
    {'year': 2019, 'pending': 45, 'done': 38},
    {'year': 2020, 'pending': 32, 'done': 30},
  ];
}
