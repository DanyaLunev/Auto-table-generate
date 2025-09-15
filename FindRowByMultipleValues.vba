Function FindRowByMultipleValues(searchValues As Variant, searchRange As Range, Optional columnsArray As Variant, Optional returnAbsoluteRow As Boolean = False) As Long
    Dim i As Long
    Dim j As Long
    Dim found As Boolean

    If IsMissing(columnsArray) Then
        ReDim columnsArray(1 To UBound(searchValues))
        For i = 1 To UBound(searchValues)
            columnsArray(i) = i
        Next i
    End If

    For i = 1 To searchRange.Rows.Count
        found = True
        For j = 1 To UBound(searchValues)
            If searchRange.Cells(i, columnsArray(j)).Value <> searchValues(j) Then
                found = False
                Exit For
            End If
        Next j

        If found Then
            If returnAbsoluteRow Then
                FindRowByMultipleValues = searchRange.Row + i - 1
            Else
                FindRowByMultipleValues = i
            End If
            Exit Function
        End If
    Next i

    FindRowByMultipleValues = -1
End Function
