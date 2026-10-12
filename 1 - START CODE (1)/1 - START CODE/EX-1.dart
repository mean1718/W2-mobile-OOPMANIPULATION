enum Skill { FLUTTER, DART, OTHER }

class Address {
  String _street;
  String _city;
  String _zipCode;

  Address(this._street, this._city, this._zipCode);
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(String name, double baseSalary)
    : _name = name,
      _baseSalary = baseSalary,
      _skills = [Skill.FLUTTER, Skill.DART],
      _address = Address('', '', ''),
      _yearsOfExperience = 2;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double calculateSalary() {
    double salary = _baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      if (skill == Skill.FLUTTER) {
        salary += 5000;
      } else if (skill == Skill.DART) {
        salary += 3000;
      } else if (skill == Skill.OTHER) {
        salary += 1000;
      }
    }

    return salary;
  }

  void printDetails() {
    print('Employee: $name');
    print('Base Salary: \$${baseSalary}');
    print('Total Salary: \$${calculateSalary()}');
  }
}

void main() {
  var emp1 = Employee('Sokea', 40000);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000);
  emp2.printDetails();
}
