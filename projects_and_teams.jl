#!/usr/bin/env julia
###############################################################################

type Student
	name::AbstractString
	surname::AbstractString
	index::AbstractString
	email::AbstractString
	points::Int
end

type Team
	members::Vector{Student}
end

typealias URL AbstractString
type Spec
	text::AbstractString
	resources::Vector{URL}
end

type Solution
	repo::URL
	# Short youtube presentation.
	youtube::URL
	# download.bit HW+SW
	# Could set URL to file in github master blob.
	release_bit::URL
	# Short project documentation.
	# Could set URL to file in github master blob.
	doc::URL
end

type Project
	name::AbstractString
	points::Int
	min_team_members::Int
	team::Team
	spec::Spec
	solution::Solution
	done::Bool
end


###############################################################################

projects = Project[
	Project(
		"RGB LED Matrix Display – Snake",
		45,
		3,
		Team(
			Student[
				Student(
					"Darko",
					"Lukić",
					"RA-117/2013",
					"lukicdarkoo@gmail.com",
					45
				),
				Student(
					"Igor",
					"Stefanović",
					"RA-83/2013",
					"igor.stefanovic94@gmail.com",
					45
				)
			]
		),
		Spec(
			"""
Create custom peripheral for driving 8x8 RGB LED display.
Peripheral should have:
	- memory mapped matrix of LEDs (3 bits per word),
	- FSM which read matrix and serialize controling bits.
4x CD4094 will be used as deserialization IC.
Implement Snake game on new fancy hardware.
			""",
			URL[
				URL("http://www.gotronic.fr/pj-1313.pdf"),
				URL("http://www.midondesign.com/Documents/4094BC.PDF"),
				URL("E2LP.ucf"),
				URL("P191R003_E2LP.PDF")
			]
		),
		Solution(
			"https://github.com/lukicdarkoo/fpga-matrix-snake",
			"https://www.youtube.com/watch?v=AMLDNoyo0_Q",
			"https://github.com/lukicdarkoo/fpga-matrix-snake/blob/master/RGB_LED_Snake.bit",
			"https://github.com/lukicdarkoo/fpga-matrix-snake/blob/master/Dokumentacija.odt"
		),
		true
	),
	Project(
		"IR Controller – integrate to some game",
		45,
		3,
		Team(
			Student[
				Student(
					"Damir",
					"Becirbasic",
					"RA-68/2013",
					"dmrbecirbasic22@gmail.com",
					45
				),
				Student(
					"Milos",
					"Pranjkic",
					"RA-76/2013",
					"pranjkic94@gmail.com",
					45
				),
				Student(
					"Marko",
					"Gostovic",
					"RA-77/2013",
					"markog.1994@gmail.com",
					45
				),
				Student(
					"Milica",
					"Matic",
					"RA-96/2013",
					"maticmilica1912@gmail.com",
					45
				)
			]
		),
		Spec(
			"""
Simple AXI peripheral with sampling RC-5 protocol.
			""",
			URL[
				URL("http://www.sbprojects.com/knowledge/ir/rc5.php"),
				URL("http://github.com/jasaleja/LPRS2_projekat")
			]
		),
		Solution(
			"https://github.com/maticmilica/SpaceInvadersRC5",
			"https://www.youtube.com/watch?v=hJYfN6_-DKI",
			"https://github.com/maticmilica/SpaceInvadersRC5/blob/master/IR_RC_Space_Invaders.bit",
			"https://github.com/maticmilica/SpaceInvadersRC5/blob/master/IR%20Controller%20.docx"
		),
		true
	),
	Project(
		"Sega GPU – Super Mario",
		45,
		3,
		Team(
			Student[
				Student(
					"Eleonora",
					"Nan",
					"RA-180/2013",
					"nan.eleonora@gmail.com",
					45
				),
				Student(
					"Una",
					"Radosavac",
					"RA-28/2013",
					"una.radosavac@gmail.com",
					45
				)
			]
		),
		Spec(
			"""
Fork Battle City project and reimplement graphic pipeline from scratch.
Implement Super Mario game on new platform.
			""",
			URL[
				URL("https://github.com/RELJEF/battle_city_fpga")
			]
		),
		Solution(
			"https://github.com/Una13/super_mario",
			"https://www.youtube.com/watch?v=jrztl2hGDFU",
			"https://github.com/Una13/super_mario/blob/master/SuperMario.docx",
			"https://github.com/Una13/super_mario/blob/master/battle_city_design/Super_Mario.bit"
		),
		true
	),
	Project(
		"7-Segment LED timer",
		40,
		3,
		Team(
			Student[
				Student(
					"Milos",
					"Nikolic",
					"RA-207/2012",
					"milos.nik.93@gmail.com",
					40
				),
				Student(
					"Lidia",
					"Zizic",
					"RA-225/2013",
					"wizizic@icloud.com",
					30
				),
				Student(
					"Petar",
					"Latas",
					"RA-226/2013",
					"petarlatas@gmail.com",
					35
				)
			]
		),
		Spec(
			"""
- In sch_7-segment_display and comb_logic there is explanation how 7-segment LED display works.
- Need to do time multiplexing of 4 7-segment LED displays.
- 8-bit pins goes to displays anodes (7 segments and dot) of all displays (active high).
- 8-bit pins goes to cathodes of every display (active high).
- Need to make AXI peripheral with:
	- memory mapped reg of every digit,
	- reg for dots,
	- counter for cycle digit mux,
	- bcd to 7-segment decoder.
- E2LP pins will be defined when board is made.
			""",
			URL[
				URL("http://www.rt-rk.uns.ac.rs/sites/default/files/sch_7-segment_display-2015-11-06-13-29-32_0.zip"),
				URL("http://www.rt-rk.uns.ac.rs/sites/default/files/comb_logic-2015-11-06-15-34-01.zip"),
				URL("E2LP.ucf"),
				URL("P191R003_E2LP.PDF")
			]
		),
		Solution(
			"https://github.com/milosnikolic93/LPRS2projekat-7SegmentLEDtimer/tree/master/XPS_system",
			"https://www.youtube.com/watch?v=9rlW1k6Tu-k",
			"https://github.com/milosnikolic93/LPRS2projekat-7SegmentLEDtimer/blob/master/XPS_system/7SegmentLEDtimer.bit",
			"https://github.com/milosnikolic93/LPRS2projekat-7SegmentLEDtimer/blob/master/LPRS2projekat-7SegmentLEDtimer.docx"
		),
		true
	),
	Project(
		"16-colors index VGA over FSL bus – upgrade Space Invaders",
		45,
		4,
		Team(
			Student[
				Student(
					"Marko",
					"Majkić",
					"RA-116/2012",
					"majkic@live.com",
					43
				),
				Student(
					"Stanko",
					"Ćućuz",
					"RA-93/2013",
					"stankocucuz2@gmail.com",
					43
				),
				Student(
					"Milan",
					"Novaković",
					"RA-85/2013",
					"milan94bp@gmail.com",
					42
				),
				Student(
					"Uroš",
					"Višekruna",
					"RA-84/2013",
					"urosko123@gmail.com",
					40
				)
				
			]
		),
		Spec(
			"""
Fork Space Invaders project from last year 
and modify hardware to map graphic memory via FSL bus instead AXI Lite.
Use xapp529 PDF and it's projects as examples how FSL should be implemented.
Upgrade Space Invaders game to use new higher bandwidth.
			""",
			URL[
				URL("http://www.xilinx.com/support/documentation/application_notes/xapp529.pdf"),
				URL("http://github.com/jasaleja/LPRS2_projekat")
			]
		),
		Solution(
			"https://github.com/MarkoMajkic/LPRS2_Space_Invaders_FSL",
			"https://youtu.be/11Qz-BgkWys",
			"https://github.com/MarkoMajkic/LPRS2_Space_Invaders_FSL/blob/master/SpaceInvadersFSL.bit",
			"https://github.com/MarkoMajkic/LPRS2_Space_Invaders_FSL/blob/master/SpaceInvadersFSL.pdf"
		),
		false
	),
	Project(
		"320x240 9-bit RGB VGA – Minesweeper",
		45,
		3,
		Team(
			Student[
				Student(
					"Sunčica",
					"Milivojša",
					"RA-27/2013",
					"suncicam@neobee.net",
					-1
				),
				Student(
					"Sandra",
					"Ivanović",
					"RA-46/2013",
					"sivanovic17@gmail.com",
					-1
				),
				Student(
					"Tatjana",
					"Erić",
					"RA-207/2013",
					"tanjchy0304@gmail.com",
					-1
				),
				Student(
					"Dušan",
					"Mitrović",
					"RA-64 /2013",
					"thedushn@email.com",
					-1
				)
			]
		),
		Spec(
			"""
Change graphic memory sturcture and AXI mapping to have 9-bit.
Change read address calculation to support 320x240 resolution.
Remove indexing graphic mode with direct one.
			""",
			URL[
				URL("??"),
				URL("??")
			]
		),
		Solution(
			"https://github.com/suncicam/MinesweeperProjekatLPRS2",
			"??",
			"??",
			"??"
		),
		false
	),
	Project(
		"4-color text mode – Doctor Mario",
		45,
		3,
		Team(
			Student[
 				Student(
					"Boris",
					"Tesic",
					"RA-198/2011",
 					"btesic@gmail.com",
					-1
  				),
  				Student(
 					"Stefan",
 					"Stojanovic",
 					"RA-16/2013",
 					"stefann.stojanovic@gmail.com",
					-1
 				),
 				Student(
 					"Aleksandar",
 					"Tanaskovic",
 					"RA-187/2011",
 					"aleksandar1321@gmail.com",
					-1
  				)
			]
		),
		Spec(
			"??",
			URL[
				URL("https://github.com/LPRS2/E2LP_Text_Mode_Tetris")
			]
		),
		Solution(
			"https://github.com/Nevernik/dr_Mario_E2LP",
			"https://www.youtube.com/watch?v=orRhGIP8fZ0",
			"https://github.com/Nevernik/dr_Mario_E2LP/blob/master/___project_data/dr_mario.bit",
			"https://github.com/Nevernik/dr_Mario_E2LP/blob/master/___project_data/projekat%20Dr%20Mario.docx"
		),
		false
	),
	Project(
		"MIDI Player with buzzer",
		45,
		4,
		Team(
			Student[
				Student(
					"Lazar",
					"Bozic",
					"RA-90/2013",
					"lazarovmejl@yahoo.com",
					-1
				),
				Student(
					"Milan",
					"Ivankovic",
					"RA-89/2013",
					"ivankovic_milan@yahoo.com",
					-1
				),
				Student(
					"Branislav",
					"Vukovic",
					"RA-88/2013",
					"vukovic.94@hotmail.com",
					-1
				),
				Student(
					"Nemanja",
					"Pajic",
					"RA-184/2013",
					"nemanjap555@gmail.com",
					-1
				)
			]
		),
		Spec(
			"""
Port AVR MIDI Buzzer project to uBlaze.
Use AXI Timer for generating PWM or design custom PWM HW peripheral.
			""",
			URL[
				URL("http://avrprog.pbworks.com/w/page/9345379/AvrSound"),
				URL("??")
			]
		),
		Solution(
			"https://github.com/boza94/?",
			"??",
			"??",
			"??"
		),
		false
	),
	Project(
		"MP3 Player with text UI",
		45,
		4,
		Team(
			Student[
				Student(
					"Nikola",
					"Blažić",
					"RA-170/2013",
					"nblazic942@gmail.com",
					-1
				),
				Student(
					"Aleksandar",
					"Cumbo",
					"RA-186/2013",
					"aco.cumbo@hotmail.com",
					-1
				),
				Student(
					"Aleksandar",
					"Lukić",
					"RA-139/2011",
					"lukicsu@gmail.com",
					-1
				),
				Student(
					"Boško",
					"Kragulj",
					"RA-248/2013",
					"kraguljbosko16@gmail.com",
					-1
				)
			]
		),
		Spec(
			"""
Fork E2LP MP3 project and implement textural user interface for it.
Remove from vga_periph_mem support for graphic mode, to free memory needed for MP3, 
and add it to project.
			""",
			URL[
				URL("https://github.com/MilosSubotic/E2LP_MP3_Player.git")
			]
		),
		Solution(
			"https://github.com/223323/mp3player",
			"??",
			"??",
			"??"
		),
		false
	),
	Project(
		"Bilinear Interpolation Co-processor",
		45,
		3,
		Team(
			Student[
				Student(
					"??",
					"??",
					"RA-???/20??",
					"?@?",
					-1
				),
				Student(
					"??",
					"??",
					"RA-???/20??",
					"?@?",
					-1
				)
			]
		),
		Spec(
			"??",
			URL[
				URL("??")
			]
		),
		Solution(
			"https://github.com/?/?",
			"??",
			"??",
			"??"
		),
		false
	),
	Project(
		"Array of simple processors – Shelving Audio Equilizer",
		45,
		3,
		Team(
			Student[
				Student(
					"Aleksandar-Vuk",
					"Pavlović",
					"RA-151/2013",
					"wolf.srb.ns@hotmail.com",
					-1
				),
				Student(
					"Andrej",
					"Popović",
					"RA-113/2013",
					"andypopa94@gmail.com",
					-1
				),
				Student(
					"Nataša",
					"Perković",
					"RA-137/2013",
					"perkovicnatasa94@gmail.com",
					-1
				),
				Student(
					"Marijana",
					"Molnar",
					"RA-136/2013",
					"m.mariyanna@hotmail.com",
					-1
				)
			]
		),
		Spec(
			"""
Implement simple processor:
	- Define instruction set,
	- Generate assempler and VHDL package with Config_CPU,
	- Implement processor core in VHDL.
Create array of simple processors.
Develop firmware for shelving equilizer on array:
	- Every processor should execute one shelving filter,
	- Samples should be propagiated between processors,
	- It is enough good to hardcode filter coefficients.
Wrapp design to AXI peripheral and integrate it to uBlaze system.
Use AsAP as inspiration.
			""",
			URL[
				URL("https://github.com/MilosSubotic/Config_CPU"),
				URL("https://en.wikipedia.org/wiki/Asynchronous_array_of_simple_processors"),
				URL("http://vcl.ece.ucdavis.edu/pubs/2006.08_hotchips/hotchips.baas.2006.07.25.1600.color.pdf"),
				URL("http://vcl.ece.ucdavis.edu/pubs/2008.06.symp.vlsi/vlsi.2008.03.05.0215.pdf")
			]
		),
		Solution(
			"https://github.com/authext/LPRS2-Project",
			"https://www.youtube.com/watch?v=8EY1ofh3xYc",
			"??",
			"??"
		),
		false
	),
	Project(
		"CAN network – game of choice",
		45,
		3,
		Team(
			Student[
				Student(
					"??",
					"??",
					"RA-???/20??",
					"?@?",
					-1
				),
				Student(
					"??",
					"??",
					"RA-???/20??",
					"?@?",
					-1
				)
			]
		),
		Spec(
			"??",
			URL[
				URL("??"),
				URL("??")
			]
		),
		Solution(
			"https://github.com/?/?",
			"??",
			"??",
			"??"
		),
		false
	),
	Project(
		"Tetris – upgrade",
		40,
		2,
		Team(
			Student[
				Student(
					"Milos",
					"Andric",
					"RA-175/2013",
					"andrmoljac@gmail.com",
					-1
				),
				Student(
					"Ivan",
					"Lazarevic",
					"RA-9/2013",
					"ivanlazarevic1994@gmail.com",
					-1
				),
				Student(
					"Djordje",
					"Stojanovic",
					"RA-104/2013",
					"djordje.stojanovic94@gmail.com",
					-1
				)
			]
		),
		Spec(
			"""
Fork Tetris project from last year 
and upgrade software with support for complex 4-square shapes.
			""",
			URL[
				URL("https://github.com/LPRS2/E2LP_Text_Mode_Tetris")
			]
		),
		Solution(
			"https://github.com/Andrmoljac/Tetris_Upgrade",
			"https://www.youtube.com/watch?v=c9YafEVzZxE",
			"https://github.com/Andrmoljac/Tetris_Upgrade/blob/master/lab4_i_5/Resenje/basic_system/Tetris_Upgrade.bit",
			"https://github.com/Andrmoljac/Tetris_Upgrade/blob/master/lab4_i_5/Resenje/basic_system/dokumentacija-lprs2.docx"
		),
		false
	),
	Project(
		"Sega controller – integrate to some game",
		45,
		3,
		Team(
			Student[
				Student(
					"Isidor",
					"Rimski",
					"RA-115/2012",
					"isidor.r3@gmail.com",
					-1
				),
				Student(
					"David",
					"Ujhzi",
					"RA-34/2011",
					"davidujhazi@yahoo.com",
					-1
				)
			]
		),
		Spec(
			"""
- Board with 2x 74HCT157 for muxing between two controllers.
	- 7-bits data, GND and 5V to every controller.
	- Jumper for ENABLE.
	- Pull-down 10k for every data pin going to controllers.
	- 2x 100 Ohm or similar small resistor protection to controllers.
	- Signals: 6-bits data, select, mux.
	- 2x CD4504 level shifter from 5V TTL to 3V3 CMOS.
	- Connect board to snap wire on E2LP
			""",
			URL[
				URL("https://www.cs.cmu.edu/~chuck/infopg/segasix.txt"),
				URL("E2LP.ucf"),
				URL("P191R003_E2LP.PDF")
			]
		),
		Solution(
			"https://github.com/isidorr3/projekatLPRS2",
			"https://www.youtube.com/watch?v=4VwzyuCIvpM",
			"??",
			"??"
		),
		false
	)
]

###############################################################################

function no_of_students(project::Project)
	if project.team.members[1].name == "??"
		return 0
	else
		return length(project.team.members)
	end
end
N_students = sum(map(no_of_students, projects))
@show N_students

###############################################################################

