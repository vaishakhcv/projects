#! /bin/bash
url=$1
u=$url
dir()
{
	mkdir tmp_html
}
html()
{
echo "
 		<html>
		<head> <title>ClickJacking Vulneribiliy Check</title>
		</head> 
		<body bgcolor=#9999ff>
		<h1><center><b><i><u>ClickJacking Test</u></i></b></h1>
		<iframe src="$url" width="900" height="600"></iframe><br>
		<h3>If you see the webpage above, then the website $url is <font size=14 color="red"><b>vulnerable</b></font></h3>
		</center></body>
		</html>
		" > tmp_html/test.html
}

open()
{
	firefox tmp_html/test.html
}
if [[ $# == 0 ]]; then
		echo "No input found"
		echo "./clickjack [website url]"
		echo "Eg: ./clickjack http://google.com"		
else
	dir
	html
	open	
	rm -r tmp_html	
fi  		