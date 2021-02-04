;--------------------------------------------------------------
; Kelompok : 5		                                      |
; Nama 	   : 1. Mohamad Fahrio Ghanial Fatihah (140810190005) |
;	     2. Windu Nursetyadi 	       (140810190041) |
;	     3. Adam Din Naufan		       (140810190045) |
; Kelas    : A					              |
;--------------------------------------------------------------

org 0x100				; origin 100h (ruang kosong sebanyak 100h di atas program)
global start 				; deklarasi global start

%macro write_string 1			; makro untuk menampilkan string
	mov dx, %1			; string dimasukkan ke dx
	mov ah, 9h			; interrupt untuk menampilkan string
	int 21h				; interrupt
%endmacro				; batas makro write_string

section .text				; section untuk menyimpan kodingan

start:
	mov bl, 0			; mengosongkan bl
	jmp menu 			; lompat ke menu

pembatas:				; label pembatas 
	write_string masuk1		; menampilkan string masuk1

menu:					; label menu
	write_string masuk1		; menampilkan string masuk1
	write_string masuk2		; menampilkan string masuk2
	write_string menu1		; menampilkan string menu1
	write_string menu2		; menampilkan string menu2
	write_string menu3		; menampilkan string menu3
	write_string menu4		; menampilkan string menu4
	write_string menu5		; menampilkan string menu5
	write_string menu6		; menampilkan string menu6
    	write_string menu7		; menampilkan string menu7
    	write_string menu8		; menampilkan string menu8
	write_string menuexit		; menampilkan string menuexit
	write_string pilih		; menampilkan string pilih
	mov ah,01h			; interrupt untuk membaca karakter dari input dan disimpan di al
 	int 21h 			; interrupt
	mov dl, al 			; karakter yang terbaca dipindahkan ke dl

	cmp dl,'1'			; bandingkan karakter yang ada di dl dengan '1'
 	je declare_suhu1		; jika sama maka lompat ke declare_suhu1

	cmp dl,'2'			; bandingkan karakter yang ada di dl dengan '2'
 	je declare_suhu2		; jika sama maka lompat ke declare_suhu2

	cmp dl,'3'			; bandingkan karakter yang ada di dl dengan '3'
 	je declare_suhu3		; jika sama maka lompat ke declare_suhu3

	cmp dl,'4'			; bandingkan karakter yang ada di dl dengan '4'
 	je declare_suhu4		; jika sama maka lompat ke declare_suhu4

	cmp dl,'5'			; bandingkan karakter yang ada di dl dengan '5'
 	je declare_suhu5		; jika sama maka lompat ke declare_suhu5

	cmp dl,'6'			; bandingkan karakter yang ada di dl dengan '6'
 	je declare_suhu6		; jika sama maka lompat ke declare_suhu6
 
    	cmp dl,'7'			; bandingkan karakter yang ada di dl dengan '7'
    	je declare_suhu7		; jika sama maka lompat ke declare_suhu7
        
    	cmp dl,'8'			; bandingkan karakter yang ada di dl dengan '8'
    	je declare_suhu8		; jika sama maka lompat ke declare_suhu8

	cmp dl,'0'			; bandingkan karakter yang ada di dl dengan '0'
 	je end				; jika sama maka lompat ke end
	
	jmp salah			; jika input bukan diantara "0-8" maka lompat ke label salah

salah :					; label salah
	write_string newline		; membuat baris baru
	write_string newline		; membuat baris baru
	write_string error		; menampilkan string error
	jmp pembatas			; lompat ke pembatas untuk menampilkan kembali menu (looping menu)

;==============================================================================================================

declare_suhu1:				; label declare_suhu1
	write_string newline		; membuat baris baru
	write_string newline		; membuat baris baru
 	write_string InCelcius		; menampilkan string InCelcius

start_celcius_to_reamur:		; label start_celcius_to_reamur
    	mov ah, 01h			; interrupt untuk membaca karakter dari input dan disimpan di al
    	int 21h				; interrupt

    	cmp al, 13   			; cek apakah user menekan tombol ENTER
    	je celcius_to_reamur 		; jika iya, lompat ke celcius_to_reamur

    	mov ah, 0  			; mengosongkan ah
    	sub al, 48   			; kode ASCII untuk karakter '0' adalah 48 sehingga al dikurangkan dengan 48 agar perhitungan dapat diproses sesuai dengan nilai karakter yang diinputkan

    	mov cl, al 			; memindahkan al ke cl
    	mov al, bl   			; menyimpan nilai inputan yang sebelumnya ke al
    	mov dl, 10			; untuk pengkali
    	mul dl       			; al dikali dengan dl

    	add al, cl   			; nilai sebelum + nilai baru ( setelah nilai sebelum dikali 10 )
    	mov bl, al 			; memindahkan hasil ke bl

    	jmp start_celcius_to_reamur	; lompat ke start_celcius_to_reamur	

celcius_to_reamur:			; label celcius_to_reamur
	write_string OutReamur		; menampilkan string OutReamur
	mov ax, 4			; ax diisi dengan 4 (rumus celcius ke reamur)
	mov dx, bx			; pindahkan nilai dari user yang berada di bx ke dx
	mul dx				; 4 dikali dengan dx (hasil akan berada di ax)

	xor dx, dx			; mengosongkan dx
	mov ax, ax			; inisiasi nilai ax
	mov bx, 5			; bx diisi dengan 5 (rumus celcius ke reamur)
	div bx				; bagi ax dengan 5 dan celcius telah dikonversi ke reamur
	
	push ax				; push nilai yang telah dikonversi tadi (ax) ke stack
	call print_dec			; memanggil print_dec

	mov bl, 0			; mengosongkan bl
	add sp, 2			; hapus nilai yang ada di stack
	jmp pembatas			; lompat ke pembatas untuk menampilkan kembali menu (looping menu)

;==============================================================================================================

declare_suhu2:				; label declare_suhu2
	write_string newline		; membuat baris baru
	write_string newline		; membuat baris baru
 	write_string InCelcius		; menampilkan string InCelcius

start_celcius_to_kelvin:		; label celcius_to_kelvin
    	mov ah, 01h			; interrupt untuk membaca karakter dari input dan disimpan di al
    	int 21h				; interrupt

    	cmp al, 13   			; cek apakah user menekan tombol ENTER
    	je celcius_to_kelvin 		; jika iya, lompat ke celcius_to_kelvin

   	mov ah, 0  			; mengosongkan ah
    	sub al, 48   			; kode ASCII untuk karakter '0' adalah 48 sehingga al dikurangkan dengan 48 agar perhitungan dapat diproses sesuai dengan nilai karakter yang diinputkan

    	mov cl, al 			; memindahkan al (nilai inputan baru) ke cl
    	mov al, bl   			; menyimpan nilai inputan yang sebelumnya ke al
    	mov dl, 10			; untuk pengkali
   	mul dl       			; al dikali dengan dl

    	add al, cl   			; nilai sebelum + nilai baru ( setelah nilai sebelum dikali 10 )
    	mov bl, al 			; memindahkan hasil ke bl

    	jmp start_celcius_to_kelvin	; lompat ke start_celcius_to_kelvin

celcius_to_kelvin:			; label celcius_to_kelvin
	write_string OutKelvin		; menampilkan string OutKelvin
	add bx, 273			; nilai celcius (bx) ditambah 273 (rumus celcius ke kelvin)
	push bx				; push nilai yang telah dikonversi tadi (bx) ke stack

	call print_dec			; memanggil print_dec

	mov bl, 0			; mengosongkan bl
	add sp, 2			; hapus nilai yang ada di stack
	jmp pembatas			; lompat ke pembatas untuk menampilkan kembali menu (looping menu)

;==============================================================================================================

declare_suhu3:				; label declare_suhu3
	write_string newline		; membuat baris baru
	write_string newline		; membuat baris baru
 	write_string InCelcius		; menampilkan string InCelcius 

start_celcius_to_farenheit:		; label celcius_to_farenheit
     	mov ah, 01h			; interrupt untuk membaca karakter dari input dan disimpan di al
      	int 21h				; interrupt

	cmp al, 13   			; cek apakah user menekan tombol ENTER
      	je celcius_to_farenheit		; jika iya, lompat ke celcius_to_kelvin

	mov ah, 0  			; mengosongkan ah
    	sub al, 48   			; kode ASCII untuk karakter '0' adalah 48 sehingga al dikurangkan dengan 48 agar perhitungan dapat diproses sesuai dengan nilai karakter yang diinputkan

    	mov cl, al 			; memindahkan al ke cl
    	mov al, bl   			; menyimpan nilai inputan yang sebelumnya ke al
    	mov dl, 10			; untuk pengkali
    	mul dl       			; al dikali dengan dl

    	add al, cl   			; nilai sebelum + nilai baru ( setelah nilai sebelum dikali 10 )
    	mov bl, al 			; memindahkan hasil ke bl

      	jmp start_celcius_to_farenheit	; lompat ke start_celcius_to_farenheit

celcius_to_farenheit:			; label celcius_to_farenheit
	write_string OutFarenheit	; menampilkan string OutFarenheit
	mov ax, 9			; ax diisi dengan 9 (rumus celcius ke farenheit)
	mov dx, bx			; pindahkan nilai dari user yang berada di bx ke dx
	mul dx				; 9 dikali dengan dx (hasil akan berada di ax)

	xor dx, dx			; mengosongkan dx
	mov ax, ax			; inisiasi nilai ax
	mov bx, 5			; bx diisi dengan 5 (rumus celcius ke farenheit)
	div bx				; bagi ax dengan 5 
	add ax, 32			; tambah ax dengan 32 (rumus celcius ke farenheit) dan celcius telah dikonversi ke farenheit
	
	push ax				; push nilai yang telah dikonversi tadi (ax) ke stack
	call print_dec			; memanggil print_dec

	mov bl, 0			; mengosongkan bl
	add sp, 2			; hapus nilai yang ada di stack
	jmp pembatas			; lompat ke pembatas untuk menampilkan kembali menu (looping menu)

;==============================================================================================================

declare_suhu4:				; label declare_suhu4
	write_string newline		; membuat baris baru
	write_string newline		; membuat baris baru
 	write_string InReamur		; menampilkan string InReamur

start_reamur_to_celcius:		; label reamur_to_celcius
   	mov ah, 01h			; interrupt untuk membaca karakter dari input dan disimpan di al
      	int 21h				; interrupt

	cmp al, 13   			; cek apakah user menekan tombol ENTER
	je reamur_to_celcius		; jika iya, lompat ke reamur_to_celcius

   	mov ah, 0  			; mengosongkan ah
    	sub al, 48   			; kode ASCII untuk karakter '0' adalah 48 sehingga al dikurangkan dengan 48 agar perhitungan dapat diproses sesuai dengan nilai karakter yang diinputkan

    	mov cl, al 			; memindahkan al ke cl
    	mov al, bl   			; menyimpan nilai inputan yang sebelumnya ke al
    	mov dl, 10			; untuk pengkali
    	mul dl       			; al dikali dengan dl

    	add al, cl   			; nilai sebelum + nilai baru ( setelah nilai sebelum dikali 10 )
    	mov bl, al 			; memindahkan hasil ke bl

      	jmp start_reamur_to_celcius	; lompat ke start_reamur_to_celcius

reamur_to_celcius:			; label reamur_to_celcius
	write_string OutCelcius		; menampilkan string OutCelcius
	mov ax, 5			; ax diisi dengan 5 (rumus reamur ke celcius)
	mov dx, bx			; pindahkan nilai dari user yang berada di bx ke dx
	mul dx				; 5 dikali dengan dx (hasil akan berada di ax)

	xor dx, dx			; mengosongkan dx
	mov ax, ax			; inisiasi nilai ax
	mov bx, 4			; bx diisi dengan 4 (rumus reamur ke celcius)
	div bx				; bagi ax dengan 4 dan reamur telah dikonversi ke celcius
	
	push ax				; push nilai yang telah dikonversi tadi (ax) ke stack
	call print_dec			; memanggil print_dec

	mov bl, 0			; mengosongkan bl
	add sp, 2			; hapus nilai yang ada di stack
	jmp pembatas			; lompat ke pembatas untuk menampilkan kembali menu (looping menu)

;==============================================================================================================

declare_suhu5:				; label declare_suhu5
	write_string newline		; membuat baris baru
	write_string newline		; membuat baris baru
 	write_string InReamur		; menampilkan string InReamur

start_reamur_to_farenheit:		; label reamur_to_farenheit
   	mov ah, 01h			; interrupt untuk membaca karakter dari input dan disimpan di al
      	int 21h				; interrupt

	cmp al, 13   			; cek apakah user menekan tombol ENTER
        je reamur_to_farenheit		; jika iya, lompat ke reamur_to_farenheit

        mov ah, 0  			; mengosongkan ah
    	sub al, 48   			; kode ASCII untuk karakter '0' adalah 48 sehingga al dikurangkan dengan 48 agar perhitungan dapat diproses sesuai dengan nilai karakter yang diinputkan

    	mov cl, al 			; memindahkan al ke cl
    	mov al, bl   			; menyimpan nilai inputan yang sebelumnya ke al
    	mov dl, 10			; untuk pengkali
    	mul dl       			; al dikali dengan dl

    	add al, cl   			; nilai sebelum + nilai baru ( setelah nilai sebelum dikali 10 )
    	mov bl, al 			; memindahkan hasil ke bl

      	jmp start_reamur_to_farenheit	; lompat ke start_reamur_to_farenheit

reamur_to_farenheit:			; label reamur_to_celcius
	write_string OutFarenheit	; menampilkan string OutFarenheit
	mov ax, 9			; ax diisi dengan 9 (rumus reamur ke farenheit)
	mov dx, bx			; pindahkan nilai dari user yang berada di bx ke dx
	mul dx				; 9 dikali dengan dx (hasil akan berada di ax)

	xor dx, dx			; mengosongkan dx
	mov ax, ax			; inisiasi nilai ax
	mov bx, 4			; bx diisi dengan 4 (rumus reamur ke farenheit)
	div bx				; bagi ax dengan 4 
	add ax, 32			; tambah ax dengan 32 (rumus reamur ke farenheit) dan reamur telah dikonversi ke farenheit
	
	push ax				; push nilai yang telah dikonversi tadi (ax) ke stack
	call print_dec			; memanggil print_dec

	mov bl, 0			; mengosongkan bl
	add sp, 2			; hapus nilai yang ada di stack
	jmp pembatas			; lompat ke pembatas untuk menampilkan kembali menu (looping menu)

;==============================================================================================================

declare_suhu6:				; label declare_suhu6
	write_string newline		; membuat baris baru
	write_string newline		; membuat baris baru
 	write_string InReamur		; menampilkan string InReamur

start_reamur_to_kelvin:			; label reamur_to_kelvin
    	mov ah, 01h			; interrupt untuk membaca karakter dari input dan disimpan di al
    	int 21h				; interrupt

    	cmp al, 13   			; cek apakah user menekan tombol ENTER
    	je reamur_to_kelvin 		; jika iya, lompat ke reamur_to_kelvin

    	mov ah, 0  			; mengosongkan ah
    	sub al, 48   			; kode ASCII untuk karakter '0' adalah 48 sehingga al dikurangkan dengan 48 agar perhitungan dapat diproses sesuai dengan nilai karakter yang diinputkan

    	mov cl, al 			; memindahkan al (nilai inputan baru) ke cl
    	mov al, bl   			; menyimpan nilai inputan yang sebelumnya ke al
    	mov dl, 10			; untuk pengkali
    	mul dl       			; al dikali dengan dl

    	add al, cl   			; nilai sebelum + nilai baru ( setelah nilai sebelum dikali 10 )
   	mov bl, al 			; memindahkan hasil ke bl

    	jmp start_reamur_to_kelvin	; lompat ke start_reamur_to_kelvin

reamur_to_kelvin:
	write_string OutKelvin		; menampilkan string OutKelvin
	mov ax, 5			; ax diisi dengan 5 (rumus reamur ke kelvin)
	mov dx, bx			; pindahkan nilai dari user yang berada di bx ke dx
	mul dx				; 5 dikali dengan dx (hasil akan berada di ax)

	xor dx, dx			; mengosongkan dx
	mov ax, ax			; inisiasi nilai ax
	mov bx, 4			; bx diisi dengan 4 (rumus reamur ke kelvin)
	div bx				; ax dibagi dengan bx
	add ax, 273			; ax dijumlahkan dengan 273 (rumus reamur ke kelvin)
	
	push ax				; push nilai yang telah dikonversi tadi (ax) ke stack
	call print_dec			; memanggil print_dec

	mov bl, 0			; mengosongkan bl
	add sp, 2			; hapus nilai yang ada di stack
	jmp pembatas			; lompat ke pembatas untuk menampilkan kembali menu (looping menu)

;==============================================================================================================

declare_suhu7:                          ; label declare_suhu7
	write_string newline            ; tulis baris baru
	write_string newline            ; tulis baris baru
 	write_string InFarenheit        ; menampilkan string InFarenheit

start_farenheit_to_celcius:	        ; label farenheit_to_celcius
      	mov ah, 01h                     ; interrupt untuk membaca karakter dari input dan disimpan di al
      	int 21h                         ; interrupt

      	cmp al, 13                      ; cek apakah user menekan tombol ENTER
      	je farenheit_to_celcius         ; jika iya, lompat ke farenheit_to_celsius

      	mov ah, 0                       ; mengosongkan ah
      	sub al, 48                      ; kode ASCII untuk karakter '0' adalah 48 sehingga al dikurangkan dengan 48 agar perhitungan dapat diproses sesuai dengan nilai karakter yang diinputkan

      	mov cl, al 			; memindahkan al (nilai inputan baru) ke cl
      	mov al, bl   			; menyimpan nilai inputan yang sebelumnya ke al
      	mov dl, 10			; untuk pengkali
      	mul dl       			; al dikali dengan dl

      	add al, cl   			; nilai sebelum + nilai baru ( setelah nilai sebelum dikali 10 )
      	mov bl, al 			; memindahkan hasil ke bl

      	jmp start_farenheit_to_celcius  ; lompat ke start_farenheit_to_celcius

farenheit_to_celcius:
	write_string OutCelcius         ; menampilkan string outCelcius
        sub bx, 32                      ; mengurangi ax dengan bx yang berisi 32
	mov ax, 5                       ; ax diisi dengan 5
	mov dx, bx			; pindahkan nilai dari user yang berada di bx ke dx
	mul dx				; 5 dikali dengan dx (hasil akan berada di ax)

	xor dx, dx			; mengosongkan dx
	mov ax, ax			; inisiasi nilai ax
	mov bx, 9                       ; bx diisi dengan 9
	div bx                          ; ax dibagi dengan bx

	push ax				; push nilai yang telah dikonversi tadi (ax) ke stack
	call print_dec			; memanggil print_dec

	mov bl, 0			; mengosongkan bl
	add sp, 2			; hapus nilai yang ada di stack
	jmp pembatas			; lompat ke pembatas untuk menampilkan kembali menu (looping menu)


;==============================================================================================================

declare_suhu8:                          ; label declare_suhu8
	write_string newline            ; membuat baris baru
	write_string newline            ; membuat baris baru
 	write_string InFarenheit        ; menampilkan string InFarenheit

start_farenheit_to_reamur:	
      	mov ah, 01h			; interrupt untuk membaca karakter dari input dan disimpan di al
      	int 21h				; interrupt

      	cmp al, 13   			; cek apakah user menekan tombol ENTER
      	je farenheit_to_reamur          ; jika iya, lompat ke farenheit_to_reamur

      	mov ah, 0                       ; mengosongkan ah
      	sub al, 48                      ; kode ASCII untuk karakter '0' adalah 48 sehingga al dikurangkan dengan 48 agar perhitungan dapat diproses sesuai dengan nilai karakter yang diinputkan

      	mov cl, al 			; memindahkan al (nilai inputan baru) ke cl
      	mov al, bl   			; menyimpan nilai inputan yang sebelumnya ke al
      	mov dl, 10			; untuk pengkali
      	mul dl       			; al dikali dengan dl

      	add al, cl   			; nilai sebelum + nilai baru ( setelah nilai sebelum dikali 10 )
      	mov bl, al 			; memindahkan hasil ke bl
      
      	jmp start_farenheit_to_reamur   ; lompat ke start_farenheit_to_reamur

farenheit_to_reamur:
	write_string OutReamur          ; menampilkan string OutReamur
        sub bx, 32                      ; mengurangi ax dengan bx yang berisi 32
	mov ax, 4                       ; ax diisi dengan 4
	mov dx, bx			; pindahkan nilai dari user yang berada di bx ke dx
	mul dx				; 4 dikali dengan dx (hasil akan berada di ax)

	xor dx, dx			; mengosongkan dx
	mov ax, ax			; inisiasi nilai ax
	mov bx, 9                       ; bx diisi dengan 9
	div bx                          ; ax dibagi dengan bx

	push ax				; push nilai yang telah dikonversi tadi (ax) ke stack
	call print_dec			; memanggil print_dec

	mov bl, 0			; mengosongkan bl
	add sp, 2			; hapus nilai yang ada di stack
	jmp pembatas			; lompat ke pembatas untuk menampilkan kembali menu (looping menu)

;==============================================================================================================

print_dec:				; label print_dec
    	push bp				; save bp lama
    	mov bp, sp			; bp menunjuk ke top of the stack
    	mov eax, [bp + 4]		; alokasi lokal variabel
    	mov ebx, 10			; untuk pembagi (dividend)
    	mov ecx, 0x0			; untuk menghitung jumlah digit

div_by_ten:				; label div_by_ten (bagi 10 untuk setiap digitnya dan ambil sisanya)
    	xor edx, edx			; mengosongkan dx
    	div ebx				; bagi 10, sisa akan ada di edx
    	push edx			; push sisa ke stack
    	inc ecx				; increment jumlah digit
    	cmp eax, 0x0			; bandingkan nilai ax dengan 0, jika angka sudah habis berarti ax = 0
    	jne div_by_ten			; jika masih ada angka jump lagi ke atas (div_by_ten)

print:					; label print
    	pop edx				; pop dari stack ke dx
    	add dl, '0'			; mengubah nilai stack menjadi nilai ascii agar karakter yang ditampilkan sesuai dengan nilai dalam stack
    	mov ah, 0x2			; interrupt untuk menampilkan satu karakter
    	int 0x21			; interrupt
    	dec ecx				; decrement jumlah digit
    	jnz print			; jika masih ada digit loop lagi ke atas (print)
    	leave				; hapus local variables dan ambil ebp lama dari stack
    	ret				; return dari fungsi

end:					; label end
	write_string newline		; membuat baris baru
	write_string keluar		; menampilkan string keluar
	mov ah, 4CH			; interrupt untuk exit
	mov al, 0h			; return 0
	int 21h				; interrupt

section .data									; section untuk menyimpan data
masuk1: db 0xD, 0xA, " ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ", 0xD, 0xA, '$'		; label masuk1 berisi string
masuk2: db " Program Konversi Suhu ", 0xD, 0xA, '$'				; label masuk2 berisi string
menu1: db " 1. Celcius to Reamur", 0xD, 0xA, '$'				; label menu1 berisi string
menu2: db " 2. Celcius to Kelvin", 0xD, 0xA, '$'				; label menu2 berisi string		
menu3: db " 3. Celcius to Farenheit", 0xD, 0xA, '$'				; label menu3 berisi string		
menu4: db " 4. Reamur to Celcius", 0xD, 0xA, '$'				; label menu4 berisi string
menu5: db " 5. Reamur to Farenheit", 0xD, 0xA, '$'				; label menu5 berisi string
menu6: db " 6. Reamur to Kelvin", 0xD, 0xA, '$'					; label menu6 berisi string
menu7: db " 7. Farenheit to Celsius", 0xD, 0xA, '$'				; label menu7 berisi string
menu8: db " 8. Farenheit to Reamur", 0xD, 0xA, '$'				; label menu8 berisi string
menuexit: db " 0. Keluar Program", 0xD, 0xA, '$'				; label menuexit berisi string
pilih: db " Pilih menu : $"							; label pilih berisi string
		
InCelcius: db " Masukkan suhu dalam Celcius : $"				; label InCelcius berisi string		
InReamur: db " Masukkan suhu dalam Reamur : $"					; label InReamur berisi string
InFarenheit: db " Masukkan suhu dalam Farenheit : $"				; label InFarenheit berisi string
		
OutCelcius: db " Suhu dalam Celcius: $"						; label OutCelcius berisi string
OutKelvin: db " Suhu dalam Kelvin : $"						; label OutKelvin berisi string
OutReamur: db " Suhu dalam Reamur : $"						; label OutReamur berisi string		
OutFarenheit: db " Suhu dalam Farenheit: $"					; label OutFarenheit berisi string	

keluar: db 0xD, 0xA, " ~ Terima kasih telah menggunakan program ini ~ "		; label keluar berisi string

newline: db 0xD, 0xA, '$'							; label newline berisi string
error: db " Input salah, masukkan kembali pilihan!", 0xD, 0xA, '$'		; label error berisi string