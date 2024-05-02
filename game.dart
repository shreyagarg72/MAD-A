// Base Character class
abstract class Character {
  String name;
  int health;
  int attack;

  Character(this.name, this.health, this.attack);
}

// Logger mixin
mixin Logger {
  void log(String message, {String level = 'info'}) {
    print('[$level] $message');
  }

  void logDebug(String message) {
    log(message, level: 'debug');
  }

  void logInfo(String message) {
    log(message, level: 'info');
  }

  void logWarning(String message) {
    log(message, level: 'warning');
  }

  void logError(String message) {
    log(message, level: 'error');
  }
}

// Warrior class
class Warrior extends Character with Logger {
  int rage;

  Warrior(String name, int health, int attack, this.rage)
      : super(name, health, attack);

  void warriorAttack() {
    logInfo('$name attacks with rage $rage and does $attack damage');
  }
}

// Mage class
class Mage extends Character with Logger {
  int mana;

  Mage(String name, int health, int attack, this.mana)
      : super(name, health, attack);

  void castSpell() {
    logInfo('$name casts a spell with mana $mana');
    
  }
}

// Rogue class
class Rogue extends Character with Logger {
  int stealth;

  Rogue(String name, int health, int attack, this.stealth)
      : super(name, health, attack);

  void sneak() {
    logInfo('$name sneaks with stealth $stealth');
   
  }
}

void main() {

  Warrior warrior = Warrior('Warrior', 10, 90, 50);
  Mage mage = Mage('Mage', 85, 85, 80);
  Rogue rogue = Rogue('Rogue', 90, 18, 70);
  
}