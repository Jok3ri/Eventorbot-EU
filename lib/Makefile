all: metric_fasteners_tab.scad

metric_fasteners_tab.scad: metric_nuts_and_bolts.csv metric_nuts_and_bolts.py
	python metric_nuts_and_bolts.py < metric_nuts_and_bolts.csv > metric_fasteners_tab.scad
