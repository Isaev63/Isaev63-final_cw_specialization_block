class Animals:
    """
    Базовый класс для всех животных.
    """

    def __init__(self, animal_id, name_animal, type_animal, birth_date, commands=None):
        self.animal_id = animal_id
        self.name_animal = name_animal
        self.type_animal = type_animal
        self.birth_date = birth_date
        self.commands = commands if commands else []

    def get_id(self):
        return self.animal_id

    def name_animal(self):
        return self.name_animal

    def type_animal(self):
        return self.type_animal

    def birth_date(self):
        return self.birth_date

    def command(self):
        return self.commands

    def add_command(self, command):
        self.commands.append(command)
