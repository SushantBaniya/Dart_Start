import 'dart:io';
import 'dart:math';

class RPS {
  static const List<String> choices = ['rock', 'paper', 'scissors', 'quit'];

  Random random = Random();

  String ComputerChoice() {
    int index = random.nextInt(choices.length);
    return choices[index];
  }

  void play() {
    while (true) {
      print(
        'Enter your choice (rock, paper, scissors) or type "quit" to exit:',
      );
      String? userChoice = stdin.readLineSync()?.toLowerCase();

      if (userChoice == 'quit') {
        print('Thanks for playing!');
        break;
      }

      if (!choices.contains(userChoice)) {
        print('Invalid choice. Please try again.');
        continue;
      }

      String computerChoice = ComputerChoice();
      print('Computer chose: $computerChoice');

      if (userChoice == computerChoice) {
        print('It\'s a tie!');
      } else if ((userChoice == 'rock' && computerChoice == 'scissors') ||
          (userChoice == 'paper' && computerChoice == 'rock') ||
          (userChoice == 'scissors' && computerChoice == 'paper')) {
        print('You win!');
      } else {
        print('Computer wins!');
      }
    }
  }
}

void main() {
  RPS game = RPS();
  game.play();
}