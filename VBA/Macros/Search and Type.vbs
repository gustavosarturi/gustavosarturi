Sub Search_and_Storage()
    ThisWorkbook.Worksheets("Controle").Select
    Dim Line As Integer
    Line = 1
    While Line < 100
        If Cells(Line, 1) <> Empty Then
            Line = Line + 1
        Else
            ThisWorkbook.Worksheets("Controle").Cells(Line, 1).FormulaLocal = "=LEFT(Geral!B2;10)"
            ThisWorkbook.Worksheets("Controle").Cells(Line, 2).FormulaLocal = "=MID(Geral!B2;11;5)"
            ThisWorkbook.Worksheets("Controle").Cells(Line, 3).FormulaLocal = "=MID(Geral!B2;16;3)"            
            ThisWorkbook.Worksheets("Controle").Cells(Line, 4).FormulaLocal = "=RIGHT(Geral!B2;3)"
           
            ThisWorkbook.Worksheets("Controle").Range(Cells(Line, 1), Cells(Line, 4)).Select
            Selection.Copy
            ThisWorkbook.Worksheets("Controle").Range(Cells(Line, 1), Cells(Line, 4)).PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
                :=False, Transpose:=False
            Application.CutCopyMode = False
            
            Line = 100
            ThisWorkbook.Worksheets("Geral").Select
            Range("B2").Select
        End If
    Wend
End Sub
