CREATE TABLE Контейнеры (
    ИД UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
    Номер INT NOT NULL,
    Тип NVARCHAR(255) NOT NULL,
    Длина INT NOT NULL,
    Ширина INT NOT NULL,
    Высота INT NOT NULL,
    Вес INT NOT NULL,
    [Пустой/не пустой] BIT NOT NULL,
    [Дата поступления] DATETIME NOT NULL
);

CREATE TABLE Операции (
    ИД UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
    [ИД Контейнера] UNIQUEIDENTIFIER NOT NULL,
    [Дата начала операции] DATETIME NOT NULL,
    [Дата окончания операции] DATETIME NOT NULL,
    [Тип операции] NVARCHAR(255) NOT NULL,
    [ФИО оператора] NVARCHAR(255) NOT NULL,
    [Место инспекции] NVARCHAR(255) NOT NULL,
    FOREIGN KEY ([ИД Контейнера]) REFERENCES Контейнеры(ИД)
);

SELECT '[' + STRING_AGG(
    '{' +
        '"ИД":"' + CAST(ИД AS NVARCHAR(36)) + '",' +
        '"Номер":' + CAST(Номер AS NVARCHAR) + ',' +
        '"Тип":"' + Тип + '",' +
        '"Длина":' + CAST(Длина AS NVARCHAR) + ',' +
        '"Ширина":' + CAST(Ширина AS NVARCHAR) + ',' +
        '"Высота":' + CAST(Высота AS NVARCHAR) + ',' +
        '"Вес":' + CAST(Вес AS NVARCHAR) + ',' +
        '"Пустой/не пустой":' + CAST([Пустой/не пустой] AS NVARCHAR) + ',' +
        '"Дата поступления":"' + FORMAT([Дата поступления], 'yyyy-MM-dd HH:mm:ss') + '"' +
    '}'
, ',') + ']' AS JSON
FROM Контейнеры;


SELECT '[' + STRING_AGG(
    '{' +
        '"ИД":"' + CAST(Операции.ИД AS NVARCHAR(36)) + '",' +
        '"ИД Контейнера":"' + CAST(Операции.[ИД Контейнера] AS NVARCHAR(36)) + '",' +
        '"Дата начала операции":"' + FORMAT(Операции.[Дата начала операции], 'yyyy-MM-dd HH:mm:ss') + '",' +
        '"Дата окончания операции":"' + FORMAT(Операции.[Дата окончания операции], 'yyyy-MM-dd HH:mm:ss') + '",' +
        '"Тип операции":"' + Операции.[Тип операции] + '",' +
        '"ФИО оператора":"' + Операции.[ФИО оператора] + '",' +
        '"Место инспекции":"' + Операции.[Место инспекции] + '"' +
    '}'
, ',') + ']' AS JSON
FROM Операции
JOIN Контейнеры ON Операции.[ИД Контейнера] = Контейнеры.ИД
WHERE Контейнеры.[Пустой/не пустой] = 0;
