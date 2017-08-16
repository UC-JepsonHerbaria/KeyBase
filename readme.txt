(Last updated 2016-09-23)
Some information about the KeyBase load:

Key files can be regenerated from the raw file using make_keys_for_pruning.pl
It is not perfect, with regard to compound group keys and embedded infrataxa keys
But that is explained in comments at the top of the script

Keys with groups (Asteraceae, Fabaceae, Poaceae) are entered separately.
E.g. The key to groups for Asteraceae terminates at "Asteraceae Group 1", "Asteraceae Group 2", etc.
Then, when the Asteraceae Group 1 key is loaded, the taxonomic scope is entered as "Asteraceae Group 1"
so that it links up with the key to Asteraceae Groups


The following families contain a single genus in the flora, which contains multiple species.
The terminal nodes for these taxa in the key to families were formatted so they would link to the species key for that genus
E.g. "Selaginellaceae" formatted to "Selaginellaceae {Selaginella}"

Aspleniaceae {Asplenium}
Azollaceae {Azolla}
Cornaceae {Cornus}
Droseraceae {Drosera}
Ephedraceae {Ephedra}
Equisetaceae {Equisetum}
Garryaceae {Garrya}
Balsaminaceae {Impatiens}
Krameriaceae {Krameria}
Passifloraceae {Passiflora}
Phrymaceae {Mimulus}
Polypodiaceae {Polypodium}
Grossulariaceae {Ribes}
Salviniaceae {Salvinia}
Selaginellaceae {Selaginella}
Thelypteridaceae {Thelypteris}
Juncaginaceae {Triglochin}
Violaceae {Viola}
Smilacaceae {Smilax}
Isoetaceae {Isoetes}
Frankeniaceae {Frankenia}
Haloragaceae {Myriophyllum}
Hypericaceae {Hypericum}
Martyniaceae {Proboscidea}
Oxalidaceae {Oxalis}
Paeoniaceae {Paeonia}
Parnassiaceae {Parnassia}
Phrymaceae {Mimulus}
Phytolaccaceae {Phytolacca}
Picrodendraceae {Tetracoccus}
Platanaceae {Platanus}
Polygalaceae {Polygala}
Portulacaceae {Portulaca}
Sarcobataceae {Sarcobatus}
Tamaricaceae {Tamarix}
Ulmaceae {Ulmus}
Asparagaceae {Asparagus}
Ruppiaceae {Ruppia}


Furthermore, the following families contain a single genus which consists of a single species
And were formatted as follows

Apodanthaceae {Pilostyles thurberi}
Aponogetonaceae {Aponogeton distachyos}
Aquifoliaceae {Ilex aquifolium}
Basellaceae {Anredera cordifolia}
Bataceae {Batis maritima}
Burseraceae {Bursera microphylla}
Calycanthaceae {Calycanthus occidentalis}
Cyatheaceae {Sphaeropteris cooperi}
Ceratophyllaceae {Ceratophyllum demersum}
Comandraceae {Comandra umbellata subsp. californica}
Datiscaceae {Datisca glomerata}
Dennstaedtiaceae {Pteridium aquilinum var. pubescens}
Fouquieriaceae {Fouquieria splendens subsp. splendens}
Gunneraceae {Gunnera tinctoria}
Koeberliniaceae {Koeberlinia spinosa var. tenuispina}
Laxmanniaceae {Cordyline australis}
Linnaeaceae {Linnaea borealis var. longiflora}
Meliaceae {Melia azedarach}
Nartheciaceae {Narthecium californicum}
Nitrariaceae {Peganum harmala}
Proteaceae {Grevillea robusta}
Saururaceae {Anemopsis californica}
Scheuchzeriaceae {Scheuchzeria palustris}
Simmondsiaceae {Simmondsia chinensis}
Staphyleaceae {Staphylea bolanderi}
Styracaceae {Styrax redivivus}
Tecophilaeaceae {Odontostomum hartwegii}
Theophrastaceae {Samolus parviflorus}
Thymelaeaceae {Dirca occidentalis}
Tofieldiaceae {Triantha occidentalis subsp. occidentalis}
Tropaeolaceae {Tropaeolum majus}
Zannichelliaceae {Zannichellia palustris}
Zingiberaceae {Hedychium flavescens}

These taxa occur in all Family Group keys except Groups 1 and 18


A very important thing that is missing from the way that KeyBase is currently loaded
Is that while we have taken care of families with one genus, as above
I have not done the same for monotypic genera.
So, when someone arrives at e.g. Allotropa, they are not told it is Allotropa virgata
It just terminates at Allotropa.
There are 600 monotypic genera in 134 families in Jepson, so this is a big job to reformat the keys
>>>e.g. in the Ericaceae key change "Allotropa" to "Allotropa {Allotropa virgata}
And then also reload them.
The list is currently in monotypic.txt, sorted by family

UPDATE: The family keys containing monotypic genera have been updated in the txt file.
These families include:

Acanthaceae
Agavaceae
Aizoaceae
Alismataceae
Alliaceae
Amaranthaceae
Amaryllidaceae
Anacardiaceae
Apiaceae
Apocynaceae
Araceae
Araliaceae
Arecaceae
Aristolochiaceae
Asphodelaceae
Asteraceae
Betulaceae
Bignoniaceae
Blechnaceae
Boraginaceae
Cabombaceae
Cactaceae
Campanulaceae
Cannabaceae
Caryophyllaceae
Celastraceae
Chenopodiaceae
Cistaceae
Cleomaceae
Commelinaceae
Convolvulaceae
Crassulaceae
Cucurbitaceae
Cupressaceae
Cyperaceae
Dryopteridaceae
Elaeagnaceae
Elatinaceae
Ericaceae
Euphorbiaceae
Fabaceae
Gentianaceae
Geraniaceae
Hydrangeaceae
Hydrocharitaceae
Iridaceae
Juglandaceae
Lamiaceae
Lauraceae (TJM2/eFlora already has binomials)
Lentibulariaceae
Liliaceae
Limnanthaceae
Linaceae
Lythraceae
Malvaceae
Marsileaceae
Melanthiaceae
Menyanthaceae
Moraceae
Myricaceae
Myrsinaceae
Myrtaceae
Nyctaginaceae
Nymphaeaceae
Oleaceae
Onagraceae
Ophioglossaceae
Orchidaceae
Orobanchaceae
Papaveraceae
Pittosporaceae
Plantaginaceae
Poaceae
Polemoniaceae
Polygonaceae
Pontederiaceae
Pteridaceae
Ranunculaceae
Resedaceae
Rhamnaceae
Rosaceae
Rubiaceae
Rutaceae
Sapindaceae
Sarraceniaceae
Saxifragaceae
Scrophulariaceae
Simaroubaceae
Solanaceae
Taxaceae
Themidaceae
Urticaceae
Valerianaceae
Verbenaceae
Viscaceae
Vitaceae
Woodsiaceae
Zygophyllaceae


Interestingly, the following genera in Asteraceae are not arrived at in the Asteraceae key.
Each one only contains two or three species, so they are identified to species within the Asteraceae key.
Although they still have a separate key for the genus.
As a result, the genus keys do not get nested in the KeyBase tree structure
Acamptopappus
Clinopodium (Lamiaceae)
Euphrosyne
Geraea
Lepidospartum
Leucosyris
Nothcalais
Verbasina
Xanthium

These taxa are monotypics where the family key terminates at the binomial instead of the genus name
This is unusual and I don't know why it's done like this.

Peltandra virginica
Campsis radicans
Jacaranda mimosifolia
Freesia leichtlinii subsp. alba
Ixia maculata
Libertia formosa
Pterocarya stenoptera
Alyogyne huegelii
Anisodontea capensis
Gossypium hirsutum




The KeyBase "TO DO"
-Fix parsing script to pick up unabridged keys (Gaillardia, Jensia etc.)
-Fix parsing script to pick up keys for genera with one species with multiple vars (Palafoxia, Vachellia, etc.)
--> load those keys
-Reload keys that have been updated since Rev2 or Rev3, since they didn't have monotypics indicated correctly.
-Fix loading script (or add another script) that will format monotypic taxa correctly in key leads

-reload all checklists.
-Clean up keybase directory.
-improve loading script



KeyBase Low Priority
-Add group descriptions to the Family Group keys



KeyBase DONE
-Add the species terminals to the top "key to families"
-Locate and load Phrymaceae and Plumbaginaceae keys, and load (note Plumbaginaceae needs some monotypics added
-Reload the key to family groups (all except 5 were updated, so might as well bulkload them all)
-Add monotypics and reload composite family keys (Brassicaceae)
-Check how KB handles the "times" character: Check &times;Crocosmia in the Iridaceae key after the key is reloaded (it works fine)
-Reload the family keys containing monotypic genera
-Add monotypics to composite family keys (Asteraceae, Fabaceae, Poaceae)
>>Redo the composite keys (i.e. Asteraceae, Brassicaceae, Fabaceae, Poaceae) as groups instead of smashed together
-drop ALA taxon links and reload with eFlora links 