Feature: Gestión de gastos
  Como estudiante
  Quiero registrar mis gastos
  Para controlar cuánto dinero gasto

  Scenario: Crear un gasto y comprobar cual es el total que llevo gastado
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    Then el total de dinero gastado debe ser 5 euros

  Scenario: Eliminar un gasto y comprobar cual es el total que llevo gastado
    Given un gestor con un gasto de 5 euros
    When elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear y eliminar un gasto y comprobar que no he gastado dinero
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear dos gastos diferentes y comprobar que el total que llevo gastado es la suma de ambos
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And añado un gasto de 10 euros llamado Comida
    Then el total de dinero gastado debe ser 15 euros

  Scenario: Crear tres gastos diferentes que sumen 30 euros hace que el total sean 30 euros
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And añado un gasto de 10 euros llamado Comida
    And añado un gasto de 15 euros llamado Gasolina
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Café_Agaete
    And añado un gasto de 30 euros llamado Comida
    And añado un gasto de 30 euros llamado Transporte
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear cuatro gastos de 10, 30, 30, 5 euros y elimino el ultimo gasto la suma son 70 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Merienda
    And añado un gasto de 30 euros llamado Almuerzo
    And añado un gasto de 30 euros llamado Gasolina
    And añado un gasto de 5 euros llamado Gintonic
    And elimino el gasto con id 4
    Then el total de dinero gastado debe ser 70 euros
  
  Scenario: Crear un gasto inicial de 20 euros y añadir otro de 5 euros hace que el total sea 25 euros
    Given un gestor con un gasto de 20 euros
    When añado un gasto de 5 euros llamado Desayuno
    Then el total de dinero gastado debe ser 25 euros

  Scenario: Crear dos gastos y eliminar el primero deja un solo gasto registrado
    Given un gestor de gastos vacío
    When añado un gasto de 8 euros llamado Pan
    And añado un gasto de 12 euros llamado Leche
    And elimino el gasto con id 1
    Then debe haber 1 gastos registrados
    And el total de dinero gastado debe ser 12 euros

  Scenario: Crear cuatro gastos pequeños hace que el total y el número de gastos sean correctos
    Given un gestor de gastos vacío
    When añado un gasto de 2 euros llamado Agua
    And añado un gasto de 3 euros llamado Café
    And añado un gasto de 4 euros llamado Bocadillo
    And añado un gasto de 1 euros llamado Chicle
    Then debe haber 4 gastos registrados
    And el total de dinero gastado debe ser 10 euros

  Scenario: Crear tres gastos y eliminarlos todos deja el total en 0 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Café
    And añado un gasto de 20 euros llamado Comida
    And añado un gasto de 30 euros llamado Transporte
    And elimino el gasto con id 1
    And elimino el gasto con id 2
    And elimino el gasto con id 3
    Then debe haber 0 gastos registrados
    And el total de dinero gastado debe ser 0 euros

  Scenario: Crear varios gastos y eliminar el gasto intermedio mantiene correctamente el total restante
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Café
    And añado un gasto de 30 euros llamado Comida
    And añado un gasto de 50 euros llamado Transporte
    And elimino el gasto con id 2
    Then debe haber 2 gastos registrados
    And el total de dinero gastado debe ser 60 euros

  Scenario: Crear cinco gastos y eliminar dos de ellos recalcula bien el número de gastos y el total
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado A
    And añado un gasto de 10 euros llamado B
    And añado un gasto de 15 euros llamado C
    And añado un gasto de 20 euros llamado D
    And añado un gasto de 25 euros llamado E
    And elimino el gasto con id 2
    And elimino el gasto con id 4
    Then debe haber 3 gastos registrados
    And el total de dinero gastado debe ser 45 euros