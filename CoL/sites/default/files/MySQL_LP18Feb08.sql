/*
MySQL Backup
Source Host:           localhost
Source Server Version: 5.0.18-nt
Source Database:       MySQLSample
Date:                  2008-02-18 17:09:28
*/

SET FOREIGN_KEY_CHECKS=0;
use MySQLSample;
#----------------------------
# Table structure for accepted names
#----------------------------
CREATE TABLE `accepted names` (
  `ID` int(11) default NULL,
  `Kingdom` varchar(50) default NULL,
  `Phylum` varchar(50) default NULL,
  `Class` varchar(50) default NULL,
  `Order` varchar(50) default NULL,
  `SuperFamilyName` varchar(50) default NULL,
  `Family` varchar(50) default NULL,
  `Genus` varchar(50) default NULL,
  `Species` varchar(50) default NULL,
  `AuthorString` varchar(50) default NULL,
  `InfraSpecies` varchar(50) default NULL,
  `InfraSpMarker` varchar(50) default NULL,
  `InfraSpecificAuthorString` varchar(100) default NULL,
  `AdditionalData` longtext,
  `Sp2000NameStatus` varchar(50) default NULL,
  `Specialist` varchar(255) default NULL,
  `ScrutinyDate` varchar(50) default NULL,
  `GSDNameStatus` varchar(50) default NULL,
  `Distribution` longtext,
  `OccurrenceStatus` varchar(50) default NULL,
  `SpeciesURL` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
#----------------------------
# Records for table accepted names
#----------------------------


insert  into `accepted names` values 
(10657, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Labridae', 'Thalassoma', 'hardwicke', '(Bennett, 1830)', null, null, null, 'Family: Wrasses, Habitat and Biology: Occurs in shallow lagoon and seaward reefs. Feeds on benthic and planktonic crustaceans, small fishes, and foraminiferans.', 'Accepted name', 'Westneat, Mark', '15/07/03', 'new combination, valid: Yes', 'Indo-Pacific:  East Africa to the Line and Tuamoto islands, north to southern Japan, south to the Lord Howe and Austral islands; throughout Micronesia.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=5643'), 
(11048, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Cichlidae', 'Astatotilapia', 'calliptera', '(Günther, 1894)', null, null, null, 'Family: Cichlids, Habitat and Biology: Occurs in vegetated areas in shallow water, but also found in rivers and streams around the lake. Feeds on invertebrates, algae, plants, small fishes and plankton (Ref. 5595).   ', 'Accepted name', 'Kullander, Sven O.', '03/09/03', 'new combination, valid: Yes', 'Africa:  Lakes Malawi, Chiuta and Chilwa; Lower Zambezi, Buzi, Pungwe and Save River systems.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=6707'), 
(11127, 'Animalia', 'Chordata', 'Actinopterygii', 'Siluriformes', null, 'Clariidae', 'Bathyclarias', 'foveolatus', '(Jackson, 1955)', null, null, null, 'Family: Airbreathing catfishes, Habitat and Biology: Occurs at a depth of 30 m and deeper, in rocky areas. Feeds on rock-inhabiting species during the night (Ref. 5595).    ', 'Accepted name', 'Teugels, Guy', '30/07/03', 'new combination, valid: Yes', 'Africa:  Endemic and occurring throughout Lake Malawi (Nyasa).', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=8368'), 
(112090, 'Animalia', 'Chordata', 'Actinopterygii', 'Siluriformes', null, 'Callichthyidae', 'Corydoras', 'adolfoi', 'Burgess, 1982', null, null, null, 'Family: Callichthyid armored catfishes, Habitat and Biology: ', 'Accepted name', 'Reis, Roberto E.', '15/07/03', 'original combination, valid: Yes', 'South America:  Negro River basin.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=46040'), 
(112093, 'Animalia', 'Chordata', 'Actinopterygii', 'Siluriformes', null, 'Callichthyidae', 'Corydoras', 'amphibelus', 'Cope, 1872', null, null, null, 'Family: Callichthyid armored catfishes, Habitat and Biology: ', 'Accepted name', 'Reis, Roberto E.', '15/07/03', 'original combination, valid: Yes', 'South America:  Upper Amazon River basin.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=46041'), 
(112094, 'Animalia', 'Chordata', 'Actinopterygii', 'Siluriformes', null, 'Callichthyidae', 'Corydoras', 'approuaguensis', 'Nijssen & Isbrücker, 1983', null, null, null, 'Family: Callichthyid armored catfishes, Habitat and Biology: Often found in the company of <i>C. melanistius brevirostris</i> and <i>C. spilurus</i> on sandy bottoms traversed by a strong current (Ref. 27188). Abundant in the backwaters of sandy beaches d', 'Accepted name', 'Reis, Roberto E.', '15/07/03', 'original combination, valid: Yes', 'South America:  Approuague River basin.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=46042'), 
(112095, 'Animalia', 'Chordata', 'Actinopterygii', 'Siluriformes', null, 'Callichthyidae', 'Corydoras', 'araguaiaensis', 'Sands, 1990', null, null, null, 'Family: Callichthyid armored catfishes, Habitat and Biology: ', 'Accepted name', 'Reis, Roberto E.', '15/07/03', 'original combination, valid: Yes', 'South America:  Araguaia River basin.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=46043'), 
(112096, 'Animalia', 'Chordata', 'Actinopterygii', 'Siluriformes', null, 'Callichthyidae', 'Corydoras', 'armatus', '(Günther, 1868)', null, null, null, 'Family: Callichthyid armored catfishes, Habitat and Biology: ', 'Accepted name', 'Reis, Roberto E.', '15/07/03', 'new combination, valid: Yes', 'South America:  Upper Amazon River basin.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=46044'), 
(149118, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Labridae', 'Oxycheilinus', 'digramma', '(Lacepède, 1801)', null, null, null, 'Family: Wrasses, Habitat and Biology: Inhabits lagoon and sheltered seaward reefs in coral rich areas (Ref. 1602). Possibly to 120 m depths. The species is observed to swim with a group of goatfish and change its color to resemble these fish, it then dart', 'Accepted name', 'Westneat, Mark', '8/4/2003', 'new combination, valid: Yes', 'Indo-Pacific:  Red Sea and East Africa to the Marshall Islands and Samoa.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=5599'), 
(22954, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Carangidae', 'Selar', 'crumenophthalmus', '(Bloch, 1793)', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Prefers clear oceanic waters around islands to neritic waters (Ref. 5217). Occasionally in turbid waters (Ref. 9283). Mainly nocturnal. Feeds on small shrimps, benthic invertebrates, and forams when inshore', 'Accepted name', 'Smith-Vaniz, William F.', '2/6/1997', 'new combination, valid: Yes', 'Circumtropical.  Indo-Pacific:  East Africa (Ref. 3287) to Rapa, north to southern Japan and the Hawaiian Islands, south to New Caledonia.  Eastern Pacific:  Mexico to Peru, including the Galapagos Islands (Ref. 5530).  Western Atlantic:  Nova Scotia, Can', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=387'), 
(23106, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Carangidae', 'Decapterus', 'macarellus', '(Cuvier, 1833)', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Prefers clear oceanic waters, frequently around islands (Ref. 5217). Sometimes near the surface, but generally caught between 40 and 200 m depth (Ref. 9283). Forms schools (Ref. 26235). Feeds mainly on zoop', 'Accepted name', 'Smith-Vaniz, William F.', '4/18/2000', 'new combination, valid: Yes', 'Circumglobal.  Western Atlantic:  Nova Scotia, Canada and Bermuda to approximately Pernambuco, Brazil.  Appears to be absent from the Gulf of Mexico (Ref. 9626).  Eastern Atlantic:  St. Helena, Ascension, Cape Verde, and Gulf of Guinea (Ref. 7097); Azores', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=993'), 
(23107, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Carangidae', 'Decapterus', 'punctatus', '(Cuvier, 1829)', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Inhabits neritic waters, often near sandy beaches (Ref. 5217). A shoaling species, generally  near the bottom (Ref. 27121). Feeds on planktonic invertebrates, primarily copepods, but also on gastropod larva', 'Accepted name', 'Smith-Vaniz, William F.', '9/11/1995', 'new combination, valid: Yes', 'Western Atlantic:  Nova Scotia, Canada (Ref. 7251), Massachusetts to Florida, USA (Ref. 26938) and Bermuda southward through the Gulf of Mexico, entire Caribbean, West Indies, and South American coast (Ref. 26938) to Rio de Janeiro, Brazil.  Eastern Atlan', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=994'), 
(23192, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Carangidae', 'Naucrates', 'ductor', '(Linnaeus, 1758)', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Oceanic species with a semi-obligate commensal relationship with sharks, rays, other bony fishes and turtles (Ref. 5217). Young are usually associated with jellyfish and drifting seaweed (Ref. 2850, 9563). ', 'Accepted name', 'Smith-Vaniz, William F.', '2/5/1997', 'new combination, valid: Yes', 'Circumtropical in tropical seas.  Western Atlantic:  Nova Scotia, Canada to Argentina (Ref. 7251).  Eastern Atlantic:  British Isles (rare vagrant) and Bay of Biscay to Angola, including the Mediterranean and Canary Islands.  Eastern Pacific:  Vancouver I', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=998'), 
(23222, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', null, 'Carcharhinidae', 'Prionace', 'glauca', '(Linnaeus, 1758)', null, null, null, 'Family: Requiem sharks, Habitat and Biology: Oceanic, but may be found close inshore where the continental shelf is narrow (Ref. 6871).  Usually found to at least 150 m (Ref. 26938). Reported from estuaries (Ref. 26340). Feeds on bony fishes, small sharks', 'Accepted name', 'Compagno, Leonard J.V.', '10/28/2000', 'new combination, valid: Yes', 'Circumglobal in temperate and tropical waters.  Western Atlantic:  Newfoundland, Canada to Argentina.  Central Atlantic.  Eastern Atlantic:  Norway to South Africa, including the Mediterranean.  Indo-West Pacific:  East Africa to Indonesia, Japan, Austral', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=898'), 
(23551, 'Animalia', 'Chordata', 'Actinopterygii', 'Beloniformes', null, 'Exocoetidae', 'Hirundichthys', 'speculiger', '(Valenciennes, 1847)', null, null, null, 'Family: Flyingfishes, Habitat and Biology: Found in oceanic surface waters (Ref. 9839). Spawns throughout the year in warm waters (Ref. 6523).', 'Accepted name', 'Parin, Nikolay V.', '3/9/2000', 'new combination, valid: Yes', 'Worldwide in tropical waters.  Eastern Atlantic:  probably throughout the tropical region, apparently uncommon in the Gulf of Guinea and absent in Benguela current (Ref. 4498).  Western Atlantic:  northern South America (Ref. 5217); uncommon in the Caribb', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=1036'), 
(23749, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Carangidae', 'Pseudocaranx', 'dentex', '(Bloch & Schneider, 1801)', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Occur in bays and coastal waters, including estuaries (Ref. 9563). Juveniles usually inhabit estuaries, bays and shallow continental shelf waters, while adults form schools near the sea bed on the continent', 'Accepted name', 'Smith-Vaniz, William F.', '12/1/1998', 'new combination, valid: Yes', 'Western Atlantic:  Bermuda, North Carolina, and south to southern Brazil.  Eastern Atlantic:  Mediterranean, Azores, Madeira, the Canary Islands, Cape Verde, Ascension and St. Helena Island.  Indo-Pacific:  South Africa, Japan, Hawaii (Ref. 26145), Austra', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=1002'), 
(23881, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Carangidae', 'Uraspis', 'helvola', '(Forster, 1801)', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: A pelagic and demersal species found in sandy bottoms at the foot of the edge of the outer reefs, continental coasts and around islands (Ref. 9283). Solitary or forming small schools (Ref. 30573). Mainly no', 'Accepted name', 'Smith-Vaniz, William F.', '5/25/1999', 'new combination, valid: Yes', 'Southeast Atlantic:  St. Helena and Ascension islands (Ref. 7097).  Western Indian Ocean:  southern Red Sea, off Oman and Sri Lanka.  Eastern Pacific:  Hawaiian and Revillagigedo islands (Ref. 9283).  Reported from the Arafura Sea (Ref. 9819).', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=1983'), 
(23898, 'Animalia', 'Chordata', 'Elasmobranchii', 'Lamniformes', null, 'Alopiidae', 'Alopias', 'superciliosus', '(Lowe, 1841)', null, null, null, 'Family: Thresher sharks, Habitat and Biology: Occurs in coastal waters over continental shelves, sometimes close inshore in shallow waters, and on the high seas far from land (Ref. 247). Depth range to at least 500 m (Ref. 247). Feeds on pelagic and botto', 'Accepted name', 'Compagno, Leonard J.V.', '10/27/2000', 'new combination, valid: Yes', 'Circumtropical.  Western Atlantic:  New York, USA southward to Bahamas and Cuba; Panama to Guyana (Ref. 6871).  Eastern Atlantic:  Portugal to Angola, including the Mediterranean.  Indo-Pacific:  Arabian Sea, Madagascar, South Africa, southern Japan, Taiw', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=2534'), 
(24787, 'Animalia', 'Chordata', 'Actinopterygii', 'Cypriniformes', null, 'Cobitidae', 'Misgurnus', 'anguillicaudatus', '(Cantor, 1842)', null, null, null, 'Family: Loaches, Habitat and Biology: Occurs in rivers, lakes and ponds. Also in swamps and ricefields (Ref. 27732). Prefers muddy bottoms, where they hide in the muck and leaf litter with only their heads sticking out; prefers muddy bottoms of streams an', 'Accepted name', 'Kottelat, Maurice', '5/6/1997', 'new combination, valid: Yes', 'Asia:  Myanmar and Northeastern Asia and southward to Central China.  This species proved successful in the aquarium fish trade and has also been introduced to other countries (Ref. 1739).  At least one country reports adverse ecological impact after intr', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=3016'), 
(26672, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Labridae', 'Bodianus', 'perditio', '(Quoy & Gaimard, 1834)', null, null, null, 'Family: Wrasses, Habitat and Biology: Inhabits the vicinity of coral and rocky reefs, often over sand or rubble in deeper water. Feeds mainly on benthic invertebrates such as mollusks and crustaceans (Ref. 9823). An excellent food fish (Ref. 3132).', 'Accepted name', 'Westneat, Mark', '10/3/1995', 'new combination, valid: Yes', 'Antiequatorial in distribution.  Indo-West Pacific:  southern Africa to the islands of southern Oceania and from Taiwan to southern Japan.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=7734'), 
(26673, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Labridae', 'Coris', 'formosa', '(Bennett, 1830)', null, null, null, 'Family: Wrasses, Habitat and Biology: Adults found in weed, rock and coral areas; juveniles in shallow tide pools (Ref. 30573). Generally solitary (Ref. 5213). Feeds mainly on hard-shelled prey, including crustaceans, mollusks and sea urchins (Ref. 5374).', 'Accepted name', 'Westneat, Mark', '6/18/2002', 'new combination, valid: Yes', 'Western Indian Ocean:  southern Red Sea to Natal, South Africa and east to Sri Lanka.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=7736'), 
(26678, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Labridae', 'Xyrichtys', 'pentadactylus', '(Linnaeus, 1758)', null, null, null, 'Family: Wrasses, Habitat and Biology: Found over sandy bottoms of coastal areas and also in areas with some seagrass or algae. Ranges to a depth of over 18 m (Ref. 9710). When threatened, it dives head-first into sand. Feeds mainly on hard-shelled prey, i', 'Accepted name', 'Westneat, Mark', '8/1/1995', 'new combination, valid: Yes', 'Indo-Pacific:  Red Sea and East Africa to the western Pacific.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=7747'), 
(26682, 'Animalia', 'Chordata', 'Actinopterygii', 'Beloniformes', null, 'Belonidae', 'Platybelone', 'argalus', null, 'trachura', null, '(Valenciennes, 1846)', 'Family: Needlefishes, Habitat and Biology: Maximum length is body length. Found close to the surface in shallow water. Feeds mainly on small fishes.', 'Accepted name', 'Collette, Bruce B.', '8/19/1999', 'new combination, valid: Yes', 'Southeast Atlantic:  known only from Ascension and St. Helena Islands.', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=7753'), 
(29523, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', null, 'Carangidae', 'Seriola', 'lalandi', 'Valenciennes, 1833', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: A pelagic and demersal species (Ref. 9283) found in coastal and oceanic waters, off kelp beds and rocky areas (Ref. 2850), sometimes entering estuaries (Ref. 9563). They are solitary or occur in small group', 'Accepted name', 'Smith-Vaniz, William F.', '2/6/1997', 'original combination, valid: Yes', 'Circumtropical, entering temperate waters in some areas.  Indo-Pacific:  Japan, Great Australian Bight and southeastern Australia.  Reported from Walters Shoal (Ref. 33390).  Eastern Pacific:  British Columbia, Canada to Chile (Ref. 2850).  Eastern Atlant', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=382'), 
(58485, 'Animalia', 'Chordata', 'Elasmobranchii', 'Lamniformes', null, 'Lamnidae', 'Isurus', 'oxyrinchus', 'Rafinesque, 1810', null, null, null, 'Family: Mackerel sharks, white sharks, Habitat and Biology: Oceanic, but sometimes found close inshore (Ref. 6871, 11230). Usually in surface waters (Ref. 30573), down to about 150 m (Ref. 26938, 11230). Feeds on bony fishes, other sharks (Ref. 5578), cep', 'Accepted name', 'Compagno, Leonard J.V.', '10/27/2000', 'original combination, valid: Yes', 'Cosmopolitan in temperate and tropical seas (Ref. 6871, 11230).  Western Atlantic:  Gulf of Maine to southern Brazil, including the Gulf of Mexico and Caribbean.  Eastern Atlantic:  Norway to South Africa, including the Mediterranean.  Indo-Pacific:  East', null, 'http://www.fishbase.org/Summary/SpeciesSummary.php?ID=752');
#----------------------------
# Table structure for common names
#----------------------------
CREATE TABLE `common names` (
  `ID` int(50) default NULL,
  `CommonName` varchar(50) default NULL,
  `Country` varchar(50) default NULL,
  `Language` varchar(50) default NULL,
  `Reference(s)` varchar(255) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
#----------------------------
# Records for table common names
#----------------------------


insert  into `common names` values 
(24787, 'Aasianmutakala', 'Finland', 'Finnish', '7494'), 
(22954, 'Adlo', 'Philippines', 'Surigaonon', '31411'), 
(112090, 'Adolfo\'s Panzerwels', 'Germany', 'German', '2059'), 
(112090, 'Adolf\'s catfish', 'USA', 'English', '37395'), 
(22954, 'Aji', 'Hawaii', 'Hawaiian', '4887'), 
(22954, 'Akule', 'Hawaii', 'Hawaiian', '4390'), 
(58485, 'Al karch', 'Morocco', 'Arabic', '171'), 
(23107, 'Alassan', 'Benin', 'Other', '6269'), 
(29523, 'Albacore', 'Australia', 'English', '3287'), 
(29523, 'Albacore', 'South Africa', 'English', '3287'), 
(10657, 'Alle', 'Marshall Is', 'Marshallese', '12356'), 
(23898, 'Alopias megalomatos', 'Greece', 'Greek', '41475'), 
(23106, 'Alumahan', 'Philippines', 'Maranao/Samal/Tao Sug', '31411'), 
(29523, 'Amber fish', 'Barbados', 'English', '27295'), 
(29523, 'Amber jack', 'Barbados', 'English', '27295'), 
(29523, 'Amberjack', 'Australia', 'English', '6390'), 
(29523, 'Amberjack', 'Cuba', 'English', '35205'), 
(58485, 'Amlez', 'Israel', 'Hebrew', '171'), 
(29523, 'Amoureuse grosse', 'Reunion', 'French', '33390'), 
(24787, 'Amur mud loach', 'Russian Fed', 'English', '26334'), 
(24787, 'Amur weatherfish', 'Former USSR', 'English', '1441'), 
(24787, 'Amurskii v\'yun', 'Former USSR', 'Russian', '1441'), 
(23881, 'Anak bong', 'Philippines', 'Maranao/Samal/Tao Sug', '31411'), 
(22954, 'Anduhaw', 'Philippines', 'Surigaonon', '31411'), 
(58485, 'Anequim', 'Brazil', 'Portuguese', '38265'), 
(58485, 'Anequim', 'Cape Verde', 'Portuguese', '27000');
#----------------------------
# Table structure for references
#----------------------------
CREATE TABLE `references` (
  `Reference(s)` int(255) default NULL,
  `Author(s)` varchar(200) default NULL,
  `Year` varchar(10) default NULL,
  `Title` longtext,
  `Details` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
#----------------------------
# Records for table references
#----------------------------


insert  into `references` values 
(26673, 'Skelton, P.H.', '1996', 'A review of <i>Opsaridium zambezense</i> (Pisces: Cyprinidae) from southern Africa with description of a new species from Malawi.', 'Ichthyol. Explor. Freshwaters 7(1):59-84.'), 
(26673, 'Skelton, P.H.', '1996', 'A review of <i>Opsaridium zambezense</i> (Pisces: Cyprinidae) from southern Africa with description of a new species from Malawi.', 'Ichthyol. Explor. Freshwaters 7(1):59-84.'), 
(26678, 'Kullander, S.O. and S. Prada-Pedreros', '1993', '<i>Nannacara  adoketa</i>, a new species of ciclid fish from the Rio Negro in Brazil.', 'Ichthyol. Explor. Freshwat. 4(4):357-366.'), 
(26678, 'Kullander, S.O. and S. Prada-Pedreros', '1993', '<i>Nannacara  adoketa</i>, a new species of ciclid fish from the Rio Negro in Brazil.', 'Ichthyol. Explor. Freshwat. 4(4):357-366.'), 
(12356, 'Strasburg, D.W.', '1950', 'Names of Marshallese fishes obtained at Arno Atoll.', 'Typed manuscript.'), 
(1441, 'Berg, L.S.', '1964', 'Freshwater fishes of the U.S.S.R. and adjacent countries. volume 2, 4th edition.', 'Israel Program for Scientific Translations Ltd, Jerusalem. (Russian version published 1949).'), 
(171, 'Coppola, S.R., W. Fischer, L. Garibaldi, N. Scialabba and K.E. Carpenter', '1994', 'SPECIESDAB: Global species database for fishery purposes. User\'s manual.', 'FAO Computerized Information Series (Fisheries). No. 9. Rome, FAO. 103 p.'), 
(2059, 'Baensch, H.A. and R. Riehl', '1991', 'Aquarien atlas. Bd. 3.', 'Melle: Mergus, Verlag für Natur- und Heimtierkunde, Germany. 1104 p.'), 
(26334, 'Reshetnikov, Y.S., N.G. Bogutskaya, E.D. Vasil\'eva, E.A. Dorofeeva, A.M. Naseka, O.A. Popova, K.A. Savvaitova, V.G. Sideleva and L.I. Sokolov', '1997', 'An annotated check-list of the freshwater fishes of Russia.', 'J. Ichthyol. 37(9):687-736.'), 
(27000, 'Reiner, F.', '1996', 'Catálogo dos peixes do Arquipélago de Cabo Verde.', 'Publicações avulsas do IPIMAR No. 2. 339 p.'), 
(27295, 'Butsch, R.S.', '1939', 'A list of Barbadian fishes.', 'J. B.M.H.S. 7(1):17-31.'), 
(31411, 'Ganaden, S.R. and F. Lavapie-Gonzales', '1999', 'Common and local names of marine fishes of the Philippines.', 'Bureau of Fisheries and Aquatic Resources, Philippines. 385 p.'), 
(3287, 'Smith-Vaniz, W.F.', '1984', 'Carangidae.', 'In W. Fischer and G. Bianchi (eds.)  FAO species identification sheets for fishery purposes. Western Indian Ocean fishing area 51. Vol. 1. [pag. var.]. FAO, Rome.'), 
(33390, 'Fricke, R.', '1999', 'Fishes of the Mascarene Islands (Réunion, Mauritius, Rodriguez): an annotated checklist, with descriptions of new species.', 'Koeltz Scientific Books, Koenigstein, Theses Zoologicae, Vol. 31: 759 p.'), 
(35205, 'Zaneveld, J.S.', '1983', 'Caribbean Fish Life. Index to the local and scientific names of the marine fishes and fishlike invertebrates of the Caribbean area (Tropical Western Central Atlantic Ocean)', 'E.J. Brill / Dr. W. Backhuys, Leiden, 163p.'), 
(37395, 'Reis, R.E.', '2003', 'Callichthyidae (Armored catfishes).', 'p. 291-309. In R.E. Reis, S.O. Kullander and C.J. Ferraris, Jr. (eds.) Checklist of the Freshwater Fishes of South and Central America. Porto Alegre: EDIPUCRS, Brasil.'), 
(38265, 'Nomura, H.', '1984', 'Dicionário dos peixes do Brasil.', 'Brasília: Editerra. 482p.'), 
(41475, 'Economidis, P.S. and E. Koutrakis', '2001', 'Common names of comercially important  Hellenic marine organisms.', 'Aristotle University, Unpublished Technical Report.'), 
(4390, 'Various authors', '1992', 'pers. comm.', 'Division of Aquatic Resources, State of Hawaii, Dept. of Land and Natural Resources.'), 
(4887, 'Honebrink, R.', '1990', 'Fishing in Hawaii: a student manual.', 'Education Program,  Division of Aquatic Resources, Honolulu, Hawaii. 79 p.'), 
(6269, 'Pliya, J.', '1980', 'La pêche dans le sud-ouest du Bénin.', 'Agence de Cooperation Culturelle et Technique, Paris. 296 p.'), 
(6390, 'Kailola, P.J., M.J. Williams, P.C. Stewart, R.E. Reichelt, A. McNee and C. Grieve', '1993', 'Australian fisheries resources.', 'Bureau of Resource Sciences, Canberra, Australia. 422 p.'), 
(7494, 'Varjo, M.', '1981', 'Kalannimiluettelo (List of Finnish fish names).', 'Luonnon Tutkija 85:1-60');
#----------------------------
# Table structure for scitific name references
#----------------------------
CREATE TABLE `scitific name references` (
  `ID` int(50) default NULL,
  `Reference Type` varchar(50) default NULL,
  `Reference(s)` int(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
#----------------------------
# Records for table scitific name references
#----------------------------


insert  into `scitific name references` values 
(10657, 'Nomenclatural Reference', 2334), 
(11048, 'Nomenclatural Reference', 7248), 
(112096, 'Nomenclatural Reference', 6329), 
(149118, 'Nomenclatural Reference', 35918), 
(22954, 'Nomenclatural Reference', 9283), 
(23106, 'Nomenclatural Reference', 9283), 
(23107, 'Nomenclatural Reference', 7097), 
(23192, 'Nomenclatural Reference', 7097), 
(10657, 'Nomenclatural Reference', 781), 
(22954, 'Nomenclatural Reference', 7248), 
(22954, 'Nomenclatural Reference', 7097), 
(24787, 'Common Name Reference', 7494), 
(22954, 'Common Name Reference', 31411), 
(112090, 'Common Name Reference', 2059), 
(112090, 'Common Name Reference', 37395), 
(22954, 'Common Name Reference', 4887), 
(22954, 'Common Name Reference', 4390), 
(58485, 'Common Name Reference', 171), 
(23107, 'Common Name Reference', 6269), 
(29523, 'Common Name Reference', 3287), 
(29523, 'Common Name Reference', 3287), 
(10657, 'Common Name Reference', 12356), 
(23898, 'Common Name Reference', 41475), 
(23106, 'Common Name Reference', 31411), 
(29523, 'Common Name Reference', 27295), 
(29523, 'Common Name Reference', 27295), 
(29523, 'Common Name Reference', 6390), 
(29523, 'Common Name Reference', 35205), 
(58485, 'Common Name Reference', 171), 
(29523, 'Common Name Reference', 33390), 
(24787, 'Common Name Reference', 26334), 
(24787, 'Common Name Reference', 1441), 
(24787, 'Common Name Reference', 1441), 
(23881, 'Common Name Reference', 31411), 
(22954, 'Common Name Reference', 31411), 
(58485, 'Common Name Reference', 38265), 
(58485, 'Common Name Reference', 27000), 
(10020, 'Nomenclatural reference', 14320), 
(10021, 'Nomenclatural reference', 1650), 
(10028, 'Nomenclatural reference', 2710), 
(10029, 'Nomenclatural reference', 16785), 
(10030, 'Nomenclatural reference', 3490), 
(10045, 'Nomenclatural reference', 2787), 
(10070, 'Nomenclatural reference', 17344), 
(10072, 'Nomenclatural reference', 2830), 
(10073, 'Nomenclatural reference', 3069), 
(10075, 'Nomenclatural reference', 2787), 
(10076, 'Nomenclatural reference', 2787), 
(10080, 'Nomenclatural reference', 1011), 
(10082, 'Nomenclatural reference', 1011), 
(10088, 'Nomenclatural reference', 4883), 
(10089, 'Nomenclatural reference', 4883), 
(10097, 'Nomenclatural reference', 1002), 
(10101, 'Nomenclatural reference', 995), 
(10106, 'Nomenclatural reference', 2787), 
(10107, 'Nomenclatural reference', 471), 
(10108, 'Nomenclatural reference', 1002), 
(10109, 'Nomenclatural reference', 4868), 
(10110, 'Nomenclatural reference', 4868), 
(10111, 'Nomenclatural reference', 1002), 
(10112, 'Nomenclatural reference', 471), 
(10028, 'Nomenclatural reference', 1650), 
(10073, 'Nomenclatural reference', 1011), 
(10073, 'Nomenclatural reference', 1650), 
(10107, 'Nomenclatural reference', 3490);
#----------------------------
# Table structure for source database
#----------------------------
CREATE TABLE `source database` (
  `TaxonomicCoverage` longtext,
  `DatabaseShortName` varchar(50) default NULL,
  `DatabaseFullName` varchar(100) default NULL,
  `DatabaseVersion` varchar(50) default NULL,
  `ReleaseDate` datetime default NULL,
  `HomeURL` longtext,
  `SearchURL` varchar(255) default NULL,
  `LogoURL` varchar(255) default NULL,
  `StandardDataAbstract` longtext,
  `Custodian` varchar(255) default NULL,
  `Editor(s)/Author(s)` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
#----------------------------
# Records for table source database
#----------------------------


insert  into `source database` values 
('Animalia - Chordata - Actinopterygii, Cephalaspidomorphi, Elasmobranchii, Holocephali, Myxini, Sarcopterygii', 'FishBase', 'FishBase', '10/03', '2003-10-07 00:00:00', '#http://www.fishbase.org#', 'http://www.fishbase.org/search.cfm', 'http://www.fishbase.org/search.cfm', 'FishBase was developed at the WorldFish Center in the Philippines, in collaboration with the Food and Agriculture Organization of the United Nations and many other partners, and with support from the European Commission. It has diverse information on all 28,500 species of fish, including descriptive, physiological and conservation data, and contains links to information in other databases.', 'Froese, Rainer', null);
#----------------------------
# Table structure for synonyms
#----------------------------
CREATE TABLE `synonyms` (
  `ID` int(50) default NULL,
  `AcceptedName_ID` int(50) default NULL,
  `Genus` varchar(50) default NULL,
  `Species` varchar(50) default NULL,
  `AuthorString` varchar(50) default NULL,
  `InfraSpecies` varchar(50) default NULL,
  `InfraSpMarker` varchar(50) default NULL,
  `InfraSpecificAuthorString` varchar(100) default NULL,
  `AdditionalData` longtext,
  `Specialist` varchar(255) default NULL,
  `ScrutinyDate` datetime default NULL,
  `Sp2000NameStatus` varchar(50) default NULL,
  `GSDNameStatus` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
#----------------------------
# Records for table synonyms
#----------------------------


insert  into synonyms values 
(10020, 26672, 'Cossyphus', 'nigromaculatus', 'Gilchrist & Thompson, 1908', null, null, null, 'Family: Wrasses, Habitat and Biology: Inhabits the vicinity of coral and rocky reefs, often over sand or rubble in deeper water. Feeds mainly on benthic invertebrates such as mollusks and crustaceans (Ref. 9823). An excellent food fish (Ref. 3132).', 'Westneat, Mark', '1995-11-21 00:00:00', 'Synonym', 'junior synonym, valid: No'), 
(10021, 26672, 'Chaeropsodes', 'pictus', 'Gilchrist & Thompson, 1909', null, null, null, 'Family: Wrasses, Habitat and Biology: Inhabits the vicinity of coral and rocky reefs, often over sand or rubble in deeper water. Feeds mainly on benthic invertebrates such as mollusks and crustaceans (Ref. 9823). An excellent food fish (Ref. 3132).', 'Westneat, Mark', '1995-11-21 00:00:00', 'Synonym', 'junior synonym, valid: No'), 
(10028, 149118, 'Labrus', 'digramma', 'Lacepède, 1801', null, null, null, 'Family: Wrasses, Habitat and Biology: Inhabits lagoon and sheltered seaward reefs in coral rich areas (Ref. 1602). Possibly to 120 m depths. The species is observed to swim with a group of goatfish and change its color to resemble these fish, it then dart', 'Westneat, Mark', '1997-02-08 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10029, 26673, 'Labrus', 'formosus', 'Bennett, 1830', null, null, null, 'Family: Wrasses, Habitat and Biology: Adults found in weed, rock and coral areas; juveniles in shallow tide pools (Ref. 30573). Generally solitary (Ref. 5213). Feeds mainly on hard-shelled prey, including crustaceans, mollusks and sea urchins (Ref. 5374).', 'Westneat, Mark', '2002-06-18 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10030, 26673, 'Coris', 'frerei', 'Günther, 1867', null, null, null, 'Family: Wrasses, Habitat and Biology: Adults found in weed, rock and coral areas; juveniles in shallow tide pools (Ref. 30573). Generally solitary (Ref. 5213). Feeds mainly on hard-shelled prey, including crustaceans, mollusks and sea urchins (Ref. 5374).', 'Westneat, Mark', '2002-06-18 00:00:00', 'Synonym', 'junior synonym, valid: No'), 
(10045, 26678, 'Coryphaena', 'pentadactyla', 'Linnaeus, 1758', null, null, null, 'Family: Wrasses, Habitat and Biology: Found over sandy bottoms of coastal areas and also in areas with some seagrass or algae. Ranges to a depth of over 18 m (Ref. 9710). When threatened, it dives head-first into sand. Feeds mainly on hard-shelled prey, i', 'Westneat, Mark', '1997-09-19 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10070, 24787, 'Cobitis', 'anguillicaudata', 'Cantor, 1842', null, null, null, 'Family: Loaches, Habitat and Biology: Occurs in rivers, lakes and ponds. Also in swamps and ricefields (Ref. 27732). Prefers muddy bottoms, where they hide in the muck and leaf litter with only their heads sticking out; prefers muddy bottoms of streams an', 'Kottelat, Maurice', '1996-07-31 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10072, 23898, 'Alopecias', 'superciliosus', 'Lowe, 1841', null, null, null, 'Family: Thresher sharks, Habitat and Biology: Occurs in coastal waters over continental shelves, sometimes close inshore in shallow waters, and on the high seas far from land (Ref. 247). Depth range to at least 500 m (Ref. 247). Feeds on pelagic and botto', 'Compagno, Leonard J.V.', '1995-07-27 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10073, 58485, 'Lamna', 'glauca', '(Müller & Henle, 1839)', null, null, null, 'Family: Mackerel sharks, white sharks, Habitat and Biology: Oceanic, but sometimes found close inshore (Ref. 6871, 11230). Usually in surface waters (Ref. 30573), down to about 150 m (Ref. 26938, 11230). Feeds on bony fishes, other sharks (Ref. 5578), cep', 'Compagno, Leonard J.V.', '1996-02-06 00:00:00', 'Synonym', 'junior synonym, valid: No'), 
(10075, 23222, 'Carcharias', 'glaucus', '(Linnaeus, 1758)', null, null, null, 'Family: Requiem sharks, Habitat and Biology: Oceanic, but may be found close inshore where the continental shelf is narrow (Ref. 6871).  Usually found to at least 150 m (Ref. 26938). Reported from estuaries (Ref. 26340). Feeds on bony fishes, small sharks', 'Compagno, Leonard J.V.', '2000-07-05 00:00:00', 'Synonym', 'new combination, valid: No'), 
(10076, 23222, 'Glyphis', 'glaucus', '(Linnaeus, 1758)', null, null, null, 'Family: Requiem sharks, Habitat and Biology: Oceanic, but may be found close inshore where the continental shelf is narrow (Ref. 6871).  Usually found to at least 150 m (Ref. 26938). Reported from estuaries (Ref. 26340). Feeds on bony fishes, small sharks', 'Compagno, Leonard J.V.', '1999-03-22 00:00:00', 'Synonym', 'new combination, valid: No'), 
(10080, 26682, 'Belone', 'trachura', 'Valenciennes, 1846', null, null, null, 'Family: Needlefishes, Habitat and Biology: Maximum length is body length. Found close to the surface in shallow water. Feeds mainly on small fishes.', 'Collette, Bruce B.', '1999-08-19 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10082, 26682, 'Belone', 'ardeola', null, 'trachura', null, 'Valenciennes, 1846', 'Family: Needlefishes, Habitat and Biology: Maximum length is body length. Found close to the surface in shallow water. Feeds mainly on small fishes.', 'Collette, Bruce B.', '1999-08-19 00:00:00', 'Synonym', 'new combination, valid: No'), 
(10088, 23551, 'Exocoetus', 'speculiger', 'Valenciennes, 1847', null, null, null, 'Family: Flyingfishes, Habitat and Biology: Found in oceanic surface waters (Ref. 9839). Spawns throughout the year in warm waters (Ref. 6523).', 'Parin, Nikolay V.', '2000-03-09 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10089, 23551, 'Exocoetus', 'nigripinnis', 'Valenciennes, 1846', null, null, null, 'Family: Flyingfishes, Habitat and Biology: Found in oceanic surface waters (Ref. 9839). Spawns throughout the year in warm waters (Ref. 6523).', 'Parin, Nikolay V.', '1999-09-17 00:00:00', 'Synonym', 'junior synonym, valid: No'), 
(10097, 23106, 'Caranx', 'macarellus', 'Cuvier, 1833', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Prefers clear oceanic waters, frequently around islands (Ref. 5217). Sometimes near the surface, but generally caught between 40 and 200 m depth (Ref. 9283). Forms schools (Ref. 26235). Feeds mainly on zoop', 'Smith-Vaniz, William F.', '1997-02-05 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10101, 23107, 'Caranx', 'punctatus', 'Cuvier, 1829', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Inhabits neritic waters, often near sandy beaches (Ref. 5217). A shoaling species, generally  near the bottom (Ref. 27121). Feeds on planktonic invertebrates, primarily copepods, but also on gastropod larva', 'Smith-Vaniz, William F.', '1997-02-05 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10106, 23192, 'Gasterosteus', 'ductor', 'Linnaeus, 1758', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Oceanic species with a semi-obligate commensal relationship with sharks, rays, other bony fishes and turtles (Ref. 5217). Young are usually associated with jellyfish and drifting seaweed (Ref. 2850, 9563). ', 'Smith-Vaniz, William F.', '1997-02-05 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10107, 23749, 'Scomber', 'dentex', 'Bloch & Schneider, 1801', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Occur in bays and coastal waters, including estuaries (Ref. 9563). Juveniles usually inhabit estuaries, bays and shallow continental shelf waters, while adults form schools near the sea bed on the continent', 'Smith-Vaniz, William F.', '1997-02-05 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10108, 23749, 'Caranx', 'analis', 'Cuvier, 1833', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Occur in bays and coastal waters, including estuaries (Ref. 9563). Juveniles usually inhabit estuaries, bays and shallow continental shelf waters, while adults form schools near the sea bed on the continent', 'Smith-Vaniz, William F.', '1995-02-09 00:00:00', 'Synonym', 'junior synonym, valid: No'), 
(10109, 22954, 'Scomber', 'crumenophthalmus', 'Bloch, 1793', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Prefers clear oceanic waters around islands to neritic waters (Ref. 5217). Occasionally in turbid waters (Ref. 9283). Mainly nocturnal. Feeds on small shrimps, benthic invertebrates, and forams when inshore', 'Smith-Vaniz, William F.', '1997-02-06 00:00:00', 'Synonym', 'original combination, valid: No'), 
(10110, 22954, 'Caranx', 'crumenophthalmus', '(Bloch, 1793)', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: Prefers clear oceanic waters around islands to neritic waters (Ref. 5217). Occasionally in turbid waters (Ref. 9283). Mainly nocturnal. Feeds on small shrimps, benthic invertebrates, and forams when inshore', 'Smith-Vaniz, William F.', '2000-07-06 00:00:00', 'Synonym', 'new combination, valid: No'), 
(10111, 29523, 'Seriola', 'lalandii', 'Valenciennes, 1833', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: A pelagic and demersal species (Ref. 9283) found in coastal and oceanic waters, off kelp beds and rocky areas (Ref. 2850), sometimes entering estuaries (Ref. 9563). They are solitary or occur in small group', 'Smith-Vaniz, William F.', '1999-01-15 00:00:00', 'Synonym', 'misspelling, valid: No'), 
(10112, 23881, 'Scomber', 'helvolus', 'Forster, 1801', null, null, null, 'Family: Jacks and pompanos, Habitat and Biology: A pelagic and demersal species found in sandy bottoms at the foot of the edge of the outer reefs, continental coasts and around islands (Ref. 9283). Solitary or forming small schools (Ref. 30573). Mainly no', 'Smith-Vaniz, William F.', '1994-09-05 00:00:00', 'Synonym', 'original combination, valid: No');

