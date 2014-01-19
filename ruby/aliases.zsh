# A hand one liner for quick Ruby one-liners
r() 
{
  echo "$fg[red]$(ruby -v | cut -d ' ' -f 1,2)> $1 "
  echo "--------\n $reset_color"
  ruby -e $1 | tee >(pbcopy)  
}
