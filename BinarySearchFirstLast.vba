Function BinarySearchFirstLast(searchValues As Variant, searchRange As Range, Optional columnsArray As Variant) As Variant
    Dim result(1) As Long
    result(0) = -1
    result(1) = -1 
    
    If searchRange Is Nothing Then
        BinarySearchFirstLast = result
        Exit Function
    End If
    
    If IsMissing(columnsArray) Then
        ReDim columnsArray(1 To UBound(searchValues))
        Dim i As Long
        For i = 1 To UBound(searchValues)
            columnsArray(i) = i
        Next i
    End If
    
    Dim totalRows As Long
    totalRows = searchRange.Rows.Count
    
    ' Поиск первого вхождения с условием
    Dim low As Long, high As Long, mid As Long
    low = 1
    high = totalRows
    
    While low <= high
        mid = (low + high) \ 2
        
        Dim compareResult As Integer
        compareResult = CompareRowWithValues(searchRange, mid, searchValues, columnsArray)
        
        If compareResult = 0 Then
            ' Проверяем условие для столбца 12
            If CheckCondition(searchRange, mid) Then
                result(0) = mid
                high = mid - 1
            Else
                ' Условие не выполняется, продолжаем поиск вправо
                low = mid + 1
            End If
        ElseIf compareResult < 0 Then
            low = mid + 1
        Else
            high = mid - 1
        End If
    Wend
    
    ' Поиск последнего вхождения с условием
    low = 1
    high = totalRows
    
    While low <= high
        mid = (low + high) \ 2
        
        compareResult = CompareRowWithValues(searchRange, mid, searchValues, columnsArray)
        
        If compareResult = 0 Then
            ' Проверяем условие для столбца 12
            If CheckCondition(searchRange, mid) Then
                result(1) = mid
                low = mid + 1
            Else
                ' Условие не выполняется, продолжаем поиск влево
                high = mid - 1
            End If
        ElseIf compareResult < 0 Then
            low = mid + 1
        Else
            high = mid - 1
        End If
    Wend
    
    BinarySearchFirstLast = result
End Function

Private Function CompareRowWithValues(rng As Range, rowNum As Long, searchValues As Variant, columnsArray As Variant) As Integer
    Dim i As Long
    Dim cellValue As Variant
    Dim searchValue As Variant
    
    For i = 1 To UBound(searchValues)
        cellValue = rng.Cells(rowNum, columnsArray(i)).Value
        searchValue = searchValues(i)
        
        If cellValue < searchValue Then
            CompareRowWithValues = -1
            Exit Function
        ElseIf cellValue > searchValue Then
            CompareRowWithValues = 1
            Exit Function
        End If
    Next i
    
    CompareRowWithValues = 0
End Function

' Функция проверки условия: значение в 12 столбце не равно 10
Private Function CheckCondition(rng As Range, rowNum As Long) As Boolean
    Dim value12 As Variant
    value12 = rng.Cells(rowNum, 12).Value
    
    ' Проверяем, что значение существует и не равно 10
    If IsEmpty(value12) Or IsNull(value12) Then
        CheckCondition = True ' Пустые значения проходят условие
    Else
        CheckCondition = (value12 <> 10)
    End If
End Function
