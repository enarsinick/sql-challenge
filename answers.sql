USE world;
SHOW TABLES;
DESCRIBE country;

SELECT * FROM city;
SELECT * FROM country;

# 1. Using COUNT, get the number of cities in the USA.
SELECT COUNT(name) FROM city WHERE countryCode='USA';

# A: 274

# -----------------------------------------------------------------

# 2. Find out the population and life expectancy for people in Argentina.
SELECT population, lifeExpectancy FROM country WHERE name="argentina";

# A: Population: 37032000 | lifeExpectancy: 75.1

# -----------------------------------------------------------------

# 3. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT name, lifeExpectancy FROM country WHERE lifeExpectancy IS NOT NULL ORDER BY lifeExpectancy DESC LIMIT 10;

# A: Andorra	83.5

# -----------------------------------------------------------------

# 4. Using JOIN ... ON, find the capital city of Spain.
SELECT c1.name, c2.name FROM city c1 JOIN country c2 ON c1.countryCode=c2.code WHERE c2.name='spain' LIMIT 1;

# A: Madrid

# -----------------------------------------------------------------

# 5. Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT c.name, l.language FROM countryLanguage l JOIN country c ON l.countrycode=c.code WHERE c.region='Southeast Asia'; 

/* 
	Brunei	Chinese
	Brunei	English
	Brunei	Malay
	Brunei	Malay-English
	Indonesia	Bali
	Indonesia	Banja
	Indonesia	Batakki
	Indonesia	Bugi
	Indonesia	Javanese
	Indonesia	Madura
	Indonesia	Malay
	Indonesia	Minangkabau
	Indonesia	Sunda
	Cambodia	Chinese
	Cambodia	Khmer
	Cambodia	TÂšam
	Cambodia	Vietnamese
	Laos	Lao
	Laos	Lao-Soung
	Laos	Mon-khmer
	Laos	Thai
	Myanmar	Burmese
	Myanmar	Chin
	Myanmar	Kachin
	Myanmar	Karen
	Myanmar	Kayah
	Myanmar	Mon
	Myanmar	Rakhine
	Myanmar	Shan
	Malaysia	Chinese
	Malaysia	Dusun
	Malaysia	English
	Malaysia	Iban
	Malaysia	Malay
	Malaysia	Tamil
	Philippines	Bicol
	Philippines	Cebuano
	Philippines	Hiligaynon
	Philippines	Ilocano
	Philippines	Maguindanao
	Philippines	Maranao
	Philippines	Pampango
	Philippines	Pangasinan
	Philippines	Pilipino
	Philippines	Waray-waray
	Singapore	Chinese
	Singapore	Malay
	Singapore	Tamil
	Thailand	Chinese
	Thailand	Khmer
	Thailand	Kuy
	Thailand	Lao
	Thailand	Malay
	Thailand	Thai
	East Timor	Portuguese
	East Timor	Sunda
	Vietnam	Chinese
	Vietnam	Khmer
	Vietnam	Man
	Vietnam	Miao
	Vietnam	Muong
	Vietnam	Nung
	Vietnam	Thai
	Vietnam	Tho
	Vietnam	Vietnamese
*/

# -----------------------------------------------------------------

# 6. Using a single query, list 25 cities around the world that start with the letter F.
SELECT name FROM city WHERE name LIKE 'F%' LIMIT 25;

/*
	Fagatogo
	Florencio Varela
	Formosa
	Francistown
	Fortaleza
	Feira de Santana
	Franca
	FlorianÃ³polis
	Foz do IguaÃ§u
	Ferraz de Vasconcelos
	Francisco Morato
	Franco da Rocha
	Fuenlabrada
	Faridabad
	Firozabad
	Farrukhabad-cum-Fatehgarh
	Faizabad
	Fatehpur
	Firenze
	Foggia
	Ferrara
	ForlÃ¬
	Fukuoka
	Funabashi
	Fukuyama
*/

# -----------------------------------------------------------------

# 7. Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(c1.name) FROM city c1 JOIN country c2 ON c1.countryCode=c2.code WHERE c2.name='china';

# A: 363

# -----------------------------------------------------------------

# 8. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT name, population FROM country 
WHERE population IS NOT NULL AND NOT POPULATION=0 ORDER BY population ASC LIMIT 10;

/*
Pitcairn	50
Cocos (Keeling) Islands	600
Holy See (Vatican City State)	1000
Falkland Islands	2000
Tokelau	2000
Niue	2000
Norfolk Island	2000
Christmas Island	2500
Svalbard and Jan Mayen	3200
Saint Helena	6000
*/

# -----------------------------------------------------------------

# 9. Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(code) FROM country;

# A: 239

# -----------------------------------------------------------------

# 10. What are the top ten largest countries by area?
SELECT name, surfaceArea FROM country ORDER BY surfaceArea DESC LIMIT 10;

/* 
	Russian Federation	17075400.00
	Antarctica	13120000.00
	Canada	9970610.00
	China	9572900.00
	United States	9363520.00
	Brazil	8547403.00
	Australia	7741220.00
	India	3287263.00
	Argentina	2780400.00
	Kazakstan	2724900.00
*/

# -----------------------------------------------------------------

# 11. List the five largest cities by population in Japan.
SELECT c1.name, c1.population 
FROM city c1 JOIN country c2 
ON c1.countryCode=c2.code 
WHERE c2.name='Japan' 
ORDER BY population DESC LIMIT 5;

/* 
	Tokyo	7980230
	Jokohama [Yokohama]	3339594
	Osaka	2595674
	Nagoya	2154376
	Sapporo	1790886
*/

# -----------------------------------------------------------------

# 12. List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
SELECT name, code, headOfState FROM country WHERE headOfState='Elisabeth II';

/* 
	Anguilla	AIA	Elisabeth II
	Antigua and Barbuda	ATG	Elisabeth II
	Australia	AUS	Elisabeth II
	Bahamas	BHS	Elisabeth II
	Belize	BLZ	Elisabeth II
	Bermuda	BMU	Elisabeth II
	Barbados	BRB	Elisabeth II
	Canada	CAN	Elisabeth II
	Cocos (Keeling) Islands	CCK	Elisabeth II
	Cook Islands	COK	Elisabeth II
	Christmas Island	CXR	Elisabeth II
	Cayman Islands	CYM	Elisabeth II
	Falkland Islands	FLK	Elisabeth II
	United Kingdom	GBR	Elisabeth II
	Gibraltar	GIB	Elisabeth II
	Grenada	GRD	Elisabeth II
	Heard Island and McDonald Islands	HMD	Elisabeth II
	British Indian Ocean Territory	IOT	Elisabeth II
	Jamaica	JAM	Elisabeth II
	Saint Kitts and Nevis	KNA	Elisabeth II
	Saint Lucia	LCA	Elisabeth II
	Montserrat	MSR	Elisabeth II
	Norfolk Island	NFK	Elisabeth II
	Niue	NIU	Elisabeth II
	New Zealand	NZL	Elisabeth II
	Pitcairn	PCN	Elisabeth II
	Papua New Guinea	PNG	Elisabeth II
	South Georgia and the South Sandwich Islands	SGS	Elisabeth II
	Saint Helena	SHN	Elisabeth II
	Solomon Islands	SLB	Elisabeth II
	Turks and Caicos Islands	TCA	Elisabeth II
	Tokelau	TKL	Elisabeth II
	Tuvalu	TUV	Elisabeth II
	Saint Vincent and the Grenadines	VCT	Elisabeth II
	Virgin Islands, British	VGB	Elisabeth II
*/

# -----------------------------------------------------------------

# 13. List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT name, population, surfaceArea FROM country WHERE population / surfaceArea != 0 ORDER BY surfaceArea ASC LIMIT 10;

/*
	Holy See (Vatican City State)	1000	0.40
	Monaco	34000	1.50
	Gibraltar	25000	6.00
	Tokelau	2000	12.00
	Cocos (Keeling) Islands	600	14.00
	Macao	473000	18.00
	Nauru	12000	21.00
	Tuvalu	12000	26.00
	Norfolk Island	2000	36.00
	Pitcairn	50	49.00
*/

# -----------------------------------------------------------------

# 14. List every unique world language.
SELECT DISTINCT language FROM countryLanguage;

# -----------------------------------------------------------------

# 15. List the names and GNP of the world's top 10 richest countries.
SELECT name, GNP FROM country ORDER BY GNP DESC LIMIT 10;

/*
	United States	8510700.00
	Japan	3787042.00
	Germany	2133367.00
	France	1424285.00
	United Kingdom	1378330.00
	Italy	1161755.00
	China	982268.00
	Brazil	776739.00
	Canada	598862.00
	Spain	553233.00
*/






