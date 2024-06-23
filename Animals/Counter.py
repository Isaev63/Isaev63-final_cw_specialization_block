class Counter:
    """
    Класс Counter для подсчета созданных животных.
    """

    def __init__(self):
        self.count = 0
        self.closed = False

    def add(self):
        if self.closed:
            raise RuntimeError("\033[1;31m[*] Попытка использования закрытого ресурса.\033[0m")
        self.count += 1

    def close(self):
        self.closed = True

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()
