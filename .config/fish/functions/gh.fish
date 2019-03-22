function gh
	if git rev-parse
		open (git remote -v | grep 'origin' -m 1 | awk '{print $2}')
	end
end
