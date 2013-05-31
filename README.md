UOttawa LaTeX Thesis Template
================================

This is a LaTeX document class I wrote for my PhD thesis in Physics at the
University of Ottawa.

I tried to follow as much as possible the different guidelines from the Physics
Department, the Faculty of Science and the Faculty of Graduate and Postdoctoral
Studies.


Usage
-------------------------
Use it as a document class:

    \documentclass[author={Your name},title={Thesis' title},linenumbers,draft=true]{uottawa}

See the file example/example_thesis.tex for a basic example. I also included
the compiled version in example/example_thesis.pdf.

Required option:

 * author: Your name. Must be enclosed in brackets "{}"
 * title: Title of the thesis. Must be enclosed in brackets "{}"

Optional options:

 * linenumbers: Add line numbers before at start of every lines for ease of edition.
 * draft: Makes compilation faster by skipping some LaTeX options. Will not include
          external PDF or figures for example.
 * final: Opposite of the "draft" option.


Notes
-------------------------
There isn't an exact requirement for a thesis formatting at University of Ottawa.
Instead, there is some general guidelines that I tried to follow. Students are
free to format what is not specified, as long as it stays sober and does not
impact the readability of the final thesis.

Additionally, since many different styles can respect the guidelines, I have
created this class to get something visually appealing to me, but please feel
free to modify to your liking.

This is a work in progress as I haven't submitted the final version of my thesis.

This LaTeX class is based on the letterpaper class.

You should verify with your department/faculty/etc. that the template you use
respect their requirements.


Useful guides/links that I used:
 * Most detailed information of formatting
   http://web5.uottawa.ca/www3/fespfgps/theses/do-en-2point5num1.htm
 * University of Ottawa Thesis LaTeX Template
   Wail Gueaieb, Ph.D., P.Eng., SMIEEE, Associate Professor
   http://miram1.site.uottawa.ca/~wgueaieb/site/index.php?id=9
 * Thesis Style Files
   Monica Nevins, Associate Professor
   http://padic.mathstat.uottawa.ca/~mnevins/thesis/
 * Guide for Doctoral thesis
   http://www.grad.uottawa.ca/Default.aspx?tabid=1373
 * General Regulations
   http://www.grad.uottawa.ca/Default.aspx?tabid=1807&msId=21

License
-------------------------

This code is distributed under the terms of the [GNU General Public License v3 (GPLv3)](http://www.gnu.org/licenses/gpl.html) and is Copyright 2013 Nicolas Bigaouette.


