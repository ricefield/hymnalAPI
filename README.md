hymnalAPI
=========

a simple API for hymnal.net

all hymn data is returned as JSON (see examples below)

i am not so good at writing API documentation. sorry.

features:
---------

[completed]

[in progress]
- classic hymns (need to parse witness-lee-hymns.org)

[planned]
- new songs
- hymnal.net search results
- category
- key
- composer
- author
- meter
- verse 

suggestions are welcome!

examples:
---------

calling "/hymn/1343" returns:


	title: "A new commandment",
	details: {
		Category:: [
			"Scriptures for Singing",
			"http://www.hymnal.net/search.php/all/subcategory/Scriptures for Singing"
		],
		Key:: [
			"D Major",
			"http://www.hymnal.net/search.php/all/key/D Major"
		],
		Time:: [
			"4/4",
			"http://www.hymnal.net/search.php/all/time/4/4"
		],
		Meter:: [
			"Peculiar Meter.",
			"http://www.hymnal.net/search.php/all/meter/Peculiar Meter."
		],
		Hymn Code:: [
			"5332114432",
			"http://www.hymnal.net/search.php/all/hymncode/5332114432"
		],
		Scriptures: : [
			"John 13:34-35",
			"http://online.recoveryversion.org/bibleverses.asp?fvid=3520&lvid=3521"
		]
	},
	lyrics: {
		stanza 1: [
			"A new commandment",
			"I give unto you",
			"That you love one another",
			"  As I have loved you,",
			"That you love one another",
			"  As I have loved you.",
			"    By this shall all men",
			"    Know you are My disciples",
			"    If you have love one to another."
		]
	}
