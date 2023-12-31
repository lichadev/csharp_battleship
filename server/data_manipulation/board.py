import random

class Board:
    ships = {1: 5, 2: 4, 3: 3, 4: 2, 5: 1}
    def __init__(self):
        self.board = [['O' for _ in range(15)] for _ in range(15)]
        self.position_ships(self.board, self.ships)
    def show_board(self):
        for row in self.board:
            print(' '.join(row))
    # Función para verificar si una coordenada es agua o un barco
    def check_coordinate(self, row, col):
        if self.board[row][col] == 'O':
            self.board[row][col] = 'A'  # agua
            return 'agua'
        elif self.board[row][col] != 'X':
            self.board[row][col] = 'X'  # fuiste tocado tio te vais marcado 

            # Verificar si todos los barcos han sido impactados al menos una vez
            all_ships_hit = all(all(cell == 'X' for cell in row) for row in self.board if any(cell.isdigit() for cell in row))
            if all_ships_hit:
                return 'gg'  # GG GG GG GG GG GG GG GG GG GG GG 
            return 'tocado'
    # Función para verificar si se puede colocar un barco en una posición específica
    def can_place_ship(self, board, row, col, length, direction):
        if direction == 'horizontal':
            return col + length <= len(board[0]) and all(board[row][col+i] == 'O' for i in range(length))
        else:
            return row + length <= len(board) and all(board[row+i][col] == 'O' for i in range(length))
    # Función para colocar un barco en una posición específica
    def place_ship(self, board, row, col, length, direction):
        if direction == 'horizontal':
            for i in range(length):
                #print(board[row][col+i])
                board[row][col+i] = str(length)
        else:
            for i in range(length):
                #print(board[row+i][col])
                board[row+i][col] = str(length)

    def position_ships(self, board, ships):
        directions = ['horizontal', 'vertical']
        for ship, length in ships.items():
            placed = False
            while not placed:
                direction = random.choice(directions)
                if direction == 'horizontal':
                    row = random.randint(0, len(board) - 1)
                    col = random.randint(0, len(board[0]) - length)  # Ajustamos el límite para que el barco quepa
                else:
                    row = random.randint(0, len(board) - length)  # Ajustamos el límite para que el barco quepa
                    col = random.randint(0, len(board[0]) - 1)
                    
                if (self.can_place_ship(board, row, col, length, direction)):
                    self.place_ship(board, row, col, length, direction)
                    placed = True
                
""" batl = Board()
batl.show_board()

for i in range(15):
  for j in range(15):
    x, y = i, j
    result = batl.check_coordinate(batl.board, y, x)
    print(f'Coordenada ({x}, {y}) es {result}')
    
batl.show_board() """