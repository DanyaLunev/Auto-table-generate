Sub ReadSelectedRange()
    Dim selectedRange As Range
    Dim cellValues As Variant
    Dim i As Long, j As Long
    
    ' Проверяем, что выделен диапазон
    If TypeName(Selection) <> "Range" Then
        MsgBox "Пожалуйста, выделите диапазон ячеек"
        Exit Sub
    End If
    
    Set selectedRange = Selection
    ' Считываем значения в массив
    cellValues = selectedRange.Value
    
    ' Выводим значения в Immediate Window (Ctrl+G)
    For i = 1 To UBound(cellValues, 1)
        For j = 1 To UBound(cellValues, 2)
            Debug.Print "Ячейка(" & i & "," & j & "): " & cellValues(i, j)
        Next j
    Next i
End Sub
