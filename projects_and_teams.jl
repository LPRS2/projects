#!/usr/bin/env julia
###############################################################################

type Student
	name::AbstractString
	surname::AbstractString
	index::AbstractString
	email::AbstractString
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
					"lukicdarkoo@gmail.com"
				),
				Student(
					"Igor",
					"Stefanović",
					"RA-83/2013",
					"igor.stefanovic94@gmail.com"
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
			"??",
			"??",
			"??"
		)
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
					"dmrbecirbasic22@gmail.com"
				),
				Student(
					"Milos",
					"Pranjkic",
					"RA-76/2013",
					"pranjkic94@gmail.com"
				),
				Student(
					"Marko",
					"Gostovic",
					"RA-77/2013",
					"markog.1994@gmail.com"
				),
				Student(
					"Milica",
					"Matic",
					"RA-96/2013",
					"maticmilica1912@gmail.com"
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
		)
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
					"nan.eleonora@gmail.com"
				),
				Student(
					"Una",
					"Radosavac",
					"RA-28/2013",
					"una.radosavac@gmail.com"
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
			"https://github.com/Una13/super_mario/blob/master/SuperMario.docx",
			"??",
			"??"
		)
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
					"milos.nik.93@gmail.com"
				),
				Student(
					"Lidia",
					"Zizic",
					"RA-225/2013",
					"wizizic@icloud.com"
				),
				Student(
					"Petar",
					"Latas",
					"RA-226/2013",
					"petarlatas@gmail.com"
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
			"https://github.com/milosnikolic93/lprs2-projekat",
			"??",
			"??",
			"??"
		)
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
					"majkic@live.com"
				),
				Student(
					"Stanko",
					"Ćućuz",
					"RA-93/2013",
					"stankocucuz2@gmail.com"
				),
				Student(
					"Milan",
					"Novaković",
					"RA-85/2013",
					"milan94bp@gmail.com"
				),
				Student(
					"Uroš",
					"Višekruna",
					"RA-84/2013",
					"urosko123@gmail.com"
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
			"https://github.com/MarkoMajkic/LPRS2_Project.git",
			"??",
			"??",
			"??"
		)
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
					"suncicam@neobee.net"
				),
				Student(
					"Sandra",
					"Ivanović",
					"RA-46/2013",
					"sivanovic17@gmail.com"
				),
				Student(
					"Tatjana",
					"Erić",
					"RA-207/2013",
					"tanjchy0304@gmail.com"
				),
				Student(
					"Dušan",
					"Mitrović",
					"RA-64 /2013",
					"thedushn@email.com"
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
		)
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
 					"btesic@gmail.com"
  				),
  				Student(
 					"Stefan",
 					"Stojanovic",
 					"RA-16/2013",
 					"stefann.stojanovic@gmail.com"
 				),
 				Student(
 					"Aleksandar",
 					"Tanaskovic",
 					"RA-187/2011",
 					"aleksandar1321@gmail.com"
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
		)
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
					"lazarovmejl@yahoo.com"
				),
				Student(
					"Milan",
					"Ivankovic",
					"RA-89/2013",
					"ivankovic_milan@yahoo.com"
				),
				Student(
					"Branislav",
					"Vukovic",
					"RA-88/2013",
					"vukovic.94@hotmail.com"
				),
				Student(
					"Nemanja",
					"Pajic",
					"RA-184/2013",
					"nemanjap555@gmail.com"
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
		)
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
					"nblazic942@gmail.com"
				),
				Student(
					"Aleksandar",
					"Cumbo",
					"RA-186/2013",
					"aco.cumbo@hotmail.com"
				),
				Student(
					"Aleksandar",
					"Lukić",
					"RA-139/2011",
					"lukicsu@gmail.com"
				),
				Student(
					"Boško",
					"Kragulj",
					"RA-248/2013",
					"kraguljbosko16@gmail.com"
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
		)
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
					"?@?"
				),
				Student(
					"??",
					"??",
					"RA-???/20??",
					"?@?"
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
		)
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
					"wolf.srb.ns@hotmail.com"
				),
				Student(
					"Andrej",
					"Popović",
					"RA-113/2013",
					"andypopa94@gmail.com"
				),
				Student(
					"Nataša",
					"Perković",
					"RA-137/2013",
					"perkovicnatasa94@gmail.com"
				),
				Student(
					"Marijana",
					"Molnar",
					"RA-136/2013",
					"m.mariyanna@hotmail.com"
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
		)
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
					"?@?"
				),
				Student(
					"??",
					"??",
					"RA-???/20??",
					"?@?"
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
		)
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
					"andrmoljac@gmail.com"
				),
				Student(
					"Ivan",
					"Lazarevic",
					"RA-9/2013",
					"ivanlazarevic1994@gmail.com"
				),
				Student(
					"Djordje",
					"Stojanovic",
					"RA-104/2013",
					"djordje.stojanovic94@gmail.com"
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
		)
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
					"isidor.r3@gmail.com"
				),
				Student(
					"David",
					"Ujhzi",
					"RA-34/2011",
					"davidujhazi@yahoo.com"
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
			"??",
			"??",
			"??"
		)
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

