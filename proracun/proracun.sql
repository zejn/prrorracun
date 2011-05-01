--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: difference(text, text); Type: FUNCTION; Schema: public; Owner: hruske
--

CREATE FUNCTION difference(text, text) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/fuzzystrmatch', 'difference';


ALTER FUNCTION public.difference(text, text) OWNER TO hruske;

--
-- Name: dmetaphone(text); Type: FUNCTION; Schema: public; Owner: hruske
--

CREATE FUNCTION dmetaphone(text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/fuzzystrmatch', 'dmetaphone';


ALTER FUNCTION public.dmetaphone(text) OWNER TO hruske;

--
-- Name: dmetaphone_alt(text); Type: FUNCTION; Schema: public; Owner: hruske
--

CREATE FUNCTION dmetaphone_alt(text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/fuzzystrmatch', 'dmetaphone_alt';


ALTER FUNCTION public.dmetaphone_alt(text) OWNER TO hruske;

--
-- Name: levenshtein(text, text); Type: FUNCTION; Schema: public; Owner: hruske
--

CREATE FUNCTION levenshtein(text, text) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/fuzzystrmatch', 'levenshtein';


ALTER FUNCTION public.levenshtein(text, text) OWNER TO hruske;

--
-- Name: levenshtein(text, text, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: hruske
--

CREATE FUNCTION levenshtein(text, text, integer, integer, integer) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/fuzzystrmatch', 'levenshtein_with_costs';


ALTER FUNCTION public.levenshtein(text, text, integer, integer, integer) OWNER TO hruske;

--
-- Name: metaphone(text, integer); Type: FUNCTION; Schema: public; Owner: hruske
--

CREATE FUNCTION metaphone(text, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/fuzzystrmatch', 'metaphone';


ALTER FUNCTION public.metaphone(text, integer) OWNER TO hruske;

--
-- Name: soundex(text); Type: FUNCTION; Schema: public; Owner: hruske
--

CREATE FUNCTION soundex(text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/fuzzystrmatch', 'soundex';


ALTER FUNCTION public.soundex(text) OWNER TO hruske;

--
-- Name: text_soundex(text); Type: FUNCTION; Schema: public; Owner: hruske
--

CREATE FUNCTION text_soundex(text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/fuzzystrmatch', 'soundex';


ALTER FUNCTION public.text_soundex(text) OWNER TO hruske;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: hruske; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO hruske;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: hruske
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO hruske;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hruske
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hruske
--

SELECT pg_catalog.setval('django_content_type_id_seq', 4, true);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: hruske; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO hruske;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: hruske
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO hruske;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hruske
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hruske
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: proracun_postavka; Type: TABLE; Schema: public; Owner: hruske; Tablespace: 
--

CREATE TABLE proracun_postavka (
    id integer NOT NULL,
    proracun_id integer NOT NULL,
    sifra integer NOT NULL,
    naziv character varying(1000) NOT NULL,
    znesek numeric(20,2) NOT NULL
);


ALTER TABLE public.proracun_postavka OWNER TO hruske;

--
-- Name: proracun_postavka_id_seq; Type: SEQUENCE; Schema: public; Owner: hruske
--

CREATE SEQUENCE proracun_postavka_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.proracun_postavka_id_seq OWNER TO hruske;

--
-- Name: proracun_postavka_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hruske
--

ALTER SEQUENCE proracun_postavka_id_seq OWNED BY proracun_postavka.id;


--
-- Name: proracun_postavka_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hruske
--

SELECT pg_catalog.setval('proracun_postavka_id_seq', 3227, true);


--
-- Name: proracun_proracun; Type: TABLE; Schema: public; Owner: hruske; Tablespace: 
--

CREATE TABLE proracun_proracun (
    id integer NOT NULL,
    proracunsko_leto character varying(4) NOT NULL,
    datum_sprejetja date NOT NULL,
    tip_proracuna character varying(4) NOT NULL,
    del_proracuna integer NOT NULL,
    epa character varying(10) NOT NULL,
    pdf character varying(100) NOT NULL,
    csv character varying(100) NOT NULL
);


ALTER TABLE public.proracun_proracun OWNER TO hruske;

--
-- Name: proracun_proracun_id_seq; Type: SEQUENCE; Schema: public; Owner: hruske
--

CREATE SEQUENCE proracun_proracun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.proracun_proracun_id_seq OWNER TO hruske;

--
-- Name: proracun_proracun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hruske
--

ALTER SEQUENCE proracun_proracun_id_seq OWNED BY proracun_proracun.id;


--
-- Name: proracun_proracun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hruske
--

SELECT pg_catalog.setval('proracun_proracun_id_seq', 16, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: hruske
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: hruske
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: hruske
--

ALTER TABLE proracun_postavka ALTER COLUMN id SET DEFAULT nextval('proracun_postavka_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: hruske
--

ALTER TABLE proracun_proracun ALTER COLUMN id SET DEFAULT nextval('proracun_proracun_id_seq'::regclass);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: hruske
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	content type	contenttypes	contenttype
2	site	sites	site
3	proracun	proracun	proracun
4	postavka	proracun	postavka
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: hruske
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: proracun_postavka; Type: TABLE DATA; Schema: public; Owner: hruske
--

COPY proracun_postavka (id, proracun_id, sifra, naziv, znesek) FROM stdin;
1	1	70	Davčni prihodki	7170751417.00
2	1	700	Davki na dohodek in dobiček	1621905615.00
3	1	7000	Dohodnina	1038671309.00
4	1	7001	Davek od dohodkov pravnih oseb	583234306.00
5	1	701	Prispevki za socialno varnost	61865036.00
6	1	7010	Prispevki zaposlenih	33927134.00
7	1	7011	Prispevki delodajalcev	22528351.00
8	1	7012	Prispevki samozaposlenih	4626248.00
9	1	7013	Ostali prispevki za socialno varnost	783303.00
10	1	702	Davki na plačilno listo in delovno silo	29444099.00
11	1	7021	Posebni davek na določene prejemke	29444099.00
12	1	704	Domači davki na blago in storitve	5255901367.00
13	1	7040	Davek na dodano vrednost	3267777422.00
14	1	7041	Drugi davki na blago in storitve	94555309.00
15	1	7042	Trošarine (akcize)	1561061090.00
16	1	7044	Davki na posebne storitve	132571232.00
17	1	7046	Letna dajatev za uporabo vozil v cestnem prometu	113004326.00
18	1	7047	Drugi davki na uporabo blaga in storitev	40498512.00
19	1	7048	Davki od prometa motornih vozil	46433476.00
20	1	705	Davki na mednarodno trgovino in transakcije	91476227.00
21	1	7050	Carine	91476227.00
22	1	706	Drugi davki	110159072.00
23	1	7060	Drugi davki	110159072.00
24	1	71	Nedavčni prihodki	437728476.00
25	1	710	Udeležba na dobičku in dohodki od premoženja	162445910.00
26	1	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	71000300.00
27	1	7102	Prihodki od obresti	20856318.00
28	1	7103	Prihodki od premoženja	70589292.00
29	1	711	Takse in pristojbine	84311873.00
30	1	7110	Sodne takse	51583716.00
31	1	7111	Upravne takse in pristojbine	32728157.00
32	1	712	Globe in druge denarne kazni	82060526.00
33	1	7120	Globe in druge denarne kazni	82060526.00
34	1	713	Prihodki od prodaje blaga in storitev	10085012.00
35	1	7130	Prihodki od prodaje blaga in storitev	10085012.00
36	1	714	Drugi nedavčni prihodki	98825155.00
37	1	7141	Drugi nedavčni prihodki	98825155.00
38	1	72	KAPITALSKI PRIHODKI	25914022.00
39	1	720	Prihodki od prodaje osnovnih sredstev	24470202.00
40	1	7200	Prihodki od prodaje zgradb in prostorov	22996033.00
41	1	7201	Prihodki od prodaje prevoznih sredstev	1204125.00
42	1	7202	Prihodki od prodaje opreme	235639.00
43	1	7203	Prihodki od prodaje drugih osnovnih sredstev	34405.00
44	1	722	Prihodki od prodaje zemljišč in neopredmetenih sredstev	1443820.00
45	1	7220	Prihodki od prodaje kmetijskih zemljišč in gozdov	12389.00
46	1	7221	Prihodki od prodaje stavbnih zemljišč	1431431.00
47	1	73	PREJETE DONACIJE	9505284.00
48	1	730	Prejete donacije iz domačih virov	182825.00
49	1	7300	Prejete donacije in darila od domačih pravnih oseb	182825.00
50	1	731	Prejete donacije iz tujine	9322458.00
51	1	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	1156354.00
52	1	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	8159611.00
53	1	7312	Prejete donacije in darila od tujih pravnih oseb	6494.00
54	1	74	TRANSFERNI PRIHODKI	863899.00
55	1	740	Transferni prihodki in drugih javnofinančnih institucij	863899.00
56	1	7400	Prejeta sredstva iz državnega proračuna	844086.00
57	1	7402	Prejeta sredstva iz skladov socialnega zavarovanja	19813.00
58	1	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	1050430725.00
59	1	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske in ribiške politike	255096763.00
60	1	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	9151600.00
61	1	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	117406000.00
62	1	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	118994435.00
63	1	7813	Ostala prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	2562093.00
64	1	7814	Prejeta sredstva iz proračuna EU za izvajanje skupne ribiške politike	6982635.00
65	1	782	Prejeta sredstva iz proračuna EU iz strukturnih skladov	462594111.00
66	1	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	268642478.00
67	1	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	193951633.00
68	1	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	307275220.00
69	1	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	307275220.00
70	1	784	Prejeta sredstva iz proračuna EU za izvajanje centraliziranih in drugih programov EU	17993641.00
71	1	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranjih politik EU 2004-2006	3350000.00
72	1	7842	Prejeta sredstva iz proračuna EU iz naslova Konkurenčnost za rast in zaposlovanje	6935204.00
73	1	7843	Prejeta sredstva iz proračuna EU iz naslova Državljanstvo, svoboda, varnost, pravica	7708437.00
74	1	786	Ostala prejeta sredstva iz proračuna Evropske unije	7470990.00
75	1	7860	Ostala prejeta sredstva iz proračuna EU	7470990.00
77	1	400	Plače in drugi izdatki zaposlenim	1028762348.00
78	1	4000	Plače in dodatki	890115025.00
79	1	4001	Regres za letni dopust	27561707.00
80	1	4002	Povračila in nadomestila	86381491.00
81	1	4003	Sredstva za delovno uspešnost	6178075.00
82	1	4004	Sredstva za nadurno delo	9106650.00
83	1	4005	Plače za delo nerezidentov po pogodbi	6402.00
84	1	4009	Drugi izdatki zaposlenim	9412998.00
85	1	401	Prispevki delodajalcev za socialno varnost	176438504.00
86	1	4010	Prispevek za pokojninsko in invalidsko zavarovanje	101921556.00
87	1	4011	Prispevek za zdravstveno zavarovanje	57849054.00
88	1	4012	Prispevek za zaposlovanje	559658.00
89	1	4013	Prispevek za starševsko varstvo	898361.00
90	1	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	15209875.00
91	1	402	Izdatki za blago in storitve	863451424.00
92	1	4020	Pisarniški in splošni material in storitve	123144142.00
93	1	4021	Posebni material in storitve	178478839.00
94	1	4022	Energija, voda, komunalne storitve in komunikacije	72716259.00
95	1	4023	Prevozni stroški in storitve	49576014.00
96	1	4024	Izdatki za službena potovanja	20553337.00
97	1	4025	Tekoče vzdrževanje	216651384.00
98	1	4026	Poslovne najemnine in zakupnine	64397203.00
99	1	4027	Kazni in odškodnine	8265613.00
100	1	4029	Drugi operativni odhodki	129668633.00
109	1	409	Rezerve	141618710.00
110	1	4090	Splošna proračunska rezervacija	107232729.00
111	1	4091	Proračunska rezerva	28985981.00
112	1	4093	Sredstva za posebne namene	5400000.00
113	1	41	Tekoči transferi	5388766314.00
114	1	410	Subvencije	476801495.00
115	1	4100	Subvencije javnim podjetjem	63294485.00
116	1	4101	Subvencije finančnim institucijam	0.00
117	1	4102	Subvencije privatnim podjetjem in zasebnikom	413507010.00
118	1	411	Transferi posameznikom in gospodinjstvom	1421792027.00
119	1	4110	Transferi nezaposlenim	187213666.00
120	1	4111	Družinski prejemki in starševska nadomestila	599228209.00
121	1	4112	Transferi za zagotavljanje socialne varnosti	270692924.00
122	1	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	76880000.00
123	1	4117	Štipendije	145752299.00
124	1	4119	Drugi transferi posameznikom	142024929.00
125	1	412	Transferi nepridobitnim organizacijam in ustanovam	125400367.00
126	1	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	125400367.00
127	1	413	Drugi tekoči domači transferi	3335974063.00
128	1	4130	Tekoči transferi občinam	29250441.00
129	1	4131	Tekoči transferi v sklade socialnega zavarovanja	1353980671.00
130	1	4132	Tekoči transferi v javne sklade	8436559.00
131	1	4133	Tekoči transferi v javne zavode	1839416437.00
132	1	4134	Tekoči transferi v državni proračun	741628.00
133	1	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	69171775.00
134	1	4136	Tekoči transferi v javne agencije	34976551.00
135	1	414	Tekoči transferi v tujino	28798362.00
136	1	4140	Tekoči transferi mednarodnim institucijam	18008155.00
137	1	4141	Tekoči transferi tujim vladam in vladnim institucijam	15727.00
138	1	4142	Tekoči transferi neprofitnim organizacijam v tujini	1674108.00
139	1	4143	Drugi tekoči transferi v tujino	9100372.00
140	1	42	INVESTICIJSKI ODHODKI	673826478.00
141	1	420	Nakup in gradnja osnovnih sredstev	673826478.00
142	1	4200	Nakup zgradb in prostorov	8686252.00
143	1	4201	Nakup prevoznih sredstev	7616285.00
144	1	4202	Nakup opreme	68944570.00
145	1	4203	Nakup drugih osnovnih sredstev	344149.00
146	1	4204	Novogradnje, rekonstrukcije in adaptacije	361772858.00
147	1	4205	Investicijsko vzdrževanje in obnove	88452646.00
148	1	4206	Nakup zemljišč in naravnih bogastev	13492229.00
149	1	4207	Nakup nematerialnega premoženja	38481040.00
150	1	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	86036449.00
151	1	43	INVESTICIJSKI TRANSFERI	782713065.00
152	1	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	203287691.00
153	1	4310	Investicijski transferi nepridobitnim organizacijam in ustanovam	32639464.00
154	1	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	11125351.00
155	1	4313	Investicijski transferi privatnim podjetjem	115740423.00
156	1	4314	Investicijski transferi posameznikom in zasebnikom	31067603.00
157	1	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	12704323.00
158	1	4316	Investicijski transferi v tujino	10526.00
159	1	432	Investicijski transferi proračunskim uporabnikom	579425374.00
160	1	4320	Investicijski transferi občinam	396534828.00
161	1	4321	Investicijski transferi javnim skladom in agencijam	6315070.00
162	1	4323	Investicijski transferi javnim zavodom	176575475.00
163	1	45	Plačila sredstev v proračun Evropske unije	466191700.00
164	1	450	Plačila sredstev v proračun Evropske unije	466191700.00
165	1	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	82962655.00
166	1	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	56233362.00
334	2	4133	Tekoči transferi v javne zavode	1836578194.00
167	1	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	309439229.00
168	1	4503	Plačila sredstev v proračun EU iz naslova poravka v korist Združenega Kraljestva	15075677.00
169	1	4504	Plačila sredstev v proračun EU iz naslova popravkov BND vira v korist Kraljevin Nizozemske in Švedske	2480777.00
170	1	75	Prejeta vračila danih posojil in prodaja kapitalskih deležev	18776890.00
171	1	750	Prejeta vračila danih posojil	13384000.00
172	1	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	30000.00
173	1	7501	Prejeta vračila danih posojil – od javnih skladov	8354000.00
174	1	7504	Prejeta vračila danih posojil od privatnih podjetij	5000000.00
175	1	751	Prodaja kapitalskih deležev	3000000.00
176	1	7514	Prejeta vračila namenskega premoženja	3000000.00
177	1	752	Kupnine iz naslova privatizacije	2392890.00
178	1	7520	Sredstva kupnin iz naslova privatizacije	2392890.00
179	1	44	Dana posojila in povečanje kapitalskih deležev	202421880.00
180	1	440	Dana posojila	174388536.00
181	1	4401	Dana posojila javnim skladom	26500000.00
182	1	4402	Dana posojila javnim podjetjem in družbam, ki so v lasti države ali občin	72890.00
183	1	4404	Dana posojila privatnim podjetjem	50500000.00
184	1	4406	Dana posojila v tujino	85300000.00
185	1	4409	Plačila zapadlih poroštev	12015646.00
186	1	441	Povečanje kapitalskih deležev in finančnih naložb	3713344.00
187	1	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	2000000.00
188	1	4414	Povečanje kapitalskih deležev v tujino	1713344.00
189	1	442	Poraba sredstev kupnin iz naslova privatizacije	2120000.00
190	1	4420	Dana posojila iz sredstev kupnin	1000000.00
191	1	4421	Sredstva kupnin, razporejena v javne sklade in agencije	1120000.00
192	1	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	22200000.00
193	1	4430	Povečanje namenskega premoženja v javnih skladih	22200000.00
194	1	50	ZADOLŽEVANJE	967756843.00
196	1	550	Odplačila domačega dolga	1214812429.00
197	1	5501	Odplačila kreditov poslovnim bankam	16684193.00
198	1	5503	Odplačila kreditov drugim domačim kreditodajalcem	0.00
199	1	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	1198128236.00
200	1	551	Odplačila dolga v tujino	9650947.00
201	1	5510	Odplačila dolga mednarodnim finančnim institucijam	9650947.00
202	1	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	0.00
203	1	5514	Odplačila glavnice vrednostnih papirjev, izdanih na tujih trgih	0.00
204	2	70	Davčni prihodki	6765582323.00
205	2	700	Davki na dohodek in dobiček	1506924310.00
206	2	7000	Dohodnina	982130867.00
207	2	7001	Davek od dohodkov pravnih oseb	524793443.00
208	2	701	Prispevki za socialno varnost	59542864.00
209	2	7010	Prispevki zaposlenih	32653642.00
210	2	7011	Prispevki delodajalcev	21682725.00
211	2	7012	Prispevki samozaposlenih	4452596.00
212	2	7013	Ostali prispevki za socialno varnost	753901.00
213	2	702	Davki na plačilno listo in delovno silo	28338883.00
214	2	7021	Posebni davek na določene prejemke	28338883.00
215	2	704	Domači davki na blago in storitve	5061902925.00
216	2	7040	Davek na dodano vrednost	3138694949.00
217	2	7041	Drugi davki na blago in storitve	82735136.00
218	2	7042	Trošarine (akcize)	1516013589.00
219	2	7044	Davki na posebne storitve	129717448.00
220	2	7046	Letna dajatev za uporabo vozil v cestnem prometu	110571748.00
221	2	7047	Drugi davki na uporabo blaga in storitev	39626724.00
222	2	7048	Davki od prometa motornih vozil	44543332.00
223	2	705	Davki na mednarodno trgovino in transakcije	90548557.00
224	2	7050	Carine	90548557.00
225	2	706	Drugi davki	18324784.00
226	2	7060	Drugi davki	18324784.00
227	2	71	Nedavčni prihodki	469229362.00
228	2	710	Udeležba na dobičku in dohodki od premoženja	163164836.00
229	2	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	71000300.00
230	2	7102	Prihodki od obresti	23094779.00
231	2	7103	Prihodki od premoženja	69069757.00
232	2	711	Takse in pristojbine	82496940.00
233	2	7110	Sodne takse	50473303.00
234	2	7111	Upravne takse in pristojbine	32023637.00
235	2	712	Globe in druge denarne kazni	80294057.00
236	2	7120	Globe in druge denarne kazni	80294057.00
237	2	713	Prihodki od prodaje blaga in storitev	9867917.00
238	2	7130	Prihodki od prodaje blaga in storitev	9867917.00
239	2	714	Drugi nedavčni prihodki	133405612.00
240	2	7141	Drugi nedavčni prihodki	133405612.00
241	2	72	KAPITALSKI PRIHODKI	24715019.00
242	2	720	Prihodki od prodaje osnovnih sredstev	23338002.00
243	2	7200	Prihodki od prodaje zgradb in prostorov	21932041.00
244	2	7201	Prihodki od prodaje prevoznih sredstev	1148411.00
245	2	7202	Prihodki od prodaje opreme	224736.00
246	2	7203	Prihodki od prodaje drugih osnovnih sredstev	32813.00
247	2	722	Prihodki od prodaje zemljišč in neopredmetenih sredstev	1377017.00
248	2	7220	Prihodki od prodaje kmetijskih zemljišč in gozdov	11816.00
249	2	7221	Prihodki od prodaje stavbnih zemljišč	1365201.00
250	2	73	PREJETE DONACIJE	9300669.00
251	2	730	Prejete donacije iz domačih virov	178890.00
252	2	7300	Prejete donacije in darila od domačih pravnih oseb	178890.00
253	2	731	Prejete donacije iz tujine	9121779.00
254	2	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	1131461.00
255	2	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	7983963.00
256	2	7312	Prejete donacije in darila od tujih pravnih oseb	6354.00
257	2	74	TRANSFERNI PRIHODKI	845303.00
258	2	740	Transferni prihodki in drugih javnofinančnih institucij	845303.00
259	2	7400	Prejeta sredstva iz državnega proračuna	825916.00
260	2	7402	Prejeta sredstva iz skladov socialnega zavarovanja	19387.00
261	2	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	1058969640.00
262	2	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	263459251.00
263	2	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	8182600.00
264	2	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	103389000.00
265	2	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	142364983.00
266	2	7813	Ostala prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	2540033.00
267	2	7814	Prejeta sredstva iz proračuna EU za izvajanje skupne ribiške politike	6982635.00
268	2	782	Prejeta sredstva iz proračuna EU za strukturno politiko	594163381.00
269	2	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	398736902.00
270	2	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	195426479.00
271	2	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	178423993.00
272	2	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	178423993.00
273	2	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	15797696.00
274	2	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	537500.00
275	2	7842	Prejeta sredstva iz proračuna EU iz naslova Konkurenčnost za rast in zaposlovanje	6721062.00
276	2	7843	Prejeta sredstva iz proračuna EU iz naslova Državljanstvo, svoboda, varnost in pravica	8539134.00
277	2	786	Ostala prejeta sredstva iz proračuna Evropske unije	7125319.00
278	2	7860	Ostala prejeta sredstva iz proračuna EU	7125319.00
280	2	400	Plače in drugi izdatki zaposlenim	1032538702.00
281	2	4000	Plače in dodatki	893441105.00
282	2	4001	Regres za letni dopust	27608386.00
283	2	4002	Povračila in nadomestila	86403116.00
284	2	4003	Sredstva za delovno uspešnost	6453156.00
285	2	4004	Sredstva za nadurno delo	9077197.00
286	2	4005	Plače za delo nerezidentov po pogodbi	7297.00
287	2	4009	Drugi izdatki zaposlenim	9548445.00
288	2	401	Prispevki delodajalcev za socialno varnost	176651964.00
289	2	4010	Prispevek za pokojninsko in invalidsko zavarovanje	102119802.00
290	2	4011	Prispevek za zdravstveno zavarovanje	57877154.00
291	2	4012	Prispevek za zaposlovanje	531014.00
292	2	4013	Prispevek za starševsko varstvo	872330.00
293	2	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	15251664.00
294	2	402	Izdatki za blago in storitve	830900429.00
295	2	4020	Pisarniški in splošni material in storitve	119840119.00
296	2	4021	Posebni material in storitve	170298279.00
297	2	4022	Energija, voda, komunalne storitve in komunikacije	68707042.00
298	2	4023	Prevozni stroški in storitve	49070623.00
299	2	4024	Izdatki za službena potovanja	21157623.00
300	2	4025	Tekoče vzdrževanje	211957352.00
301	2	4026	Poslovne najemnine in zakupnine	62173678.00
302	2	4027	Kazni in odškodnine	6077787.00
303	2	4029	Drugi operativni odhodki	121617924.00
312	2	409	Rezerve	94727912.00
313	2	4090	Splošna proračunska rezervacija	56446723.00
314	2	4091	Proračunska rezerva	28881189.00
315	2	4093	Sredstva za posebne namene	9400000.00
316	2	41	Tekoči transferi	5495639840.00
317	2	410	Subvencije	518450780.00
318	2	4100	Subvencije javnim podjetjem	66910164.00
319	2	4101	Subvencije finančnim institucijam	0.00
320	2	4102	Subvencije privatnim podjetjem in zasebnikom	451540616.00
321	2	411	Transferi posameznikom in gospodinjstvom	1414176091.00
322	2	4110	Transferi nezaposlenim	192853723.00
323	2	4111	Družinski prejemki in starševska nadomestila	624847631.00
324	2	4112	Transferi za zagotavljanje socialne varnosti	252112675.00
325	2	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	77107816.00
326	2	4117	Štipendije	125010723.00
327	2	4119	Drugi transferi posameznikom	142243523.00
328	2	412	Transferi nepridobitnim organizacijam in ustanovam	129376119.00
329	2	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	129376119.00
330	2	413	Drugi tekoči domači transferi	3405677683.00
331	2	4130	Tekoči transferi občinam	27617745.00
332	2	4131	Tekoči transferi v sklade socialnega zavarovanja	1420254297.00
333	2	4132	Tekoči transferi v javne sklade	8715686.00
335	2	4134	Tekoči transferi v državni proračun	759652.00
336	2	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabni	78084257.00
337	2	4136	Tekoči transferi v javne agencije	33667852.00
338	2	414	Tekoči transferi v tujino	27959167.00
339	2	4140	Tekoči transferi mednarodnim institucijam	17156875.00
340	2	4141	Tekoči transferi tujim vladam in vladnim institucijam	15727.00
341	2	4142	Tekoči transferi neprofitnim organizacijam v tujini	1669912.00
342	2	4143	Drugi tekoči transferi v tujino	9116654.00
343	2	42	INVESTICIJSKI ODHODKI	580192056.00
344	2	420	Nakup in gradnja osnovnih sredstev	580192056.00
345	2	4200	Nakup zgradb in prostorov	10204689.00
346	2	4201	Nakup prevoznih sredstev	7068480.00
347	2	4202	Nakup opreme	60070161.00
348	2	4203	Nakup drugih osnovnih sredstev	189093.00
349	2	4204	Novogradnje, rekonstrukcije in adaptacije	276124857.00
350	2	4205	Investicijsko vzdrževanje in obnove	84311791.00
351	2	4206	Nakup zemljišč in naravnih bogastev	18758753.00
352	2	4207	Nakup nematerialnega premoženja	40336218.00
353	2	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inž;eniring	83128013.00
354	2	43	INVESTICIJSKI TRANSFERI	847324922.00
355	2	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	299616147.00
356	2	4310	Investicijski transferi nepridobitnim organizacijam in ustanovam	25736268.00
357	2	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	36306383.00
358	2	4313	Investicijski transferi privatnim podjetjem	178175606.00
359	2	4314	Investicijski transferi posameznikom in zasebnikom	46048840.00
360	2	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	13338510.00
361	2	4316	Investicijski transferi v tujino	10539.00
362	2	432	Investicijski transferi proračunskim uporabnikom	547708776.00
363	2	4320	Investicijski transferi občinam	378957553.00
364	2	4321	Investicijski transferi javnim skladom in agencijam	6798637.00
365	2	4323	Investicijski transferi javnim zavodom	161952586.00
366	2	45	Plačila sredstev v proračun Evropske unije	439800509.00
367	2	450	Plačila sredstev v proračun Evropske unije	439800509.00
368	2	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	78800000.00
369	2	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	53411850.00
370	2	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	290913101.00
371	2	4503	Plačila sredstev v proračun EU iz naslova poravka v korist Združenega Kraljestva	14319254.00
372	2	4504	Plačila sredstev v proračun EU iz naslova popravkov BND vira v korist Kraljevin Nizozemske in Švedske	2356304.00
373	2	75	Prejeta vračila danih posojil	25855720.00
374	2	750	Prejeta vračila danih posojil	17803755.00
375	2	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	30000.00
376	2	7501	Prejeta vračila danih posojil – od javnih skladov	11273755.00
377	2	7504	Prejeta vračila danih posojil od privatnih podjetij	6500000.00
378	2	751	Prodaja kapitalskih deležev	1500000.00
379	2	7514	Prejeta vračila namenskega premoženja	1500000.00
380	2	752	Kupnine iz naslova privatizacije	6551965.00
381	2	7520	Sredstva kupnin iz naslova privatizacije	6551965.00
382	2	44	Dana posojila in povečanje kapitalskih deležev	507084671.00
383	2	440	Dana posojila	229921375.00
384	2	4401	Dana posojila javnim skladom	16500000.00
385	2	4402	Dana posojila javnim podjetjem in družbam, ki so v lasti države ali občin	72890.00
386	2	4404	Dana posojila privatnim podjetjem	54390594.00
387	2	4406	Dana posojila v tujino	140600000.00
388	2	4409	Plačila zapadlih poroštev	18357891.00
389	2	441	Povečanje kapitalskih deležev in finančnih naložb	251074815.00
390	2	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	250000000.00
391	2	4414	Povečanje kapitalskih deležev v tujino	1074815.00
392	2	442	Poraba sredstev kupnin iz naslova privatizacije	3888481.00
393	2	4420	Dana posojila iz sredstev kupnin	500000.00
394	2	4421	Sredstva kupnin, razporejena v javne sklade in agencije	3388481.00
395	2	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	22200000.00
396	2	4430	Povečanje namenskega premoženja v javnih skladih	22200000.00
397	2	50	ZADOLŽEVANJE	3160110498.00
399	2	550	Odplačila domačega dolga	527396017.00
400	2	5501	Odplačila kreditov poslovnim bankam	47284193.00
401	2	5503	Odplačila kreditov drugim domačim kreditodajalcem	0.00
402	2	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	480111824.00
403	2	551	Odplačila dolga v tujino	463083931.00
404	2	5510	Odplačila dolga mednarodnim finančnim institucijam	13083931.00
405	2	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	0.00
406	2	5514	Odplačila glavnice vrednostnih papirjev, izdanih na tujih trgih	450000000.00
407	3	70	Davčni prihodki	7339048622.00
408	3	700	Davki na dohodek in dobiček	1885992528.00
409	3	7000	Dohodnina	1111611237.00
410	3	7001	Davek od dohodkov pravnih oseb	774381292.00
411	3	701	Prispevki za socialno varnost	57624554.00
412	3	7010	Prispevki zaposlenih	32258860.00
413	3	7011	Prispevki delodajalcev	21630585.00
414	3	7012	Prispevki samozaposlenih	2728676.00
415	3	7013	Ostali prispevki za socialno varnost	1006433.00
416	3	702	Davki na plačilno listo in delovno silo	29673761.00
417	3	7021	Posebni davek na določene prejemke	29673761.00
418	3	704	Domači davki na blago in storitve	5251961614.00
419	3	7040	Davek na dodano vrednost	3166256147.00
420	3	7041	Davek od dohodkov pravnih oseb	192000000.00
421	3	7042	Trošarine (akcize)	1535941731.00
422	3	7044	Davki na posebne storitve	139575593.00
423	3	7046	Letna dajatev za uporabo vozil v cestnem prometu	113438576.00
424	3	7047	Drugi davki na uporabo blaga in storitev	42249951.00
425	3	7048	Davki od prometa motornih vozil	62499617.00
426	3	705	Davki na mednarodno trgovino in transakcije	111230195.00
427	3	7050	Carine	109702155.00
428	3	7051	Druge uvozne dajatve	1528039.00
429	3	706	Drugi davki	2565970.00
430	3	7060	Drugi davki	2565970.00
431	3	71	Nedavčni prihodki	428775507.00
432	3	710	Udeležba na dobičku in dohodki od premoženja	132156488.00
433	3	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	47000300.00
434	3	7102	Prihodki od obresti	13000000.00
435	3	7103	Prihodki od premoženja	72156188.00
436	3	711	Takse in pristojbine	80606453.00
437	3	7110	Sodne takse	45181698.00
438	3	7111	Upravne takse in pristojbine	35424755.00
439	3	712	Globe in druge denarne kazni	77761034.00
440	3	7120	Globe in druge denarne kazni	77761034.00
441	3	713	Prihodki od prodaje blaga in storitev	10553796.00
442	3	7130	Prihodki od prodaje blaga in storitev	10553796.00
443	3	714	Drugi nedavčni prihodki	127697735.00
444	3	7141	Drugi nedavčni prihodki	127697735.00
445	3	72	KAPITALSKI PRIHODKI	18150000.00
446	3	720	Prihodki od prodaje osnovnih sredstev	16765237.00
447	3	7200	Prihodki od prodaje zgradb in prostorov	15351366.00
448	3	7201	Prihodki od prodaje prevoznih sredstev	1154872.00
449	3	7202	Prihodki od prodaje opreme	226000.00
450	3	7203	Prihodki od prodaje drugih osnovnih sredstev	32998.00
451	3	722	Prihodki od prodaje zemljišč in neopredmetenih sredstev	1384763.00
452	3	7220	Prihodki od prodaje kmetijskih zemljišč in gozdov	11882.00
453	3	7221	Prihodki od prodaje stavbnih zemljišč	1372881.00
454	3	73	PREJETE DONACIJE	6246864.00
455	3	730	Prejete donacije iz domačih virov	178106.00
456	3	7300	Prejete donacije in darila od domačih pravnih oseb	178106.00
457	3	731	Prejete donacije iz tujine	6068757.00
458	3	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	2376619.00
459	3	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	3645565.00
460	3	7312	Prejete donacije in darila od tujih pravnih oseb	46573.00
461	3	74	TRANSFERNI PRIHODKI	845265.00
462	3	740	Transferni prihodki in drugih javnofinančnih institucij	845265.00
463	3	7400	Prejeta sredstva iz državnega proračuna	825916.00
464	3	7402	Prejeta sredstva iz skladov socialnega zavarovanja	19349.00
465	3	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	1029000170.00
466	3	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	258991558.00
467	3	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	8182600.00
468	3	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	103389000.00
469	3	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	147419958.00
470	3	782	Prejeta sredstva iz proračuna EU za strukturno politiko	567434752.00
471	3	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	422284795.00
472	3	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	145149957.00
473	3	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	168401700.00
474	3	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	168401700.00
475	3	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	27046841.00
476	3	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	27046841.00
477	3	786	Ostala prejeta sredstva iz proračuna Evropske unije	7125319.00
478	3	7860	Ostala prejeta sredstva iz proračuna EU	7125319.00
480	3	400	Plače in drugi izdatki zaposlenim	1096440695.00
481	3	4000	Plače in dodatki	932002815.00
482	3	4001	Regres za letni dopust	30073440.00
483	3	4002	Povračila in nadomestila	101776710.00
484	3	4003	Sredstva za delovno uspešnost	10899126.00
485	3	4004	Sredstva za nadurno delo	12203545.00
486	3	4005	Plače za delo nerezidentov po pogodbi	8234.00
487	3	4009	Drugi izdatki zaposlenim	9476824.00
488	3	401	Prispevki delodajalcev za socialno varnost	199157960.00
489	3	4010	Prispevek za pokojninsko in invalidsko zavarovanje	115607408.00
490	3	4011	Prispevek za zdravstveno zavarovanje	65587427.00
491	3	4012	Prispevek za zaposlovanje	570380.00
492	3	4013	Prispevek za starševsko varstvo	937825.00
493	3	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	16454921.00
494	3	402	Izdatki za blago in storitve	864258573.00
495	3	4020	Pisarniški in splošni material in storitve	127599418.00
496	3	4021	Posebni material in storitve	207816090.00
497	3	4022	Energija, voda, komunalne storitve in komunikacije	67018505.00
498	3	4023	Prevozni stroški in storitve	48335847.00
499	3	4024	Izdatki za službena potovanja	21470857.00
500	3	4025	Tekoče vzdrževanje	200666887.00
501	3	4026	Poslovne najemnine in zakupnine	63188295.00
502	3	4027	Kazni in odškodnine	7180256.00
503	3	4029	Drugi operativni odhodki	120982418.00
512	3	409	Rezerve	93027295.00
513	3	4090	Splošna proračunska rezervacija	49829778.00
514	3	4091	Proračunska rezerva	22860761.00
515	3	4093	Sredstva za posebne namene	20336756.00
516	3	41	Tekoči transferi	5544076598.00
517	3	410	Subvencije	533808464.00
518	3	4100	Subvencije javnim podjetjem	68865087.00
519	3	4101	Subvencije finančnim institucijam	4282263.00
520	3	4102	Subvencije privatnim podjetjem in zasebnikom	460661114.00
521	3	411	Transferi posameznikom in gospodinjstvom	1331424840.00
522	3	4110	Transferi nezaposlenim	182530470.00
523	3	4111	Družinski prejemki in starševska nadomestila	650408703.00
524	3	4112	Transferi za zagotavljanje socialne varnosti	174820547.00
525	3	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	76590828.00
526	3	4117	Štipendije	126438164.00
527	3	4119	Drugi transferi posameznikom	120636128.00
528	3	412	Transferi neprofitnim organizacijam in ustanovam	108090456.00
529	3	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	108090456.00
530	3	413	Drugi tekoči domači transferi	3545284112.00
531	3	4130	Tekoči transferi občinam	15739774.00
532	3	4131	Tekoči transferi v sklade socialnega zavarovanja	1479067818.00
533	3	4132	Tekoči transferi v javne sklade	8324365.00
534	3	4133	Tekoči transferi v javne zavode	1935551717.00
535	3	4134	Tekoči transferi v državni proračun	704089.00
536	3	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	74707135.00
537	3	4136	Tekoči transferi v javne agencije	31189215.00
538	3	414	Tekoči transferi v tujino	25468725.00
539	3	4140	Tekoči transferi mednarodnim institucijam	15309113.00
540	3	4141	Tekoči transferi tujim vladam in vladnim institucijam	3737.00
541	3	4142	Tekoči transferi neprofitnim organizacijam v tujini	1495215.00
542	3	4143	Drugi tekoči transferi v tujino	8660660.00
543	3	42	INVESTICIJSKI ODHODKI	765837804.00
544	3	420	Nakup in gradnja osnovnih sredstev	765837804.00
545	3	4200	Nakup zgradb in prostorov	10632450.00
546	3	4201	Nakup prevoznih sredstev	8630627.00
547	3	4202	Nakup opreme	74292275.00
548	3	4203	Nakup drugih osnovnih sredstev	445227.00
549	3	4204	Novogradnje, rekonstrukcije in adaptacije	342420040.00
550	3	4205	Investicijsko vzdrževanje in obnove	189038595.00
551	3	4206	Nakup zemljišč in naravnih bogastev	20157560.00
552	3	4207	Nakup nematerialnega premoženja	33023454.00
553	3	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	87197576.00
554	3	43	INVESTICIJSKI TRANSFERI	786126468.00
555	3	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	299377903.00
556	3	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	14955258.00
557	3	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	39606861.00
558	3	4313	Investicijski transferi privatnim podjetjem	195089662.00
559	3	4314	Investicijski transferi posameznikom in zasebnikom	47160120.00
560	3	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	2533502.00
561	3	4316	Investicijski transferi v tujino	32500.00
562	3	432	Investicijski transferi proračunskim uporabnikom	486748564.00
563	3	4320	Investicijski transferi občinam	340026012.00
564	3	4321	Investicijski transferi javnim skladom in agencijam	5047011.00
565	3	4322	Investicijski transferi v državni proračun	0.00
566	3	4323	Investicijski transferi javnim zavodom	141675541.00
567	3	45	Plačila sredstev v proračun Evropske unije	463376320.00
568	3	450	Plačila sredstev v proračun Evropske unije	463376320.00
569	3	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	82500000.00
570	3	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	58898400.00
571	3	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	298418560.00
572	3	4503	Plačila sredstev v proračun EU iz naslova poravka v korist Združenega Kraljestva	19632800.00
573	3	4504	Plačila sredstev v proračun EU iz naslova popravkov BND vira v korist Kraljevin Nizozemske in Švedske	3926560.00
574	3	75	Prejeta vračila danih posojil	12430000.00
575	3	750	Prejeta vračila danih posojil	11730000.00
576	3	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	30000.00
577	3	7501	Prejeta vračila danih posojil – od javnih skladov	8200000.00
578	3	7504	Prejeta vračila danih posojil od privatnih podjetij	3500000.00
579	3	752	Kupnine iz naslova privatizacije	700000.00
580	3	7520	Sredstva kupnin iz naslova privatizacije	700000.00
581	3	44	Dana posojila in povečanje kapitalskih deležev	113501887.00
582	3	440	Dana posojila	56241402.00
583	3	4404	Dana posojila privatnim podjetjem	38300000.00
584	3	4409	Plačila zapadlih poroštev	17941402.00
752	4	4202	Nakup opreme	47398756.00
585	3	441	Povečanje kapitalskih deležev in finančnih naložb	43210000.00
586	3	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	40000000.00
587	3	4414	Povečanje kapitalskih deležev v tujino	3210000.00
588	3	442	Poraba sredstev kupnin iz naslova privatizacije	6965357.00
589	3	4420	Dana posojila iz sredstev kupnin	3500000.00
590	3	4421	Sredstva kupnin, razporejena v javne sklade in agencije	965357.00
591	3	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	2500000.00
592	3	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	7085128.00
593	3	4430	Povečanje namenskega premoženja v javnih skladih	7085128.00
594	3	50	ZADOLŽEVANJE	2592728991.00
596	3	550	Odplačila domačega dolga	474322262.00
597	3	5501	Odplačila kreditov poslovnim bankam	47284193.00
598	3	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	427038069.00
599	3	551	Odplačila dolga v tujino	462967119.00
600	3	5510	Odplačila dolga mednarodnim finančnim institucijam	12967119.00
601	3	5514	Odplačila glavnice vrednostnih papirjev, izdanih na tujih trgih	450000000.00
602	4	70	Davčni prihodki	6487068492.00
603	4	700	Davki na dohodek in dobiček	1423027287.00
604	4	7000	Dohodnina	979886355.00
605	4	7001	Davek od dohodkov pravnih oseb	443140932.00
606	4	701	Prispevki za socialno varnost	57258650.00
607	4	7010	Prispevki zaposlenih	31400966.00
608	4	7011	Prispevki delodajalcev	20850921.00
609	4	7012	Prispevki samozaposlenih	4281784.00
610	4	7013	Ostali prispevki za socialno varnost	724979.00
611	4	702	Davki na plačilno listo in delovno silo	27240770.00
612	4	7021	Posebni davek na določene prejemke	27240770.00
613	4	704	Domači davki na blago in storitve	4887108243.00
614	4	7040	Davek na dodano vrednost	3058369555.00
615	4	7041	Drugi davki na blago in storitve	30061460.00
616	4	7042	Trošarine (akcize)	1464387731.00
617	4	7044	Davki na posebne storitve	125273602.00
618	4	7046	Letna dajatev za uporabo vozil v cestnem prometu	106821195.00
619	4	7047	Drugi davki na uporabo blaga in storitev	41219464.00
620	4	7048	Davki od prometa motornih vozil	60975236.00
621	4	705	Davki na mednarodno trgovino in transakcije	89505372.00
622	4	7050	Carine	89505372.00
623	4	706	Drugi davki	2928169.00
624	4	7060	Drugi davki	2928169.00
625	4	71	Nedavčni prihodki	549795298.00
626	4	710	Udeležba na dobičku in dohodki od premoženja	203164204.00
627	4	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	94819479.00
628	4	7102	Prihodki od obresti	41090823.00
629	4	7103	Prihodki od premoženja	67253902.00
630	4	711	Takse in pristojbine	83756897.00
631	4	7110	Sodne takse	52575167.00
632	4	7111	Upravne takse in pristojbine	31181731.00
633	4	712	Globe in druge denarne kazni	77861948.00
634	4	7120	Globe in druge denarne kazni	77861948.00
635	4	713	Prihodki od prodaje blaga in storitev	9575224.00
636	4	7130	Prihodki od prodaje blaga in storitev	9575224.00
637	4	714	Drugi nedavčni prihodki	175437025.00
638	4	7141	Drugi nedavčni prihodki	175437025.00
639	4	72	KAPITALSKI PRIHODKI	22050000.00
640	4	720	Prihodki od prodaje osnovnih sredstev	20726062.00
641	4	7200	Prihodki od prodaje zgradb in prostorov	19374297.00
642	4	7201	Prihodki od prodaje prevoznih sredstev	1104144.00
643	4	7202	Prihodki od prodaje opreme	216073.00
644	4	7203	Prihodki od prodaje drugih osnovnih sredstev	31549.00
645	4	722	Prihodki od prodaje zemljišč in neopredmetenih sredstev	1323937.00
646	4	7220	Prihodki od prodaje kmetijskih zemljišč in gozdov	11360.00
647	4	7221	Prihodki od prodaje stavbnih zemljišč	1312577.00
648	4	73	PREJETE DONACIJE	8944501.00
649	4	730	Prejete donacije iz domačih virov	172822.00
650	4	7300	Prejete donacije in darila od domačih pravnih oseb	172822.00
651	4	731	Prejete donacije iz tujine	8771679.00
652	4	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	1093083.00
653	4	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	7672458.00
654	4	7312	Prejete donacije in darila od tujih pravnih oseb	6139.00
655	4	74	TRANSFERNI PRIHODKI	908784.00
656	4	740	Transferni prihodki in drugih javnofinančnih institucij	908784.00
657	4	7400	Prejeta sredstva iz državnega proračuna	889907.00
658	4	7402	Prejeta sredstva iz skladov socialnega zavarovanja	18877.00
659	4	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	1037870429.00
660	4	780		5119744.00
661	4	7800	Prejeta sredstva PHARE	226000.00
662	4	7801	Prejeta sredstva ISPA	4893744.00
663	4	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske in ribiške politike	259681996.00
664	4	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	9643858.00
665	4	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	87942000.00
666	4	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	156517359.00
753	4	4203	Nakup drugih osnovnih sredstev	59901.00
667	4	7813	Ostala prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	2033663.00
668	4	7814	Prejeta sredstva iz proračuna EU za izvajanje skupne ribiške politike	3545116.00
669	4	782	Prejeta sredstva iz proračuna EU iz strukturnih skladov	531274208.00
670	4	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	371240639.00
671	4	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	160033569.00
672	4	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	203904030.00
673	4	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	203904030.00
674	4	784	Prejeta sredstva iz proračuna EU za izvajanje centraliziranih in drugih programov EU	17143264.00
675	4	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranjih politik EU 2004-2006	5711944.00
676	4	7842	Prejeta sredstva iz proračuna EU iz naslova Konkurenčnost za rast in zaposlovanje	4347321.00
677	4	7843	Prejeta sredstva iz proračuna EU iz naslova Državljanstvo, svoboda, varnost in pravica	7083999.00
678	4	786	Ostala prejeta sredstva iz proračuna Evropske unije	2620401.00
679	4	7860	Ostala prejeta sredstva iz proračuna EU	2620401.00
680	4	787	Prejeta sredstva od drugih evropskih institucij	610000.00
681	4	7870	Prejeta sredstva od drugih evropskih institucij	610000.00
682	4	788	Prejeta vračila sredstev iz proračuna Evropske unije	17516786.00
683	4	7880	Prejeta vračila sredstev iz proračuna Evropske unije	17516786.00
685	4	400	Plače in drugi izdatki zaposlenim	1049873280.00
686	4	4000	Plače in dodatki	887107039.00
687	4	4001	Regres za letni dopust	29968314.00
688	4	4002	Povračila in nadomestila	101912327.00
689	4	4003	Sredstva za delovno uspešnost	9348840.00
690	4	4004	Sredstva za nadurno delo	9539260.00
691	4	4005	Plače za delo nerezidentov po pogodbi	8734.00
692	4	4009	Drugi izdatki zaposlenim	11988766.00
693	4	401	Prispevki delodajalcev za socialno varnost	187457579.00
694	4	4010	Prispevek za pokojninsko in invalidsko zavarovanje	107581316.00
695	4	4011	Prispevek za zdravstveno zavarovanje	62117731.00
696	4	4012	Prispevek za zaposlovanje	559761.00
697	4	4013	Prispevek za starševsko varstvo	914672.00
698	4	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	16284099.00
699	4	402	Izdatki za blago in storitve	823880299.00
700	4	4020	Pisarniški in splošni material in storitve	103440642.00
701	4	4021	Posebni material in storitve	201656672.00
702	4	4022	Energija, voda, komunalne storitve in komunikacije	66876593.00
703	4	4023	Prevozni stroški in storitve	42076878.00
704	4	4024	Izdatki za službena potovanja	18464951.00
705	4	4025	Tekoče vzdrževanje	201918279.00
706	4	4026	Poslovne najemnine in zakupnine	60285227.00
707	4	4027	Kazni in odškodnine	8384323.00
708	4	4029	Drugi operativni odhodki	120776734.00
717	4	409	Rezerve	58320592.00
718	4	4090	Splošna proračunska rezervacija	39535925.00
719	4	4091	Proračunska rezerva	3779152.00
720	4	4093	Sredstva za posebne namene	15005515.00
721	4	41	Tekoči transferi	5582190867.00
722	4	410	Subvencije	628832232.00
723	4	4100	Subvencije javnim podjetjem	71006253.00
724	4	4101	Subvencije finančnim institucijam	4354618.00
725	4	4102	Subvencije privatnim podjetjem in zasebnikom	553471361.00
726	4	411	Transferi posameznikom in gospodinjstvom	1380184536.00
727	4	4110	Transferi nezaposlenim	221877094.00
728	4	4111	Družinski prejemki in starševska nadomestila	644066832.00
729	4	4112	Transferi za zagotavljanje socialne varnosti	177275087.00
730	4	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	81226449.00
731	4	4117	Štipendije	125107334.00
732	4	4119	Drugi transferi posameznikom	130631741.00
733	4	412	Transferi nepridobitnim organizacijam in ustanovam	125752982.00
734	4	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	125752982.00
735	4	413	Drugi tekoči domači transferi	3422987213.00
736	4	4130	Tekoči transferi občinam	13387516.00
737	4	4131	Tekoči transferi v sklade socialnega zavarovanja	1429284490.00
738	4	4132	Tekoči transferi v javne sklade	15228688.00
739	4	4133	Tekoči transferi v javne zavode	1850671328.00
740	4	4134	Tekoči transferi v državni proračun	771966.00
741	4	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	83406758.00
742	4	4136	Tekoči transferi v javne agencije	30236467.00
743	4	414	Tekoči transferi v tujino	24433904.00
744	4	4140	Tekoči transferi mednarodnim institucijam	14219340.00
745	4	4141	Tekoči transferi tujim vladam in vladnim institucijam	15727.00
746	4	4142	Tekoči transferi neprofitnim organizacijam v tujini	1406841.00
747	4	4143	Drugi tekoči transferi v tujino	8791997.00
748	4	42	INVESTICIJSKI ODHODKI	471501453.00
749	4	420	Nakup in gradnja osnovnih sredstev	471501453.00
750	4	4200	Nakup zgradb in prostorov	12491976.00
751	4	4201	Nakup prevoznih sredstev	7763196.00
709	4	553	Plačila domačih obresti (403)	381527874.00
754	4	4204	Novogradnje, rekonstrukcije in adaptacije	205792070.00
755	4	4205	Investicijsko vzdrževanje in obnove	58986570.00
756	4	4206	Nakup zemljišč in naravnih bogastev	25757237.00
757	4	4207	Nakup nematerialnega premoženja	36935627.00
758	4	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	76316119.00
759	4	43	INVESTICIJSKI TRANSFERI	809453952.00
760	4	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	312314603.00
761	4	4310	Investicijski transferi nepridobitnim organizacijam in ustanovam	28164398.00
762	4	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	99694395.00
763	4	4313	Investicijski transferi privatnim podjetjem	128420224.00
764	4	4314	Investicijski transferi posameznikom in zasebnikom	52357289.00
765	4	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	3658296.00
766	4	4316	Investicijski transferi v tujino	20000.00
767	4	432	Investicijski transferi proračunskim uporabnikom	497139349.00
768	4	4320	Investicijski transferi občinam	399993875.00
769	4	4321	Investicijski transferi javnim skladom in agencijam	4752210.00
770	4	4323	Investicijski transferi javnim zavodom	92393265.00
771	4	45	Plačila sredstev v proračun Evropske unije	412805832.00
772	4	450	Plačila sredstev v proračun Evropske unije	412805832.00
773	4	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	52400000.00
774	4	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	54309750.00
775	4	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	283964010.00
776	4	4503	Plačila sredstev v proračun EU iz naslova poravka v korist Združenega Kraljestva	19643216.00
777	4	4504	Plačila sredstev v proračun EU iz naslova popravkov BND vira v korist Kraljevin Nizozemske in Švedske	2488856.00
778	4	75	Prejeta vračila danih posojil in prodaja kapitalskih deležev	63710000.00
779	4	750	Prejeta vračila danih posojil	12810000.00
780	4	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	30000.00
781	4	7501	Prejeta vračila danih posojil – od javnih skladov	9280000.00
782	4	7504	Prejeta vračila danih posojil od privatnih podjetij	3500000.00
783	4	751	Prodaja kapitalskih deležev	50000000.00
784	4	7514	Prejeta vračila namenskega premoženja	50000000.00
785	4	752	Kupnine iz naslova privatizacije	900000.00
786	4	7520	Sredstva kupnin iz naslova privatizacije	900000.00
787	4	44	Dana posojila in povečanje kapitalskih deležev	292512863.00
788	4	440	Dana posojila	237847172.00
789	4	4401	Dana posojila javnim skladom	13797339.00
790	4	4404	Dana posojila privatnim podjetjem	55042567.00
791	4	4406	Dana posojila v tujino	145400000.00
792	4	4409	Plačila zapadlih poroštev	23607267.00
793	4	441	Povečanje kapitalskih deležev in finančnih naložb	37121482.00
794	4	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	30000000.00
795	4	4414	Povečanje kapitalskih deležev v tujino	7121482.00
796	4	442	Poraba sredstev kupnin iz naslova privatizacije	6403231.00
797	4	4420	Dana posojila iz sredstev kupnin	2172495.00
798	4	4421	Sredstva kupnin, razporejena v javne sklade in agencije	3840142.00
799	4	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	390594.00
800	4	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	11140977.00
801	4	4430	Povečanje namenskega premoženja v javnih skladih	11140977.00
802	4	50	ZADOLŽEVANJE	3621773371.00
804	4	550	Odplačila domačega dolga	1217064684.00
805	4	5501	Odplačila kreditov poslovnim bankam	54657820.00
806	4	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	1162406864.00
807	4	551	Odplačila dolga v tujino	515383314.00
808	4	5510	Odplačila dolga mednarodnim finančnim institucijam	15383314.00
809	4	5514	Odplačila glavnice vrednostnih papirjev, izdanih na tujih trgih	500000000.00
810	5	70	Davčni prihodki	7011901071.00
811	5	700	Davki na dohodek in dobiček	1752938135.00
812	5	7000	Dohodnina	1027995910.00
813	5	7001	Davek od dohodkov pravnih oseb	724942226.00
814	5	701	Prispevki za socialno varnost	55833713.00
815	5	7010	Prispevki zaposlenih	31256327.00
816	5	7011	Prispevki delodajalcev	20958355.00
817	5	7012	Prispevki samozaposlenih	2643875.00
818	5	7013	Ostali prispevki za socialno varnost	975156.00
819	5	702	Davki na plačilno listo in delovno silo	28751567.00
820	5	7021	Posebni davek na določene prejemke	28751567.00
821	5	704	Domači davki na blago in storitve	5067251961.00
822	5	7040	Davek na dodano vrednost	3061930766.00
823	5	7041	Drugi davki na blago in storitve	151000000.00
824	5	7042	Trošarine (akcize)	1505283404.00
825	5	7044	Davki na posebne storitve	136171310.00
826	5	7046	Letna dajatev za uporabo vozil v cestnem prometu	110671782.00
827	5	7047	Drugi davki na uporabo blaga in storitev	41219464.00
828	5	7048	Davki od prometa motornih vozil	60975236.00
829	5	705	Davki na mednarodno trgovino in transakcije	104622309.00
830	5	7050	Carine	103185046.00
831	5	7051	Druge uvozne dajatve	1437263.00
832	5	706	Drugi davki	2503385.00
833	5	7060	Drugi davki	2503385.00
834	5	71	Nedavčni prihodki	458390040.00
835	5	710	Udeležba na dobičku in dohodki od premoženja	150887581.00
836	5	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	46000300.00
837	5	7102	Prihodki od obresti	34491000.00
838	5	7103	Prihodki od premoženja	70396281.00
839	5	711	Takse in pristojbine	78640442.00
840	5	7110	Sodne takse	44079705.00
841	5	7111	Upravne takse in pristojbine	34560737.00
842	5	712	Globe in druge denarne kazni	75864424.00
843	5	7120	Globe in druge denarne kazni	75864424.00
844	5	713	Prihodki od prodaje blaga in storitev	10296386.00
845	5	7130	Prihodki od prodaje blaga in storitev	10296386.00
846	5	714	Drugi nedavčni prihodki	142701207.00
847	5	7141	Drugi nedavčni prihodki	142701207.00
848	5	72	KAPITALSKI PRIHODKI	15650000.00
849	5	720	Prihodki od prodaje osnovnih sredstev	14326062.00
850	5	7200	Prihodki od prodaje zgradb in prostorov	12974297.00
851	5	7201	Prihodki od prodaje prevoznih sredstev	1104144.00
852	5	7202	Prihodki od prodaje opreme	216073.00
853	5	7203	Prihodki od prodaje drugih osnovnih sredstev	31549.00
854	5	722	Prihodki od prodaje zemljišč in neopredmetenih sredstev	1323937.00
855	5	7220	Prihodki od prodaje kmetijskih zemljišč in gozdov	11360.00
856	5	7221	Prihodki od prodaje stavbnih zemljišč	1312577.00
857	5	73	PREJETE DONACIJE	6094501.00
858	5	730	Prejete donacije iz domačih virov	173762.00
859	5	7300	Prejete donacije in darila od domačih pravnih oseb	173762.00
860	5	731	Prejete donacije iz tujine	5920739.00
861	5	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	2318653.00
862	5	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	3556648.00
863	5	7312	Prejete donacije in darila od tujih pravnih oseb	45437.00
864	5	74	TRANSFERNI PRIHODKI	817263.00
865	5	740	Transferni prihodki in drugih javnofinančnih institucij	817263.00
866	5	7400	Prejeta sredstva iz državnega proračuna	798386.00
867	5	7402	Prejeta sredstva iz skladov socialnega zavarovanja	18877.00
868	5	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	1154710540.00
869	5	780	Predpristopna sredstva Evropske unije	5119744.00
870	5	7800	Prejeta sredstva PHARE	226000.00
871	5	7801	Prejeta sredstva ISPA	4893744.00
872	5	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	246867672.00
873	5	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	9643858.00
874	5	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	87942000.00
875	5	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada – Jamstveni del (EAGGF – Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	149281814.00
876	5	782	Prejeta sredstva iz proračuna EU za strukturno politiko	601060814.00
877	5	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	428958952.00
878	5	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	172101862.00
879	5	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	265641825.00
880	5	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	265641825.00
881	5	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	27965829.00
882	5	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	27965829.00
883	5	786	Ostala prejeta sredstva iz proračuna Evropske unije	8054656.00
884	5	7860	Ostala prejeta sredstva iz proračuna EU	8054656.00
886	5	400	Plače in drugi izdatki zaposlenim	1063698035.00
887	5	4000	Plače in dodatki	899320806.00
888	5	4001	Regres za letni dopust	29931420.00
889	5	4002	Povračila in nadomestila	101745452.00
890	5	4003	Sredstva za delovno uspešnost	10862483.00
891	5	4004	Sredstva za nadurno delo	12134547.00
892	5	4005	Plače za delo nerezidentov po pogodbi	8234.00
893	5	4009	Drugi izdatki zaposlenim	9695094.00
894	5	401	Prispevki delodajalcev za socialno varnost	191839083.00
895	5	4010	Prispevek za pokojninsko in invalidsko zavarovanje	111138714.00
896	5	4011	Prispevek za zdravstveno zavarovanje	62996420.00
897	5	4012	Prispevek za zaposlovanje	551110.00
898	5	4013	Prispevek za starševsko varstvo	907409.00
899	5	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	16245429.00
900	5	402	Izdatki za blago in storitve	895068682.00
901	5	4020	Pisarniški in splošni material in storitve	135367643.00
902	5	4021	Posebni material in storitve	221618529.00
903	5	4022	Energija, voda, komunalne storitve in komunikacije	67241968.00
904	5	4023	Prevozni stroški in storitve	44951074.00
905	5	4024	Izdatki za službena potovanja	21316287.00
906	5	4025	Tekoče vzdrževanje	203417389.00
907	5	4026	Poslovne najemnine in zakupnine	66808893.00
908	5	4027	Kazni in odškodnine	8833005.00
909	5	4029	Drugi operativni odhodki	125513895.00
918	5	409	Rezerve	69344948.00
910	5	553	Plačila domačih obresti (403)	413011954.00
919	5	4090	Splošna proračunska rezervacija	39132846.00
920	5	4091	Proračunska rezerva	11337478.00
921	5	4093	Sredstva za posebne namene	18874624.00
922	5	41	Tekoči transferi	5635522379.00
923	5	410	Subvencije	655815199.00
924	5	4100	Subvencije javnim podjetjem	64040487.00
925	5	4101	Subvencije finančnim institucijam	4354618.00
926	5	4102	Subvencije privatnim podjetjem in zasebnikom	587420094.00
927	5	411	Transferi posameznikom in gospodinjstvom	1365179446.00
928	5	4110	Transferi nezaposlenim	209735040.00
929	5	4111	Družinski prejemki in starševska nadomestila	644066832.00
930	5	4112	Transferi za zagotavljanje socialne varnosti	177070087.00
931	5	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	81226449.00
932	5	4117	Štipendije	125796556.00
933	5	4119	Drugi transferi posameznikom	127284482.00
934	5	412	Transferi neprofitnim organizacijam in ustanovam	116364051.00
935	5	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	116364051.00
936	5	413	Drugi tekoči domači transferi	3474430329.00
937	5	4130	Tekoči transferi občinam	11730525.00
938	5	4131	Tekoči transferi v sklade socialnega zavarovanja	1447131275.00
939	5	4132	Tekoči transferi v javne sklade	9615238.00
940	5	4133	Tekoči transferi v javne zavode	1892020621.00
941	5	4134	Tekoči transferi v državni proračun	740993.00
942	5	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	82181542.00
943	5	4136	Tekoči transferi v javne agencije	31010135.00
944	5	414	Tekoči transferi v tujino	23733354.00
945	5	4140	Tekoči transferi mednarodnim institucijam	13599094.00
946	5	4141	Tekoči transferi tujim vladam in vladnim institucijam	3737.00
947	5	4142	Tekoči transferi neprofitnim organizacijam v tujini	1459820.00
948	5	4143	Drugi tekoči transferi v tujino	8670703.00
949	5	42	INVESTICIJSKI ODHODKI	737395432.00
950	5	420	Nakup in gradnja osnovnih sredstev	737395432.00
951	5	4200	Nakup zgradb in prostorov	13748849.00
952	5	4201	Nakup prevoznih sredstev	12162572.00
953	5	4202	Nakup opreme	70542340.00
954	5	4203	Nakup drugih osnovnih sredstev	574513.00
955	5	4204	Novogradnje, rekonstrukcije in adaptacije	308515560.00
956	5	4205	Investicijsko vzdrževanje in obnove	120832666.00
957	5	4206	Nakup zemljišč in naravnih bogastev	35612796.00
958	5	4207	Nakup nematerialnega premoženja	46727620.00
959	5	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski	128678516.00
960	5	43	INVESTICIJSKI TRANSFERI	932875686.00
961	5	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	394308113.00
962	5	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	13781673.00
963	5	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	130653990.00
964	5	4313	Investicijski transferi privatnim podjetjem	197417418.00
965	5	4314	Investicijski transferi posameznikom in zasebnikom	48869273.00
966	5	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	3555759.00
967	5	4316	Investicijski transferi v tujino	30000.00
968	5	432	Investicijski transferi proračunskim uporabnikom	538567573.00
969	5	4320	Investicijski transferi občinam	402865814.00
970	5	4321	Investicijski transferi javnim skladom in agencijam	5228468.00
971	5	4322	Investicijski transferi v državni proračun	0.00
972	5	4323	Investicijski transferi javnim zavodom	130473291.00
973	5	45	Plačila sredstev v proračun Evropske unije	437805832.00
974	5	450	Plačila sredstev v proračun Evropske unije	437805832.00
975	5	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	77400000.00
976	5	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	54309750.00
977	5	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	283964010.00
978	5	4503	Plačila sredstev v proračun EU iz naslova poravka v korist Združenega Kraljestva	19643216.00
979	5	4504	Plačila sredstev v proračun EU iz naslova popravkov BND vira v korist Kraljevin Nizozemske in Švedske	2488856.00
980	5	75	Prejeta vračila danih posojil	63710000.00
981	5	750	Prejeta vračila danih posojil	12810000.00
982	5	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	30000.00
983	5	7501	Prejeta vračila danih posojil – od javnih skladov	9280000.00
984	5	7504	Prejeta vračila danih posojil od privatnih podjetij	3500000.00
985	5	751	Prodaja kapitalskih deležev	50000000.00
986	5	7514	Sredstva, pridobljena z vračilom namenskega premoženja	50000000.00
987	5	752	Kupnine iz naslova privatizacije	900000.00
988	5	7520	Sredstva kupnin iz naslova privatizacije	900000.00
989	5	44	Dana posojila in povečanje kapitalskih deležev	126993141.00
990	5	440	Dana posojila	72134656.00
991	5	4404	Dana posojila privatnim podjetjem	53500000.00
992	5	4409	Plačila zapadlih poroštev	18634656.00
993	5	441	Povečanje kapitalskih deležev in finančnih naložb	36980000.00
994	5	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	30000000.00
995	5	4414	Povečanje kapitalskih deležev v tujino	6980000.00
996	5	442	Poraba sredstev kupnin iz naslova privatizacije	6793357.00
997	5	4420	Dana posojila iz sredstev kupnin	3000000.00
998	5	4421	Sredstva kupnin, razporejena v javne sklade in agencije	1493357.00
999	5	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	2300000.00
1000	5	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	11085128.00
1001	5	4430	Povečanje namenskega premoženja v javnih skladih	11085128.00
1002	5	50	ZADOLŽEVANJE	3621773371.00
1004	5	550	Odplačila domačega dolga	1217064684.00
1005	5	5501	Odplačila kreditov poslovnim bankam	54657820.00
1006	5	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	1162406864.00
1007	5	551	Odplačila dolga v tujino	515283314.00
1008	5	5510	Odplačila dolga mednarodnim finančnim institucijam	15283314.00
1009	5	5514	Odplačila glavnice vrednostnih papirjev, izdanih na tujih trgih	500000000.00
1010	6	70	DAVČNI PRIHODKI	6726857388.00
1011	6	700	Davki na dohodek in dobiček	1800209815.00
1012	6	7000	Dohodnina	1052635000.00
1013	6	7001	Davek od dohodkov pravnih oseb	747574815.00
1014	6	701	Prispevki za socialno varnost	52497372.00
1015	6	7010	Prispevki zaposlenih	29439964.00
1016	6	7011	Prispevki delodajalcev	19588477.00
1017	6	7012	Prispevki samozaposlenih	2534220.00
1018	6	7013	Ostali prispevki za socialno varnost	934711.00
1019	6	702	Davki na plačilno listo in delovno silo	27874492.00
1020	6	7020	Davek na izplačane plače	0.00
1021	6	7021	Posebni davek na določene prejemke	27874492.00
1022	6	703	Davki na premoženje	0.00
1023	6	7033	Davki na promet nepremičnin in na finančno premoženje	0.00
1024	6	704	Domači davki na blago in storitve	4740091635.00
1025	6	7040	Davek na dodano vrednost	2851206755.00
1026	6	7041	Drugi davki na blago in storitve	30351455.00
1027	6	7042	Trošarine (akcize)	1534900548.00
1028	6	7044	Davki na posebne storitve	132099096.00
1029	6	7046	Letna dajatev za uporabo vozil v cestnem prometu	106409952.00
1030	6	7047	Drugi davki na uporabo blaga in storitev	43520546.00
1031	6	7048	Davki od prometa motornih vozil	41603283.00
1032	6	705	Davki na mednarodno trgovino in transakcije	104359805.00
1033	6	7050	Carine	102981084.00
1034	6	7051	Druge uvozne dajatve	1378721.00
1035	6	706	Drugi davki	1824270.00
1036	6	7060	Drugi davki	1824270.00
1037	6	71	NEDAVČNI PRIHODKI	351841244.00
1038	6	710	Udeležba na dobičku in dohodki od premoženja	127358807.00
1039	6	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	43000000.00
1040	6	7102	Prihodki od obresti	15000000.00
1041	6	7103	Prihodki od premoženja	69358807.00
1042	6	711	Takse in pristojbine	73099789.00
1043	6	7110	Sodne takse	36437830.00
1044	6	7111	Upravne takse in pristojbine	36661959.00
1045	6	712	Globe in druge denarne kazni	72199071.00
1046	6	7120	Globe in druge denarne kazni	72199071.00
1047	6	713	Prihodki od prodaje blaga in storitev	10129289.00
1048	6	7130	Prihodki od prodaje blaga in storitev	10129289.00
1049	6	714	Drugi nedavčni prihodki	69054288.00
1050	6	7141	Drugi nedavčni prihodki	69054288.00
1051	6	72	KAPITALSKI PRIHODKI	20521372.00
1052	6	720	Prihodki od prodaje osnovnih sredstev	19216019.00
1053	6	7200	Prihodki od prodaje zgradb in prostorov	17883240.00
1054	6	7201	Prihodki od prodaje prevoznih sredstev	1088636.00
1055	6	7202	Prihodki od prodaje opreme	213038.00
1056	6	7203	Prihodki od prodaje drugih osnovnih sredstev	31105.00
1057	6	722	Prihodki od prodaje zemljišč in neopredmetenih sredstev	1305353.00
1058	6	7220	Prihodki od prodaje kmetijskih zemljišč in gozdov	11200.00
1059	6	7221	Prihodki od prodaje stavbnih zemljišč	1294153.00
1060	6	73	PREJETE DONACIJE	6004435.00
1061	6	730	Prejete donacije iz domačih virov	171194.00
1062	6	7300	Prejete donacije in darila od domačih pravnih oseb	171194.00
1063	6	731	Prejete donacije iz tujine	5833240.00
1064	6	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	2284387.00
1065	6	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	3504087.00
1066	6	7312	Prejete donacije in darila od tujih pravnih oseb	44766.00
1067	6	74	TRANSFERNI PRIHODKI	759458.00
1068	6	740	Transferni prihodki iz drugih javnofinančnih institucij	759458.00
1069	6	7400	Prejeta sredstva iz državnega proračuna	741304.00
1070	6	7402	Prejeta sredstva iz skladov socialnega zavarovanja	18155.00
1071	6	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	814056422.00
1072	6	780	Predpristopna sredstva Evropske unije	18832900.00
1073	6	7800	Prejeta sredstva PHARE	252900.00
1074	6	7801	Prejeta sredstva ISPA	18580000.00
1075	6	7802	Prejeta sredstva SAPARD	0.00
1076	6	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	234563812.00
1077	6	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	35922233.00
1078	6	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	66607162.00
1079	6	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega sklada za razvoj podeželja (EKSRP)	132034417.00
1080	6	782	Prejeta sredstva iz proračuna EU za strukturno politiko	409704459.00
1081	6	7820	Prejeta sredstva iz proračuna EU iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Usmerjevalni del (EAGGF - Guidance Fund)	0.00
1082	6	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	311604879.00
1083	6	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	98099580.00
1084	6	7823	Prejeta sredstva iz proračuna EU iz naslova Finančnega instrumenta za usmerjanje ribištva (FIFG)	0.00
1085	6	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	108684559.00
1086	6	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	108684559.00
1087	6	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	18914325.00
1088	6	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	18914325.00
1089	6	786	Ostala prejeta sredstva iz proračuna Evropske unije	3910796.00
1090	6	7860	Ostala prejeta sredstva iz proračuna EU	3910796.00
1091	6	787	Prejeta sredstva od drugih evropskih institucij	0.00
1092	6	7870	Prejeta sredstva od drugih evropskih institucij	0.00
1093	6	788	Prejeta vračila sredstev iz proračuna Evropske unije	19445571.00
1094	6	7880	Prejeta vračila sredstev iz proračuna Evropske unije	19445571.00
1096	6	400	Plače in drugi izdatki zaposlenim	1039972019.00
1097	6	4000	Plače in dodatki	875509779.00
1098	6	4001	Regres za letni dopust	28544846.00
1099	6	4002	Povračila in nadomestila	98219782.00
1100	6	4003	Sredstva za delovno uspešnost	18716537.00
1101	6	4004	Sredstva za nadurno delo	10608489.00
1102	6	4005	Plače za delo nerezidentov po pogodbi	13256.00
1103	6	4009	Drugi izdatki zaposlenim	8359331.00
1104	6	401	Prispevki delodajalcev za socialno varnost	183724243.00
1105	6	4010	Prispevek za pokojninsko in invalidsko zavarovanje	105376435.00
1106	6	4011	Prispevek za zdravstveno zavarovanje	61112393.00
1107	6	4012	Prispevek za zaposlovanje	537367.00
1108	6	4013	Prispevek za starševsko varstvo	886859.00
1109	6	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	15811188.00
1110	6	402	Izdatki za blago in storitve	878346448.00
1111	6	4020	Pisarniški in splošni material in storitve	121635022.00
1112	6	4021	Posebni material in storitve	226367162.00
1113	6	4022	Energija, voda, komunalne storitve in komunikacije	64671698.00
1114	6	4023	Prevozni stroški in storitve	46128539.00
1115	6	4024	Izdatki za službena potovanja	22496454.00
1116	6	4025	Tekoče vzdrževanje	187708825.00
1117	6	4026	Poslovne najemnine in zakupnine	65662731.00
1118	6	4027	Kazni in odškodnine	9362807.00
1119	6	4029	Drugi operativni odhodki	134313212.00
1129	6	409	Rezerve	33442697.00
1130	6	4090	Splošna proračunska rezervacija	24447489.00
1131	6	4091	Proračunska rezerva	5655208.00
1132	6	4093	Sredstva za posebne namene	3340000.00
1133	6	41	TEKOČI TRANSFERI	5579463201.00
1134	6	410	Subvencije	683379463.00
1135	6	4100	Subvencije javnim podjetjem	69407620.00
1136	6	4101	Subvencije finančnim institucijam	4277249.00
1137	6	4102	Subvencije privatnim podjetjem in zasebnikom	609694593.00
1138	6	411	Transferi posameznikom in gospodinjstvom	1276986745.00
1139	6	4110	Transferi nezaposlenim	171486002.00
1140	6	4111	Družinski prejemki in starševska nadomestila	579454531.00
1141	6	4112	Transferi za zagotavljanje socialne varnosti	174831803.00
1142	6	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	79472220.00
1143	6	4117	Štipendije	118574323.00
1144	6	4119	Drugi transferi posameznikom	153167867.00
1145	6	412	Transferi neprofitnim organizacijam in ustanovam	100383830.00
1146	6	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	100383830.00
1147	6	413	Drugi tekoči domači transferi	3492462866.00
1148	6	4130	Tekoči transferi občinam	67841337.00
1149	6	4131	Tekoči transferi v sklade socialnega zavarovanja	1428939095.00
1150	6	4132	Tekoči transferi v javne sklade	11975217.00
1151	6	4133	Tekoči transferi v javne zavode	1889266883.00
1152	6	4134	Tekoči transferi v državni proračun	777408.00
1153	6	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	76391808.00
1154	6	4136	Tekoči transferi v javne agencije	17271119.00
1155	6	414	Tekoči transferi v tujino	26250297.00
1156	6	4140	Tekoči transferi mednarodnim institucijam	15554112.00
1157	6	4141	Tekoči transferi tujim vladam in vladnim institucijam	23737.00
1158	6	4142	Tekoči transferi neprofitnim organizacijam v tujini	1764962.00
1159	6	4143	Drugi tekoči transferi v tujino	8907486.00
1160	6	42	INVESTICIJSKI ODHODKI	507488010.00
1161	6	420	Nakup in gradnja osnovnih sredstev	507488010.00
1162	6	4200	Nakup zgradb in prostorov	15288650.00
1163	6	4201	Nakup prevoznih sredstev	6014756.00
1164	6	4202	Nakup opreme	74385233.00
1165	6	4203	Nakup drugih osnovnih sredstev	348259.00
1166	6	4204	Novogradnje, rekonstrukcije in adaptacije	211499110.00
1167	6	4205	Investicijsko vzdrževanje in obnove	81942992.00
1168	6	4206	Nakup zemljišč in naravnih bogastev	23936939.00
1169	6	4207	Nakup nematerialnega premoženja	27798430.00
1170	6	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	66273640.00
1171	6	43	INVESTICIJSKI TRANSFERI	727812475.00
1254	7	7051	Druge uvozne dajatve	1378721.00
1120	6	553	Plačila domačih obresti (403)	239135399.00
1172	6	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	252027040.00
1173	6	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	13650070.00
1174	6	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	38786094.00
1175	6	4313	Investicijski transferi privatnim podjetjem	158463136.00
1176	6	4314	Investicijski transferi posameznikom in zasebnikom	36444048.00
1177	6	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	4658692.00
1178	6	4316	Investicijski transferi v tujino	25000.00
1179	6	432	Investicijski transferi proračunskim uporabnikom	475785435.00
1180	6	4320	Investicijski transferi občinam	359074182.00
1181	6	4321	Investicijski transferi javnim skladom in agencijam	5753422.00
1182	6	4323	Investicijski transferi javnim zavodom	110957831.00
1183	6	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	452045572.00
1184	6	450	Plačila sredstev v proračun Evropske unije	452045572.00
1185	6	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	98125200.00
1186	6	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	62118540.00
1187	6	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	254428035.00
1188	6	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Združenega Kraljestva	30233797.00
1189	6	4504	Plačila sredstev v proračun EU iz naslova popravkov BDN vira v korist Kraljevin Nizozemske in Švedske	7140000.00
1190	6	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	21068487.00
1191	6	750	Prejeta vračila danih posojil	19875600.00
1192	6	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	33600.00
1193	6	7501	Prejeta vračila danih posojil - od javnih skladov	16260000.00
1194	6	7502	Prejeta vračila danih posojil od javnih podjetij in družb, ki so v lasti države ali občin	0.00
1195	6	7503	Prejeta vračila danih posojil - od finančnih institucij	0.00
1196	6	7504	Prejeta vračila danih posojil od privatnih podjetij	3582000.00
1197	6	7507	Prejeta vračila danih posojil državnemu proračunu	0.00
1198	6	7509	Prejeta vračila plačanih poroštev	0.00
1199	6	751	Prodaja kapitalskih deležev	0.00
1200	6	7511	Sredstva, pridobljena s prodajo kapitalskih deležev v finančnih institucijah	0.00
1201	6	7512	Sredstva, pridobljena s prodajo kapitalskih deležev v privatnih podjetjih	0.00
1202	6	752	Kupnine iz naslova privatizacije	1192887.00
1203	6	7520	Sredstva kupnin iz naslova privatizacije	1192887.00
1204	6	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	675462052.00
1205	6	440	Dana posojila	102479534.00
1206	6	4401	Dana posojila javnim skladom	0.00
1207	6	4404	Dana posojila privatnim podjetjem	90423066.00
1208	6	4409	Plačila zapadlih poroštev	12056468.00
1209	6	441	Povečanje kapitalskih deležev in finančnih naložb	559820607.00
1210	6	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	80000000.00
1211	6	4411	Povečanje kapitalskih deležev v finančnih institucijah	460000000.00
1212	6	4414	Povečanje kapitalskih deležev v tujino	9820607.00
1213	6	4415	Povečanje drugih finančnih naložb	10000000.00
1214	6	442	Poraba sredstev kupnin iz naslova privatizacije	5769183.00
1215	6	4420	Dana posojila iz sredstev kupnin	2522562.00
1216	6	4421	Sredstva kupnin, razporejena v javne sklade in agencije	1197629.00
1217	6	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	2048992.00
1218	6	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	7392728.00
1219	6	4430	Povečanje  namenskega premoženja v javnih skladih	7392728.00
1220	6	50	ZADOLŽEVANJE	3347432617.00
1221	6	500	Domače zadolževanje	3347432617.00
1222	6	5000	Najeti krediti pri Banki Slovenije	3347432617.00
1223	6	5004	Sredstva, pridobljena z izdajo vrednostnih papirjev na domačem trgu	0.00
1225	6	550	Odplačila domačega dolga	428151240.00
1226	6	5501	Odplačila kreditov poslovnim bankam	65097647.00
1227	6	5503	Odplačila kreditov drugim domačim kreditodajalcem	55000000.00
1228	6	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	308053593.00
1229	6	551	Odplačila dolga v tujino	425648960.00
1230	6	5510	Odplačila dolga mednarodnim finančnim institucijam	18900000.00
1231	6	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6748960.00
1232	6	5514	Odplačila glavnice vrednostnih papirjev, izdanih na tujih trgih	400000000.00
1233	7	70	DAVČNI PRIHODKI	6726857388.00
1234	7	700	Davki na dohodek in dobiček	1800209815.00
1235	7	7000	Dohodnina	1052635000.00
1236	7	7001	Davek od dohodkov pravnih oseb	747574815.00
1237	7	701	Prispevki za socialno varnost	52497372.00
1238	7	7010	Prispevki zaposlenih	29439964.00
1239	7	7011	Prispevki delodajalcev	19588477.00
1240	7	7012	Prispevki samozaposlenih	2534220.00
1241	7	7013	Ostali prispevki za socialno varnost	934711.00
1242	7	702	Davki na plačilno listo in delovno silo	27874492.00
1243	7	7021	Posebni davek na določene prejemke	27874492.00
1244	7	704	Domači davki na blago in storitve	4740091635.00
1245	7	7040	Davek na dodano vrednost	2851206755.00
1246	7	7041	Drugi davki na blago in storitve	30351455.00
1247	7	7042	Trošarine (akcize)	1534900548.00
1248	7	7044	Davki na posebne storitve	132099096.00
1249	7	7046	Letna dajatev za uporabo vozil v cestnem prometu	106409952.00
1250	7	7047	Drugi davki na uporabo blaga in storitev	43520546.00
1251	7	7048	Davki od prometa motornih vozil	41603283.00
1252	7	705	Davki na mednarodno trgovino in transakcije	104359805.00
1253	7	7050	Carine	102981084.00
1255	7	706	Drugi davki	1824270.00
1256	7	7060	Drugi davki	1824270.00
1257	7	71	NEDAVČNI PRIHODKI	351841244.00
1258	7	710	Udeležba na dobičku in dohodki od premoženja	127358807.00
1259	7	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	43000000.00
1260	7	7102	Prihodki od obresti	15000000.00
1261	7	7103	Prihodki od premoženja	69358807.00
1262	7	711	Takse in pristojbine	73099789.00
1263	7	7110	Sodne takse	36437830.00
1264	7	7111	Upravne takse in pristojbine	36661959.00
1265	7	712	Globe in druge denarne kazni	72199071.00
1266	7	7120	Globe in druge denarne kazni	72199071.00
1267	7	713	Prihodki od prodaje blaga in storitev	10129289.00
1268	7	7130	Prihodki od prodaje blaga in storitev	10129289.00
1269	7	714	Drugi nedavčni prihodki	69054288.00
1270	7	7141	Drugi nedavčni prihodki	69054288.00
1271	7	72	KAPITALSKI PRIHODKI	20521372.00
1272	7	720	Prihodki od prodaje osnovnih sredstev	19216019.00
1273	7	7200	Prihodki od prodaje zgradb in prostorov	17883240.00
1274	7	7201	Prihodki od prodaje prevoznih sredstev	1088636.00
1275	7	7202	Prihodki od prodaje opreme	213038.00
1276	7	7203	Prihodki od prodaje drugih osnovnih sredstev	31105.00
1277	7	722	Prihodki od prodaje zemljišč in neopredmetenih sredstev	1305353.00
1278	7	7220	Prihodki od prodaje kmetijskih zemljišč in gozdov	11200.00
1279	7	7221	Prihodki od prodaje stavbnih zemljišč	1294153.00
1280	7	73	PREJETE DONACIJE	6004435.00
1281	7	730	Prejete donacije iz domačih virov	171194.00
1282	7	7300	Prejete donacije in darila od domačih pravnih oseb	171194.00
1283	7	731	Prejete donacije iz tujine	5833240.00
1284	7	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	2284387.00
1285	7	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	3504087.00
1286	7	7312	Prejete donacije in darila od tujih pravnih oseb	44766.00
1287	7	74	TRANSFERNI PRIHODKI	759458.00
1288	7	740	Transferni prihodki iz drugih javnofinančnih institucij	759458.00
1289	7	7400	Prejeta sredstva iz državnega proračuna	741304.00
1290	7	7402	Prejeta sredstva iz skladov socialnega zavarovanja	18155.00
1291	7	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	814056422.00
1292	7	780	Predpristopna sredstva Evropske unije	18832900.00
1293	7	7800	Prejeta sredstva PHARE	252900.00
1294	7	7801	Prejeta sredstva ISPA	18580000.00
1295	7	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	234563812.00
1296	7	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	35922233.00
1297	7	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	66607162.00
1298	7	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega sklada za razvoj podeželja (EKSRP)	132034417.00
1299	7	782	Prejeta sredstva iz proračuna EU za strukturno politiko	409704459.00
1300	7	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	311604879.00
1301	7	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	98099580.00
1302	7	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	108684559.00
1303	7	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	108684559.00
1304	7	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	18914325.00
1305	7	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	18914325.00
1306	7	786	Ostala prejeta sredstva iz proračuna Evropske unije	3910796.00
1307	7	7860	Ostala prejeta sredstva iz proračuna EU	3910796.00
1308	7	788	Prejeta vračila sredstev iz proračuna Evropske unije	19445571.00
1309	7	7880	Prejeta vračila sredstev iz proračuna Evropske unije	19445571.00
1311	7	400	Plače in drugi izdatki zaposlenim	1039972019.00
1312	7	4000	Plače in dodatki	875509779.00
1313	7	4001	Regres za letni dopust	28544846.00
1314	7	4002	Povračila in nadomestila	98219782.00
1315	7	4003	Sredstva za delovno uspešnost	18716537.00
1316	7	4004	Sredstva za nadurno delo	10608489.00
1317	7	4005	Plače za delo nerezidentov po pogodbi	13256.00
1318	7	4009	Drugi izdatki zaposlenim	8359331.00
1319	7	401	Prispevki delodajalcev za socialno varnost	183724243.00
1320	7	4010	Prispevek za pokojninsko in invalidsko zavarovanje	105376435.00
1321	7	4011	Prispevek za zdravstveno zavarovanje	61112393.00
1322	7	4012	Prispevek za zaposlovanje	537367.00
1323	7	4013	Prispevek za starševsko varstvo	886859.00
1324	7	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	15811188.00
1325	7	402	Izdatki za blago in storitve	878346448.00
1326	7	4020	Pisarniški in splošni material in storitve	121635022.00
1327	7	4021	Posebni material in storitve	226367162.00
1328	7	4022	Energija, voda, komunalne storitve in komunikacije	64671698.00
1329	7	4023	Prevozni stroški in storitve	46128539.00
1330	7	4024	Izdatki za službena potovanja	22496454.00
1331	7	4025	Tekoče vzdrževanje	187708825.00
1332	7	4026	Poslovne najemnine in zakupnine	65662731.00
1333	7	4027	Kazni in odškodnine	9362807.00
1334	7	4029	Drugi operativni odhodki	134313212.00
1335	7	553	Plačila domačih obresti (403)	239135399.00
1344	7	409	Rezerve	33442697.00
1345	7	4090	Splošna proračunska rezervacija	24447489.00
1346	7	4091	Proračunska rezerva	5655208.00
1347	7	4093	Sredstva za posebne namene	3340000.00
1348	7	41	TEKOČI TRANSFERI	5579463201.00
1349	7	410	Subvencije	683379463.00
1350	7	4100	Subvencije javnim podjetjem	69407620.00
1351	7	4101	Subvencije finančnim institucijam	4277249.00
1352	7	4102	Subvencije privatnim podjetjem in zasebnikom	609694593.00
1353	7	411	Transferi posameznikom in gospodinjstvom	1276986745.00
1354	7	4110	Transferi nezaposlenim	171486002.00
1355	7	4111	Družinski prejemki in starševska nadomestila	579454531.00
1356	7	4112	Transferi za zagotavljanje socialne varnosti	174831803.00
1357	7	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	79472220.00
1358	7	4117	Štipendije	118574323.00
1359	7	4119	Drugi transferi posameznikom	153167867.00
1360	7	412	Transferi neprofitnim organizacijam in ustanovam	100383830.00
1361	7	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	100383830.00
1362	7	413	Drugi tekoči domači transferi	3492462866.00
1363	7	4130	Tekoči transferi občinam	67841337.00
1364	7	4131	Tekoči transferi v sklade socialnega zavarovanja	1428939095.00
1365	7	4132	Tekoči transferi v javne sklade	11975217.00
1366	7	4133	Tekoči transferi v javne zavode	1889266883.00
1367	7	4134	Tekoči transferi v državni proračun	777408.00
1368	7	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	76391808.00
1369	7	4136	Tekoči transferi v javne agencije	17271119.00
1370	7	414	Tekoči transferi v tujino	26250297.00
1371	7	4140	Tekoči transferi mednarodnim institucijam	15554112.00
1372	7	4141	Tekoči transferi tujim vladam in vladnim institucijam	23737.00
1373	7	4142	Tekoči transferi neprofitnim organizacijam v tujini	1764962.00
1374	7	4143	Drugi tekoči transferi v tujino	8907486.00
1375	7	42	INVESTICIJSKI ODHODKI	507488010.00
1376	7	420	Nakup in gradnja osnovnih sredstev	507488010.00
1377	7	4200	Nakup zgradb in prostorov	15288650.00
1378	7	4201	Nakup prevoznih sredstev	6014756.00
1379	7	4202	Nakup opreme	74385233.00
1380	7	4203	Nakup drugih osnovnih sredstev	348259.00
1381	7	4204	Novogradnje, rekonstrukcije in adaptacije	211499110.00
1382	7	4205	Investicijsko vzdrževanje in obnove	81942992.00
1383	7	4206	Nakup zemljišč in naravnih bogastev	23936939.00
1384	7	4207	Nakup nematerialnega premoženja	27798430.00
1385	7	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	66273640.00
1386	7	43	INVESTICIJSKI TRANSFERI	727812475.00
1387	7	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	252027040.00
1388	7	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	13650070.00
1389	7	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	38786094.00
1390	7	4313	Investicijski transferi privatnim podjetjem	158463136.00
1391	7	4314	Investicijski transferi posameznikom in zasebnikom	36444048.00
1392	7	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	4658692.00
1393	7	4316	Investicijski transferi v tujino	25000.00
1394	7	432	Investicijski transferi proračunskim uporabnikom	475785435.00
1395	7	4320	Investicijski transferi občinam	359074182.00
1396	7	4321	Investicijski transferi javnim skladom in agencijam	5753422.00
1397	7	4323	Investicijski transferi javnim zavodom	110957831.00
1398	7	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	452045572.00
1399	7	450	Plačila sredstev v proračun Evropske unije	452045572.00
1400	7	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	98125200.00
1401	7	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	62118540.00
1402	7	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	254428035.00
1403	7	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Združenega Kraljestva	30233797.00
1404	7	4504	Plačila sredstev v proračun EU iz naslova popravkov BND vira v korist Kraljevin Nizozemske in Švedske	7140000.00
1405	7	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	21068487.00
1406	7	750	Prejeta vračila danih posojil	19875600.00
1407	7	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	33600.00
1408	7	7501	Prejeta vračila danih posojil - od javnih skladov	16260000.00
1409	7	7504	Prejeta vračila danih posojil od privatnih podjetij	3582000.00
1410	7	752	Kupnine iz naslova privatizacije	1192887.00
1411	7	7520	Sredstva kupnin iz naslova privatizacije	1192887.00
1412	7	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	675462052.00
1413	7	440	Dana posojila	102479534.00
1414	7	4404	Dana posojila privatnim podjetjem	90423066.00
1415	7	4409	Plačila zapadlih poroštev	12056468.00
1416	7	441	Povečanje kapitalskih deležev in finančnih naložb	559820607.00
1417	7	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	80000000.00
1418	7	4411	Povečanje kapitalskih deležev v finančnih institucijah	460000000.00
1419	7	4414	Povečanje kapitalskih deležev v tujino	9820607.00
1420	7	4415	Povečanje drugih finančnih naložb	10000000.00
1421	7	442	Poraba sredstev kupnin iz naslova privatizacije	5769183.00
1422	7	4420	Dana posojila iz sredstev kupnin	2522562.00
1423	7	4421	Sredstva kupnin, razporejena v javne sklade in agencije	1197629.00
1424	7	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	2048992.00
1425	7	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	7392728.00
1426	7	4430	Povečanje  namenskega premoženja v javnih skladih	7392728.00
1427	7	50	ZADOLŽEVANJE	3347432617.00
1428	7	500	Domače zadolževanje	0.00
1429	7	5000	Najeti krediti pri Banki Slovenije	0.00
1431	7	550	Odplačila domačega dolga	428151240.00
1432	7	5501	Odplačila kreditov poslovnim bankam	65097647.00
1433	7	5503	Odplačila kreditov drugim domačim kreditodajalcem	55000000.00
1434	7	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	308053593.00
1435	7	551	Odplačila dolga v tujino	425648960.00
1436	7	5510	Odplačila dolga mednarodnim finančnim institucijam	18900000.00
1437	7	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6748960.00
1438	7	5514	Odplačila glavnice vrednostnih papirjev, izdanih na tujih trgih	400000000.00
1439	8	70	DAVČNI PRIHODKI	7491316356.00
1440	8	700	Davki na dohodek in dobiček	2172818357.00
1441	8	7000	Dohodnina	1114781920.00
1442	8	7001	Davek od dohodkov pravnih oseb	1058036437.00
1443	8	701	Prispevki za socialno varnost	54958166.00
1444	8	7010	Prispevki zaposlenih	30819951.00
1445	8	7011	Prispevki delodajalcev	20506679.00
1446	8	7012	Prispevki samozaposlenih	2653011.00
1447	8	7013	Ostali prispevki za socialno varnost	978525.00
1448	8	702	Davki na plačilno listo in delovno silo	29181098.00
1449	8	7021	Posebni davek na določene prejemke	29181098.00
1450	8	704	Domači davki na blago in storitve	5113139755.00
1451	8	7040	Davek na dodano vrednost	3250948486.00
1452	8	7041	Drugi davki na blago in storitve	30351454.00
1453	8	7042	Trošarine (akcize)	1499249287.00
1454	8	7044	Davki na posebne storitve	132099096.00
1455	8	7046	Letna dajatev za uporabo vozil v cestnem prometu	106409952.00
1456	8	7047	Drugi davki na uporabo blaga in storitev	43520546.00
1457	8	7048	Davki od prometa motornih vozil	50560934.00
1458	8	705	Davki na mednarodno trgovino in transakcije	119394710.00
1459	8	7050	Carine	117817359.00
1460	8	7051	Druge uvozne dajatve	1577351.00
1461	8	706	Drugi davki	1824270.00
1462	8	7060	Drugi davki	1824270.00
1463	8	71	NEDAVČNI PRIHODKI	390432306.00
1464	8	710	Udeležba na dobičku in dohodki od premoženja	171991807.00
1465	8	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	87633000.00
1466	8	7102	Prihodki od obresti	15000000.00
1467	8	7103	Prihodki od premoženja	69358807.00
1468	8	711	Takse in pristojbine	73099789.00
1469	8	7110	Sodne takse	36437830.00
1470	8	7111	Upravne takse in pristojbine	36661959.00
1471	8	712	Globe in druge denarne kazni	66157132.00
1472	8	7120	Globe in druge denarne kazni	66157132.00
1473	8	713	Prihodki od prodaje blaga in storitev	10129289.00
1474	8	7130	Prihodki od prodaje blaga in storitev	10129289.00
1475	8	714	Drugi nedavčni prihodki	69054289.00
1476	8	7141	Drugi nedavčni prihodki	69054289.00
1477	8	72	KAPITALSKI PRIHODKI	20521372.00
1478	8	720	Prihodki od prodaje osnovnih sredstev	19216019.00
1479	8	7200	Prihodki od prodaje zgradb in prostorov	17883240.00
1480	8	7201	Prihodki od prodaje prevoznih sredstev	1088636.00
1481	8	7202	Prihodki od prodaje opreme	213038.00
1482	8	7203	Prihodki od prodaje drugih osnovnih sredstev	31105.00
1483	8	722	Prihodki od prodaje zemljišč in neopredmetenih sredstev	1305353.00
1484	8	7220	Prihodki od prodaje kmetijskih zemljišč in gozdov	11200.00
1485	8	7221	Prihodki od prodaje stavbnih zemljišč	1294153.00
1486	8	73	PREJETE DONACIJE	6004434.00
1487	8	730	Prejete donacije iz domačih virov	171194.00
1488	8	7300	Prejete donacije in darila od domačih pravnih oseb	171194.00
1489	8	731	Prejete donacije iz tujine	5833240.00
1490	8	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	2284387.00
1491	8	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	3504087.00
1492	8	7312	Prejete donacije in darila od tujih pravnih oseb	44766.00
1493	8	74	TRANSFERNI PRIHODKI	735368.00
1494	8	740	Transferni prihodki iz drugih javnofinančnih institucij	735368.00
1495	8	7400	Prejeta sredstva iz državnega proračuna	718424.00
1496	8	7402	Prejeta sredstva iz skladov socialnega zavarovanja	16944.00
1497	8	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	873655548.00
1498	8	780	Predpristopna sredstva Evropske unije	14732900.00
1499	8	7800	Prejeta sredstva PHARE	252900.00
1500	8	7801	Prejeta sredstva ISPA	14480000.00
1501	8	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	241621351.00
1502	8	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	38634634.00
1503	8	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	66952300.00
1589	8	4206	Nakup zemljišč in naravnih bogastev	25513049.00
1504	8	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega sklada za razvoj podeželja (EKSRP)	136034417.00
1505	8	782	Prejeta sredstva iz proračuna EU za strukturno politiko	460204459.00
1506	8	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	278107493.00
1507	8	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	182096966.00
1508	8	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	108684559.00
1509	8	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	108684559.00
1510	8	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	23395325.00
1511	8	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	23395325.00
1512	8	786	Ostala prejeta sredstva iz proračuna Evropske unije	5571383.00
1513	8	7860	Ostala prejeta sredstva iz proračuna EU	5571383.00
1514	8	788	Prejeta vračila sredstev iz proračuna Evropske unije	19445571.00
1515	8	7880	Prejeta vračila sredstev iz proračuna Evropske unije	19445571.00
1517	8	400	Plače in drugi izdatki zaposlenim	1038580222.00
1518	8	4000	Plače in dodatki	882237347.00
1519	8	4001	Regres za letni dopust	27802321.00
1520	8	4002	Povračila in nadomestila	96751004.00
1521	8	4003	Sredstva za delovno uspešnost	14011819.00
1522	8	4004	Sredstva za nadurno delo	10636107.00
1523	8	4005	Plače za delo nerezidentov po pogodbi	13256.00
1524	8	4009	Drugi izdatki zaposlenim	7128367.00
1525	8	401	Prispevki delodajalcev za socialno varnost	182610163.00
1526	8	4010	Prispevek za pokojninsko in invalidsko zavarovanje	105099173.00
1527	8	4011	Prispevek za zdravstveno zavarovanje	60454936.00
1528	8	4012	Prispevek za zaposlovanje	528545.00
1529	8	4013	Prispevek za starševsko varstvo	871535.00
1530	8	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	15655973.00
1531	8	402	Izdatki za blago in storitve	933566977.00
1532	8	4020	Pisarniški in splošni material in storitve	131823716.00
1533	8	4021	Posebni material in storitve	266287088.00
1534	8	4022	Energija, voda, komunalne storitve in komunikacije	64955928.00
1535	8	4023	Prevozni stroški in storitve	45559118.00
1536	8	4024	Izdatki za službena potovanja	25977730.00
1537	8	4025	Tekoče vzdrževanje	191466688.00
1538	8	4026	Poslovne najemnine in zakupnine	65467229.00
1539	8	4027	Kazni in odškodnine	9364164.00
1540	8	4029	Drugi operativni odhodki	132665316.00
1550	8	409	Rezerve	37341272.00
1551	8	4090	Splošna proračunska rezervacija	28346064.00
1552	8	4091	Proračunska rezerva	5655208.00
1553	8	4093	Sredstva za posebne namene	3340000.00
1554	8	41	TEKOČI TRANSFERI	5579503486.00
1555	8	410	Subvencije	844784410.00
1556	8	4100	Subvencije javnim podjetjem	71327053.00
1557	8	4101	Subvencije finančnim institucijam	4277249.00
1558	8	4102	Subvencije privatnim podjetjem in zasebnikom	769180108.00
1559	8	411	Transferi posameznikom in gospodinjstvom	1248401870.00
1560	8	4110	Transferi nezaposlenim	139737563.00
1561	8	4111	Družinski prejemki in starševska nadomestila	585615033.00
1562	8	4112	Transferi za zagotavljanje socialne varnosti	155560501.00
1563	8	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	80291469.00
1564	8	4117	Štipendije	119287870.00
1565	8	4119	Drugi transferi posameznikom	167909434.00
1566	8	412	Transferi neprofitnim organizacijam in ustanovam	83522449.00
1567	8	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	83522449.00
1568	8	413	Drugi tekoči domači transferi	3376697201.00
1569	8	4130	Tekoči transferi občinam	66972554.00
1570	8	4131	Tekoči transferi v sklade socialnega zavarovanja	1303331324.00
1571	8	4132	Tekoči transferi v javne sklade	12696770.00
1572	8	4133	Tekoči transferi v javne zavode	1898731580.00
1573	8	4134	Tekoči transferi v državni proračun	639217.00
1574	8	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	76626678.00
1575	8	4136	Tekoči transferi v javne agencije	17699078.00
1576	8	414	Tekoči transferi v tujino	26097556.00
1577	8	4140	Tekoči transferi mednarodnim institucijam	15608025.00
1578	8	4141	Tekoči transferi tujim vladam in vladnim institucijam	33737.00
1579	8	4142	Tekoči transferi neprofitnim organizacijam v tujini	1523308.00
1580	8	4143	Drugi tekoči transferi v tujino	8932486.00
1581	8	42	INVESTICIJSKI ODHODKI	603300730.00
1582	8	420	Nakup in gradnja osnovnih sredstev	603300730.00
1583	8	4200	Nakup zgradb in prostorov	20673354.00
1584	8	4201	Nakup prevoznih sredstev	8568188.00
1585	8	4202	Nakup opreme	73623228.00
1586	8	4203	Nakup drugih osnovnih sredstev	360804.00
1587	8	4204	Novogradnje, rekonstrukcije in adaptacije	249320722.00
1588	8	4205	Investicijsko vzdrževanje in obnove	87271506.00
1674	9	7110	Sodne takse	42099637.00
1590	8	4207	Nakup nematerialnega premoženja	35518590.00
1591	8	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	102451289.00
1592	8	43	INVESTICIJSKI TRANSFERI	730109648.00
1593	8	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	290583286.00
1594	8	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	18309562.00
1595	8	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	51232691.00
1596	8	4313	Investicijski transferi privatnim podjetjem	178461204.00
1597	8	4314	Investicijski transferi posameznikom in zasebnikom	37877002.00
1598	8	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	4677827.00
1599	8	4316	Investicijski transferi v tujino	25000.00
1600	8	432	Investicijski transferi proračunskim uporabnikom	439526362.00
1601	8	4320	Investicijski transferi občinam	319029909.00
1602	8	4321	Investicijski transferi javnim skladom in agencijam	6269890.00
1603	8	4323	Investicijski transferi javnim zavodom	114226563.00
1604	8	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	452045572.00
1605	8	450	Plačila sredstev v proračun Evropske unije	452045572.00
1606	8	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	98125200.00
1607	8	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	62118540.00
1608	8	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	254428035.00
1609	8	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Združenega Kraljestva	30233797.00
1610	8	4504	Plačila sredstev v proračun EU iz naslova popravkov BND vira v korist Kraljevin Nizozemske in Švedske	7140000.00
1611	8	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	21068487.00
1612	8	750	Prejeta vračila danih posojil	19875600.00
1613	8	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	33600.00
1614	8	7501	Prejeta vračila danih posojil - od javnih skladov	16260000.00
1615	8	7504	Prejeta vračila danih posojil od privatnih podjetij	3582000.00
1616	8	752	Kupnine iz naslova privatizacije	1192887.00
1617	8	7520	Sredstva kupnin iz naslova privatizacije	1192887.00
1618	8	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	329759750.00
1619	8	440	Dana posojila	71363911.00
1620	8	4404	Dana posojila privatnim podjetjem	57762401.00
1621	8	4409	Plačila zapadlih poroštev	13601510.00
1622	8	441	Povečanje kapitalskih deležev in finančnih naložb	249820607.00
1623	8	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	80000000.00
1624	8	4411	Povečanje kapitalskih deležev v finančnih institucijah	160000000.00
1625	8	4414	Povečanje kapitalskih deležev v tujino	9820607.00
1626	8	442	Poraba sredstev kupnin iz naslova privatizacije	1182504.00
1627	8	4420	Dana posojila iz sredstev kupnin	162744.00
1628	8	4421	Sredstva kupnin, razporejena v javne sklade in agencije	944647.00
1629	8	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	75113.00
1630	8	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	7392728.00
1631	8	4430	Povečanje  namenskega premoženja v javnih skladih	7392728.00
1632	8	50	ZADOLŽEVANJE	2296167073.00
1633	8	500	Domače zadolževanje	0.00
1634	8	5000	Najeti krediti pri Banki Slovenije	0.00
1636	8	550	Odplačila domačega dolga	428151240.00
1637	8	5501	Odplačila kreditov poslovnim bankam	65097647.00
1638	8	5503	Odplačila kreditov drugim domačim kreditodajalcem	55000000.00
1639	8	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	308053593.00
1640	8	551	Odplačila dolga v tujino	425648960.00
1641	8	5510	Odplačila dolga mednarodnim finančnim institucijam	18900000.00
1642	8	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6748960.00
1643	8	5514	Odplačila glavnice vrednostnih papirjev, izdanih na tujih trgih	400000000.00
1644	9	70	DAVČNI PRIHODKI	7669825396.00
1645	9	700	Davki na dohodek in dobiček	2508766886.00
1646	9	7000	Dohodnina	1337105978.00
1647	9	7001	Davek od dohodkov pravnih oseb	1171660908.00
1648	9	701	Prispevki za socialno varnost	55866954.00
1649	9	7010	Prispevki zaposlenih	31293997.00
1650	9	7011	Prispevki delodajalcev	20691346.00
1651	9	7012	Prispevki samozaposlenih	2919642.00
1652	9	7013	Ostali prispevki za socialno varnost	961969.00
1653	9	702	Davki na plačilno listo in delovno silo	29305165.00
1654	9	7021	Posebni davek na določene prejemke	29305165.00
1655	9	704	Domači davki na blago in storitve	4930510749.00
1656	9	7040	Davek na dodano vrednost	3365243739.00
1657	9	7041	Drugi davki na blago in storitve	25614502.00
1658	9	7042	Trošarine (akcize)	1152451120.00
1659	9	7044	Davki na posebne storitve	154554254.00
1660	9	7046	Letna povračila za uporabo cest	110147816.00
1661	9	7047	Drugi davki na uporabo blaga in storitev	51099896.00
1662	9	7048	Davki na motorna vozila	71399422.00
1663	9	705	Davki na mednarodno trgovino in transakcije	143783269.00
1664	9	7050	Carine	143096513.00
1665	9	7051	Druge uvozne dajatve	686756.00
1666	9	706	Drugi davki	1592373.00
1667	9	7060	Drugi davki	1592373.00
1668	9	71	NEDAVČNI PRIHODKI	409392638.00
1669	9	710	Udeležba na dobičku in dohodki od premoženja	187218723.00
1670	9	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	115675080.00
1671	9	7102	Prihodki od obresti	12336000.00
1672	9	7103	Prihodki od premoženja	59207643.00
1673	9	711	Takse in pristojbine	83915964.00
1675	9	7111	Upravne takse in pristojbine	41816327.00
1676	9	712	Globe in druge denarne kazni	46469549.00
1677	9	7120	Globe in druge denarne kazni	46469549.00
1678	9	713	Prihodki od prodaje blaga in storitev	10666093.00
1679	9	7130	Prihodki od prodaje blaga in storitev	10666093.00
1680	9	714	Drugi nedavčni prihodki	81122309.00
1681	9	7141	Drugi nedavčni prihodki	81122309.00
1682	9	72	KAPITALSKI PRIHODKI	15406889.00
1683	9	720	Prihodki od prodaje osnovnih sredstev	15406889.00
1684	9	7200	Prihodki od prodaje zgradb in prostorov	15057989.00
1685	9	7201	Prihodki od prodaje prevoznih sredstev	288000.00
1686	9	7202	Prihodki od prodaje opreme	54000.00
1687	9	7203	Prihodki od prodaje drugih osnovnih sredstev	6900.00
1688	9	73	PREJETE DONACIJE	4900657.00
1689	9	730	Prejete donacije iz domačih virov	86464.00
1690	9	7300	Prejete donacije in darila od domačih pravnih oseb	86464.00
1691	9	731	Prejete donacije iz tujine	4814193.00
1692	9	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	4814193.00
1693	9	74	TRANSFERNI PRIHODKI	568700.00
1694	9	740	Transferni prihodki iz drugih javnofinančnih institucij	568700.00
1695	9	7400	Prejeta sredstva iz državnega proračuna	552075.00
1696	9	7402	Prejeta sredstva iz skladov socialnega zavarovanja	16625.00
1697	9	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	886667720.00
1698	9	780	Predpristopna sredstva Evropske unije	5095000.00
1699	9	7800	Prejeta sredstva PHARE	735000.00
1700	9	7801	Prejeta sredstva ISPA	4360000.00
1701	9	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	247281626.00
1702	9	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	38987401.00
1703	9	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	71950000.00
1704	9	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega sklada za razvoj podeželja (EKSRP)	136344225.00
1705	9	782	Prejeta sredstva iz proračuna EU za strukturno politiko	443195303.00
1706	9	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	268712070.00
1707	9	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	174483233.00
1708	9	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	157203244.00
1709	9	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	157203244.00
1710	9	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	27430895.00
1711	9	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	27430895.00
1712	9	786	Ostala prejeta sredstva iz proračuna Evropske unije	5878752.00
1713	9	7860	Ostala prejeta sredstva iz proračuna EU	5878752.00
1714	9	787	Prejeta sredstva od drugih evropskih institucij	582900.00
1715	9	7870	Prejeta sredstva od drugih evropskih institucij	582900.00
1717	9	400	Plače in drugi izdatki zaposlenim	983606070.00
1718	9	4000	Plače in dodatki	840568701.00
1719	9	4001	Regres za letni dopust	27055296.00
1720	9	4002	Povračila in nadomestila	86690354.00
1721	9	4003	Sredstva za delovno uspešnost	14564901.00
1722	9	4004	Sredstva za nadurno delo	7148581.00
1723	9	4009	Drugi izdatki zaposlenim	7578237.00
1724	9	401	Prispevki delodajalcev za socialno varnost	166234532.00
1725	9	4010	Prispevek za pokojninsko in invalidsko zavarovanje	95491847.00
1726	9	4011	Prispevek za zdravstveno zavarovanje	54417194.00
1727	9	4012	Prispevek za zaposlovanje	616264.00
1728	9	4013	Prispevek za starševsko varstvo	717282.00
1729	9	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	14991945.00
1730	9	402	Izdatki za blago in storitve	961002195.00
1731	9	4020	Pisarniški in splošni material in storitve	136410917.00
1732	9	4021	Posebni material in storitve	306441909.00
1733	9	4022	Energija, voda, komunalne storitve in komunikacije	65075740.00
1734	9	4023	Prevozni stroški in storitve	49485442.00
1735	9	4024	Izdatki za službena potovanja	24504372.00
1736	9	4025	Tekoče vzdrževanje	187979585.00
1737	9	4026	Poslovne najemnine in zakupnine	66577997.00
1738	9	4027	Kazni in odškodnine	8812559.00
1739	9	4029	Drugi operativni odhodki	115713674.00
1749	9	409	Rezerve	53862287.00
1750	9	4090	Splošna proračunska rezervacija	28322079.00
1751	9	4091	Proračunska rezerva	22200208.00
1752	9	4093	Sredstva za posebne namene	3340000.00
1753	9	41	TEKOČI TRANSFERI	4895249128.00
1754	9	410	Subvencije	518232625.00
1755	9	4100	Subvencije javnim podjetjem	60209074.00
1756	9	4101	Subvencije finančnim institucijam	4277249.00
1740	9	553	Plačila domačih obresti (403)	145732890.00
1757	9	4102	Subvencije privatnim podjetjem in zasebnikom	453746302.00
1758	9	411	Transferi posameznikom in gospodinjstvom	1035165695.00
1759	9	4110	Transferi nezaposlenim	108241248.00
1760	9	4111	Družinski prejemki in starševska nadomestila	511292604.00
1761	9	4112	Transferi za zagotavljanje socialne varnosti	148996056.00
1762	9	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	77352408.00
1763	9	4117	Štipendije	123543443.00
1764	9	4119	Drugi transferi posameznikom	65739936.00
1765	9	412	Transferi neprofitnim organizacijam in ustanovam	84820853.00
1766	9	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	84820853.00
1767	9	413	Drugi tekoči domači transferi	3232526616.00
1768	9	4130	Tekoči transferi občinam	24030453.00
1769	9	4131	Tekoči transferi v sklade socialnega zavarovanja	1281361785.00
1770	9	4132	Tekoči transferi v javne sklade	17044737.00
1771	9	4133	Tekoči transferi v javne zavode	1833789746.00
1772	9	4134	Tekoči transferi v državni proračun	502659.00
1773	9	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	59658540.00
1774	9	4136	Tekoči transferi v javne agencije	16138696.00
1775	9	414	Tekoči transferi v tujino	24503339.00
1776	9	4140	Tekoči transferi mednarodnim institucijam	14041469.00
1777	9	4141	Tekoči transferi tujim vladam in vladnim institucijam	30000.00
1778	9	4142	Tekoči transferi neprofitnim organizacijam v tujini	1483194.00
1779	9	4143	Drugi tekoči transferi v tujino	8948676.00
1780	9	42	INVESTICIJSKI ODHODKI	594694821.00
1781	9	420	Nakup in gradnja osnovnih sredstev	594694821.00
1782	9	4200	Nakup zgradb in prostorov	26585373.00
1783	9	4201	Nakup prevoznih sredstev	6628129.00
1784	9	4202	Nakup opreme	66175436.00
1785	9	4203	Nakup drugih osnovnih sredstev	89182.00
1786	9	4204	Novogradnje, rekonstrukcije in adaptacije	288611766.00
1787	9	4205	Investicijsko vzdrževanje in obnove	74385868.00
1788	9	4206	Nakup zemljišč in naravnih bogastev	20985031.00
1789	9	4207	Nakup nematerialnega premoženja	32877872.00
1790	9	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	78356164.00
1791	9	43	INVESTICIJSKI TRANSFERI	699046315.00
1792	9	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	266169764.00
1793	9	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	12345409.00
1794	9	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	80357941.00
1795	9	4313	Investicijski transferi privatnim podjetjem	152291554.00
1796	9	4314	Investicijski transferi posameznikom in zasebnikom	15553538.00
1797	9	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	5596322.00
1798	9	4316	Investicijski transferi v tujino	25000.00
1799	9	432	Investicijski transferi proračunskim uporabnikom	432876551.00
1800	9	4320	Investicijski transferi občinam	310345828.00
1801	9	4321	Investicijski transferi javnim skladom in agencijam	4425721.00
1802	9	4323	Investicijski transferi javnim zavodom	118105002.00
1803	9	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	399189114.00
1804	9	450	Plačila sredstev v proračun Evropske unije	399189114.00
1805	9	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	104757786.00
1806	9	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	56505227.00
1807	9	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	211448355.00
1808	9	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Velike Britanije	26477746.00
1809	9	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	21068487.00
1810	9	750	Prejeta vračila danih posojil	19875600.00
1811	9	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	33600.00
1812	9	7501	Prejeta vračila danih posojil - od javnih skladov	16260000.00
1813	9	7504	Prejeta vračila danih posojil od privatnih podjetij	3582000.00
1814	9	752	Kupnine iz naslova privatizacije	1192887.00
1815	9	7520	Sredstva kupnin iz naslova privatizacije	1192887.00
1816	9	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	48117675.00
1817	9	440	Dana posojila	10776581.00
1818	9	4404	Dana posojila privatnim podjetjem	2712401.00
1819	9	4409	Plačila zapadlih poroštev	8064180.00
1820	9	441	Povečanje kapitalskih deležev in finančnih naložb	28840607.00
1821	9	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	20000000.00
1822	9	4414	Povečanje kapitalskih deležev v tujino	8840607.00
1823	9	442	Poraba sredstev kupnin iz naslova privatizacije	1107759.00
1824	9	4420	Dana posojila iz sredstev kupnin	162744.00
1825	9	4421	Sredstva kupnin, razporejena v javne sklade in agencije	869902.00
1826	9	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	75113.00
1827	9	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	7392728.00
1828	9	4430	Povečanje  namenskega premoženja v javnih skladih	7392728.00
1829	9	50	ZADOLŽEVANJE	868485560.00
1830	9	500	Domače zadolževanje	0.00
1831	9	5000	Najeti krediti pri Banki Slovenije	0.00
1833	9	550	Odplačila domačega dolga	291044162.00
1834	9	5501	Odplačila kreditov poslovnim bankam	72760969.00
1835	9	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	218283193.00
1836	9	551	Odplačila dolga v tujino	424986825.00
1837	9	5510	Odplačila dolga mednarodnim finančnim institucijam	18237865.00
1838	9	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6748960.00
1839	9	5514	Odplačila glavnice vrednostnih papirjev, izdanih na tujih trgih	400000000.00
1840	10	70	DAVČNI PRIHODKI	7587441701.00
1841	10	700	Davki na dohodek in dobiček	2373377213.00
1842	10	7000	Dohodnina	1113325165.00
1843	10	7001	Davek od dohodkov pravnih oseb	1260052048.00
1844	10	701	Prispevki za socialno varnost	52686050.00
1845	10	7010	Prispevki zaposlenih	29512889.00
1846	10	7011	Prispevki delodajalcev	19607762.00
1847	10	7012	Prispevki samozaposlenih	2667100.00
1848	10	7013	Ostali prispevki za socialno varnost	898299.00
1849	10	702	Davki na plačilno listo in delovno silo	262913900.00
1850	10	7020	Davek na izplačane plače	234061630.00
1851	10	7021	Posebni davek na določene prejemke	28852270.00
1852	10	704	Domači davki na blago in storitve	4766751560.00
1853	10	7040	Davek na dodano vrednost	3185837630.00
1854	10	7041	Drugi davki na blago in storitve	25029840.00
1855	10	7042	Trošarine (akcize)	1190386170.00
1856	10	7044	Davki na posebne storitve	140162060.00
1857	10	7046	Letna povračila za uporabo cest	106583380.00
1858	10	7047	Drugi davki na uporabo blaga in storitev	49708070.00
1859	10	7048	Davki na motorna vozila	69044410.00
1860	10	705	Davki na mednarodno trgovino in transakcije	130120605.00
1861	10	7050	Carine	129499107.00
1862	10	7051	Druge uvozne dajatve	621498.00
1863	10	706	Drugi davki	1592373.00
1864	10	7060	Drugi davki	1592373.00
1865	10	71	NEDAVČNI PRIHODKI	486114471.00
1866	10	710	Udeležba na dobičku in dohodki od premoženja	191772110.00
1867	10	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	115320350.00
1868	10	7102	Prihodki od obresti	20775000.00
1869	10	7103	Prihodki od premoženja	55676760.00
1870	10	711	Takse in pristojbine	71884310.00
1871	10	7110	Sodne takse	34838940.00
1872	10	7111	Upravne takse in pristojbine	37045370.00
1873	10	712	Globe in druge denarne kazni	54907290.00
1874	10	7120	Globe in druge denarne kazni	54907290.00
1875	10	713	Prihodki od prodaje blaga in storitev	10375577.00
1876	10	7130	Prihodki od prodaje blaga in storitev	10375577.00
1877	10	714	Drugi nedavčni prihodki	157175184.00
1878	10	7141	Drugi nedavčni prihodki	157175184.00
1879	10	72	KAPITALSKI PRIHODKI	16416003.00
1880	10	720	Prihodki od prodaje osnovnih sredstev	16416003.00
1881	10	7200	Prihodki od prodaje zgradb in prostorov	16052590.00
1882	10	7201	Prihodki od prodaje prevoznih sredstev	298746.00
1883	10	7202	Prihodki od prodaje opreme	56715.00
1884	10	7203	Prihodki od prodaje drugih osnovnih sredstev	7952.00
1885	10	73	PREJETE DONACIJE	11389077.00
1886	10	730	Prejete donacije iz domačih virov	84355.00
1887	10	7300	Prejete donacije in darila od domačih pravnih oseb	84355.00
1888	10	731	Prejete donacije iz tujine	11304722.00
1889	10	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	4399956.00
1890	10	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	6904766.00
1891	10	74	TRANSFERNI PRIHODKI	553210.00
1892	10	740	Transferni prihodki iz drugih javnofinančnih institucij	553210.00
1893	10	7400	Prejeta sredstva iz državnega proračuna	537038.00
1894	10	7402	Prejeta sredstva iz skladov socialnega zavarovanja	16172.00
1895	10	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	783000431.00
1896	10	780	Predpristopna sredstva Evropske unije	5721700.00
1897	10	7800	Prejeta sredstva PHARE	2121700.00
1898	10	7801	Prejeta sredstva ISPA	3600000.00
1899	10	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	225976631.00
1900	10	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	45048396.00
1901	10	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	56463131.00
1902	10	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega sklada za razvoj podeželja (EKSRP)	124465104.00
1903	10	782	Prejeta sredstva iz proračuna EU za strukturno politiko	413920936.00
1904	10	7820	Prejeta sredstva iz proračuna EU iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Usmerjevalni del (EAGGF - Guidance Fund)	4731112.00
1905	10	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	325942336.00
1906	10	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	82873488.00
1907	10	7823	Prejeta sredstva iz proračuna EU iz naslova Finančnega instrumenta za usmerjanje ribištva (FIFG)	374000.00
1908	10	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	105258238.00
1909	10	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	105258238.00
1910	10	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	23467755.00
1911	10	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	23467755.00
1912	10	786	Ostala prejeta sredstva iz proračuna Evropske unije	5269640.00
1913	10	7860	Ostala prejeta sredstva iz proračuna EU	5269640.00
1914	10	787	Prejeta sredstva od drugih evropskih institucij	3385531.00
1915	10	7870	Prejeta sredstva od drugih evropskih institucij	3385531.00
1917	10	400	Plače in drugi izdatki zaposlenim	967214574.00
1918	10	4000	Plače in dodatki	820035385.00
1919	10	4001	Regres za letni dopust	27433882.00
1920	10	4002	Povračila in nadomestila	87152068.00
1921	10	4003	Sredstva za delovno uspešnost	16339272.00
1922	10	4004	Sredstva za nadurno delo	8483108.00
1923	10	4005	Plače za delo nerezidentov po pogodbi	100.00
1924	10	4009	Drugi izdatki zaposlenim	7770759.00
1925	10	401	Prispevki delodajalcev za socialno varnost	169207753.00
1926	10	4010	Prispevek za pokojninsko in invalidsko zavarovanje	97731914.00
1927	10	4011	Prispevek za zdravstveno zavarovanje	54835544.00
1928	10	4012	Prispevek za zaposlovanje	613693.00
1929	10	4013	Prispevek za starševsko varstvo	878503.00
1930	10	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	15148099.00
1931	10	402	Izdatki za blago in storitve	941013174.00
1932	10	4020	Pisarniški in splošni material in storitve	145944168.00
1933	10	4021	Posebni material in storitve	238779618.00
1934	10	4022	Energija, voda, komunalne storitve in komunikacije	62198775.00
1935	10	4023	Prevozni stroški in storitve	49199492.00
1936	10	4024	Izdatki za službena potovanja	26957170.00
1937	10	4025	Tekoče vzdrževanje	201298082.00
1938	10	4026	Poslovne najemnine in zakupnine	67726664.00
1939	10	4027	Kazni in odškodnine	8836726.00
1940	10	4028	Davek na izplačane plače	19431825.00
1941	10	4029	Drugi operativni odhodki	120640654.00
1951	10	409	Rezerve	55897260.00
1952	10	4090	Splošna proračunska rezervacija	18398520.00
1953	10	4091	Proračunska rezerva	34158740.00
1954	10	4093	Sredstva za posebne namene	3340000.00
1955	10	41	TEKOČI TRANSFERI	4719853466.00
1956	10	410	Subvencije	518016576.00
1957	10	4100	Subvencije javnim podjetjem	75146378.00
1958	10	4101	Subvencije finančnim institucijam	4172926.00
1959	10	4102	Subvencije privatnim podjetjem in zasebnikom	438697272.00
1960	10	411	Transferi posameznikom in gospodinjstvom	1045641519.00
1961	10	4110	Transferi nezaposlenim	103002633.00
1962	10	4111	Družinski prejemki in starševska nadomestila	540318968.00
1963	10	4112	Transferi za zagotavljanje socialne varnosti	142020753.00
1964	10	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	76778448.00
1965	10	4117	Štipendije	109415230.00
1966	10	4119	Drugi transferi posameznikom	74105488.00
1967	10	412	Transferi neprofitnim organizacijam in ustanovam	84647586.00
1968	10	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	84647586.00
1969	10	413	Drugi tekoči domači transferi	3041324992.00
1970	10	4130	Tekoči transferi občinam	22812784.00
1971	10	4131	Tekoči transferi v sklade socialnega zavarovanja	1169980381.00
1972	10	4132	Tekoči transferi v javne sklade	15407788.00
1973	10	4133	Tekoči transferi v javne zavode	1752602518.00
1974	10	4134	Tekoči transferi v državni proračun	494554.00
1975	10	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	62876718.00
1976	10	4136	Tekoči transferi v javne agencije	17150249.00
1977	10	414	Tekoči transferi v tujino	30222792.00
1978	10	4140	Tekoči transferi mednarodnim institucijam	19525698.00
1979	10	4141	Tekoči transferi tujim vladam in vladnim institucijam	60544.00
1980	10	4142	Tekoči transferi neprofitnim organizacijam v tujini	1496867.00
1981	10	4143	Drugi tekoči transferi v tujino	9139683.00
1982	10	42	INVESTICIJSKI ODHODKI	611833340.00
1983	10	420	Nakup in gradnja osnovnih sredstev	611833340.00
1984	10	4200	Nakup zgradb in prostorov	18821377.00
1985	10	4201	Nakup prevoznih sredstev	6022781.00
1986	10	4202	Nakup opreme	51519166.00
1987	10	4203	Nakup drugih osnovnih sredstev	327393.00
1988	10	4204	Novogradnje, rekonstrukcije in adaptacije	302885753.00
1989	10	4205	Investicijsko vzdrževanje in obnove	85948095.00
1990	10	4206	Nakup zemljišč in naravnih bogastev	25138870.00
1991	10	4207	Nakup nematerialnega premoženja	31611544.00
1992	10	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	89558361.00
1993	10	43	INVESTICIJSKI TRANSFERI	647109442.00
1994	10	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	233874781.00
1995	10	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	8006398.00
1996	10	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	61733297.00
1997	10	4313	Investicijski transferi privatnim podjetjem	136645308.00
1998	10	4314	Investicijski transferi posameznikom in zasebnikom	23126392.00
1999	10	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	4338049.00
2000	10	4316	Investicijski transferi v tujino	25336.00
2001	10	432	Investicijski transferi proračunskim uporabnikom	413234661.00
2002	10	4320	Investicijski transferi občinam	306630437.00
2003	10	4321	Investicijski transferi javnim skladom in agencijam	5422338.00
2004	10	4323	Investicijski transferi javnim zavodom	101181886.00
2005	10	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	375310057.00
2006	10	450	Plačila sredstev v proračun Evropske unije	375310057.00
2007	10	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	95061737.00
2008	10	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	52979183.00
2009	10	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	203349808.00
2010	10	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Velike Britanije	23919329.00
2011	10	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	35477672.00
2012	10	750	Prejeta vračila danih posojil	34257093.00
2013	10	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	32700.00
2014	10	7501	Prejeta vračila danih posojil - od javnih skladov	30740000.00
2015	10	7504	Prejeta vračila danih posojil od privatnih podjetij	3484393.00
2016	10	752	Kupnine iz naslova privatizacije	1220579.00
2017	10	7520	Sredstva kupnin iz naslova privatizacije	1220579.00
2018	10	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	193458902.00
2019	10	440	Dana posojila	14538616.00
2020	10	4404	Dana posojila privatnim podjetjem	2712401.00
2021	10	4409	Plačila zapadlih poroštev	11826215.00
2022	10	441	Povečanje kapitalskih deležev in finančnih naložb	165271615.00
2023	10	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	20005000.00
2024	10	4411	Povečanje kapitalskih deležev v finančnih institucijah	127585401.00
2025	10	4414	Povečanje kapitalskih deležev v tujino	17681214.00
2026	10	442	Poraba sredstev kupnin iz naslova privatizacije	1114169.00
2027	10	4420	Dana posojila iz sredstev kupnin	162744.00
2028	10	4421	Sredstva kupnin, razporejena v javne sklade in agencije	876312.00
2029	10	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	75113.00
2030	10	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	12534502.00
2031	10	4430	Povečanje  namenskega premoženja v javnih skladih	12534502.00
2032	10	50	ZADOLŽEVANJE	1094722785.00
2033	10	500	Domače zadolževanje	0.00
2034	10	5000	Najeti krediti pri Banki Slovenije	0.00
2036	10	550	Odplačila domačega dolga	1198381821.00
2037	10	5501	Odplačila kreditov poslovnim bankam	73432682.00
2038	10	5503	Odplačila kreditov drugim domačim kreditodajalcem	440000000.00
2039	10	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	684949139.00
2040	10	551	Odplačila dolga v tujino	42717525.00
2041	10	5510	Odplačila dolga mednarodnim finančnim institucijam	35968685.00
2042	10	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6748840.00
2043	11	70	DAVČNI PRIHODKI	7324383201.00
2044	11	700	Davki na dohodek in dobiček	2210932213.00
2045	11	7000	Dohodnina	1113325165.00
2046	11	7001	Davek od dohodkov pravnih oseb	1097607048.00
2047	11	701	Prispevki za socialno varnost	52497581.00
2048	11	7010	Prispevki zaposlenih	29406636.00
2049	11	7011	Prispevki delodajalcev	19443437.00
2050	11	7012	Prispevki samozaposlenih	2743556.00
2051	11	7013	Ostali prispevki za socialno varnost	903952.00
2052	11	702	Davki na plačilno listo in delovno silo	262215453.00
2053	11	7020	Davek na izplačane plače	234677702.00
2054	11	7021	Posebni davek na določene prejemke	27537751.00
2055	11	704	Domači davki na blago in storitve	4667024976.00
2056	11	7040	Davek na dodano vrednost	3158048484.00
2057	11	7041	Drugi davki na blago in storitve	24404340.00
2058	11	7042	Trošarine (akcize)	1118874559.00
2059	11	7044	Davki na posebne storitve	144286670.00
2060	11	7046	Letna povračila za uporabo cest	105046746.00
2061	11	7047	Drugi davki na uporabo blaga in storitev	49708070.00
2062	11	7048	Davki na motorna vozila	66656107.00
2063	11	705	Davki na mednarodno trgovino in transakcije	130120605.00
2064	11	7050	Carine	129499107.00
2065	11	7051	Druge uvozne dajatve	621498.00
2066	11	706	Drugi davki	1592373.00
2067	11	7060	Drugi davki	1592373.00
2068	11	71	NEDAVČNI PRIHODKI	480513107.00
2069	11	710	Udeležba na dobičku in dohodki od premoženja	186128189.00
2070	11	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	115320350.00
2071	11	7102	Prihodki od obresti	12000000.00
2072	11	7103	Prihodki od premoženja	58807839.00
2073	11	711	Takse in pristojbine	81630316.00
2074	11	7110	Sodne takse	40952955.00
2075	11	7111	Upravne takse in pristojbine	40677361.00
2076	11	712	Globe in druge denarne kazni	45203841.00
2077	11	7120	Globe in druge denarne kazni	45203841.00
2078	11	713	Prihodki od prodaje blaga in storitev	10375577.00
2079	11	7130	Prihodki od prodaje blaga in storitev	10375577.00
2080	11	714	Drugi nedavčni prihodki	157175184.00
2081	11	7141	Drugi nedavčni prihodki	157175184.00
2082	11	72	KAPITALSKI PRIHODKI	16416003.00
2083	11	720	Prihodki od prodaje osnovnih sredstev	16416003.00
2084	11	7200	Prihodki od prodaje zgradb in prostorov	16052590.00
2085	11	7201	Prihodki od prodaje prevoznih sredstev	298746.00
2086	11	7202	Prihodki od prodaje opreme	56715.00
2087	11	7203	Prihodki od prodaje drugih osnovnih sredstev	7952.00
2088	11	73	PREJETE DONACIJE	11389077.00
2089	11	730	Prejete donacije iz domačih virov	84355.00
2090	11	7300	Prejete donacije in darila od domačih pravnih oseb	84355.00
2091	11	731	Prejete donacije iz tujine	11304722.00
2092	11	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	4399956.00
2093	11	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	6904766.00
2094	11	74	TRANSFERNI PRIHODKI	553210.00
2095	11	740	Transferni prihodki iz drugih javnofinančnih institucij	553210.00
2096	11	7400	Prejeta sredstva iz državnega proračuna	537038.00
2097	11	7402	Prejeta sredstva iz skladov socialnega zavarovanja	16172.00
2098	11	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	801531588.00
2099	11	780	Predpristopna sredstva Evropske unije	5721700.00
2100	11	7800	Prejeta sredstva PHARE	2121700.00
2101	11	7801	Prejeta sredstva ISPA	3600000.00
2102	11	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	222400948.00
2103	11	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	31854866.00
2104	11	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	56463131.00
2105	11	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega sklada za razvoj podeželja (EKSRP)	134082951.00
2106	11	782	Prejeta sredstva iz proračuna EU za strukturno politiko	433224552.00
2107	11	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	318997209.00
2108	11	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	114227343.00
2109	11	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	105258238.00
2110	11	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	105258238.00
2111	11	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	23467755.00
2112	11	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	23467755.00
2113	11	786	Ostala prejeta sredstva iz proračuna Evropske unije	8072864.00
2114	11	7860	Ostala prejeta sredstva iz proračuna EU	8072864.00
2115	11	787	Prejeta sredstva od drugih evropskih institucij	3385531.00
2116	11	7870	Prejeta sredstva od drugih evropskih institucij	3385531.00
2118	11	400	Plače in drugi izdatki zaposlenim	952055691.00
2119	11	4000	Plače in dodatki	807806920.00
2120	11	4001	Regres za letni dopust	27093441.00
2121	11	4002	Povračila in nadomestila	86514818.00
2122	11	4003	Sredstva za delovno uspešnost	14670234.00
2123	11	4004	Sredstva za nadurno delo	8259794.00
2124	11	4009	Drugi izdatki zaposlenim	7710484.00
2125	11	401	Prispevki delodajalcev za socialno varnost	165793193.00
2126	11	4010	Prispevek za pokojninsko in invalidsko zavarovanje	95313925.00
2127	11	4011	Prispevek za zdravstveno zavarovanje	54046847.00
2128	11	4012	Prispevek za zaposlovanje	627260.00
2129	11	4013	Prispevek za starševsko varstvo	855053.00
2130	11	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	14950108.00
2131	11	402	Izdatki za blago in storitve	989471483.00
2132	11	4020	Pisarniški in splošni material in storitve	143532074.00
2133	11	4021	Posebni material in storitve	288366947.00
2134	11	4022	Energija, voda, komunalne storitve in komunikacije	64024746.00
2135	11	4023	Prevozni stroški in storitve	51170077.00
2136	11	4024	Izdatki za službena potovanja	28748939.00
2137	11	4025	Tekoče vzdrževanje	191889828.00
2138	11	4026	Poslovne najemnine in zakupnine	68006001.00
2139	11	4027	Kazni in odškodnine	9006284.00
2140	11	4028	Davek na izplačane plače	19742502.00
2141	11	4029	Drugi operativni odhodki	124984085.00
2151	11	409	Rezerve	43819625.00
2152	11	4090	Splošna proračunska rezervacija	19420885.00
2153	11	4091	Proračunska rezerva	21058740.00
2154	11	4093	Sredstva za posebne namene	3340000.00
2155	11	41	TEKOČI TRANSFERI	4685695762.00
2156	11	410	Subvencije	503066686.00
2157	11	4100	Subvencije javnim podjetjem	76058318.00
2158	11	4101	Subvencije finančnim institucijam	4172926.00
2159	11	4102	Subvencije privatnim podjetjem in zasebnikom	422835442.00
2160	11	411	Transferi posameznikom in gospodinjstvom	1012686093.00
2161	11	4110	Transferi nezaposlenim	113794312.00
2162	11	4111	Družinski prejemki in starševska nadomestila	498448968.00
2163	11	4112	Transferi za zagotavljanje socialne varnosti	149349384.00
2164	11	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	76778448.00
2165	11	4117	Štipendije	112500451.00
2166	11	4119	Drugi transferi posameznikom	61814530.00
2167	11	412	Transferi neprofitnim organizacijam in ustanovam	86859169.00
2168	11	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	86859169.00
2169	11	413	Drugi tekoči domači transferi	3059113783.00
2170	11	4130	Tekoči transferi občinam	23508226.00
2171	11	4131	Tekoči transferi v sklade socialnega zavarovanja	1203923581.00
2172	11	4132	Tekoči transferi v javne sklade	14850981.00
2173	11	4133	Tekoči transferi v javne zavode	1745510010.00
2174	11	4134	Tekoči transferi v državni proračun	494554.00
2175	11	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	54806113.00
2176	11	4136	Tekoči transferi v javne agencije	16020318.00
2177	11	414	Tekoči transferi v tujino	23970031.00
2142	11	553	Plačila domačih obresti (403)	199234839.00
2178	11	4140	Tekoči transferi mednarodnim institucijam	13254073.00
2179	11	4141	Tekoči transferi tujim vladam in vladnim institucijam	85583.00
2180	11	4142	Tekoči transferi neprofitnim organizacijam v tujini	1502849.00
2181	11	4143	Drugi tekoči transferi v tujino	9127526.00
2182	11	42	INVESTICIJSKI ODHODKI	646104080.00
2183	11	420	Nakup in gradnja osnovnih sredstev	646104080.00
2184	11	4200	Nakup zgradb in prostorov	23988258.00
2185	11	4201	Nakup prevoznih sredstev	6674084.00
2186	11	4202	Nakup opreme	59162473.00
2187	11	4203	Nakup drugih osnovnih sredstev	398246.00
2188	11	4204	Novogradnje, rekonstrukcije in adaptacije	317356343.00
2189	11	4205	Investicijsko vzdrževanje in obnove	92004410.00
2190	11	4206	Nakup zemljišč in naravnih bogastev	23510632.00
2191	11	4207	Nakup nematerialnega premoženja	31727414.00
2192	11	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	91282220.00
2193	11	43	INVESTICIJSKI TRANSFERI	678852348.00
2194	11	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	251739728.00
2195	11	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	10452584.00
2196	11	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	61921213.00
2197	11	4313	Investicijski transferi privatnim podjetjem	158731756.00
2198	11	4314	Investicijski transferi posameznikom in zasebnikom	16345417.00
2199	11	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	4263758.00
2200	11	4316	Investicijski transferi v tujino	25000.00
2201	11	432	Investicijski transferi proračunskim uporabnikom	427112620.00
2202	11	4320	Investicijski transferi občinam	318874946.00
2203	11	4321	Investicijski transferi javnim skladom in agencijam	5626115.00
2204	11	4323	Investicijski transferi javnim zavodom	102611559.00
2205	11	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	375310057.00
2206	11	450	Plačila sredstev v proračun Evropske unije	375310057.00
2207	11	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	95061737.00
2208	11	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	52979183.00
2209	11	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	203349808.00
2210	11	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Velike Britanije	23919329.00
2211	11	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	35477672.00
2212	11	750	Prejeta vračila danih posojil	34257093.00
2213	11	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	32700.00
2214	11	7501	Prejeta vračila danih posojil - od javnih skladov	30740000.00
2215	11	7504	Prejeta vračila danih posojil od privatnih podjetij	3484393.00
2216	11	752	Kupnine iz naslova privatizacije	1220579.00
2217	11	7520	Sredstva kupnin iz naslova privatizacije	1220579.00
2218	11	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	110873501.00
2219	11	440	Dana posojila	14543616.00
2220	11	4404	Dana posojila privatnim podjetjem	2712401.00
2221	11	4409	Plačila zapadlih poroštev	11831215.00
2222	11	441	Povečanje kapitalskih deležev in finančnih naložb	87681214.00
2223	11	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	20000000.00
2224	11	4411	Povečanje kapitalskih deležev v finančnih institucijah	50000000.00
2225	11	4414	Povečanje kapitalskih deležev v tujino	17681214.00
2226	11	442	Poraba sredstev kupnin iz naslova privatizacije	1114169.00
2227	11	4420	Dana posojila iz sredstev kupnin	162744.00
2228	11	4421	Sredstva kupnin, razporejena v javne sklade in agencije	876312.00
2229	11	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	75113.00
2230	11	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	7534502.00
2231	11	4430	Povečanje  namenskega premoženja v javnih skladih	7534502.00
2232	11	50	ZADOLŽEVANJE	1573427000.00
2233	11	500	Domače zadolževanje	0.00
2234	11	5000	Najeti krediti pri Banki Slovenije	0.00
2236	11	550	Odplačila domačega dolga	1396883821.00
2237	11	5501	Odplačila kreditov poslovnim bankam	73432682.00
2238	11	5503	Odplačila kreditov drugim domačim kreditodajalcem	637000000.00
2239	11	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	686451139.00
2240	11	551	Odplačila dolga v tujino	42717525.00
2241	11	5510	Odplačila dolga mednarodnim finančnim institucijam	35968685.00
2242	11	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6748840.00
2243	12	70	DAVČNI PRIHODKI	7116018260.00
2244	12	700	Davki na dohodek in dobiček	2030358376.00
2245	12	7000	Dohodnina	1070501807.00
2246	12	7001	Davek od dohodkov pravnih oseb	959856569.00
2247	12	701	Prispevki za socialno varnost	49644597.00
2248	12	7010	Prispevki zaposlenih	27743354.00
2249	12	7011	Prispevki delodajalcev	18309556.00
2250	12	7012	Prispevki samozaposlenih	2756249.00
2251	12	7013	Ostali prispevki za socialno varnost	835438.00
2252	12	702	Davki na plačilno listo in delovno silo	229004736.00
2253	12	7020	Davek na izplačane plače	202913026.00
2254	12	7021	Posebni davek na določene prejemke	26091710.00
2255	12	704	Domači davki na blago in storitve	4728081545.00
2256	12	7040	Davek na dodano vrednost	3172647734.00
2257	12	7041	Drugi davki na blago in storitve	33288691.00
2258	12	7042	Trošarine (akcize)	1146325511.00
2259	12	7044	Davki na posebne storitve	130172208.00
2260	12	7046	Letna povračila za uporabo cest	99621357.00
2261	12	7047	Drugi davki na uporabo blaga in storitev	95242105.00
2262	12	7048	Davki na motorna vozila	50783938.00
2263	12	705	Davki na mednarodno trgovino in transakcije	55295013.00
2264	12	7050	Carine	54891875.00
2265	12	7051	Druge uvozne dajatve	403138.00
2266	12	706	Drugi davki	23633993.00
2267	12	7060	Drugi davki	23633993.00
2268	12	71	NEDAVČNI PRIHODKI	400755901.00
2269	12	710	Udeležba na dobičku in dohodki od premoženja	160942526.00
2270	12	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	94828910.00
2271	12	7102	Prihodki od obresti	14911951.00
2272	12	7103	Prihodki od premoženja	51201665.00
2273	12	711	Takse in pristojbine	88962986.00
2274	12	7110	Sodne takse	44992744.00
2275	12	7111	Upravne takse in pristojbine	43970242.00
2276	12	712	Denarne kazni	38923210.00
2277	12	7120	Denarne kazni	38923210.00
2278	12	713	Prihodki od prodaje blaga in storitev	12089355.00
2279	12	7130	Prihodki od prodaje blaga in storitev	12089355.00
2280	12	714	Drugi nedavčni prihodki	99837823.00
2281	12	7141	Drugi nedavčni prihodki	99837823.00
2282	12	72	KAPITALSKI PRIHODKI	10432315.00
2283	12	720	Prihodki od prodaje osnovnih sredstev	10432315.00
2284	12	7200	Prihodki od prodaje zgradb in prostorov	10432315.00
2285	12	73	PREJETE DONACIJE	2138871.00
2286	12	730	Prejete donacije iz domačih virov	61042.00
2287	12	7300	Prejete donacije in darila od domačih pravnih oseb	61042.00
2288	12	731	Prejete donacije iz tujine	2077829.00
2289	12	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	2077829.00
2290	12	74	TRANSFERNI PRIHODKI	519113.00
2291	12	740	Transferni prihodki iz drugih javnofinančnih institucij	519113.00
2292	12	7400	Prejeta sredstva iz državnega proračuna	504258.00
2293	12	7402	Prejeta sredstva iz skladov socialnega zavarovanja	14855.00
2294	12	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	608885161.00
2295	12	780	Predpristopna sredstva Evropske unije	3340260.00
2296	12	7801	Prejeta sredstva ISPA	3340260.00
2297	12	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	136525309.00
2298	12	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund)	16691704.00
2299	12	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund)	57291579.00
2300	12	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund)	62542026.00
2301	12	782	Prejeta sredstva iz proračuna EU za strukturno politiko	327750401.00
2302	12	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	217116925.00
2303	12	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	110633475.00
2304	12	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	135999917.00
2305	12	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	135999917.00
2306	12	786	Ostala prejeta sredstva iz proračuna Evropske unije	5269275.00
2307	12	7860	Ostala prejeta sredstva iz proračuna EU	5269275.00
2309	12	400	Plače in drugi izdatki zaposlenim	902209737.00
2310	12	4000	Plače in dodatki	748031599.00
2311	12	4001	Regres za letni dopust	27373525.00
2312	12	4002	Povračila in nadomestila	92079673.00
2313	12	4003	Sredstva za delovno uspešnost	14541302.00
2314	12	4004	Sredstva za nadurno delo	10204363.00
2315	12	4009	Drugi izdatki zaposlenim	9979275.00
2316	12	401	Prispevki delodajalcev za socialno varnost	154688190.00
2317	12	4010	Prispevek za pokojninsko in invalidsko zavarovanje	86841428.00
2318	12	4011	Prispevek za zdravstveno zavarovanje	51345084.00
2319	12	4012	Prispevek za zaposlovanje	617528.00
2320	12	4013	Prispevek za starševsko varstvo	784299.00
2321	12	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	15099851.00
2322	12	402	Izdatki za blago in storitve	845378713.00
2323	12	4020	Pisarniški in splošni material in storitve	125201400.00
2324	12	4021	Posebni material in storitve	263441613.00
2325	12	4022	Energija, voda, komunalne storitve in komunikacije	65233397.00
2326	12	4023	Prevozni stroški in storitve	48236922.00
2327	12	4024	Izdatki za službena potovanja	26774512.00
2328	12	4025	Tekoče vzdrževanje	118928800.00
2329	12	4026	Poslovne najemnine in zakupnine	57969312.00
2330	12	4027	Kazni in odškodnine	8799916.00
2331	12	4028	Davek na izplačane plače	21091104.00
2332	12	4029	Drugi operativni odhodki	109701737.00
2342	12	409	Rezerve	94088330.00
2343	12	4090	Splošna proračunska rezervacija	33441547.00
2344	12	4091	Proračunska rezerva	21681990.00
2345	12	4092	Druge rezerve	35626452.00
2346	12	4093	Sredstva za posebne namene	3338341.00
2347	12	41	TEKOČI TRANSFERI	4737789751.00
2333	12	553	Plačila domačih obresti (403)	264286966.00
2348	12	410	Subvencije	513905980.00
2349	12	4100	Subvencije javnim podjetjem	85435922.00
2350	12	4101	Subvencije finančnim institucijam	4172926.00
2351	12	4102	Subvencije privatnim podjetjem in zasebnikom	424297132.00
2352	12	411	Transferi posameznikom in gospodinjstvom	981360989.00
2353	12	4110	Transferi nezaposlenim	114554279.00
2354	12	4111	Družinski prejemki in starševska nadomestila	464570940.00
2355	12	4112	Transferi za zagotavljanje socialne varnosti	158038363.00
2356	12	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	74959440.00
2357	12	4117	Štipendije	106563279.00
2358	12	4119	Drugi transferi posameznikom	62674688.00
2359	12	412	Transferi neprofitnim organizacijam in ustanovam	74925817.00
2360	12	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	74925817.00
2361	12	413	Drugi tekoči domači transferi	3148314818.00
2362	12	4130	Tekoči transferi občinam	17176917.00
2363	12	4131	Tekoči transferi v sklade socialnega zavarovanja	1227056594.00
2364	12	4132	Tekoči transferi v javne sklade	13511425.00
2365	12	4133	Tekoči transferi v javne zavode	1713071243.00
2366	12	4134	Tekoči transferi v državni proračun	473608.00
2367	12	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	44233887.00
2368	12	4136	Tekoči transferi v javne agencije	132791144.00
2369	12	414	Tekoči transferi v tujino	19282147.00
2370	12	4140	Tekoči transferi mednarodnim institucijam	9318463.00
2371	12	4141	Tekoči transferi tujim vladam in vladnim institucijam	20114.00
2372	12	4142	Tekoči transferi neprofitnim organizacijam v tujini	1427368.00
2373	12	4143	Drugi tekoči transferi v tujino	8516202.00
2374	12	42	INVESTICIJSKI ODHODKI	401365137.00
2375	12	420	Nakup in gradnja osnovnih sredstev	401365137.00
2376	12	4200	Nakup zgradb in prostorov	26930494.00
2377	12	4201	Nakup prevoznih sredstev	5377927.00
2378	12	4202	Nakup opreme	59719053.00
2379	12	4203	Nakup drugih osnovnih sredstev	140642.00
2380	12	4204	Novogradnje, rekonstrukcije in adaptacije	185922232.00
2381	12	4205	Investicijsko vzdrževanje in obnove	51613267.00
2382	12	4206	Nakup zemljišč in naravnih bogastev	10024457.00
2383	12	4207	Nakup nematerialnega premoženja	32635097.00
2384	12	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	29001968.00
2385	12	43	INVESTICIJSKI TRANSFERI	612319641.00
2386	12	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	182810135.00
2387	12	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	22373366.00
2388	12	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	73683722.00
2389	12	4313	Investicijski transferi privatnim podjetjem	76027146.00
2390	12	4314	Investicijski transferi posameznikom in zasebnikom	9973792.00
2391	12	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	752109.00
2392	12	432	Investicijski transferi proračunskim uporabnikom	429509506.00
2393	12	4320	Investicijski transferi občinam	288864811.00
2394	12	4321	Investicijski transferi javnim skladom in agencijam	61425393.00
2395	12	4323	Investicijski transferi javnim zavodom	79219302.00
2396	12	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	353186703.00
2397	12	450	Plačila sredstev v proračun Evropske unije	353186703.00
2398	12	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	45232040.00
2399	12	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	54919009.00
2400	12	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	228250477.00
2401	12	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Velike Britanije	24785177.00
2402	12	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	35618294.00
2403	12	750	Prejeta vračila danih posojil	34366416.00
2404	12	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	2370.00
2405	12	7501	Prejeta vračila danih posojil - od javnih skladov	30879653.00
2406	12	7504	Prejeta vračila danih posojil od privatnih podjetij	3484393.00
2407	12	752	Kupnine iz naslova privatizacije	1251878.00
2408	12	7520	Sredstva kupnin iz naslova privatizacije	1251878.00
2409	12	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	38004331.00
2410	12	440	Dana posojila	14543616.00
2411	12	4404	Dana posojila privatnim podjetjem	2712401.00
2412	12	4409	Plačila zapadlih poroštev	11831215.00
2413	12	441	Povečanje kapitalskih deležev in naložb	21436847.00
2414	12	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	3755634.00
2415	12	4414	Povečanje kapitalskih deležev v tujino	17681213.00
2416	12	442	Poraba sredstev kupnin iz naslova privatizacije	1251877.00
2417	12	4420	Dana posojila iz sredstev kupnin	269154.00
2418	12	4421	Sredstva kupnin, razporejena v javne sklade in agencije	907610.00
2419	12	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	75113.00
2420	12	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki	771991.00
2421	12	4430	Povečanje  namenskega premoženja v javnih skladih	771991.00
2422	12	50	ZADOLŽEVANJE	1386704678.00
2423	12	500	Domače zadolževanje	0.00
2424	12	5000	Najeti krediti pri Banki Slovenije	0.00
2426	12	550	Odplačila domačega dolga	1034251194.00
2427	12	5501	Odplačila kreditov poslovnim bankam	71431963.00
2428	12	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	962819231.00
2429	12	551	Odplačila dolga v tujino	43500729.00
2430	12	5510	Odplačila dolga mednarodnim finančnim institucijam	36752920.00
2686	14	7110	Sodne takse	44067330.00
2431	12	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6747809.00
2432	13	70	DAVČNI PRIHODKI	6782716203.00
2433	13	700	Davki na dohodek in dobiček	1919417700.00
2434	13	7000	Dohodnina	891626369.00
2435	13	7001	Davek od dohodkov pravnih oseb	1027791331.00
2436	13	701	Prispevki za socialno varnost	46834525.00
2437	13	7010	Prispevki zaposlenih	26172976.00
2438	13	7011	Prispevki delodajalcev	17273166.00
2439	13	7012	Prispevki samozaposlenih	2600235.00
2440	13	7013	Ostali prispevki za socialno varnost	788149.00
2441	13	702	Davki na plačilno listo in delovno silo	396941903.00
2442	13	7020	Davek na izplačane plače	372327082.00
2443	13	7021	Posebni davek na določene prejemke	24614821.00
2444	13	704	Domači davki na blago in storitve	4337330996.00
2445	13	7040	Davek na dodano vrednost	2834501541.00
2446	13	7041	Drugi davki na blago in storitve	31840623.00
2447	13	7042	Trošarine (akcize)	1120021807.00
2448	13	7044	Davki na posebne storitve	124738495.00
2449	13	7046	Letna povračila za uporabo cest	95659155.00
2450	13	7047	Drugi davki na uporabo blaga in storitev	81805245.00
2451	13	7048	Davki na motorna vozila	48764130.00
2452	13	705	Davki na mednarodno trgovino in transakcije	50268194.00
2453	13	7050	Carine	49901707.00
2454	13	7051	Druge uvozne dajatve	366487.00
2455	13	706	Drugi davki	31922884.00
2456	13	7060	Drugi davki	31922884.00
2457	13	71	NEDAVČNI PRIHODKI	386856203.00
2458	13	710	Udeležba na dobičku in dohodki od premoženja	178604828.00
2459	13	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	103071274.00
2460	13	7102	Prihodki od obresti	14605241.00
2461	13	7103	Prihodki od premoženja	60928313.00
2462	13	711	Takse in pristojbine	87133189.00
2463	13	7110	Sodne takse	44067330.00
2464	13	7111	Upravne takse in pristojbine	43065859.00
2465	13	712	Globe in druge denarne kazni	38122634.00
2466	13	7120	Globe in druge denarne kazni	38122634.00
2467	13	713	Prihodki od prodaje blaga in storitev	11840699.00
2468	13	7130	Prihodki od prodaje blaga in storitev	11840699.00
2469	13	714	Drugi nedavčni prihodki	71154853.00
2470	13	7140	Drugi prostovoljni prispevki za socialno varnost	0.00
2471	13	7141	Drugi nedavčni prihodki	71154853.00
2472	13	72	KAPITALSKI PRIHODKI	10432315.00
2473	13	720	Prihodki od prodaje osnovnih sredstev	10432315.00
2474	13	7200	Prihodki od prodaje zgradb in prostorov	10432315.00
2475	13	7201	Prihodki od prodaje prevoznih sredstev	0.00
2476	13	7202	Prihodki od prodaje opreme	0.00
2477	13	7203	Prihodki od prodaje drugih osnovnih sredstev	0.00
2478	13	722	Prihodki od prodaje zemljišč in neopredmetenih dolgoročnih sredstev	0.00
2479	13	7220	Prihodki od prodaje kmetijskih zemljišč in gozdov	0.00
2480	13	7221	Prihodki od prodaje stavbnih zemljišč	0.00
2481	13	73	PREJETE DONACIJE	2094880.00
2482	13	730	Prejete donacije iz domačih virov	59786.00
2483	13	7300	Prejete donacije in darila od domačih pravnih oseb	59786.00
2484	13	731	Prejete donacije iz tujine	2035094.00
2485	13	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	2035094.00
2486	13	7311	Prejete donacije in darila od tujih vlad in vladnih institucij	0.00
2487	13	74	TRANSFERNI PRIHODKI	511246.00
2488	13	740	Transferni prihodki iz drugih javnofinančnih institucij	511246.00
2489	13	7400	Prejeta sredstva iz državnega proračuna	496611.00
2490	13	7402	Prejeta sredstva iz skladov socialnega zavarovanja	14635.00
2491	13	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	582120840.00
2492	13	780	Predpristopna sredstva Evropske unije	18703055.00
2493	13	7800	Prejeta sredstva PHARE	0.00
2494	13	7801	Prejeta sredstva ISPA	18703055.00
2495	13	7802	Prejeta sredstva SAPARD	0.00
2496	13	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	160994408.00
2497	13	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	16190953.00
2498	13	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	42146553.00
2499	13	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega sklada za razvoj podeželja (EKSRP)	102656902.00
2500	13	782	Prejeta sredstva iz proračuna EU za strukturno politiko	233111446.00
2501	13	7820	Prejeta sredstva iz proračuna EU iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Usmerjevalni del (EAGGF - Guidance Fund)	0.00
2502	13	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	149526657.00
2503	13	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	83584790.00
2504	13	7823	Prejeta sredstva iz proračuna EU iz naslova Finančnega instrumenta za usmerjanje ribištva (FIFG)	0.00
2505	13	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	96855024.00
2506	13	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	96855024.00
2507	13	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	69375146.00
2508	13	7840	Prejeta sredstva iz proračuna EU za Schengensko mejo	69375146.00
2509	13	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	0.00
2510	13	786	Ostala prejeta sredstva iz proračuna Evropske unije	3081760.00
2511	13	7860	Ostala prejeta sredstva iz proračuna EU	3081760.00
2512	13	787	Prejeta sredstva od drugih evropskih institucij	0.00
2513	13	7870	Prejeta sredstva od drugih evropskih institucij	0.00
2515	13	400	Plače in drugi izdatki zaposlenim	892148808.00
2516	13	4000	Plače in dodatki	743846782.00
2517	13	4001	Regres za letni dopust	26930238.00
2518	13	4002	Povračila in nadomestila	90481610.00
2519	13	4003	Sredstva za delovno uspešnost	14276779.00
2520	13	4004	Sredstva za nadurno delo	7136963.00
2521	13	4005	Plače za delo nerezidentov po pogodbi	0.00
2522	13	4009	Drugi izdatki zaposlenim	9476436.00
2523	13	401	Prispevki delodajalcev za socialno varnost	151644198.00
2524	13	4010	Prispevek za pokojninsko in invalidsko zavarovanje	84904127.00
2525	13	4011	Prispevek za zdravstveno zavarovanje	50513420.00
2526	13	4012	Prispevek za zaposlovanje	603951.00
2527	13	4013	Prispevek za starševsko varstvo	774665.00
2528	13	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	14848035.00
2529	13	402	Izdatki za blago in storitve	824577834.00
2530	13	4020	Pisarniški in splošni material in storitve	115678593.00
2531	13	4021	Posebni material in storitve	207973725.00
2532	13	4022	Energija, voda, komunalne storitve in komunikacije	61882027.00
2533	13	4023	Prevozni stroški in storitve	43860162.00
2534	13	4024	Izdatki za službena potovanja	25082899.00
2535	13	4025	Tekoče vzdrževanje	142067441.00
2536	13	4026	Poslovne najemnine in zakupnine	55905274.00
2537	13	4027	Kazni in odškodnine	8160902.00
2538	13	4028	Davek na izplačane plače	29803577.00
2539	13	4029	Drugi operativni odhodki	134163234.00
2549	13	409	Rezerve	54591823.00
2550	13	4090	Splošna proračunska rezervacija	17430896.00
2551	13	4091	Proračunska rezerva	12783657.00
2552	13	4092	Druge rezerve	21038929.00
2553	13	4093	Sredstva za posebne namene	3338341.00
2554	13	41	TEKOČI TRANSFERI	4468336133.00
2555	13	410	Subvencije	437670457.00
2556	13	4100	Subvencije javnim podjetjem	75592108.00
2557	13	4101	Subvencije finančnim institucijam	4172926.00
2558	13	4102	Subvencije privatnim podjetjem in zasebnikom	357905423.00
2559	13	411	Transferi posameznikom in gospodinjstvom	968825521.00
2560	13	4110	Transferi nezaposlenim	107523141.00
2561	13	4111	Družinski prejemki in starševska nadomestila	454696384.00
2562	13	4112	Transferi za zagotavljanje socialne varnosti	162020622.00
2563	13	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	76172856.00
2564	13	4117	Štipendije	105413590.00
2565	13	4119	Drugi transferi posameznikom	62998928.00
2566	13	412	Transferi neprofitnim organizacijam in ustanovam	69663571.00
2567	13	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	69663571.00
2568	13	413	Drugi tekoči domači transferi	2974080317.00
2569	13	4130	Tekoči transferi občinam	22127337.00
2570	13	4131	Tekoči transferi v sklade socialnega zavarovanja	1162521532.00
2571	13	4132	Tekoči transferi v javne sklade	12489366.00
2572	13	4133	Tekoči transferi v javne zavode	1664772273.00
2573	13	4134	Tekoči transferi v državni proračun	471056.00
2574	13	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	43451212.00
2575	13	4136	Tekoči transferi v javne agencije	68247541.00
2576	13	414	Tekoči transferi v tujino	18096267.00
2577	13	4140	Tekoči transferi mednarodnim institucijam	8037938.00
2578	13	4141	Tekoči transferi tujim vladam in vladnim institucijam	126926.00
2579	13	4142	Tekoči transferi neprofitnim organizacijam v tujini	1401345.00
2580	13	4143	Drugi tekoči transferi v tujino	8530058.00
2581	13	42	INVESTICIJSKI ODHODKI	594547648.00
2582	13	420	Nakup in gradnja osnovnih sredstev	594547648.00
2583	13	4200	Nakup zgradb in prostorov	25301854.00
2584	13	4201	Nakup prevoznih sredstev	18952417.00
2585	13	4202	Nakup opreme	55405514.00
2586	13	4203	Nakup drugih osnovnih sredstev	177273.00
2587	13	4204	Novogradnje, rekonstrukcije in adaptacije	294648287.00
2588	13	4205	Investicijsko vzdrževanje in obnove	71714937.00
2589	13	4206	Nakup zemljišč in naravnih bogastev	20853263.00
2590	13	4207	Nakup nematerialnega premoženja	48083673.00
2591	13	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	59410430.00
2592	13	4209	Nakup blagovnih rezerv in intervencijskih zalog	0.00
2593	13	43	INVESTICIJSKI TRANSFERI	500219603.00
2594	13	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	151503675.00
2595	13	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	12793085.00
2596	13	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	42122418.00
2597	13	4313	Investicijski transferi privatnim podjetjem	70983119.00
2598	13	4314	Investicijski transferi posameznikom in zasebnikom	17772859.00
2599	13	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	7832194.00
2600	13	4316	Investicijski transferi v tujino	0.00
2540	13	553	Plačila domačih obresti (403)	262407662.00
2601	13	432	Investicijski transferi proračunskim uporabnikom	348715928.00
2602	13	4320	Investicijski transferi občinam	264689037.00
2603	13	4321	Investicijski transferi javnim skladom in agencijam	5727242.00
2604	13	4323	Investicijski transferi javnim zavodom	78299649.00
2605	13	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	317142378.00
2606	13	450	Plačila sredstev v proračun Evropske unije	317142378.00
2607	13	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	38613536.00
2608	13	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	48740202.00
2609	13	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	206675572.00
2610	13	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Velike Britanije	23113068.00
2611	13	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	202011368.00
2612	13	750	Prejeta vračila danih posojil	33624905.00
2613	13	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	3640.00
2614	13	7501	Prejeta vračila danih posojil - od javnih skladov	30462360.00
2615	13	7502	Prejeta vračila danih posojil od javnih podjetij in družb, ki so v lasti države ali občin	0.00
2616	13	7503	Prejeta vračila danih posojil - od finančnih institucij	0.00
2617	13	7504	Prejeta vračila danih posojil od privatnih podjetij	3158905.00
2618	13	7509	Prejeta vračila plačanih poroštev	0.00
2619	13	751	Prodaja kapitalskih deležev	166300000.00
2620	13	7510	Sredstva, pridobljena s prodajo kapitalskih deležev v javnih podjetjih in družbah, ki so v lasti države ali občin	104000000.00
2621	13	7511	Sredstva, pridobljena s prodajo kapitalskih deležev v finančnih institucijah	62300000.00
2622	13	7512	Sredstva, pridobljena s prodajo kapitalskih deležev v privatnih podjetjih	0.00
2623	13	752	Kupnine iz naslova privatizacije	2086463.00
2624	13	7520	Sredstva kupnin iz naslova privatizacije	2086463.00
2625	13	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	111474824.00
2626	13	440	Dana posojila	17448401.00
2627	13	4404	Dana posojila privatnim podjetjem	3158905.00
2628	13	4409	Plačila zapadlih poroštev	14289496.00
2629	13	441	Povečanje kapitalskih deležev in finančnih naložb	77752013.00
2630	13	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbah, ki so v lasti države ali občin	10000000.00
2631	13	4411	Povečanje kapitalskih deležev v finančnih institucijah	50000000.00
2632	13	4412	Povečanje kapitalskih deležev v privatnih podjetjih	0.00
2633	13	4414	Povečanje kapitalskih deležev v tujino	17752013.00
2634	13	442	Poraba sredstev kupnin iz naslova privatizacije	2086462.00
2635	13	4420	Dana posojila iz sredstev kupnin	448589.00
2636	13	4421	Sredstva kupnin, razporejena v javne sklade in agencije	1512685.00
2637	13	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	125188.00
2638	13	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	14187948.00
2639	13	4430	Povečanje  namenskega premoženja v javnih skladih	14187948.00
2640	13	50	ZADOLŽEVANJE	1261335947.00
2641	13	500	Domače zadolževanje	1261335947.00
2642	13	5000	Najeti krediti pri Banki Slovenije	1261335947.00
2643	13	5001	Najeti krediti pri poslovnih bankah	0.00
2644	13	5003	Najeti krediti pri drugih domačih kreditodajalcih	0.00
2645	13	5004	Sredstva, pridobljena z izdajo vrednostnih papirjev na domačem trgu	0.00
2646	13	501	Zadolževanje v tujini	0.00
2647	13	5014	Sredstva, pridobljena z izdajo vrednostnih papirjev	0.00
2649	13	550	Odplačila domačega dolga	887465786.00
2650	13	5501	Odplačila kreditov poslovnim bankam	85840262.00
2651	13	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	801625524.00
2652	13	551	Odplačila dolga v tujino	40894162.00
2653	13	5510	Odplačila dolga mednarodnim finančnim institucijam	34146353.00
2654	13	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6747809.00
2655	14	70	DAVČNI PRIHODKI	6782716203.00
2656	14	700	Davki na dohodek in dobiček	1919417700.00
2657	14	7000	Dohodnina	891626369.00
2658	14	7001	Davek od dohodkov pravnih oseb	1027791331.00
2659	14	701	Prispevki za socialno varnost	46834525.00
2660	14	7010	Prispevki zaposlenih	26172976.00
2661	14	7011	Prispevki delodajalcev	17273166.00
2662	14	7012	Prispevki samozaposlenih	2600235.00
2663	14	7013	Ostali prispevki za socialno varnost	788149.00
2664	14	702	Davki na plačilno listo in delovno silo	396941903.00
2665	14	7020	Davek na izplačane plače	372327082.00
2666	14	7021	Posebni davek na določene prejemke	24614821.00
2667	14	704	Domači davki na blago in storitve	4337330996.00
2668	14	7040	Davek na dodano vrednost	2834501541.00
2669	14	7041	Drugi davki na blago in storitve	31840623.00
2670	14	7042	Trošarine (akcize)	1120021807.00
2671	14	7044	Davki na posebne storitve	124738495.00
2672	14	7046	Letna povračila za uporabo cest	95659155.00
2673	14	7047	Drugi davki na uporabo blaga in storitev	81805245.00
2674	14	7048	Davki na motorna vozila	48764130.00
2675	14	705	Davki na mednarodno trgovino in transakcije	50268194.00
2676	14	7050	Carine	49901707.00
2677	14	7051	Druge uvozne dajatve	366487.00
2678	14	706	Drugi davki	31922884.00
2679	14	7060	Drugi davki	31922884.00
2680	14	71	NEDAVČNI PRIHODKI	386856203.00
2681	14	710	Udeležba na dobičku in dohodki od premoženja	178604828.00
2682	14	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	103071274.00
2683	14	7102	Prihodki od obresti	14605241.00
2684	14	7103	Prihodki od premoženja	60928313.00
2685	14	711	Takse in pristojbine	87133189.00
2687	14	7111	Upravne takse in pristojbine	43065859.00
2688	14	712	Globe in druge denarne kazni	38122634.00
2689	14	7120	Globe in druge denarne kazni	38122634.00
2690	14	713	Prihodki od prodaje blaga in storitev	11840699.00
2691	14	7130	Prihodki od prodaje blaga in storitev	11840699.00
2692	14	714	Drugi nedavčni prihodki	71154853.00
2693	14	7141	Drugi nedavčni prihodki	71154853.00
2694	14	72	KAPITALSKI PRIHODKI	10432315.00
2695	14	720	Prihodki od prodaje osnovnih sredstev	10432315.00
2696	14	7200	Prihodki od prodaje zgradb in prostorov	10432315.00
2697	14	73	PREJETE DONACIJE	2094880.00
2698	14	730	Prejete donacije iz domačih virov	59786.00
2699	14	7300	Prejete donacije in darila od domačih pravnih oseb	59786.00
2700	14	731	Prejete donacije iz tujine	2035094.00
2701	14	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	2035094.00
2702	14	74	TRANSFERNI PRIHODKI	511246.00
2703	14	740	Transferni prihodki iz drugih javnofinančnih institucij	511246.00
2704	14	7400	Prejeta sredstva iz državnega proračuna	496611.00
2705	14	7402	Prejeta sredstva iz skladov socialnega zavarovanja	14635.00
2706	14	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	582120840.00
2707	14	780	Predpristopna sredstva Evropske unije	18703055.00
2708	14	7801	Prejeta sredstva ISPA	18703055.00
2709	14	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	160994408.00
2710	14	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	16190953.00
2711	14	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega jamstvenega sklada (EKJS)	42146553.00
2712	14	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund) in Evropskega kmetijskega sklada za razvoj podeželja (EKSRP)	102656902.00
2713	14	782	Prejeta sredstva iz proračuna EU za strukturno politiko	233111446.00
2714	14	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	149526657.00
2715	14	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	83584790.00
2716	14	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	96855024.00
2717	14	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	96855024.00
2718	14	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	69375146.00
2719	14	7840	Prejeta sredstva iz proračuna EU za Schengensko mejo	69375146.00
2720	14	786	Ostala prejeta sredstva iz proračuna Evropske unije	3081760.00
2721	14	7860	Ostala prejeta sredstva iz proračuna EU	3081760.00
2723	14	400	Plače in drugi izdatki zaposlenim	892148808.00
2724	14	4000	Plače in dodatki	743846782.00
2725	14	4001	Regres za letni dopust	26930238.00
2726	14	4002	Povračila in nadomestila	90481610.00
2727	14	4003	Sredstva za delovno uspešnost	14276779.00
2728	14	4004	Sredstva za nadurno delo	7136963.00
2729	14	4009	Drugi izdatki zaposlenim	9476436.00
2730	14	401	Prispevki delodajalcev za socialno varnost	151644198.00
2731	14	4010	Prispevek za pokojninsko in invalidsko zavarovanje	84904127.00
2732	14	4011	Prispevek za zdravstveno zavarovanje	50513420.00
2733	14	4012	Prispevek za zaposlovanje	603951.00
2734	14	4013	Prispevek za starševsko varstvo	774665.00
2735	14	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	14848035.00
2736	14	402	Izdatki za blago in storitve	824577834.00
2737	14	4020	Pisarniški in splošni material in storitve	115678593.00
2738	14	4021	Posebni material in storitve	207973725.00
2739	14	4022	Energija, voda, komunalne storitve in komunikacije	61882027.00
2740	14	4023	Prevozni stroški in storitve	43860162.00
2741	14	4024	Izdatki za službena potovanja	25082899.00
2742	14	4025	Tekoče vzdrževanje	142067441.00
2743	14	4026	Poslovne najemnine in zakupnine	55905274.00
2744	14	4027	Kazni in odškodnine	8160902.00
2745	14	4028	Davek na izplačane plače	29803577.00
2746	14	4029	Drugi operativni odhodki	134163234.00
2756	14	409	Rezerve	54591823.00
2757	14	4090	Splošna proračunska rezervacija	17430896.00
2758	14	4091	Proračunska rezerva	12783657.00
2759	14	4092	Druge rezerve	21038929.00
2760	14	4093	Sredstva za posebne namene	3338341.00
2761	14	41	TEKOČI TRANSFERI	4468336133.00
2762	14	410	Subvencije	437670457.00
2763	14	4100	Subvencije javnim podjetjem	75592108.00
2764	14	4101	Subvencije finančnim institucijam	4172926.00
2765	14	4102	Subvencije privatnim podjetjem in zasebnikom	357905423.00
2766	14	411	Transferi posameznikom in gospodinjstvom	968825521.00
2767	14	4110	Transferi nezaposlenim	107523141.00
2768	14	4111	Družinski prejemki in starševska nadomestila	454696384.00
2850	15	70	DAVČNI PRIHODKI	6782716203.00
2769	14	4112	Transferi za zagotavljanje socialne varnosti	162020622.00
2770	14	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	76172856.00
2771	14	4117	Štipendije	105413590.00
2772	14	4119	Drugi transferi posameznikom	62998928.00
2773	14	412	Transferi neprofitnim organizacijam in ustanovam	69663571.00
2774	14	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	69663571.00
2775	14	413	Drugi tekoči domači transferi	2974080317.00
2776	14	4130	Tekoči transferi občinam	22127337.00
2777	14	4131	Tekoči transferi v sklade socialnega zavarovanja	1162521532.00
2778	14	4132	Tekoči transferi v javne sklade	12489366.00
2779	14	4133	Tekoči transferi v javne zavode	1664772273.00
2780	14	4134	Tekoči transferi v državni proračun	471056.00
2781	14	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	43451212.00
2782	14	4136	Tekoči transferi v javne agencije	68247541.00
2783	14	414	Tekoči transferi v tujino	18096267.00
2784	14	4140	Tekoči transferi mednarodnim institucijam	8037938.00
2785	14	4141	Tekoči transferi tujim vladam in vladnim institucijam	126926.00
2786	14	4142	Tekoči transferi neprofitnim organizacijam v tujini	1401345.00
2787	14	4143	Drugi tekoči transferi v tujino	8530058.00
2788	14	42	INVESTICIJSKI ODHODKI	594547648.00
2789	14	420	Nakup in gradnja osnovnih sredstev	594547648.00
2790	14	4200	Nakup zgradb in prostorov	25301854.00
2791	14	4201	Nakup prevoznih sredstev	18952417.00
2792	14	4202	Nakup opreme	55405514.00
2793	14	4203	Nakup drugih osnovnih sredstev	177273.00
2794	14	4204	Novogradnje, rekonstrukcije in adaptacije	294648287.00
2795	14	4205	Investicijsko vzdrževanje in obnove	71714937.00
2796	14	4206	Nakup zemljišč in naravnih bogastev	20853263.00
2797	14	4207	Nakup nematerialnega premoženja	48083673.00
2798	14	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	59410430.00
2799	14	43	INVESTICIJSKI TRANSFERI	500219603.00
2800	14	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	151503675.00
2801	14	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	12793085.00
2802	14	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	42122418.00
2803	14	4313	Investicijski transferi privatnim podjetjem	70983119.00
2804	14	4314	Investicijski transferi posameznikom in zasebnikom	17772859.00
2805	14	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	7832194.00
2806	14	432	Investicijski transferi proračunskim uporabnikom	348715928.00
2807	14	4320	Investicijski transferi občinam	264689037.00
2808	14	4321	Investicijski transferi javnim skladom in agencijam	5727242.00
2809	14	4323	Investicijski transferi javnim zavodom	78299649.00
2810	14	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	317142378.00
2811	14	450	Plačila sredstev v proračun Evropske unije	317142378.00
2812	14	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	38613536.00
2813	14	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	48740202.00
2814	14	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	206675572.00
2815	14	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Velike Britanije	23113068.00
2816	14	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	202011368.00
2817	14	750	Prejeta vračila danih posojil	33624905.00
2818	14	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	3640.00
2819	14	7501	Prejeta vračila danih posojil - od javnih skladov	30462360.00
2820	14	7504	Prejeta vračila danih posojil od privatnih podjetij	3158905.00
2821	14	751	Prodaja kapitalskih deležev	166300000.00
2822	14	7510	Sredstva, pridobljena s prodajo kapitalskih deležev v javnih podjetjih in družbah, ki so v lasti države ali občin	104000000.00
2823	14	7511	Sredstva, pridobljena s prodajo kapitalskih deležev v finančnih institucijah	62300000.00
2824	14	752	Kupnine iz naslova privatizacije	2086463.00
2825	14	7520	Sredstva kupnin iz naslova privatizacije	2086463.00
2826	14	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	111474824.00
2827	14	440	Dana posojila	17448401.00
2828	14	4404	Dana posojila privatnim podjetjem	3158905.00
2829	14	4409	Plačila zapadlih poroštev	14289496.00
2830	14	441	Povečanje kapitalskih deležev in finančnih naložb	77752013.00
2831	14	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	10000000.00
2832	14	4411	Povečanje kapitalskih deležev v finančnih institucijah	50000000.00
2833	14	4414	Povečanje kapitalskih deležev v tujino	17752013.00
2834	14	442	Poraba sredstev kupnin iz naslova privatizacije	2086462.00
2835	14	4420	Dana posojila iz sredstev kupnin	448589.00
2836	14	4421	Sredstva kupnin, razporejena v javne sklade in agencije	1512685.00
2837	14	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	125188.00
2838	14	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	14187948.00
2839	14	4430	Povečanje  namenskega premoženja v javnih skladih	14187948.00
2840	14	50	ZADOLŽEVANJE	1261335947.00
2841	14	500	Domače zadolževanje	0.00
2842	14	5000	Najeti krediti pri Banki Slovenije	0.00
2844	14	550	Odplačila domačega dolga	887465786.00
2845	14	5501	Odplačila kreditov poslovnim bankam	85840262.00
2846	14	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	801625524.00
2847	14	551	Odplačila dolga v tujino	40894162.00
2848	14	5510	Odplačila dolga mednarodnim finančnim institucijam	34146353.00
2849	14	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6747809.00
2851	15	700	Davki na dohodek in dobiček	1919417700.00
2852	15	7000	Dohodnina	891626369.00
2853	15	7001	Davek od dohodkov pravnih oseb	1027791331.00
2854	15	701	Prispevki za socialno varnost	46834525.00
2855	15	7010	Prispevki zaposlenih	26172976.00
2856	15	7011	Prispevki delodajalcev	17273166.00
2857	15	7012	Prispevki samozaposlenih	2600235.00
2858	15	7013	Ostali prispevki za socialno varnost	788149.00
2859	15	702	Davki na plačilno listo in delovno silo	396941903.00
2860	15	7020	Davek na izplačane plače	372327082.00
2861	15	7021	Posebni davek na določene prejemke	24614821.00
2862	15	704	Domači davki na blago in storitve	4337330996.00
2863	15	7040	Davek na dodano vrednost	2834501541.00
2864	15	7041	Drugi davki na blago in storitve	31840623.00
2865	15	7042	Trošarine (akcize)	1120021807.00
2866	15	7044	Davki na posebne storitve	124738495.00
2867	15	7046	Letna povračila za uporabo cest	95659155.00
2868	15	7047	Drugi davki na uporabo blaga in storitev	81805245.00
2869	15	7048	Davki na motorna vozila	48764130.00
2870	15	705	Davki na mednarodno trgovino in transakcije	50268194.00
2871	15	7050	Carine	49901707.00
2872	15	7051	Druge uvozne dajatve	366487.00
2873	15	706	Drugi davki	31922884.00
2874	15	7060	Drugi davki	31922884.00
2875	15	71	NEDAVČNI PRIHODKI	386856203.00
2876	15	710	Udeležba na dobičku in dohodki od premoženja	178604828.00
2877	15	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	103071274.00
2878	15	7102	Prihodki od obresti	14605241.00
2879	15	7103	Prihodki od premoženja	60928313.00
2880	15	711	Takse in pristojbine	87133189.00
2881	15	7110	Sodne takse	44067330.00
2882	15	7111	Upravne takse in pristojbine	43065859.00
2883	15	712	Denarne kazni	38122634.00
2884	15	7120	Denarne kazni	38122634.00
2885	15	713	Prihodki od prodaje blaga in storitev	11840699.00
2886	15	7130	Prihodki od prodaje blaga in storitev	11840699.00
2887	15	714	Drugi nedavčni prihodki	71154853.00
2888	15	7141	Drugi nedavčni prihodki	71154853.00
2889	15	72	KAPITALSKI PRIHODKI	10432315.00
2890	15	720	Prihodki od prodaje osnovnih sredstev	10432315.00
2891	15	7200	Prihodki od prodaje zgradb in prostorov	10432315.00
2892	15	73	PREJETE DONACIJE	2094880.00
2893	15	730	Prejete donacije iz domačih virov	59786.00
2894	15	7300	Prejete donacije in darila od domačih pravnih oseb	59786.00
2895	15	731	Prejete donacije iz tujine	2035094.00
2896	15	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	2035094.00
2897	15	74	TRANSFERNI PRIHODKI	511246.00
2898	15	740	Transferni prihodki iz drugih javnofinančnih institucij	511246.00
2899	15	7400	Prejeta sredstva iz državnega proračuna	496611.00
2900	15	7402	Prejeta sredstva iz skladov socialnega zavarovanja	14635.00
2901	15	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	582120840.00
2902	15	780	Predpristopna sredstva Evropske unije	18703055.00
2903	15	7801	Prejeta sredstva ISPA	18703055.00
2904	15	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	160994408.00
2905	15	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund)	16190953.00
2906	15	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund)	42146553.00
2907	15	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund)	102656902.00
2908	15	782	Prejeta sredstva iz proračuna EU za strukturno politiko	233111446.00
2909	15	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	149526657.00
2910	15	7822	Prejeta sredstva iz Evropskega socialnega sklada (ESF)	83584790.00
2911	15	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	96855024.00
2912	15	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	96855024.00
2913	15	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	69375146.00
2914	15	7840	Prejeta sredstva iz proračuna EU za Schengensko mejo	69375146.00
2915	15	786	Ostala prejeta sredstva iz proračuna Evropske unije	3081760.00
2916	15	7860	Ostala prejeta sredstva iz proračuna EU	3081760.00
2918	15	400	Plače in drugi izdatki zaposlenim	891685048.00
2919	15	4000	Plače in dodatki	743446225.00
2920	15	4001	Regres za letni dopust	26917207.00
2921	15	4002	Povračila in nadomestila	90445170.00
2922	15	4003	Sredstva za delovno uspešnost	14265488.00
2923	15	4004	Sredstva za nadurno delo	7135865.00
2924	15	4009	Drugi izdatki zaposlenim	9475093.00
2925	15	401	Prispevki delodajalcev za socialno varnost	151578876.00
2926	15	4010	Prispevek za pokojninsko in invalidsko zavarovanje	84872877.00
2927	15	4011	Prispevek za zdravstveno zavarovanje	50486686.00
2928	15	4012	Prispevek za zaposlovanje	603673.00
2929	15	4013	Prispevek za starševsko varstvo	774202.00
2930	15	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	14841438.00
2931	15	402	Izdatki za blago in storitve	767642754.00
2932	15	4020	Pisarniški in splošni material in storitve	115640976.00
2933	15	4021	Posebni material in storitve	184064098.00
2934	15	4022	Energija, voda, komunalne storitve in komunikacije	61851427.00
2935	15	4023	Prevozni stroški in storitve	43843188.00
2936	15	4024	Izdatki za službena potovanja	25053751.00
2937	15	4025	Tekoče vzdrževanje	109223759.00
2938	15	4026	Poslovne najemnine in zakupnine	55896327.00
2939	15	4027	Kazni in odškodnine	8160902.00
2940	15	4028	Davek na izplačane plače	29781112.00
2941	15	4029	Drugi operativni odhodki	134127214.00
2951	15	409	Rezerve	54591823.00
2952	15	4090	Splošna proračunska rezervacija	17430896.00
2953	15	4091	Proračunska rezerva	12783657.00
2954	15	4092	Druge rezerve	21038929.00
2955	15	4093	Sredstva za posebne namene	3338341.00
2956	15	41	TEKOČI TRANSFERI	4532490385.00
2957	15	410	Subvencije	437670457.00
2958	15	4100	Subvencije javnim podjetjem	75592108.00
2959	15	4101	Subvencije finančnim institucijam	4172926.00
2960	15	4102	Subvencije privatnim podjetjem in zasebnikom	357905423.00
2961	15	411	Transferi posameznikom in gospodinjstvom	968825521.00
2962	15	4110	Transferi nezaposlenim	107523141.00
2963	15	4111	Družinski prejemki in starševska nadomestila	454696384.00
2964	15	4112	Transferi za zagotavljanje socialne varnosti	162020622.00
2965	15	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	76172856.00
2966	15	4117	Štipendije	105413590.00
2967	15	4119	Drugi transferi posameznikom	62998928.00
2968	15	412	Transferi neprofitnim organizacijam in ustanovam	69663571.00
2969	15	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	69663571.00
2970	15	413	Drugi tekoči domači transferi	3038234569.00
2971	15	4130	Tekoči transferi občinam	22127337.00
2972	15	4131	Tekoči transferi v sklade socialnega zavarovanja	1162521532.00
2973	15	4132	Tekoči transferi v javne sklade	12489366.00
2974	15	4133	Tekoči transferi v javne zavode	1664772273.00
2975	15	4134	Tekoči transferi v državni proračun	471056.00
2976	15	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	43451212.00
2977	15	4136	Tekoči transferi v javne agencije	132401793.00
2978	15	414	Tekoči transferi v tujino	18096267.00
2979	15	4140	Tekoči transferi mednarodnim institucijam	8037938.00
2980	15	4141	Tekoči transferi tujim vladam in vladnim institucijam	126926.00
2981	15	4142	Tekoči transferi neprofitnim organizacijam v tujini	1401345.00
2982	15	4143	Drugi tekoči transferi v tujino	8530058.00
2983	15	42	INVESTICIJSKI ODHODKI	492025224.00
2984	15	420	Nakup in gradnja osnovnih sredstev	492025224.00
2985	15	4200	Nakup zgradb in prostorov	25151211.00
2986	15	4201	Nakup prevoznih sredstev	18952417.00
2987	15	4202	Nakup opreme	55394449.00
2988	15	4203	Nakup drugih osnovnih sredstev	177273.00
2989	15	4204	Novogradnje, rekonstrukcije in adaptacije	235620953.00
2990	15	4205	Investicijsko vzdrževanje in obnove	55393846.00
2991	15	4206	Nakup zemljišč in naravnih bogastev	15338263.00
2992	15	4207	Nakup nematerialnega premoženja	48083673.00
2993	15	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	37913139.00
2994	15	43	INVESTICIJSKI TRANSFERI	540311029.00
2995	15	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	151503675.00
2996	15	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	12793085.00
2997	15	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	42122418.00
2998	15	4313	Investicijski transferi privatnim podjetjem	70983119.00
2999	15	4314	Investicijski transferi posameznikom in zasebnikom	17772859.00
3000	15	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	7832194.00
3001	15	432	Investicijski transferi proračunskim uporabnikom	388807354.00
3002	15	4320	Investicijski transferi občinam	264689037.00
3003	15	4321	Investicijski transferi javnim skladom in agencijam	45818668.00
3004	15	4323	Investicijski transferi javnim zavodom	78299649.00
3005	15	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	317142378.00
3006	15	450	Plačila sredstev v proračun Evropske unije	317142378.00
3007	15	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	38613536.00
3008	15	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	48740202.00
3009	15	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	206675572.00
3010	15	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Velike Britanije	23113068.00
3011	15	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	35711368.00
3012	15	750	Prejeta vračila danih posojil	33624905.00
3013	15	7500	Prejeta vračila danih posojil od posameznikov in zasebnikov	3640.00
3014	15	7501	Prejeta vračila danih posojil - od javnih skladov	30462360.00
3015	15	7504	Prejeta vračila danih posojil od privatnih podjetij	3158905.00
3016	15	752	Kupnine iz naslova privatizacije	2086463.00
3017	15	7520	Sredstva kupnin iz naslova privatizacije	2086463.00
3018	15	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	55230458.00
3019	15	440	Dana posojila	17448401.00
3020	15	4404	Dana posojila privatnim podjetjem	3158905.00
3021	15	4409	Plačila zapadlih poroštev	14289496.00
3022	15	441	Povečanje kapitalskih deležev in naložb	21507647.00
3023	15	4410	Povečanje kapitalskih deležev v javnih podjetjih in družbam, ki so v lasti države ali občin	3755634.00
3024	15	4414	Povečanje kapitalskih deležev v tujino	17752013.00
3025	15	442	Poraba sredstev kupnin iz naslova privatizacije	2086462.00
3026	15	4420	Dana posojila iz sredstev kupnin	448589.00
3027	15	4421	Sredstva kupnin, razporejena v javne sklade in agencije	1512685.00
3028	15	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	125188.00
3029	15	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	14187948.00
3030	15	4430	Povečanje  namenskega premoženja v javnih skladih	14187948.00
3031	15	50	ZADOLŽEVANJE	1261335947.00
3032	15	500	Domače zadolževanje	0.00
3033	15	5000	Najeti krediti pri Banki Slovenije	0.00
3035	15	550	Odplačila domačega dolga	878165786.00
3036	15	5501	Odplačila kreditov poslovnim bankam	76540262.00
3037	15	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	801625524.00
3038	15	551	Odplačila dolga v tujino	40894162.00
3039	15	5510	Odplačila dolga mednarodnim finančnim institucijam	34146353.00
3040	15	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6747809.00
3041	16	70	DAVČNI PRIHODKI	6972345000.00
3042	16	700	Davki na dohodek in dobiček	2007536000.00
3043	16	7000	Dohodnina	1214052000.00
3044	16	7001	Davek od dohodkov pravnih oseb	793484000.00
3045	16	701	Prispevki za socialno varnost	47576000.00
3046	16	7010	Prispevki zaposlenih	27045000.00
3047	16	7011	Prispevki delodajalcev	17352000.00
3048	16	7012	Prispevki samozaposlenih	2327000.00
3049	16	7013	Ostali prispevki za socialno varnost	851000.00
3050	16	702	Davki na plačilno listo in delovno silo	361766000.00
3051	16	7020	Davek na izplačane plače	341030000.00
3052	16	7021	Posebni davek na določene prejemke	20735000.00
3053	16	704	Domači davki na blago in storitve	4490223000.00
3054	16	7040	Davek na dodano vrednost	2979194000.00
3055	16	7041	Drugi davki na blago in storitve	43585000.00
3056	16	7042	Trošarine (akcize)	1094413000.00
3057	16	7044	Davki na posebne storitve	124738000.00
3058	16	7046	Letna povračila za uporabo cest	102031000.00
3059	16	7047	Drugi davki na uporabo blaga in storitev	91754000.00
3060	16	7048	Davki na motorna vozila	54508000.00
3061	16	705	Davki na mednarodno trgovino in transakcije	40713000.00
3062	16	7050	Carine	40339000.00
3063	16	7051	Druge uvozne dajatve	374000.00
3064	16	706	Drugi davki	24532000.00
3065	16	7060	Drugi davki	24532000.00
3066	16	71	NEDAVČNI PRIHODKI	378156000.00
3067	16	710	Udeležba na dobičku in dohodki od premoženja	148847000.00
3068	16	7100	Prihodki od udeležbe na dobičku in dividend ter presežkov prihodkov nad odhodki	84726000.00
3069	16	7102	Prihodki od obresti	9180000.00
3070	16	7103	Prihodki od premoženja	54941000.00
3071	16	711	Takse in pristojbine	99397000.00
3072	16	7110	Sodne takse	42123000.00
3073	16	7111	Upravne takse in pristojbine	57274000.00
3074	16	712	Denarne kazni	31686000.00
3075	16	7120	Denarne kazni	31686000.00
3076	16	713	Prihodki od prodaje blaga in storitev	11980000.00
3077	16	7130	Prihodki od prodaje blaga in storitev	11980000.00
3078	16	714	Drugi nedavčni prihodki	86246000.00
3079	16	7141	Drugi nedavčni prihodki	86246000.00
3080	16	72	KAPITALSKI PRIHODKI	1700000.00
3081	16	720	Prihodki od prodaje osnovnih sredstev	1700000.00
3082	16	7200	Prihodki od prodaje zgradb in prostorov	1700000.00
3083	16	73	PREJETE DONACIJE	4010000.00
3084	16	731	Prejete donacije iz tujine	3386000.00
3085	16	7310	Prejete donacije in darila od tujih nevladnih organizacij in fundacij	3386000.00
3086	16	732	Donacije za odpravo posledic naravnih nesreč	623000.00
3087	16	7320	Donacije za odpravo posledic naravnih nesreč	623000.00
3088	16	74	TRANSFERNI PRIHODKI	454000.00
3089	16	740	Transferni prihodki iz drugih javnofinančnih institucij	454000.00
3090	16	7400	Prejeta sredstva iz državnega proračuna	424000.00
3091	16	7402	Prejeta sredstva iz skladov socialnega zavarovanja	30000.00
3092	16	78	PREJETA SREDSTVA IZ EVROPSKE UNIJE	409870000.00
3093	16	780	Predpristopna sredstva Evropske unije	18703000.00
3094	16	7801	Prejeta sredstva ISPA	18703000.00
3095	16	781	Prejeta sredstva iz proračuna EU za izvajanje skupne kmetijske politike	148904000.00
3096	16	7810	Prejeta sredstva iz proračuna EU iz naslova tržnih ukrepov v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund)	16191000.00
3097	16	7811	Prejeta sredstva iz proračuna EU iz naslova neposrednih plačil v kmetijstvu iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund)	38635000.00
3098	16	7812	Prejeta sredstva iz proračuna EU iz naslova programa razvoja podeželja iz Evropskega kmetijskega jamstvenega in usmerjevalnega sklada - Jamstveni del (EAGGF - Guarantee Fund)	94079000.00
3099	16	782	Prejeta sredstva iz proračuna EU za strukturno politiko	149527000.00
3100	16	7821	Prejeta sredstva iz proračuna EU iz Evropskega sklada za regionalni razvoj (ERDF)	149527000.00
3101	16	783	Prejeta sredstva iz proračuna EU za kohezijsko politiko	68755000.00
3102	16	7830	Prejeta sredstva iz Kohezijskega sklada (CF)	68755000.00
3103	16	784	Prejeta sredstva iz proračuna EU za izvajanje notranje politike	23981000.00
3104	16	7840	Prejeta sredstva iz proračuna EU za Schengensko mejo	15023000.00
3105	16	7841	Druga prejeta sredstva iz proračuna EU za izvajanje notranje politike	8959000.00
3107	16	400	Plače in drugi izdatki zaposlenim	849655000.00
3034	15	55	ODPLAČILA DOLGA	1259081027.00
3108	16	4000	Plače in dodatki	717675000.00
3109	16	4001	Regres za letni dopust	26225000.00
3110	16	4002	Povračila in nadomestila	80164000.00
3111	16	4003	Sredstva za delovno uspešnost	14042000.00
3112	16	4004	Sredstva za nadurno delo	5933000.00
3113	16	4009	Drugi izdatki zaposlenim	5616000.00
3114	16	401	Prispevki delodajalcev za socialno varnost	153464000.00
3115	16	4010	Prispevek za pokojninsko in invalidsko zavarovanje	85308000.00
3116	16	4011	Prispevek za zdravstveno zavarovanje	51370000.00
3117	16	4012	Prispevek za zaposlovanje	445000.00
3118	16	4013	Prispevek za starševsko varstvo	741000.00
3119	16	4015	Premije kolektivnega dodatnega pokojninskega zavarovanja, na podlagi ZKDPZJU	15600000.00
3120	16	402	Izdatki za blago in storitve	761945000.00
3121	16	4020	Pisarniški in splošni material in storitve	95630000.00
3122	16	4021	Posebni material in storitve	210968000.00
3123	16	4022	Energija, voda, komunalne storitve in komunikacije	58513000.00
3124	16	4023	Prevozni stroški in storitve	45505000.00
3125	16	4024	Izdatki za službena potovanja	29187000.00
3126	16	4025	Tekoče vzdrževanje	106837000.00
3127	16	4026	Poslovne najemnine in zakupnine	53818000.00
3128	16	4027	Kazni in odškodnine	12274000.00
3129	16	4028	Davek na izplačane plače	32393000.00
3130	16	4029	Drugi operativni odhodki	116821000.00
3140	16	409	Rezerve	89876000.00
3141	16	4090	Splošna proračunska rezervacija	38555000.00
3142	16	4091	Proračunska rezerva	27340000.00
3143	16	4092	Druge rezerve	20642000.00
3144	16	4093	Sredstva za posebne namene	3338000.00
3145	16	41	TEKOČI TRANSFERI	4727533000.00
3146	16	410	Subvencije	413645000.00
3147	16	4100	Subvencije javnim podjetjem	77468000.00
3148	16	4102	Subvencije privatnim podjetjem in zasebnikom	336176000.00
3149	16	411	Transferi posameznikom in gospodinjstvom	928250000.00
3150	16	4110	Transferi nezaposlenim	97128000.00
3151	16	4111	Družinski prejemki in starševska nadomestila	438363000.00
3152	16	4112	Transferi za zagotavljanje socialne varnosti	154815000.00
3153	16	4113	Transferi vojnim invalidom, veteranom in žrtvam vojnega nasilja	76216000.00
3154	16	4117	Štipendije	100161000.00
3155	16	4119	Drugi transferi posameznikom	61567000.00
3156	16	412	Transferi neprofitnim organizacijam in ustanovam	78364000.00
3157	16	4120	Tekoči transferi neprofitnim organizacijam in ustanovam	78364000.00
3158	16	413	Drugi tekoči domači transferi	3290648000.00
3159	16	4130	Tekoči transferi občinam	228744000.00
3160	16	4131	Tekoči transferi v sklade socialnega zavarovanja	1217239000.00
3161	16	4132	Tekoči transferi v javne sklade	15269000.00
3162	16	4133	Tekoči transferi v javne zavode	1661329000.00
3163	16	4134	Tekoči transferi v državni proračun	437000.00
3164	16	4135	Tekoča plačila drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	40613000.00
3165	16	4136	Tekoči transferi v javne agencije	127016000.00
3166	16	414	Tekoči transferi v tujino	16626000.00
3167	16	4140	Tekoči transferi mednarodnim institucijam	6161000.00
3168	16	4141	Tekoči transferi tujim vladam in vladnim institucijam	66000.00
3169	16	4142	Tekoči transferi neprofitnim organizacijam v tujini	1687000.00
3170	16	4143	Drugi tekoči transferi v tujino	8713000.00
3171	16	42	INVESTICIJSKI ODHODKI	379584000.00
3172	16	420	Nakup in gradnja osnovnih sredstev	379584000.00
3173	16	4200	Nakup zgradb in prostorov	18683000.00
3174	16	4201	Nakup prevoznih sredstev	9531000.00
3175	16	4202	Nakup opreme	92227000.00
3176	16	4203	Nakup drugih osnovnih sredstev	163000.00
3177	16	4204	Novogradnje, rekonstrukcije in adaptacije	167890000.00
3178	16	4205	Investicijsko vzdrževanje in obnove	52349000.00
3179	16	4206	Nakup zemljišč in naravnih bogastev	10587000.00
3180	16	4207	Nakup nematerialnega premoženja	2650000.00
3181	16	4208	Študije o izvedljivosti projektov, projektna dokumentacija, nadzor in investicijski inženiring	25504000.00
3182	16	43	INVESTICIJSKI TRANSFERI	476956000.00
3183	16	431	Investicijski transferi pravnim in fizičnim osebam, ki niso proračunski uporabniki	127514000.00
3184	16	4310	Investicijski transferi neprofitnim organizacijam in ustanovam	8593000.00
3185	16	4311	Investicijski transferi javnim podjetjem in družbam, ki so v lasti države ali občin	56231000.00
3186	16	4313	Investicijski transferi privatnim podjetjem	45880000.00
3187	16	4314	Investicijski transferi posameznikom in zasebnikom	14120000.00
3188	16	4315	Investicijski transferi drugim izvajalcem javnih služb, ki niso posredni proračunski uporabniki	2691000.00
3189	16	432	Investicijski transferi proračunskim uporabnikom	349442000.00
3190	16	4320	Investicijski transferi občinam	242751000.00
3191	16	4321	Investicijski transferi javnim skladom in agencijam	38534000.00
3192	16	4322	Investicijski transferi v državni proračun	579000.00
3193	16	4323	Investicijski transferi javnim zavodom	67578000.00
3194	16	45	PLAČILA SREDSTEV V PRORAČUN EVROPSKE UNIJE	363114000.00
3131	16	553	Plačila domačih obresti (403)	270424000.00
3195	16	450	Plačila sredstev v proračun Evropske unije	363114000.00
3196	16	4500	Plačila tradicionalnih lastnih sredstev v proračun Evropske unije	35051000.00
3197	16	4501	Plačila sredstev v proračun EU iz naslova davka na dodano vrednost	45641000.00
3198	16	4502	Plačila sredstev v proračun EU iz naslova bruto nacionalnega dohodka	255885000.00
3199	16	4503	Plačila sredstev v proračun EU iz naslova popravka v korist Velike Britanije	26536000.00
3200	16	75	PREJETA VRAČILA DANIH POSOJIL IN PRODAJA KAPITALSKIH DELEŽEV	35709000.00
3201	16	750	Prejeta vračila danih posojil	33622000.00
3202	16	7501	Prejeta vračila danih posojil - od javnih skladov	30462000.00
3203	16	7504	Prejeta vračila danih posojil od privatnih podjetij	3160000.00
3204	16	752	Kupnine iz naslova privatizacije	2086000.00
3205	16	7520	Sredstva kupnin iz naslova privatizacije	2086000.00
3206	16	44	DANA POSOJILA IN POVEČANJE KAPITALSKIH DELEŽEV	37640000.00
3207	16	440	Dana posojila	5245000.00
3208	16	4404	Dana posojila privatnim podjetjem	3159000.00
3209	16	4409	Plačila zapadlih poroštev	2086000.00
3210	16	441	Povečanje kapitalskih deležev in naložb	17789000.00
3211	16	4414	Povečanje kapitalskih deležev v tujino	17789000.00
3212	16	442	Poraba sredstev kupnin iz naslova privatizacije	2086000.00
3213	16	4420	Dana posojila iz sredstev kupnin	449000.00
3214	16	4421	Sredstva kupnin, razporejena v javne sklade in agencije	1513000.00
3215	16	4422	Povečanje kapitalskih deležev države iz sredstev kupnin	125000.00
3216	16	443	Povečanje namenskega premoženja v javnih skladih in drugih pravnih osebah javnega prava, ki imajo premoženje v svoji lasti	12519000.00
3217	16	4430	Povečanje  namenskega premoženja v javnih skladih	12519000.00
3218	16	50	ZADOLŽEVANJE	1338830000.00
3219	16	500	Domače zadolževanje	1338830000.00
3220	16	5000	Najeti krediti pri Banki Slovenije	0.00
3222	16	550	Odplačila domačega dolga	907095000.00
3223	16	5501	Odplačila kreditov poslovnim bankam	78205000.00
3224	16	5504	Odplačila glavnice vrednostnih papirjev, izdanih na domačem trgu	828890000.00
3225	16	551	Odplačila dolga v tujino	41221000.00
3226	16	5510	Odplačila dolga mednarodnim finančnim institucijam	34472000.00
3227	16	5512	Odplačila dolga tujim poslovnim bankam in finančnim institucijam	6749000.00
2722	14	40	TEKOČI ODHODKI	1922962663.00
1516	8	40	TEKOČI ODHODKI	2192098634.00
2308	12	40	TEKOČI ODHODKI	1996364970.00
76	1	40	Tekoči odhodki	2210270986.00
279	2	40	Tekoči odhodki	2134819007.00
2917	15	40	TEKOČI ODHODKI	1865498501.00
479	3	40	Tekoči odhodki	2252884522.00
1916	10	40	TEKOČI ODHODKI	2133332760.00
2117	11	40	TEKOČI ODHODKI	2151139992.00
684	4	40	Tekoči odhodki	2119531751.00
885	5	40	Tekoči odhodki	2219950747.00
2514	13	40	TEKOČI ODHODKI	1922962663.00
1716	9	40	TEKOČI ODHODKI	2164705084.00
1310	7	40	TEKOČI ODHODKI	2135485407.00
3106	16	40	TEKOČI ODHODKI	1854941000.00
1095	6	40	TEKOČI ODHODKI	2135485407.00
2843	14	55	ODPLAČILA DOLGA	1273181027.00
1635	8	55	ODPLAČILA DOLGA	1213083124.00
2425	12	55	ODPLAČILA DOLGA	1422042059.00
195	1	55	Odplačila dolga	1820554571.00
398	2	55	Odplačila dolga	1509747528.00
595	3	55	Odplačila dolga	1501421820.00
2035	10	55	ODPLAČILA DOLGA	1569217812.00
2235	11	55	ODPLAČILA DOLGA	1767715548.00
803	4	55	Odplačila dolga	2211119489.00
1003	5	55	Odplačila dolga	2242503569.00
2648	13	55	ODPLAČILA DOLGA	1273181027.00
1832	9	55	ODPLAČILA DOLGA	1075313910.00
1430	7	55	ODPLAČILA DOLGA	1210784706.00
3221	16	55	ODPLAČILA DOLGA	1301308000.00
1224	6	55	ODPLAČILA DOLGA	1210784706.00
101	1	553	Plačila domačih obresti (403)	554168224.00
102	1	5531	Plačila obresti od kreditov – poslovnim bankam (4031)	641069.00
103	1	5532	Plačila obresti od kreditov – drugim finančnim institucijam (4032)	139950.00
104	1	5533	Plačila obresti od kreditov – drugim domačim kreditodajalcem (4033)	253000.00
105	1	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	553134206.00
106	1	554	Plačila tujih obresti (404)	41922972.00
107	1	5540	Plačila obresti od kreditov – mednarodnim finančnim institucijam (4040)	1922972.00
108	1	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	40000000.00
304	2	553	Plačila domačih obresti (403)	452698222.00
305	2	5531	Plačila obresti od kreditov – poslovnim bankam (4031)	2628538.00
306	2	5532	Plačila obresti od kreditov – drugim finančnim institucijam (4032)	100000.00
307	2	5533	Plačila obresti od kreditov – drugim domačim kreditodajalcem (4033)	175000.00
308	2	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	449794684.00
309	2	554	Plačila tujih obresti (404)	66569358.00
310	2	5540	Plačila obresti od kreditov – mednarodnim finančnim institucijam (4040)	2381858.00
311	2	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	64187500.00
504	3	553	Plačila domačih obresti (403)	497564275.00
505	3	5531	Plačila obresti od kreditov – poslovnim bankam (4031)	2628538.00
506	3	5532	Plačila obresti od kreditov – drugim finančnim institucijam (4032)	1118801.00
507	3	5533	Plačila obresti od kreditov – drugim domačim kreditodajalcem (4033)	5000000.00
508	3	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	488816936.00
509	3	554	Plačila tujih obresti (404)	66568164.00
510	3	5540	Plačila obresti od kreditov – mednarodnim finančnim institucijam (4040)	2380664.00
511	3	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	64187500.00
710	4	5531	Plačila obresti od kreditov – poslovnim bankam (4031)	4648133.00
711	4	5532	Plačila obresti od kreditov – drugim finančnim institucijam (4032)	1118801.00
712	4	5533	Plačila obresti od kreditov – drugim domačim kreditodajalcem (4033)	50000.00
713	4	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	375710940.00
714	4	554	Plačila tujih obresti (404)	97143617.00
715	4	5540	Plačila obresti od kreditov – mednarodnim finančnim institucijam (4040)	2956117.00
716	4	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	94187500.00
911	5	5531	Plačila obresti od kreditov – poslovnim bankam (4031)	4648133.00
912	5	5532	Plačila obresti od kreditov – drugim finančnim institucijam (4032)	1118801.00
913	5	5533	Plačila obresti od kreditov – drugim domačim kreditodajalcem (4033)	1000000.00
914	5	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	406245019.00
915	5	554	Plačila tujih obresti (404)	97143617.00
916	5	5540	Plačila obresti od kreditov – mednarodnim finančnim institucijam (4040)	2956117.00
917	5	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	94187500.00
1121	6	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	6921752.00
1122	6	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	860000.00
1123	6	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	12000000.00
1124	6	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	219353647.00
1125	6	554	Plačila tujih obresti (404)	117849107.00
1126	6	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	3907594.00
1127	6	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	254013.00
1128	6	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	113687500.00
1336	7	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	6921752.00
1337	7	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	860000.00
1338	7	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	12000000.00
1339	7	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	219353647.00
1340	7	554	Plačila tujih obresti (404)	117849107.00
1341	7	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	3907594.00
1342	7	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	254013.00
1343	7	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	113687500.00
1541	8	553	Plačila domačih obresti (403)	241433817.00
1542	8	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	6921752.00
1543	8	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	860000.00
1544	8	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	12000000.00
1545	8	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	221652065.00
1546	8	554	Plačila tujih obresti (404)	117849107.00
1547	8	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	3907594.00
1548	8	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	254013.00
1549	8	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	113687500.00
1741	9	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	8175460.00
1742	9	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	851435.00
1743	9	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	4500000.00
1744	9	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	132205995.00
1745	9	554	Plačila tujih obresti (404)	213550033.00
1746	9	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	4141031.00
1747	9	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	221502.00
1748	9	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	209187500.00
1942	10	553	Plačila domačih obresti (403)	199239103.00
1943	10	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	10778094.00
1944	10	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	851436.00
1945	10	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	5504264.00
1946	10	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	182105309.00
1947	10	554	Plačila tujih obresti (404)	128879363.00
1948	10	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	6169903.00
1949	10	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	521960.00
1950	10	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	122187500.00
2143	11	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	10778094.00
2144	11	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	851436.00
2145	11	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	5500000.00
2146	11	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	182105309.00
2147	11	554	Plačila tujih obresti (404)	128879363.00
2148	11	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	6169903.00
2149	11	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	521960.00
2150	11	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	122187500.00
2334	12	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	10051211.00
2335	12	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	885967.00
2336	12	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	4178769.00
2337	12	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	249171019.00
2338	12	554	Plačila tujih obresti (404)	80003170.00
2339	12	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	5929594.00
2340	12	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	397330.00
2341	12	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	73676246.00
2541	13	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	14648095.00
2542	13	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	885967.00
2543	13	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	4094893.00
2544	13	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	242778707.00
2545	13	554	Plačila tujih obresti (404)	82413417.00
2546	13	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	8120063.00
2547	13	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	617108.00
2548	13	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	73676246.00
2747	14	553	Plačila domačih obresti (403)	262407662.00
2748	14	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	14648095.00
2749	14	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	885967.00
2750	14	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	4094893.00
2751	14	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	242778707.00
2752	14	554	Plačila tujih obresti (404)	82413417.00
2753	14	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	8120063.00
2754	14	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	617108.00
2755	14	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	73676246.00
2942	15	553	Plačila domačih obresti (403)	257607662.00
2943	15	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	9848095.00
2944	15	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	885967.00
2945	15	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	4094893.00
2946	15	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	242778707.00
2947	15	554	Plačila tujih obresti (404)	82413417.00
2948	15	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	8120063.00
2949	15	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	617108.00
2950	15	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	73676246.00
3132	16	5531	Plačila obresti od kreditov - poslovnim bankam (4031)	12874000.00
3133	16	5532	Plačila obresti od kreditov - drugim finančnim institucijam (4032)	719000.00
3134	16	5533	Plačila obresti od kreditov - drugim domačim kreditodajalcem (4033)	8885000.00
3135	16	5534	Plačila obresti od vrednostnih papirjev izdanih na domačem trgu (4034)	247945000.00
3136	16	554	Plačila tujih obresti (404)	82568000.00
3137	16	5540	Plačila obresti od kreditov - mednarodnim finančnim institucijam (4040)	8400000.00
3138	16	5542	Plačila obresti od kreditov - tujim poslovnim bankam in finančnim institucijam (4042)	481000.00
3139	16	5544	Plačila obresti od vrednostnih papirjev, izdanih na tujih trgih (4044)	73688000.00
\.


--
-- Data for Name: proracun_proracun; Type: TABLE DATA; Schema: public; Owner: hruske
--

COPY proracun_proracun (id, proracunsko_leto, datum_sprejetja, tip_proracuna, del_proracuna, epa, pdf, csv) FROM stdin;
1	2012	2010-12-01	SP	1	1319-V	proracun/pdf/SP2012_II_1.pdf	proracun/csv/si_proracun_2012_2010_12_01_SP.csv
2	2011	2010-12-01	SSP	1	1318-V	proracun/pdf/SP2011_II_1.pdf	proracun/csv/si_proracun_2011_2010_12_01_SSP.csv
3	2011	2009-12-07	SP	1	0609-V	proracun/pdf/SPLOSNI_DEL-2011.PDF	proracun/csv/si_proracun_2011_2009_12_07_SP.csv
4	2010	2010-07-15	RB	1	1110-V	proracun/pdf/01_REB2010_splosni_del_novo.pdf	proracun/csv/si_proracun_2010_2010_07_15_RB.csv
5	2010	2009-12-07	SP	1	0608-V	proracun/pdf/10_01_splosni_del_2010.pdf	proracun/csv/si_proracun_2010_2009_12_07_SP.csv
6	2009	2011-03-17	ZR	1	1310-V	proracun/pdf/ZR2009-SPLOSNI_DEL.pdf	proracun/csv/si_proracun_2009_2011_03_17_ZR.csv
7	2009	2009-07-30	RB	1	0460-V	proracun/pdf/01_REB2009II_splosni_del.pdf	proracun/csv/si_proracun_2009_2009_07_30_RB2.csv
8	2009	2009-04-06	RB	1	0223-V	proracun/pdf/SPLOSNI_DEL.pdf	proracun/csv/si_proracun_2009_2009_04_06_RB.csv
9	2009	2007-12-13	SP	1	1664-IV	proracun/pdf/EPA_1664-IV.PDF	proracun/csv/si_proracun_2009_2007_12_13_SP.csv
10	2008	2008-06-10	RB	1	2073-IV	proracun/pdf/REB2008.pdf	proracun/csv/si_proracun_2008_2008_06_10_RB.csv
11	2008	2007-12-13	SSP	1	1663-IV	proracun/pdf/EPA_1663-IV.PDF	proracun/csv/si_proracun_2008_2007_12_13_SSP.csv
12	2008	2006-12-05	SP	1	1095-IV	proracun/pdf/EPA1095-IV.pdf	proracun/csv/si_proracun_2008_2006_12_05_SP.csv
13	2007	2009-02-17	ZR	1	0170-V	proracun/pdf/1_SPLOSNI_DEL_ZR_PROR.pdf	proracun/csv/si_proracun_2007_2009_02_17_ZR.csv
14	2007	2007-07-24	RB	1	1540-IV	proracun/pdf/EPA_1540-IV.pdf	proracun/csv/si_proracun_2007_2007_07_24_RB.csv
15	2007	2006-12-05	SSP	1	1094-IV	proracun/pdf/RS_-2006-126-05340-OBP001-0000.PDF	proracun/csv/si_proracun_2007_2006_12_05_SSP.csv
16	2007	2005-12-22	SP	1	0460-IV	proracun/pdf/SP07_SPL.pdf	proracun/csv/si_proracun_2007_2005_12_22_SP_eur.csv
\.


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: hruske; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: hruske; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: hruske; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: proracun_postavka_pkey; Type: CONSTRAINT; Schema: public; Owner: hruske; Tablespace: 
--

ALTER TABLE ONLY proracun_postavka
    ADD CONSTRAINT proracun_postavka_pkey PRIMARY KEY (id);


--
-- Name: proracun_proracun_pkey; Type: CONSTRAINT; Schema: public; Owner: hruske; Tablespace: 
--

ALTER TABLE ONLY proracun_proracun
    ADD CONSTRAINT proracun_proracun_pkey PRIMARY KEY (id);


--
-- Name: proracun_postavka_proracun_id; Type: INDEX; Schema: public; Owner: hruske; Tablespace: 
--

CREATE INDEX proracun_postavka_proracun_id ON proracun_postavka USING btree (proracun_id);


--
-- Name: proracun_postavka_sifra; Type: INDEX; Schema: public; Owner: hruske; Tablespace: 
--

CREATE INDEX proracun_postavka_sifra ON proracun_postavka USING btree (sifra);


--
-- Name: proracun_postavka_proracun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hruske
--

ALTER TABLE ONLY proracun_postavka
    ADD CONSTRAINT proracun_postavka_proracun_id_fkey FOREIGN KEY (proracun_id) REFERENCES proracun_proracun(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

