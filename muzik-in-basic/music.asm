<<<<<<< HEAD
	!to"build/music.prg",cbm

	music		= $1000		;Müzik dosyasinin yuklenecegi adres
	music_play	= music+3	;Müzik player adresi

	* = $0801
	!by $0d,$08,$0a,$00,$9e,$20,$34,$39,$31,$35,$32
    	

    	* = $c000	 
	 
	lda #$03	 
	sta $d020

	lda #$00  	;Muzik datasıyla karışmaması için 
	sta $2b 	;Basic başlangıç adresini değiştirelim
	lda #$14
	sta $2c
	lda #$03 	;Start of Variables (SOV), Start Of Arrays (SOA)
	sta $2d 	;ve End of Arrays (EOA) adresleri de değişecek.
	sta $2f
	sta $31
	lda #$14
	sta $2e
	sta $30
	sta $32 

	lda #$00	;müziği başlatalım
	jsr music	

	;Muzik rutinini her framede çağırılması lazım.
	;Bunun için bir raster irq kuruyoruz

        sei

	lda #$7f
        sta $dc0d

        lda $d01a
        ora #$01
        sta $d01a

	lda #$00
	sta $dc0e
	
       	lda #$1b
       	sta $d011

	lda #$10
	sta $d012
		
	lda #<irq
	sta $0314
	lda #>irq
	sta $0315
 
        cli
	
	rts
		
	;Muziği çalan irq rutini
irq	inc $d019
        jsr music_play	;müziði çaldýrýyoruz
	jmp $ea81


	;Veriler

	* = music
	!bin "Little Secret.sid",,$7c+2
=======
	!to"build/music.prg",cbm

	music		= $1000		;Müzik dosyasinin yuklenecegi adres
	music_play	= music+3	;Müzik player adresi

	* = $0801
	!by $0d,$08,$0a,$00,$9e,$20,$34,$39,$31,$35,$32
    	

    	* = $c000	 
	 
	lda #$03	 
	sta $d020

	lda #$00  	;Muzik datasıyla karışmaması için 
	sta $2b 	;Basic başlangıç adresini değiştirelim
	lda #$14
	sta $2c
	lda #$03 	;Start of Variables (SOV), Start Of Arrays (SOA)
	sta $2d 	;ve End of Arrays (EOA) adresleri de değişecek.
	sta $2f
	sta $31
	lda #$14
	sta $2e
	sta $30
	sta $32 

	lda #$00	;müziği başlatalım
	jsr music	

	;Muzik rutinini her framede çağırılması lazım.
	;Bunun için bir raster irq kuruyoruz

        sei

	lda #$7f
        sta $dc0d

        lda $d01a
        ora #$01
        sta $d01a

	lda #$00
	sta $dc0e
	
       	lda #$1b
       	sta $d011

	lda #$10
	sta $d012
		
	lda #<irq
	sta $0314
	lda #>irq
	sta $0315
 
        cli
	
	rts
		
	;Muziği çalan irq rutini
irq	inc $d019
        jsr music_play	;müziði çaldýrýyoruz
	jmp $ea81


	;Veriler

	* = music
	!bin "Little Secret.sid",,$7c+2

>>>>>>> e5a5b2b9293c53ccbd2dec690f90e3887f551d49