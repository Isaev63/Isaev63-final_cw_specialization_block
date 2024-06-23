from Pets import Pets


class Dogs(Pets):
    """
    Класс для собак, наследуемый от Pets.
    """

    def __init__(self, animal_id, name_animal, birth_date, command):
        super().__init__(animal_id, name_animal, "Dog", birth_date, command)

    def get_name_animal(self):
        return self.name_animal

    def get_type_animal(self):
        return self.type_animal

    def get_birth_date(self):
        return self.birth_date

    def get_commands(self):
        return self.commands
