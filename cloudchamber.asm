lorom

arch 65816

org $808000

fillbyte $00 : fill $8000

!TRANSFER #= 8*8*8*32*28

org $808000

RESET:
	SEI
	CLC
	XCE
	JML ++

++	ROL.w $420D

	STZ.w $4200

	REP #$20

	LDA.w #$2100
	TCD
	TAY

	LDX.b #$80
	PHX
	PLB

	STX.b $2100
	STX.b $2115
	STZ.b $2181
	STY.b $2183

	STY.b $210B
	STY.b $2123

	STY.b $210D : STY.b $210D
	STY.b $210E : STY.b $210E

	STY.b $2130
	STY.b $2131
	STY.b $2133

	STY.b $212D
	STY.b $212E
	STY.b $212F
	INY : STY.b $212C
	LDY.b #$78 : STY.b $2107

	REP #$30
	LDA.w #$7800 : STA.b $2116
	LDY.w #$03C0

	LDA.w #$0000
--	STA.b $2118
	INC
	DEY
	BPL --

	SEP #$10

	LDY.b #$03 : STY.b $2105

	STZ.b $2116

	LDA.w #$4300 : TCD

	LDA.w #BLACK : STA.b $4302 : STA.b $4312
	STX.b $4304 : STX.b $4314
	LDA.w #$1809 : STA.b $4300
	LDA.w #$8008 : STA.b $4310

	LDA.w #$8000 : STA.b $4305
	STZ.b $4315

	STY.w $420B

	STY.w $2183
	STZ.w $2181

	DEY : STY.w $420B

	DEY : STY.w $2121
	LDA.w #$2208 : STA.b $4300
	LDA.w #510 : STA.b $4305
	INC.b $4302
	STY.w $420B

	STZ.b $4302
	LDA.w #$7E00
	STA.b $4303

	LDA.w #$1801 : STA.b $4300

--	LDX.w $4212 : BPL --

	STZ.w $2116

	LDA.b $4303
	BIT.w #$0080
	BNE ++

	EOR.w #$0100
	STA.b $4303

++	LDA.w #$8000
	STA.b $4305

	STY.w $420B

	LDX.b #$0F : STX.w $2100

	BRA --

BLACK:
	db $00

WHITE:
	db $FF

org $00FFC0 : db "COSMIC RAY DETECTOR  "

org $00FFD6
db $30
db $00
db $07
db $00
db $01
db $01

dw $FFFF
dw $FFFF

org $00FFFC : dw RESET