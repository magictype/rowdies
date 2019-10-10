# Clean up
rm ./build/ttf/*.ttf

# # Build static instances
fontmake -g ./masters/Rowdy.glyphs -o ttf -i --output-dir ./build/ttf -a
for f in ./build/ttf/*.ttf
do
	echo 'Processing $f'
	gftools fix-dsig --autofix $f
	gftools fix-hinting $f
	mv $f.fix $f
done

# Clean up
rm -r instance_ufo
rm -r master_ufo
