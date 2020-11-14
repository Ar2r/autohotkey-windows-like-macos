;==========================================
;Смена раскладки клавиатуры через cmd+Shift+Space
;==========================================

;#+sc039::PostMessage, 0x50, 2, 0,, A 
#sc039::PostMessage, 0x50, 2, 0,, A      ; Cmd+Space работает в Windows XP 

;======================================================
;Выполнение команд независимо от языка через cmd+{Key}: 
;  Undo, Cut, Copy, Paste, Save, Find
;======================================================
; <! - left alt-key
; ^ - ctrl-key
; + - shift-key
; sc021 - W 
; sc010 - D
; sc011 - F
; sc014 - T
; sc013 - R
; sc024 - J
; sc025 - K
; sc026 - L
; sc017 - I
; sc01A - [
; sc01B - ]
; sc027 - ;
; sc02B - \
; sc035 - /
; sc033 - ,
; sc034 - .

#sc02C::SendInput ^{sc02C}  ; Undo  cmd+z
#sc02D::SendInput ^{sc02D}  ; Cut cmd+x
#sc02E::SendInput ^{sc02E}  ; Copycmd+c
#sc02F::SendInput ^{sc02F}  ; Paste  cmd+v
#sc031::SendInput ^{sc031}  ; New  cmd+n
#sc01E::SendInput ^{sc01E}  ; Select All cmd+a
#sc01F::SendInput ^{sc01F}  ; Save  cmd+s
#sc021::SendInput ^{sc021}  ; Find  cmd+f
#sc018::SendInput ^{sc018}  ; Open  cmd+o
#sc011::SendInput ^{F4}     ; Close  cmd+w
#sc014::SendInput ^{sc014}  ; New Tab cmd+t
#sc013::SendInput ^{sc013}  ; Reload cmd+r

;==============================================================
; Google Chrome
;==============================================================

<!#sc014::SendInput +^{sc014}  ; Reopen close tab cmd+alt+t
<!#sc017::SendInput +^{sc017}  ; Open Dev tools   cmd+alt+i

;==============================================================
;Выполнение команд независимо от языка в MS Office через cmd+{Key}: 
;   Bold, Italic 
;==============================================================

#sc030::SendInput ^{sc030}  ; Bold  cmd+b 
#sc017::SendInput ^{sc017}  ; Italic  cmd+i


; --------------------------------------------------------------
; Application specific
; --------------------------------------------------------------

; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

; Show Web Developer Tools with cmd + alt + i
#!i::Send {F12}

; Show source code with cmd + alt + u
#!u::Send ^u

#IfWinActive

;==============================================================
;Корректное отображение символов в соответсвии с RU/ENG Apple Keyboard
;==============================================================

$+5::CheckRus(":","%")  ; Двоеточие через Shift+5
$+6::CheckRus(",","^")  ; Запятая через Shift+6
$+7::CheckRus(".","&")  ; Точка через Shift+7
$+8::CheckRus(";","*") ; Точка с запятой через Shift+8
$+/::CheckRus("?","?")  ; Вопрос через Shift+/

CheckRus(rus,eng)
{
SetFormat, Integer, H
WinGet, WinID,, A
ThreadID:=DllCall("GetWindowThreadProcessId", "Int", WinID, "Int", 0)
InputLocaleID:=DllCall("GetKeyboardLayout", "Int", ThreadID)
if(InputLocaleID == "0x4190419")
{
Send %rus%
}
if(InputLocaleId == "0x4090409")
{
SendRaw %eng%
}
Return
}
