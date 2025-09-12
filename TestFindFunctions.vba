Sub TestFindFunctions()
    Dim rowNumber As Long
    
    ' Пример 1: Поиск по одному значению
    rowNumber = FindRowByValue("ИскомоеЗначение", Range("A1:A100"))
    If rowNumber > 0 Then
        Debug.Print "Найдено в строке: " & rowNumber
    End If
    
    ' Пример 2: Поиск по нескольким значениям
    Dim searchValues(1 To 2) As Variant
    searchValues(1) = "Значение1"
    searchValues(2) = "Значение2"
    
    Dim columnsArray(1 To 2) As Integer
    columnsArray(1) = 1 ' Столбец A
    columnsArray(2) = 2 ' Столбец B
    
    rowNumber = FindRowByMultipleValues(searchValues, Range("A1:B100"), columnsArray)
    If rowNumber > 0 Then
        Debug.Print "Найдено в строке: " & rowNumber
    End If
End Sub
