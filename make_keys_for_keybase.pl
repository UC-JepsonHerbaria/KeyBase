#This should reorganize the keys so that they can be inserted into KeyBase
#This should nearly do it. The couplets are output in numerical order: that may make
#it easier to renumber, if necessary
#The Group keys may require some hand work as they curently exist.
#A good thing to do would be to enforce consistency for the group key headers in the raw file
#Verify that all taxa are dealt with in the keys.

##NB> This currently ignores keys to infraspecific taxa, whether embedded or on their own (e.g. Palafoxia)
## If embedded, the key parses but the species binomial name will be put instead of the number for the "to" node.
## So I've been replacing those manually
## For infra keys on their own, I have constructed them manually from the treatments file

$/="";
#OPEN THE RAW FILE
$treatments="/Users/davidbaxter/DATA/eFlora/eflora_treatments.txt";
open(IN,$treatments) || die;
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
@paragraphs=(<IN>);

#READ THE ARRAY BOTTOM TO TOP
foreach $i (reverse( 0 .. $#paragraphs)){
	$_= $paragraphs[$i];

#RECOGNIZE KEYS BY "1'"
	if(m/\n1'/){
		$last_key=$_;
		$key_number=$i;
	}
#RECOGNIZE FAMILY PARAGRAPHS
	elsif(m/^(.*ACEAE)/){
		$family=$1;
		if($key_number-$i == 1){
			$modified_key=&mod_key($family, $paragraphs[$key_number]);
			$family=ucfirst(lc($family));
			print "Genera of $family\n$modified_key\n\n"; 
# Commented out becauseI want it to recognize the family keys, but not print them
		}
	}
#RECOGNIZE GENUS PARAGRAPHS
	elsif(m/^([A-Z-]+)\n/ &! m/^(WAIF|UNABRIDGED|NATURALIZED|NATIVE)\n/){
		$genus=ucfirst(lc($1));
		if($key_number-$i == 1){
			$modified_key=&mod_key($genus, $paragraphs[$key_number]);
			print "Species of $genus\n$modified_key\n\n";
#GENERA ASSOCIATED WITH KEYS ARE REMEMBERED
			$target_URL{$genus}="GO TO GENUS KEY";
		}
	}
#RECOGNIZE KEY TO GROUPS PARAGRAPHS
	elsif(m/^Key to .*/){
		$genus=ucfirst(lc($1));
		if($key_number-$i == 1){
			$modified_key=&mod_key($genus, $paragraphs[$key_number]);
			print "KEY TO GROUPS FOR $genus\n$modified_key\n\n";
		$target_URL{$genus}="GO TO GENUS KEY";
		}
	}
#RECOGNIZE GROUP KEY PARAGRAPHS
	elsif(m/^(Group.*)/){
		$genus=ucfirst(lc($1));
		if($key_number-$i == 1){
			$modified_key=&mod_key($genus, $paragraphs[$key_number]);
			print "GROUP KEY FOR $genus\n$modified_key\n\n";
		$target_URL{$genus}="GO TO GENUS KEY";
		}
	}
}

sub mod_key {
	my $genus =shift;
	my $key =shift;
	my @key_lines =split(/\n/,$key);
	foreach $j (0 .. $#key_lines){
		$key_lines[$j] =~s/UNABRIDGED KEY LEAD: //;
#RECOGNIZE LINES WITH TARGETS
		if($key_lines[$j] =~s/ *\.\.\.\.\.-> *(.*)/\t\1/){
			$target=$1;
			$target=~s/[\[\]]//g;
#ABBREVIATED GENUS NAMES ARE EXPANDED
			$target=~s/[A-Z]\./$genus/;
#GENUS NAMES ARE LOWERCASED
			$target=ucfirst(lc($target));
#BARE VARIETAL NAMES ARE CLOTHED
			if($target=~s/(Subsp\.|Var\.|F\.)/\L$1/){
				$target="$species $target";
			}
			else{
				$species=$target;
			}
			$target=~s/ *\(\d+\) *//;
			if($target_URL{$target}){
				$target = "$target_URL{$target} FOR $target";
			}
			$key_lines[$j] =~s/^(\d+[a-zA-Z]?)[.'](.*)\t.*/$1\t$2\t$target/;
		}
		else{
#ASSUME THAT THE LINE FOLLOWING A LINE WITHOUT A TARGET IS THE SUCCESSOR, #USE ITS NUMBER AS THE TARGET
			($next_key_number=$key_lines[$j+1]) =~s/^(\d+[a-z]?)[.'].*/$1/;
			$key_lines[$j] =~s/^(\d+[a-z]?)[.'](.*)/$1\t$2\t$next_key_number/;
		}
	}
	foreach(@key_lines){
#HTML ITALICS
		while(s/_/<i>/){
			s/_/<\/i>/;
		}
	}
return join("\n",sort {$a <=> $b}(@key_lines));
}