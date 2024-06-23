class IDGenerator:
    """
    Глобальный счетчик для генерации уникальных идентификаторов.
    """
    id_counter = 0

    @staticmethod
    def get_next_id():
        IDGenerator.id_counter += 1
        return IDGenerator.id_counter
