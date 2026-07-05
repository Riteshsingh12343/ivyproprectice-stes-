Attribute VB_Name = "Module1"
 
'range = one cell ,group of cell, group of discount
' range ("A1")
Sub range_obj()
Range("A1") = 100
Range("b1:b10") = 200
Range("c1,d2,e3,f4,g5") = 300
 

End Sub

Sub range_example()
Range("A1") = "Marks"
Dim i As Integer

'For i = 1 To 10
 '   Range("A" & i + 1) = InputBox("Enter the Marks ")
'Next i

Range("C1") = "Max Marks"
Range("c2") = "Min Marks"
Range("C3") = "Avg Marks"
'calculate in backend and push value in excel
'worksheet Function - gives you acces to excel function in vba

Range("D1") = WorksheetFunction.Max(Range("a2:A11"))
Range("D2") = WorksheetFunction.Min(Range("a2:A11"))
Range("D3") = WorksheetFunction.Average(Range("a2:A11"))

' Push The Formula in excel cell
Range("F1").Formula = "=max(a1:a11)"
Range("F2").Formula = "=min(a2:a11)"
Range("F3").Formula = "=Average(a2:a11)"

End Sub

