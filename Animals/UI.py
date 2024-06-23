from Cats import Cats
from Dogs import Dogs
from Hamsters import Hamsters
from Horses import Horses
from Donkeys import Donkeys
from Camels import Camels
from Counter import Counter
from IDGen import IDGenerator


class UserInterface:
    """
    Класс для реализации пользовательского интерфейса.
    """

    def __init__(self):
        self.animals = []

    def main_menu(self):
        """
        Главный метод для навигации по меню.
        """
        while True:
            print(f"\n\033[1;36m{'*' * 30}\n"
                  "[1] - Завести новое животное\n"
                  "[2] - Показать список команд животного\n"
                  "[3] - Обучить животное новым командам\n"
                  "[4] - Показать список всех животных\n"
                  "[5] - Выход\n")
            choice = input("[*] Выбрать опцию: \033[0m")

            if choice == '1':
                self.add_new_animal()
            elif choice == '2':
                self.show_commands()
            elif choice == '3':
                self.train_animal()
            elif choice == '4':
                self.show_all_animals()
            elif choice == '5':
                break
            else:
                print("\033[1;36m[*] Неверный выбор, попробуйте снова.\033[0m")

    def add_new_animal(self):
        """
        Метод для добавления нового животного.
        """
        try:
            with Counter() as counter:
                name = input("\033[1;36m[*] Введите имя животного: \033[0m")
                type_animal = input("\033[1;36m[*] Выбрать тип животного:\n"
                                    "[1] - Кошка\n"
                                    "[2] - Собака\n"
                                    "[3] - Хомяк\n"
                                    "[4] - Лошадь\n"
                                    "[5] - Осел\n"
                                    "[6] - Верблюд\n"
                                    "Ввести номер животного: ")
                birth_date = input("\033[1;36m[*] Введите дату рождения животного: \033[0m")
                id_animal = IDGenerator.get_next_id()

                if type_animal == '1':
                    animal = Cats(id_animal, name, birth_date, [])
                elif type_animal == '2':
                    animal = Dogs(id_animal, name, birth_date, [])
                elif type_animal == '3':
                    animal = Hamsters(id_animal, name, birth_date, [])
                elif type_animal == '4':
                    animal = Horses(id_animal, name, birth_date, [])
                elif type_animal == '5':
                    animal = Donkeys(id_animal, name, birth_date, [])
                elif type_animal == '6':
                    animal = Camels(id_animal, name, birth_date, [])
                else:
                    print("\033[1;31m[*] Что-то пошло не так! Введите правильный номер животного.\033[0m")
                    return

                self.animals.append(animal)
                counter.add()
                print(f"\033[1;32m[*] Животное '{name}' добавлено с ID {animal.get_id()}.\033[0m")
        except RuntimeError as e:
            print(f"\033[1;31m[*] Ошибка: {e}\033[0m")

    def show_commands(self):
        """
        Метод для отображения списка команд выбранного животного.
        """
        id_animal = input("\033[1;36m[*] Введите ID животного для отображения его команд: \033[0m")
        animal = self.find_animal_by_id(id_animal)
        if animal:
            print(f"\033[1;32m[*] Команды для '{animal.get_name_animal()}' "
                  f"(ID: {animal.get_id()}): {', '.join(animal.get_commands())}\033[0m")
        else:
            print(f"\033[1;31m[*] Животное с ID {id_animal} не найдено.\033[0m")

    def train_animal(self):
        """
        Метод для обучения животного новой команде.
        """
        id_animal = input("\033[1;36m[*] Введите ID животного для обучения: \033[0m")
        animal = self.find_animal_by_id(id_animal)
        if animal:
            command = input("\033[1;36m[*] Введите новую команду: \033[0m")
            animal.add_command(command)
            print(f"\033[1;32m[*] Животное '{animal.get_name_animal()}' "
                  f"(ID: {animal.get_id()}) обучено новой команде [{command}].\033[0m")
        else:
            print(f"\033[1;31m[*] Животное с ID {id_animal} не найдено.\033[0m")

    def show_all_animals(self):
        """
        Метод для отображения списка всех животных с их ID.
        """
        if self.animals:
            for animal in self.animals:
                print(f"\n\033[1;36mID: {animal.get_id()}\n"
                      f"Имя: {animal.get_name_animal()}\n"
                      f"Тип: {animal.get_type_animal()}\n"
                      f"Дата рождения: {animal.get_birth_date()}\033[0m")
        else:
            print("\033[1;31m[*] Нет зарегистрированных животных.\033[0m")

    def find_animal_by_id(self, id_animal):
        """
        Вспомогательный метод для поиска животного по ID.
        """
        try:
            id_animal = int(id_animal)
        except ValueError:
            print("\033[1;33m[*] ID должно быть числом.\033[0m")
            return None

        for animal in self.animals:
            if animal.get_id() == id_animal:
                return animal
        return None
