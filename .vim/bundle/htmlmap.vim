" --------------------------------------------------------------------
" "htmlmap.vim" 1.01pl2
" VIM script to ease the entry of HTML character entities
" --------------------------------------------------------------------
" Copyright (c) 2002 by Antoine Mechelynck, Brussels.
" Please report any bugs and/or proposed patches to:
" mailto:antoine.mechelynck@belgacom.net
"
" The author expresses NO WARRANTY about the FITNESS of the data below
" for ANY USE WHATSOEVER including MERCHANTABILITY for a particular
" PURPOSE. (You use this file at YOUR OWN risk.)
" 
" You may copy this file and use it.
" You may re-distribute this entire file with or without payment.
" You may re-package this file for re-distribution with other software.
"
" You may extract parts of this file and use them without the rest.
"
" You must never take any measures which would restrict the freedom of
" other people to copy, use, and distribute this file in the manner
" outlined above.
" --------------------------------------------------------------------
" The release history has been placed at the end of the file.
" --------------------------------------------------------------------
" Compatibility issues: This script was written for gvim 6.0 -- that's
" the version I use on both Linux and Windows. It ought to work OK on
" later versions. I don't know if and how it works on which earlier
" versions.
" --------------------------------------------------------------------
" This script maps characters above 128 to their &...; entities.
" An input method similar to Vim's "digraphs" is supported, but
" with a differernt prefix (here: F12), so you can avoid translation
" by using Vim's Ctrl-K digraphs (which will not be remapped).
" To change the digraph prefix, open this file in Vim, then execute
" the following command:
"
" :1,$s/F12/<your-prefix-key>/
"
" (e.g., to use, say, Ctrl-Shift-F7, type:
" :1,$s/F12/C-S-F7/
" )
"
" We don't bracket F12 by <> in order to replace it also in the
" comments.
" --------------------------------------------------------------------
" The first mapping (F12-Space-Space to &nbsp;) has been disabled by
" default. Uncomment it if you find it useful.
" In some future release it might become enabled by default (the change,
" if and when it happens, will be announced in the corresponding
" release description at VimOnline).
" Note that <Ctrl-K><Space><Space> gives <Space> with the high bit set,
" which happens to be the non-breaking space (since 32+128=160,
" i.e. 0x20+0x80=0xA0). I found out after defining the mapping.
" --------------------------------------------------------------------
" To use this file as a whole, you might for instance add the following
" (or something similar) to your vimrc :
"
" if has("autocmd")
" 	autocmd Syntax html source $VIM/htmlmap.vim
" endif
" 
" (this is assuming that you put the file in the $VIM directory; otherwise
" just change the path accordingly).
" The if statement is there to avoid errors when using the same vimrc with
" different versions of vi/vim/gvim with different compilation options.
" If you want to use this file with a vim that does not support autocommands,
" you will probably have to source the file manually in every buffer that
" needs it.
"
" If you type these complex sequences slowly you might also want to set
" the 'timeoutlen', e.g.
"
" if &ttimeoutlen < 0
" 	let &ttimeoutlen=&timeoutlen
" endif
" let &timeoutlen= &timeoutlen * 5
" 
" --------------------------------------------------------------------
" Note: As of this writing (March 2002) there is no provision for
" undoing all this work while keeping the buffer. Writing a companion
" script for the undo should be easy but tedious; and it doesn't make much
" sense to me.
" --------------------------------------------------------------------
" avoid doing it twice
if (exists("b:htmlmapread")) && (b:htmlmapread)
	finish
endif
let b:htmlmapread=1
" Ctrl-K digraphs are not remapped. So let's use F12 instead,
" with the same character pairs.
" (In our vimrc file we'll map F12 to Ctrl-K for other filetypes.)
" 
" We define two entries for each character in the range 160-255:
" one for the character itself (as entered on national keyboards)
" and one as <F12><Char1><Char2> for digraph-style entry.
" For A-ring and a-ring we even define two digraphs, since
" AA and aa are default, but A0 and a0 follow the standard.
" Note that typing the digraph characters (when different) in the
" "wrong" order will fallback to the "normal" single character,
" except when both are defined (as for example, !I = inverted !
" but I! = I grave).
" imap <buffer> <F12><Space><Space> &nbsp;
imap <buffer> ¡ &iexcl;
imap <buffer> <F12>!I &iexcl;
imap <buffer> ¢ &cent;
imap <buffer> <F12>Ct &cent;
imap <buffer> £ &pound;
imap <buffer> <F12>Pd &pound;
imap <buffer> ¤ &curren;
imap <buffer> <F12>Cu &curren
imap <buffer> ¥ &yen;
imap <buffer> <F12>Ye &yen;
imap <buffer> ¦ &brvbar;
imap <buffer> <F12>BB &brvbar;
imap <buffer> § &sect;
imap <buffer> <F12>SE &sect;
imap <buffer> ¨ &uml;
imap <buffer> <F12>': &uml;
imap <buffer> © &copy;
imap <buffer> <F12>Co &copy;
imap <buffer> ª &ordf;
imap <buffer> <F12>-a &ordf;
imap <buffer> « &laquo;
imap <buffer> <F12><< &laquo;
imap <buffer> ¬ &not;
imap <buffer> <F12>NO &not;
imap <buffer> <Char-0xad> &shy;
imap <buffer> <F12>-- &shy;
imap <buffer> ® &reg;
imap <buffer> <F12>Rg &reg;
imap <buffer> ¯ &macr;
imap <buffer> <F12>'m &macr;
imap <buffer> ° &deg;
imap <buffer> <F12>DG &deg;
imap <buffer> ± &plusmn;
imap <buffer> <F12>+- &plusmn;
imap <buffer> ² &sup2;
imap <buffer> <F12>2S &sup2;
imap <buffer> ³ &sup3;
imap <buffer> <F12>3S &sup3
imap <buffer> ´ &acute;
imap <buffer> <F12>'' &acute;
imap <buffer> µ &micro;
imap <buffer> <F12>My &micro;
imap <buffer> ¶ &para;
imap <buffer> <F12>PI &para;
imap <buffer> · &middot;
imap <buffer> <F12>.M &middot;
imap <buffer> ¸ &cedil;
imap <buffer> <F12>', &cedil;
imap <buffer> ¹ &sup1;
imap <buffer> <F12>1S &sup1;
imap <buffer> º &ordm;
imap <buffer> <F12>-o &ordm;
imap <buffer> » &raquo;
imap <buffer> <F12>>> &raquo;
imap <buffer> ¼ &frac14;
imap <buffer> <F12>14 &frac14;
imap <buffer> ½ &frac12;
imap <buffer> <F12>12 &frac12;
imap <buffer> ¾ &frac34;
imap <buffer> <F12>34 &frac34;
imap <buffer> ¿ &iquest;
imap <buffer> <F12>?I &iquest;
imap <buffer> À &Agrave;
imap <buffer> <F12>A! &Agrave;
imap <buffer> Á &Aacute;
imap <buffer> <F12>A' &Aacute;
imap <buffer> Â &Acirc;
imap <buffer> <F12>A> &Acirc;
imap <buffer> Ã &Atilde;
imap <buffer> <F12>A? &Atilde;
imap <buffer> Ä &Auml;
imap <buffer> <F12>A: &Auml;
imap <buffer> Å &Aring;
imap <buffer> <F12>AA &Aring;
imap <buffer> <F12>A0 &Aring;
imap <buffer> Æ &AElig;
imap <buffer> <F12>AE &AElig;
imap <buffer> Ç &Ccedil;
imap <buffer> <F12>C, &Ccedil;
imap <buffer> È &Egrave;
imap <buffer> <F12>E! &Egrave;
imap <buffer> É &Eacute;
imap <buffer> <F12>E' &Eacute;
imap <buffer> Ê &Ecirc;
imap <buffer> <F12>E> &Ecirc;
imap <buffer> Ë &Euml;
imap <buffer> <F12>E: &Euml;
imap <buffer> Ì &Igrave;
imap <buffer> <F12>I! &Igrave;
imap <buffer> Í &Iacute;
imap <buffer> <F12>I' &Iacute;
imap <buffer> Î &Icirc;
imap <buffer> <F12>I> &Icirc;
imap <buffer> Ï &Iuml;
imap <buffer> <F12>I: &Iuml;
imap <buffer> Ð &ETH;
imap <buffer> <F12>D- &ETH;
imap <buffer> Ñ &Ntilde;
imap <buffer> <F12>N? &Ntilde;
imap <buffer> Ò &Ograve;
imap <buffer> <F12>O! &Ograve;
imap <buffer> Ó &Oacute;
imap <buffer> <F12>O' &Oacute;
imap <buffer> Ô &Ocirc;
imap <buffer> <F12>O> &Ocirc;
imap <buffer> Õ &Otilde;
imap <buffer> <F12>O? &Otilde;
imap <buffer> Ö &Ouml;
imap <buffer> <F12>O: &Ouml;
imap <buffer> × &times;
imap <buffer> <F12>*X &times;
imap <buffer> Ø &Oslash;
imap <buffer> <F12>O/ &Oslash;
imap <buffer> Ù &Ugrave;
imap <buffer> <F12>U! &Ugrave;
imap <buffer> Ú &Uacute;
imap <buffer> <F12>U' &Uacute;
imap <buffer> Û &Ucirc;
imap <buffer> <F12>U> &Ucirc;
imap <buffer> Ü &Uuml;
imap <buffer> <F12>U: &Uuml;
imap <buffer> Ý &Yacute;
imap <buffer> <F12>Y' &Yacute;
imap <buffer> Þ &THORN;
imap <buffer> <F12>TH &THORN;
imap <buffer> ß &szlig;
imap <buffer> <F12>ss &szlig;
imap <buffer> à &agrave;
imap <buffer> <F12>a! &agrave;
imap <buffer> á &aacute;
imap <buffer> <F12>a' &aacute;
imap <buffer> â &acirc;
imap <buffer> <F12>a> &acirc;
imap <buffer> ã &atilde;
imap <buffer> <F12>a? &atilde;
imap <buffer> ä &auml;
imap <buffer> <F12>a: &auml;
imap <buffer> å &aring;
imap <buffer> <F12>aa &aring;
imap <buffer> <F12>a0 &aring;
imap <buffer> æ &aelig;
imap <buffer> <F12>ae &aelig;
imap <buffer> ç &ccedil;
imap <buffer> <F12>c, &ccedil;
imap <buffer> è &egrave;
imap <buffer> <F12>e! &egrave;
imap <buffer> é &eacute;
imap <buffer> <F12>e' &eacute;
imap <buffer> ê &ecirc;
imap <buffer> <F12>e> &ecirc;
imap <buffer> ë &euml;
imap <buffer> <F12>e: &euml;
imap <buffer> ì &igrave;
imap <buffer> <F12>i! &igrave;
imap <buffer> í &iacute;
imap <buffer> <F12>i' &iacute;
imap <buffer> î &icirc;
imap <buffer> <F12>i> &icirc;
imap <buffer> ï &iuml;
imap <buffer> <F12>i: &iuml;
imap <buffer> ð &eth;
imap <buffer> <F12>d- &eth;
imap <buffer> ñ &ntilde;
imap <buffer> <F12>n? &ntilde;
imap <buffer> ò &ograve;
imap <buffer> <F12>o! &ograve;
imap <buffer> ó &oacute;
imap <buffer> <F12>o' &oacute;
imap <buffer> ô &ocirc;
imap <buffer> <F12>o> &ocirc;
imap <buffer> õ &otilde;
imap <buffer> <F12>o? &otilde;
imap <buffer> ö &ouml;
imap <buffer> <F12>o: &ouml;
imap <buffer> ÷ &divide;
imap <buffer> <F12>-: &divide;
imap <buffer> ø &oslash;
imap <buffer> <F12>o/ &oslash;
imap <buffer> ù &ugrave;
imap <buffer> <F12>u! &ugrave;
imap <buffer> ú &uacute;
imap <buffer> <F12>u' &uacute;
imap <buffer> û &ucirc;
imap <buffer> <F12>u> &ucirc;
imap <buffer> ü &uuml;
imap <buffer> <F12>u: &uuml;
imap <buffer> ý &yacute;
imap <buffer> <F12>y' &yacute;
imap <buffer> þ &thorn;
imap <buffer> <F12>th &thorn;
imap <buffer> ÿ &yuml;
imap <buffer> <F12>y: &yuml;
imap <buffer> € &euro;
imap <buffer> <F12>eu &euro;
" 
" We extend the digraph method to UTF characters above 255;
" however, we use numerical values because a few older browsers will
" accept them, even if they reject the corresponding symbolic names.
"
" If you can type Unicode on your system, you may want to duplicate
" the entries below using the actual multibyte character, in a
" similar fashion to what we did above. Please let me know about it.
" 
" <Char-35> is the number sign, "#", because #0 ... #9 are F1 ... F9 in
" mappings.
"
" I know that \xnnn (with nnn > FF) is nonstandard, but I suppose
" that (in comments) it will be understood.
"
imap <buffer> <F12>A- &<Char-35>256;
imap <buffer> <F12>a- &<Char-35>257;
imap <buffer> <F12>A( &<Char-35>258;
imap <buffer> <F12>a( &<Char-35>259;
imap <buffer> <F12>A; &<Char-35>260;
imap <buffer> <F12>a; &<Char-35>261;
imap <buffer> <F12>C' &<Char-35>262;
imap <buffer> <F12>c' &<Char-35>263;
imap <buffer> <F12>C> &<Char-35>264;
imap <buffer> <F12>c> &<Char-35>265;
imap <buffer> <F12>C. &<Char-35>266;
imap <buffer> <F12>c. &<Char-35>267;
imap <buffer> <F12>C< &<Char-35>268;
imap <buffer> <F12>c< &<Char-35>269;
imap <buffer> <F12>D< &<Char-35>270;
imap <buffer> <F12>d< &<Char-35>271;
imap <buffer> <F12>D/ &<Char-35>272;
imap <buffer> <F12>d/ &<Char-35>273;
imap <buffer> <F12>E- &<Char-35>274;
imap <buffer> <F12>e- &<Char-35>275;
" \x114 &#276; undefined
" \x115 &#277; undefined
imap <buffer> <F12>E. &<Char-35>278;
imap <buffer> <F12>e. &<Char-35>279;
imap <buffer> <F12>E; &<Char-35>280;
imap <buffer> <F12>e; &<Char-35>281;
imap <buffer> <F12>E< &<Char-35>282;
imap <buffer> <F12>e< &<Char-35>283;
imap <buffer> <F12>G> &<Char-35>284;
imap <buffer> <F12>g> &<Char-35>285;
imap <buffer> <F12>G( &<Char-35>286;
imap <buffer> <F12>g( &<Char-35>287;
imap <buffer> <F12>G. &<Char-35>288;
imap <buffer> <F12>g. &<Char-35>289;
imap <buffer> <F12>G, &<Char-35>290;
imap <buffer> <F12>g, &<Char-35>291;
imap <buffer> <F12>H> &<Char-35>292;
imap <buffer> <F12>h> &<Char-35>293;
imap <buffer> <F12>H/ &<Char-35>294;
imap <buffer> <F12>h/ &<Char-35>295;
imap <buffer> <F12>I? &<Char-35>296;
imap <buffer> <F12>i? &<Char-35>297;
imap <buffer> <F12>I- &<Char-35>298;
imap <buffer> <F12>i- &<Char-35>299;
" \x12c &#300; undefined
" \x12d &#301; undefined
imap <buffer> <F12>I; &<Char-35>302;
imap <buffer> <F12>i; &<Char-35>303;
imap <buffer> <F12>I. &<Char-35>304;
" since small i normally has a dot above, we use i. for small dotless i
imap <buffer> <F12>i. &<Char-35>305;
imap <buffer> <F12>IJ &<Char-35>306;
imap <buffer> <F12>ij &<Char-35>307;
imap <buffer> <F12>J> &<Char-35>308;
imap <buffer> <F12>j> &<Char-35>309;
imap <buffer> <F12>K, &<Char-35>310;
imap <buffer> <F12>k, &<Char-35>311;
imap <buffer> <F12>kr &<Char-35>312;
imap <buffer> <F12>L' &<Char-35>313;
imap <buffer> <F12>l' &<Char-35>314;
imap <buffer> <F12>L, &<Char-35>315;
imap <buffer> <F12>l, &<Char-35>316;
imap <buffer> <F12>L< &<Char-35>317;
imap <buffer> <F12>l< &<Char-35>318;
" Attention! We pre-empt L. l. for "dot in the middle" (instead of above)
imap <buffer> <F12>L. &<Char-35>319;
imap <buffer> <F12>l. &<Char-35>320;
imap <buffer> <F12>L/ &<Char-35>321;
imap <buffer> <F12>l/ &<Char-35>322;
imap <buffer> <F12>N' &<Char-35>323;
imap <buffer> <F12>n' &<Char-35>324;
imap <buffer> <F12>N, &<Char-35>325;
imap <buffer> <F12>n, &<Char-35>326;
imap <buffer> <F12>N< &<Char-35>327;
imap <buffer> <F12>n< &<Char-35>328;
imap <buffer> <F12>'n &<Char-35>329;
imap <buffer> <F12>NG &<Char-35>330;
imap <buffer> <F12>ng &<Char-35>331;
imap <buffer> <F12>O- &<Char-35>332;
imap <buffer> <F12>o- &<Char-35>333;
" \x14e &#334; undefined
" \x14f &#335; undefined
imap <buffer> <F12>O" &<Char-35>336;
imap <buffer> <F12>o" &<Char-35>337;
imap <buffer> <F12>OE &<Char-35>338;
imap <buffer> <F12>oe &<Char-35>339;
imap <buffer> <F12>R' &<Char-35>340;
imap <buffer> <F12>r' &<Char-35>341;
imap <buffer> <F12>R, &<Char-35>342;
imap <buffer> <F12>r, &<Char-35>343;
imap <buffer> <F12>R< &<Char-35>344;
imap <buffer> <F12>r< &<Char-35>345;
imap <buffer> <F12>S' &<Char-35>346;
imap <buffer> <F12>s' &<Char-35>347;
imap <buffer> <F12>S> &<Char-35>348;
imap <buffer> <F12>s> &<Char-35>349;
imap <buffer> <F12>S, &<Char-35>350;
imap <buffer> <F12>s, &<Char-35>351;
imap <buffer> <F12>S< &<Char-35>352;
imap <buffer> <F12>s< &<Char-35>353;
imap <buffer> <F12>T, &<Char-35>354;
imap <buffer> <F12>t, &<Char-35>355;
imap <buffer> <F12>T< &<Char-35>356;
imap <buffer> <F12>t< &<Char-35>357;
imap <buffer> <F12>T/ &<Char-35>358;
imap <buffer> <F12>t/ &<Char-35>359;
imap <buffer> <F12>U? &<Char-35>360;
imap <buffer> <F12>u? &<Char-35>361;
imap <buffer> <F12>U- &<Char-35>362;
imap <buffer> <F12>u- &<Char-35>363;
imap <buffer> <F12>U( &<Char-35>364;
imap <buffer> <F12>u( &<Char-35>365;
imap <buffer> <F12>U0 &<Char-35>366;
imap <buffer> <F12>u0 &<Char-35>367;
imap <buffer> <F12>U" &<Char-35>368;
imap <buffer> <F12>u" &<Char-35>369;
imap <buffer> <F12>U; &<Char-35>370;
imap <buffer> <F12>u; &<Char-35>371;
imap <buffer> <F12>W> &<Char-35>372;
imap <buffer> <F12>w> &<Char-35>373;
imap <buffer> <F12>Y> &<Char-35>374;
imap <buffer> <F12>y> &<Char-35>375;
imap <buffer> <F12>Y: &<Char-35>376;
imap <buffer> <F12>Z' &<Char-35>377;
imap <buffer> <F12>z' &<Char-35>378;
imap <buffer> <F12>Z. &<Char-35>379;
imap <buffer> <F12>z. &<Char-35>380;
imap <buffer> <F12>Z< &<Char-35>381;
imap <buffer> <F12>z< &<Char-35>382;
" \x17f &#383; undefined
" 
" Character values from \x180 &#384; upwards are only scantily defined,
" until we come to the Greek section:
" 
" \x192 &#402; small latin f with hook
imap <buffer> <F12>f2 &<Char-35>402;
" \x1f5 &#501; small latin g with acute accent
imap <buffer> <F12>g' &<Char-35>501;
" 
" \x2bc &#700; apostrophe modifier
" \x2c6 &#710; circumflex accent
" \x2c7 &#711; caron
" \x2d8 &#728; breve
" \x2d9 &#729; dot above
" \x2da &#730; ring above
" \x2db &#731; ogonek
" \x2dc &#732; small tilde
" \x2dd &#733; double acute accent
" 
" \x386 &#902; Greek capital alpha with tonos
imap <buffer> <F12>A% &<Char-35>902;
" \x387 &#903; undefined
" \x388 &#904; Greek capital epsilon with tonos
imap <buffer> <F12>E% &<Char-35>904;
" \x389 &#905; Greek capital eta with tonos
imap <buffer> <F12>H% &<Char-35>905;
" \x38a &#906; Greek capital iota with tonos
imap <buffer> <F12>I% &<Char-35>906;
" \x38b &#907; undefined
" \x38c &#908; Greek capital omicron with tonos
imap <buffer> <F12>O% &<Char-35>908;
" \x38d &#909; undefined
" \x38e &#910; Greek capital upsilon with tonos
imap <buffer> <F12>U% &<Char-35>910;
" \x38f &#911; Greek capital omega with tonos
imap <buffer> <F12>W% &<Char-35>911;
" \x390 &#912; Greek small iota with tonos and dialytika
imap <buffer> <F12>j% &<Char-35>912;
" \x391 &#913; Greek capital alpha (etc.)
imap <buffer> <F12>A* &<Char-35>913;
imap <buffer> <F12>B* &<Char-35>914;
imap <buffer> <F12>G* &<Char-35>915;
imap <buffer> <F12>D* &<Char-35>916;
imap <buffer> <F12>E* &<Char-35>917;
imap <buffer> <F12>Z* &<Char-35>918;
imap <buffer> <F12>H* &<Char-35>919;
" I use "special Greek T" for theta (normal Greek t will be tau)
imap <buffer> <F12>T% &<Char-35>920;
imap <buffer> <F12>I* &<Char-35>921;
imap <buffer> <F12>K* &<Char-35>922;
imap <buffer> <F12>L* &<Char-35>923;
imap <buffer> <F12>M* &<Char-35>924;
imap <buffer> <F12>N* &<Char-35>925;
" I use "Greek X" for ksi (chi will be "Greek c" even if not very logical)
imap <buffer> <F12>X* &<Char-35>926;
imap <buffer> <F12>O* &<Char-35>927;
imap <buffer> <F12>P* &<Char-35>928;
imap <buffer> <F12>R* &<Char-35>929;
" \x3a2 &#930 undefined
imap <buffer> <F12>S* &<Char-35>931;
imap <buffer> <F12>T* &<Char-35>932;
imap <buffer> <F12>U* &<Char-35>933;
imap <buffer> <F12>F* &<Char-35>934;
imap <buffer> <F12>C* &<Char-35>935;
imap <buffer> <F12>P% &<Char-35>936;
imap <buffer> <F12>W* &<Char-35>937;
" \x3aa &#938; Greek capital iota with dialytika
imap <buffer> <F12>J* &<Char-35>938;
" \x3ab &#939; Greek capital upsilon with dialytika
imap <buffer> <F12>Y* &<Char-35>939;
" \x3ac &#940; Greek small alpha with tonos (etc.)
imap <buffer> <F12>a% &<Char-35>940;
imap <buffer> <F12>e% &<Char-35>941;
imap <buffer> <F12>h% &<Char-35>942;
imap <buffer> <F12>i% &<Char-35>943;
imap <buffer> <F12>y% &<Char-35>944;
imap <buffer> <F12>a* &<Char-35>945;
imap <buffer> <F12>b* &<Char-35>946;
imap <buffer> <F12>g* &<Char-35>947;
imap <buffer> <F12>d* &<Char-35>948;
imap <buffer> <F12>e* &<Char-35>949;
imap <buffer> <F12>z* &<Char-35>950;
imap <buffer> <F12>h* &<Char-35>951;
imap <buffer> <F12>t% &<Char-35>952;
imap <buffer> <F12>i* &<Char-35>953;
imap <buffer> <F12>k* &<Char-35>954;
imap <buffer> <F12>l* &<Char-35>955;
imap <buffer> <F12>m* &<Char-35>956;
imap <buffer> <F12>n* &<Char-35>957;
imap <buffer> <F12>x* &<Char-35>958;
imap <buffer> <F12>o* &<Char-35>959;
imap <buffer> <F12>p* &<Char-35>960;
imap <buffer> <F12>r* &<Char-35>961;
imap <buffer> <F12>s% &<Char-35>962;
imap <buffer> <F12>s* &<Char-35>963;
imap <buffer> <F12>t* &<Char-35>964;
imap <buffer> <F12>u* &<Char-35>965;
imap <buffer> <F12>f* &<Char-35>966;
imap <buffer> <F12>c* &<Char-35>967;
imap <buffer> <F12>p% &<Char-35>968;
imap <buffer> <F12>w* &<Char-35>969;
imap <buffer> <F12>j* &<Char-35>970;
imap <buffer> <F12>y* &<Char-35>971;
imap <buffer> <F12>o% &<Char-35>972;
" \x3cd &#973; undefined
imap <buffer> <F12>w% &<Char-35>974;
" \x3cf &#975; undefined
" \x3d0 &#976; undefined
" \x3d1 &#977; Greek theta symbol
imap <buffer> <F12>t3 &<Char-35>977;
" \x3d2 &#978; Greek upsilon with hook
imap <buffer> <F12>Y3 &<Char-35>978;
" \x3d3 &#979; undefined
" \x3d4 &#980; undefined
" \x3d5 &#981; Greek phi symbol
imap <buffer> <F12>f3 &<Char-35>981;
" \x3d6 &#982; Greek pi symbol (small omega with bar above)
imap <buffer> <F12>p3 &<Char-35>982;
" \x3d7 &#983; Greek digamma (vau)
imap <buffer> <F12>v* &<Char-35>983;
" 24 slots unused (\3d8-\3ef, &#984;-&#1007;)
" \x3f0 &#1008; Greek kappa symbol
imap <buffer> <F12>k% &<Char-35>1008;
" \x3f1 &#1009; Greek rho symbol
imap <buffer> <F12>r% &<Char-35>1009;
" 14 slots unused (\3f2-\3ff, &#1010;-&#1023;)
"
" \x400 &#1024; start of Cyrillic part
"
imap <buffer> <F12>YO &<Char-35>1025;
imap <buffer> <F12>DJ &<Char-35>1026;
imap <buffer> <F12>GJ &<Char-35>1027;
imap <buffer> <F12>UE &<Char-35>1028;
imap <buffer> <F12>DZ &<Char-35>1029;
imap <buffer> <F12>UI &<Char-35>1030;
imap <buffer> <F12>JI &<Char-35>1031;
imap <buffer> <F12>JJ &<Char-35>1032;
imap <buffer> <F12>LJ &<Char-35>1033;
imap <buffer> <F12>NJ &<Char-35>1034;
imap <buffer> <F12>TC &<Char-35>1035;
imap <buffer> <F12>KJ &<Char-35>1036;
" \x40d &#1037; undefined
" I use ) for Cyrillic short to avoid clash with Latin breve, (
imap <buffer> <F12>U) &<Char-35>1038;
imap <buffer> <F12>CJ &<Char-35>1039;
imap <buffer> <F12>A= &<Char-35>1040;
imap <buffer> <F12>B= &<Char-35>1041;
imap <buffer> <F12>V= &<Char-35>1042;
imap <buffer> <F12>G= &<Char-35>1043;
imap <buffer> <F12>D= &<Char-35>1044;
imap <buffer> <F12>E= &<Char-35>1045;
imap <buffer> <F12>J= &<Char-35>1046;
imap <buffer> <F12>Z= &<Char-35>1047;
imap <buffer> <F12>I= &<Char-35>1048;
imap <buffer> <F12>I) &<Char-35>1049;
imap <buffer> <F12>K= &<Char-35>1050;
imap <buffer> <F12>L= &<Char-35>1051;
imap <buffer> <F12>M= &<Char-35>1052;
imap <buffer> <F12>N= &<Char-35>1053;
imap <buffer> <F12>O= &<Char-35>1054;
imap <buffer> <F12>P= &<Char-35>1055;
imap <buffer> <F12>R= &<Char-35>1056;
imap <buffer> <F12>S= &<Char-35>1057;
imap <buffer> <F12>T= &<Char-35>1058;
imap <buffer> <F12>U= &<Char-35>1059;
imap <buffer> <F12>F= &<Char-35>1060;
imap <buffer> <F12>X= &<Char-35>1061;
imap <buffer> <F12>C= &<Char-35>1062;
imap <buffer> <F12>Q= &<Char-35>1063;
imap <buffer> <F12>H= &<Char-35>1064;
imap <buffer> <F12>W= &<Char-35>1065;
imap <buffer> <F12>!% &<Char-35>1066;
imap <buffer> <F12>Y= &<Char-35>1067;
imap <buffer> <F12>?% &<Char-35>1068;
imap <buffer> <F12>EH &<Char-35>1069;
imap <buffer> <F12>YU &<Char-35>1070;
imap <buffer> <F12>YA &<Char-35>1071;
imap <buffer> <F12>a= &<Char-35>1072;
imap <buffer> <F12>b= &<Char-35>1073;
imap <buffer> <F12>v= &<Char-35>1074;
imap <buffer> <F12>g= &<Char-35>1075;
imap <buffer> <F12>d= &<Char-35>1076;
imap <buffer> <F12>e= &<Char-35>1077;
imap <buffer> <F12>j= &<Char-35>1078;
imap <buffer> <F12>z= &<Char-35>1079;
imap <buffer> <F12>i= &<Char-35>1080;
imap <buffer> <F12>i) &<Char-35>1081;
imap <buffer> <F12>k= &<Char-35>1082;
imap <buffer> <F12>l= &<Char-35>1083;
imap <buffer> <F12>m= &<Char-35>1084;
imap <buffer> <F12>n= &<Char-35>1085;
imap <buffer> <F12>o= &<Char-35>1086;
imap <buffer> <F12>p= &<Char-35>1087;
imap <buffer> <F12>r= &<Char-35>1088;
imap <buffer> <F12>s= &<Char-35>1089;
imap <buffer> <F12>t= &<Char-35>1090;
imap <buffer> <F12>u= &<Char-35>1091;
imap <buffer> <F12>f= &<Char-35>1092;
imap <buffer> <F12>x= &<Char-35>1093;
imap <buffer> <F12>c= &<Char-35>1094;
imap <buffer> <F12>q= &<Char-35>1095;
imap <buffer> <F12>h= &<Char-35>1096;
imap <buffer> <F12>w= &<Char-35>1097;
imap <buffer> <F12>!= &<Char-35>1098;
imap <buffer> <F12>y= &<Char-35>1099;
imap <buffer> <F12>?= &<Char-35>1100;
imap <buffer> <F12>eh &<Char-35>1101;
imap <buffer> <F12>yu &<Char-35>1102;
imap <buffer> <F12>ya &<Char-35>1103;
" \x450 &#1104; undefined
imap <buffer> <F12>yo &<Char-35>1105;
imap <buffer> <F12>dj &<Char-35>1106;
imap <buffer> <F12>gj &<Char-35>1107;
imap <buffer> <F12>ue &<Char-35>1108;
imap <buffer> <F12>dz &<Char-35>1109;
imap <buffer> <F12>ui &<Char-35>1110;
imap <buffer> <F12>ji &<Char-35>1111;
imap <buffer> <F12>jj &<Char-35>1112;
imap <buffer> <F12>lj &<Char-35>1113;
imap <buffer> <F12>nj &<Char-35>1114;
imap <buffer> <F12>tc &<Char-35>1115;
imap <buffer> <F12>kj &<Char-35>1116;
" \x45d &#1117; undefined
imap <buffer> <F12>u) &<Char-35>1118;
imap <buffer> <F12>cj &<Char-35>1119;
" 
" then a lot of empty slots until...
"
" \x2000 &#8192; undefined
" \x2001 &#8193; undefined
" \x2002 &#8194; en space
imap <buffer> <F12>n_ &<Char-35>8194;
" \x2003 &#8195; em space
imap <buffer> <F12>m_ &<Char-35>8195;
" \x2004 &#8196; three-per-em space
imap <buffer> <F12>3m &<Char-35>8196;
" \x2005 &#8197; four-per-em space
imap <buffer> <F12>4m &<Char-35>8197;
" \x2006 &#8198; undefined
" \x2007 &#8199; figure space
imap <buffer> <F12>0_ &<Char-35>8199;
" \x2008 &#8200; punctuation space
imap <buffer> <F12>._ &<Char-35>8200;
" \x2009 &#8201; thin space
imap <buffer> <F12>t_ &<Char-35>8201;
" \x200a &#8202; hair space
imap <buffer> <F12>h_ &<Char-35>8202;
" \x200b &#8203; undefined
" \x200c &#8204; zero width non-joiner
imap <buffer> <F12>0n &<Char-35>8204;
" \x200d &#8205; zero width joiner
imap <buffer> <F12>0j &<Char-35>8205;
" \x200e &#8206; left-to-right mark
imap <buffer> <F12>lr &<Char-35>8206;
" \x200f &#8207; right-to-left mark
imap <buffer> <F12>rl &<Char-35>8207;
" \x2010 &#8208; hyphen
imap <buffer> <F12>hy &<Char-35>8208;
" \x2011 &#8209; undefined
" \x2012 &#8210; undefined
" \x2013 &#8211; en dash
imap <buffer> <F12>n- &<Char-35>8211;
" \x2014 &#8212; em dash
imap <buffer> <F12>m- &<Char-35>8212;
" \x2015 &#8213; horizontal bar
imap <buffer> <F12>h- &<Char-35>8213;
" \x2016 &#8214; double vertical bar
imap <buffer> <F12>v" &<Char-35>8214;
" \x2017 &#8215; undefined
" \x2018 &#8216; left single quotation mark
imap <buffer> <F12>lq &<Char-35>8216;
" \x2019 &#8217; right single quotation mark
imap <buffer> <F12>rq &<Char-35>8217;
" \x201a &#8218; single low-9 quotation mark
imap <buffer> <F12>r9 &<Char-35>8218;
" \x201b &#8219; undefined
" \x201c &#8220; left double quotation mark
imap <buffer> <F12>l" &<Char-35>8220;
" \x201d &#8221; right double quotation mark
imap <buffer> <F12>r" &<Char-35>8221;
" \x201e &#8222; double low-9 quotation mark
imap <buffer> <F12>9" &<Char-35>8222;
" \x201f &#8223 undefined
" \x2020 &#8224; dagger
imap <buffer> <F12>dg &<Char-35>8224;
" \x2021 &#8225; double dagger
imap <buffer> <F12>Dg &<Char-35>8225;
" \x2022 &#8226; bullet
imap <buffer> <F12>.. &<Char-35>8226;
" \x2023 &#8227; undefined
" \x2024 &#8228; undefined
" \x2025 &#8229; two dot leader
imap <buffer> <F12>2. &<Char-35>8229;
" \x2026 &#8230; horizontal ellipsis
imap <buffer> <F12>3. &<Char-35>8230;
" \x2027 &#8231; undefined
" \x2028-\x202f &#8232;-&#8239 undefined
" \x2030 &#8240; per mil
imap <buffer> <F12>%o &<Char-35>8240;
" \x2031 &#8241; undefined
" \x2032 &#8242; prime
imap <buffer> <F12>1' &<Char-35>8242;
" \x2033 &#8243; double prime
imap <buffer> <F12>2' &<Char-35>8243;
" \x2034 &#8244; triple prime
imap <buffer> <F12>3' &<Char-35>8244;
" \x2035 &#8245; reversed prime
imap <buffer> <F12>'I &<Char-35>8245;
" \x2036 &#8246; undefined
" \x2037 &#8247; undefined
" \x2038 &#8248; undefined
" \x2039 &#8249; sinqle left-pointing angle quote
imap <buffer> <F12>1< &<Char-35>8249;
" \x203a &#8250; single right-pointing angle quote
imap <buffer> <F12>1> &<Char-35>8250;
" \x203b &#8251; undefined
" \x203c &#8252; undefined
" \x203d &#8253; undefined
" \x203e &#8254; overline
" \x203f &#8255; undefined
" \x2040 &#8256; undefined
" \x2041 &#8257; caret insertion point
" \x2042 &#8258; undefined
" \x2043 &#8259; hyphen bullet
" \x2044 &#8260; fraction slash
" ...
" \x20ac &#8364; euro
imap <buffer> <F12>EU &<Char-35>8364;
" ...
" \x20db &#8891; combining three dots above
" \x20dc &#8892; combining four dots above
" ...
" \x2105 &#8453; care of
imap <buffer> <F12>co &<Char-35>8453;
" \x2106 &#8454; undefined
" \x2107 &#8455; undefined
" \x2108 &#8456; undefined
" \x2109 &#8457; undefined
" \x210a &#8458; undefined
" \x210b &#8459; script capital H
" \x210c &#8460; undefined
" \x210d &#8461; undefined
" \x210e &#8462; undefined
" \x210f &#8463; Planck's constant over two pi
" \x2110 &#8464; undefined
" \x2111 &#8465; black-letter capital I
" \x2112 &#8466; script capital L
" \x2113 &#8467; script small l
" \x2114 &#8468; undefined
" \x2115 &#8469; undefined
" \x2116 &#8470; Numero
imap <buffer> <F12>No &<Char-35>8470;
" \x2117 &#8471; sound recording copyright (P)
imap <buffer> <F12>P) &<Char-35>8471;
" \x2118 &#8472; script capital P
" \x2119 &#8473; undefined
" \x211a &#8474; undefined
" \x211b &#8475; undefined
" \x211c &#8476; black-letter capital R
" \x211d &#8477; undefined
" \x211e &#8478; prescription take
imap <buffer> <F12>RX &<Char-35>8478;
" \x211f &#8479; undefined
" \x2120 &#8480; undefined
" \x2121 &#8481; undefined
" \x2122 &#8482; trade mark sign
imap <buffer> <F12>TM &<Char-35>8482;
" \x2123 &#8483; undefined
" \x2124 &#8484; undefined
" \x2125 &#8485; undefined
" \x2126 &#8486; ohm sign
imap <buffer> <F12>OH &<Char-35>8486;
" \x2127 &#8487; undefined
" \x2128 &#8488; undefined
" \x2129 &#8489; undefined
" \x212a &#8490; undefined
" \x212b &#8491; angstrom sign
imap <buffer> <F12>AO &<Char-35>8491;
" \x212c &#8492; script capital B
" \x212d &#8493; undefined
" \x212e &#8494; undefined
" \x212f &#8495; undefined
" \x2130 &#8496; undefined
" \x2131 &#8497; undefined
" \x2132 &#8498; undefined
" \x2133 &#8499; script capital M
" \x2134 &#8500; script small o
" \x2135 &#8501; aleph symbol
" \x2136 &#8502; bet symbol
" \x2137 &#8503; gimel symbol
" \x2138 &#8504; dalet symbol
" ...
" \x2153 &#8531; vulgar fraction 1/3 (etc.)
imap <buffer> <F12>13 &<Char-35>8531;
imap <buffer> <F12>23 &<Char-35>8532;
imap <buffer> <F12>15 &<Char-35>8533;
imap <buffer> <F12>25 &<Char-35>8534;
imap <buffer> <F12>35 &<Char-35>8535;
imap <buffer> <F12>45 &<Char-35>8536;
imap <buffer> <F12>16 &<Char-35>8537;
imap <buffer> <F12>56 &<Char-35>8538;
imap <buffer> <F12>18 &<Char-35>8539;
imap <buffer> <F12>38 &<Char-35>8540;
imap <buffer> <F12>58 &<Char-35>8541;
imap <buffer> <F12>78 &<Char-35>8542;
" ...
" \x2190 &#8592; arrow left
imap <buffer> <F12><lt>!<< &<Char-35>8592;
" \x2191 &#8593; arrow up
imap <buffer> <F12><lt>!AA &<Char-35>8593;
" \x2192 &#8594; arrow right
imap <buffer> <F12><lt>!>> &<Char-35>8594;
" \x2193 &#8595; arrow down
imap <buffer> <F12><lt>!VV &<Char-35>8595;
" \x2194 &#8596; arrow left-right
imap <buffer> <F12><lt>!<> &<Char-35>8596;
" \x2195 &#8597; arrow up-down
imap <buffer> <F12><lt>!AV &<Char-35>8597;
" \x2196 &#8598; arrow to northwest
imap <buffer> <F12><lt>!NW &<Char-35>8598;
" \x2197 &#8599; arrow to northeast
imap <buffer> <F12><lt>!NE &<Char-35>8599;
" \x2198 &#8600; arrow to southeast
imap <buffer> <F12><lt>!SE &<Char-35>8600;
" \x2199 &#8601; arrow to southwest
imap <buffer> <F12><lt>!SW &<Char-35>8601;
" \w219a &#8602; arrow left with stroke
imap <buffer> <F12><lt>!</ &<Char-35>8602;
" \x219b &#8603; arrow right with stroke
imap <buffer> <F12><lt>!>/ &<Char-35>8603;
" \x219c &#8604; undefined
" \x219d &#8605; wavy arrow right
imap <buffer> <F12><lt>!>? &<Char-35>8605;
" \x219e &#8606; two-headed arrow left
imap <buffer> <F12><lt>!2< &<Char-35>8606;
" \x219f &#8607; undefined
" \x21a0 &#8608; two-headed arrow right
imap <buffer> <F12><lt>!2> &<Char-35>8608;
" \x21a1 &#8609; undefined
" \x21a2 &#8610; arrow left with tail
imap <buffer> <F12><lt>!<t &<Char-35>8610;
" \x21a3 &#8611; arrow right with tail
imap <buffer> <F12><lt>!>t &<Char-35>8611;
" \x21a4 &#8612; undefined
" \x21a5 &#8613; undefined
" \x21a6 &#8614; arrow right from bar
imap <buffer> <F12><lt>!>b &<Char-35>8614;
" \x21a7 &#8615; undefined
" \x21a8 &#8616; undefined
" \x21a9 &#8617; arrow left with hook
imap <buffer> <F12><lt>!<2 &<Char-35>8617;
" \x21aa &#8618; arrow right with hook
imap <buffer> <F12><lt>!>2 &<Char-35>8618;
" \x21ab &#8619; arrow left with loop
imap <buffer> <F12><lt>!<8 &<Char-35>8619;
" \x21ac &#8620; arrow right with loop
imap <buffer> <F12><lt>!>8 &<Char-35>8620;
" \x21ad &#8621; wavy arrow left right
imap <buffer> <F12><lt>!X? &<Char-35>8621;
" \x21ae &#8622; arrow left-right with stroke
imap <buffer> <F12><lt>!X/ &<Char-35>8622;
" \x21af &#8623; undefined
" \x21b0 &#8624; arrow up then left
imap <buffer> <F12><lt>!A< &<Char-35>8624;
" \x21b1 &#8625; arrow up then right
imap <buffer> <F12><lt>!A> &<Char-35>8625;
" \x21b2 &#8626; undefined
" \x21b3 &#8627; undefined
" \x21b4 &#8628; undefined
" \x21b5 &#8629; arrow down then left
imap <buffer> <F12><lt>!V< &<Char-35>8629;
" \x21b6 &#8630; arrow semicircle top anticlockwise
" \x21b7 &#8631; arrow semicircle top clockwise
" \x21b8 &#8632; undefined
" \x21b9 &#8633; undefined
" \x21ba &#8634; anticlockwise open circle arrow
" \x21bb &#8635; clockwise open circle arrow
" \x21bc &#8636; harpoon left with barb up
" \x21bd &#8637; harpoon left with barb down
" \x21be &#8638; harpoon up with barb right
" \x21bf &#8639; harpoon up with barb left
" \x21c0 &#8640; harpoon right with barb up
" \x21c1 &#8641; harpoon right with barb down
" \x21c2 &#8642; harpoon down with barb right
" \x21c3 &#8643; harpoon down with barb left
" \x21c4 &#8644; arrow right over left
" \x21c5 &#8645; undefined
" \x21c6 &#8646; arrow left over right
" \x21c7 &#8647; paired arrows left
" \x21c8 &#8648; paired arrows up
" \x21c9 &#8649; paired arrows right
" \x21ca &#8650; paired arrows down
" \x21cb &#8651; harpoons left over right
" \x21cc &#8652; harpoons right over left
" \x21cd &#8653; double arrow left with stroke
" \x21ce &#8654; double arrow left right with stroke
" \x21cf &#8655; double arrow right with stroke
" \x21d0 &#8656; double arrow left
" \x21d1 &#8657; double arrow up
" \x21d2 &#8658; double arrow right
" \x21d3 &#8659; double arrow down
" \x21d4 &#8660; double arrow left right
" \x21d5 &#8661; double arrow up down
" \x21d6 &#8662; undefined
" \x21d7 &#8663; undefined
" \x21d8 &#8664; undefined
" \x21d9 &#8665; undefined
" \x21da &#8666; triple arrow left
" \x21db &#8667; triple arrow right
" ...
" \x2200 &#8704; for all
" \x2201 &#8705; complement
" \x2202 &#8706; partial differential
" \x2203 &#8707; there exists
" \x2204 &#8708; there does not exist
" \x2205 &#8709; null set
" \x2206 &#8710; undefined
" \x2207 &#8711; nabla
" \x2208 &#8712; is an element of
" \x2209 &#8713; is not an element of
" \x220a &#8714; is an element of (small)
" \x220b &#8715; contains as element
" \x220c &#8716; undefined
" \x220d &#8717; contains as element (small)
" \x220e &#8718; undefined
" \x220f &#8719; pi (product)
" \x2210 &#8720; inverted pi (coproduct)
" \x2211 &#8721; sigma (sum)
" \x2212 &#8722; minus sign
" \x2213 &#8723; minus over plus
imap <buffer> <F12>-+ &<Char-35>8723;
" \x2214 &#8724; dot over plus
imap <buffer> <F12>+. &<Char-35>8724;
" \x2215 &#8725; undefined
" \x2216 &#8726; set subtraction (backslash)
" \x2217 &#8727; asterisk operator
" \x2218 &#8728; ring operator
" \x2219 &#8729; undefined
" \x221a &#8730; square root
imap <buffer> <F12>2R &<Char-35>8730;
" \x221b &#8731; undefined
" \x221c &#8732; undefined
" \x221d &#8733; proportional to
" \x221e &#8734; infinity
" \x221f &#8735; right angle
" \x2220 &#8736; angle
" \x2221 &#8737; measured angle
" \x2222 &#8738; spherical angle
" \x2223 &#8739; divides
" \x2224 &#8740; does not divide
" \x2225 &#8741; parallel to
" \x2226 &#8742; not parallel to
" \x2227 &#8743; logical and (inverted V)
" \x2228 &#8744; logical or (V)
" \x2229 &#8745; intersection
" \x222a &#8746; union
" \x222b &#8747; integral
" \x222c &#8748; undefined
" \x222d &#8749; undefined
" \x222e &#8750; contour integral
" \x222f &#8751; undefined
" \x2230 &#8752; undefined
" \x2231 &#8753; undefined
" \x2232 &#8754; undefined
" \x2233 &#8755; undefined
" \x2234 &#8756; therefore (3 dots, 1 over 2)
imap <buffer> <F12>.3 &<Char-35>8756;
" \x2235 &#8757; because (3 dots, 2 over 1)
" \x2236 &#8758; undefined
" \x2237 &#8759; undefined
" \x2238 &#8760; undefined
" \x2239 &#8761; undefined
" \x223a &#8762; undefined
" \x223b &#8763; undefined
" \x223c &#8764; tilde operator
" \x223d &#8765; reversed tilde
" \x223e &#8766; undefined
" \x223f &#8767; undefined
" \x2240 &#8768; wreath product
" \x2241 &#8769; not tilde
" \x2242 &#8770; undefined
" \x2243 &#8771; asymptotically equal to
" \x2244 &#8772; not asymptotically equal to
" \x2245 &#8773; approximately equal to
" \x2246 &#8774; undefined
" \x2247 &#8775; not even approximately equal to
" \x2248 &#8776; almost equal to
" \x2249 &#8777; not almost equal to
" \x224a &#8778; almost equal or equal to
" \x224b &#8779; undefined
" \x224c &#8780; all equal to
" \x224d &#8781; undefined
" \x224e &#8782; geometrically equivalent to
" \x224f &#8783; difference between
" \x2250 &#8784; approaches the limit
" \x2251 &#8785; geometrically equal to
" \x2252 &#8786; approximately equal to or the image of
" \x2253 &#8787; image of or approximately equal to
" \x2254 &#8788; colon equals
imap <buffer> <F12>:= &<Char-35>8788;
" \x2255 &#8789; equals colon
imap <buffer> <F12>=: &<Char-35>8789;
" \x2256 &#8790; ring in equal to
" \x2257 &#8791; ring equal to
" \x2258 &#8792; undefined
" \x2259 &#8793; estimates
" \x225a &#8794; undefined
" \x225b &#8795; undefined
" \x225c &#8796; delta equal to
" \x225d &#8797; undefined
" \x225e &#8798; undefined
" \x225f &#8799; undefined
" \x2260 &#8800; not equal to
" \x2261 &#8801; identical to
" \x2262 &#8802; not identical to
" \x2263 &#8803; undefined
" \x2264 &#8804; less than or equal to
imap <buffer> <F12><= &<Char-35>8804;
" \x2265 &#8805; greater than or equal to
imap <buffer> <F12>>= &<Char-35>8805;
" \x2266 &#8806; less than over equal to
" \x2267 &#8807; greater than over equal to
" \x2268 &#8808; less than but not equal to
" \x2269 &#8809; greater than but not equal to
" \x226a &#8810; much less than
" \x226b &#8811; much greater than
" \x226c &#8812; between
" \x226d &#8813; undefined
" \x226e &#8814; not less than
" \x226f &#8815; not greater than
" \x2270 &#8816; neither less than nor equal to
" \x2271 &#8817; neither greater than nor equal to
" \x2272 &#8818; less than or equivalent to
" \x2273 &#8819; greater than or equivalent to
" \x2274 &#8820; undefined
" \x2275 &#8821; undefined
" \x2276 &#8822; less than or greater than
" \x2277 &#8823; greater than or less than
" \x2278 &#8824; undefined
" \x2279 &#8825; undefined
" \x227a &#8826; precedes
" \x227b &#8827; follows
" \x227c &#8828; precedes or equal to
" \x227d &#8829; follows or equal to
" \x227e &#8830; precedes or equivalent to
" \x227f &#8831; follows or equivalent to
" \x2280 &#8832; does not precede
" \x2281 &#8833; does not follow
" \x2282 &#8834; is a subset of
" \x2283 &#8835; is a superset of
" \x2284 &#8836; is not a subset of
" \x2285 &#8837; is not a superset of
" \x2286 &#8838; subset or equal
" \x2287 &#8839; superset or equal
" \x2288 &#8840; neither subset nor equal
" \x2289 &#8841; neither superset nor equal
" \x228a &#8842; subset, not equal
" \x228b &#8843; superset, not equal
" \x228c &#8844; undefined
" \x228d &#8845; undefined
" \x228e &#8846; multiset union
" \x228f &#8847; square image of
" \x2290 &#8848; square original of
" \x2291 &#8849; square image of or equal to
" \x2292 &#8850; square original of or equal to
" \x2293 &#8851; square cap
" \x2294 &#8852; square cup
" \x2295 &#8853; circled plus
" \x2296 &#8854; circled minus
" \x2297 &#8855; circled times
" \x2298 &#8856; circled division slash
" \x2299 &#8857; circled dot
" \x229a &#8858; circled ring
" \x229b &#8859; circled asterisk
" \x229c &#8860; undefined
" \x229d &#8861; circled dash
" \x229e &#8862; squared plus
" \x229f &#8863; squared minus
" \x22a0 &#8864; squared times
" \x22a1 &#8865; squared dot
" \x22a2 &#8866; right tack
" \x22a3 &#8867; left tack
" \x22a4 &#8868; down tack
" \x22a5 &#8869; up tack
" \x22a6 &#8870; undefined
" \x22a7 &#8871; models
" \x22a8 &#8872; true
" \x22a9 &#8873; forces
" \x22aa &#8874; triple vertical bar right turnstile
" \x22ab &#8875; undefined
" \x22ac &#8876; does not prove
" \x22ad &#8877; not true
" \x22ae &#8878; does not force
" \x22af &#8879; negated double v-bar double r-turnstile
" \x22b0 &#8880; undefined
" \x22b1 &#8881; undefined
" \x22b2 &#8882; normal subgroup of
" \x22b3 &#8883; contains as normal subgroup
" \x22b4 &#8884; normal subgroup of or equal to
" \x22b5 &#8885; contains as normal subgroup or is equal to
" \x22b6 &#8886; undefined
" \x22b7 &#8887; undefined
" \x22b8 &#8888; multimap
" \x22b9 &#8889; undefined
" \x22ba &#8890; intercalate
" \x22bb &#8891; xor
" \x22bc &#8892; nand
" \x22bd &#8893; undefined
" \x22be &#8894; undefined
" \x22bf &#8895; undefined
" \x22c0 &#8896; undefined
" \x22c1 &#8897; undefined
" \x22c2 &#8898; undefined
" \x22c3 &#8899; undefined
" \x22c4 &#8900; diamond operator
" \x22c5 &#8901; dot operator
" \x22c6 &#8902; star operator
" \x22c7 &#8903; division times
" \x22c8 &#8904; bowtie
" \x22c9 &#8905; left normal factor semidirect product
" \x22ca &#8906; right normal factor semidirect product
" \x22cb &#8907; left semidirect product
" \x22cc &#8908; right semidirect product
" \x22cd &#8909; reversed tilde equals
" \x22ce &#8910; curly logical or
" \x22cf &#8911; curly logical and
" \x22d0 &#8912; double subset
" \x22d1 &#8913; double superset
" \x22d2 &#8914; double intersection
" \x22d3 &#8915; double union
" \x22d4 &#8916; pitchfork
" \x22d5 &#8917; undefined
" \x22d6 &#8918; less-than with dot
" \x22d7 &#8919; greater-than with dot
" \x22d8 &#8920; very much less than
" \x22d9 &#8921; very much greater than
" \x22da &#8922; less-than equal-to or greater-than
" \x22db &#8923; greater-than equal-to or less-than
" \x22dc &#8924; equal to or less than
" \x22dd &#8925; equal to or greater than
" \x22de &#8926; equal to or precedes
" \x22df &#8927; equal to or follows
" \x22e0 &#8928; does not precede or equal
" \x22e1 &#8929; does not follow or equal
" \x22e2 &#8930; undefined
" \x22e3 &#8931; undefined
" \x22e4 &#8932; undefined
" \x22e5 &#8933; undefined
" \x22e6 &#8934; less than but not equivalent to
" \x22e7 &#8935; greater than but not equivalent to
" \x22e8 &#8936; precedes but not equivalent to
" \x22e9 &#8937; follows but not equivalent to
" \x22ea &#8938; not normal subgroup of
" \x22eb &#8939; does not contain as normal subgroup
" \x22ec &#8940; not normal subgroup of or equal to
" \x22ed &#8941; does not contain as normal subgroup or equal
" \x22ee &#8942; vertical ellipsis
" ...
" \x2306 &#8966; perspective
" \x2307 &#8967; undefined
" \x2308 &#8968; left ceiling
" \x2309 &#8969; right ceiling
" \x230a &#8970; left floor
" \x230b &#8971; right floor
" \x230c &#8972; bottom right crop
" \x230d &#8973; bottom left crop
" \x230e &#8974; top right crop
" \x230f &#8975; top left crop
" \x2310 &#8976; undefined
" \x2311 &#8977; undefined
" \x2312 &#8978; undefined
" \x2313 &#8979; undefined
" \x2314 &#8980; undefined
" \x2315 &#8981; telephone recorder
" \x2316 &#8982; position indicator
" \x2317 &#8983; undefined
" \x2318 &#8984; undefined
" \x2319 &#8985; undefined
" \x231a &#8986; undefined
" \x231b &#8987; undefined
" \x231c &#8988; top left corner
" \x231d &#8989; top right corner
" \x231e &#8990; bottom left corner
" \x231f &#8991; bottom right corner
" \x2320 &#8992; undefined
" \x2321 &#8993; undefined
" \x2322 &#8994; frown
" \x2323 &#8995; smile
" \x2324 &#8996; undefined
" \x2325 &#8997; undefined
" \x2326 &#8998; undefined
" \x2327 &#8999; undefined
" \x2328 &#9000; undefined
" \x2329 &#9001; left-pointing angle bracket
" \x232a &#9002; right-pointing angle bracket
" ...
" \x2423 &#9251; open box
" ...
" \x24C8 &#9416; circled Latin capital S
" ...
" \x2500 &#9472; box drawings light horizontal
" \x2501 &#9473; undefined
" \x2502 &#9474; box drawings light vertical
" \x2503 &#9475; undefined
" \x2504 &#9476; undefined
" \x2505 &#9477; undefined
" \x2506 &#9478; undefined
" \x2507 &#9479; undefined
" \x2508 &#9480; undefined
" \x2509 &#9481; undefined
" \x250a &#9482; undefined
" \x250b &#9483; undefined
" \x250c &#9484; box drawings light down and right
" \x250d &#9485; undefined
" \x250e &#9486; undefined
" \x250f &#9487; undefined
" \x2510 &#9488; box drawings light down and left
" \x2511 &#9489; undefined
" \x2512 &#9490; undefined
" \x2513 &#9491; undefined
" \x2514 &#9492; box drawings light up and right
" \x2515 &#9493; undefined
" \x2516 &#9494; undefined
" \x2517 &#9495; undefined
" \x2518 &#9496; box drawings light up and left
" \x2519 &#9497; undefined
" \x251a &#9498; undefined
" \x251b &#9499; undefined
" \x251c &#9500; box drawings light vertical and right
" \x251d &#9501; undefined
" \x251e &#9502; undefined
" \x251f &#9503; undefined
" \x2520 &#9504; undefined
" \x2521 &#9505; undefined
" \x2522 &#9506; undefined
" \x2523 &#9507; undefined
" \x2524 &#9508; box drawings light vertical and left
" \x2525 &#9509; undefined
" \x2526 &#9510; undefined
" \x2527 &#9511; undefined
" \x2528 &#9512; undefined
" \x2529 &#9513; undefined
" \x252a &#9514; undefined
" \x252b &#9515; undefined
" \x252c &#9516; box drawings light down and horizontal
" \x252d &#9517; undefined
" \x252e &#9518; undefined
" \x252f &#9519; undefined
" \x2530 &#9520; undefined
" \x2531 &#9521; undefined
" \x2532 &#9522; undefined
" \x2533 &#9523; undefined
" \x2534 &#9524; box drawings light up and horizontal
" \x2535 &#9525; undefined
" \x2536 &#9526; undefined
" \x2537 &#9527; undefined
" \x2538 &#9528; undefined
" \x2539 &#9529; undefined
" \x253a &#9530; undefined
" \x253b &#9531; undefined
" \x253c &#9532; box drawings light vertical and horizontal
" ...
" \x2550 &#9552; box drawings double horizontal
" \x2551 &#9553; box drawings double vertical
" \x2552 &#9554; box drawings down single and right double
" \x2553 &#9555; box drawings down double and right single
" \x2554 &#9556; box drawings double down and right
" \x2555 &#9557; box drawings down single and left double
" \x2556 &#9558; box drawings down double and left single
" \x2557 &#9559; box drawings double down and left
" \x2558 &#9560; box drawings up single and right double
" \x2559 &#9561; box drawings up double and right single
" \x255a &#9562; box drawings double up and right
" \x255b &#9563; box drawings up single and left double
" \x255c &#9564; box drawings up double and left single
" \x255d &#9565; box drawings double up and left
" \x255e &#9566; box drawings vertical single and right double
" \x255f &#9567; box drawings vertical double and right single
" \x2560 &#9568; box drawings double vertical and right
" \x2561 &#9569; box drawings vertical single and left double
" \x2562 &#9570; box drawings vertical double and left single
" \x2563 &#9571; box drawings double vertical and left
" \x2564 &#9572; box drawings down single and horizontal double
" \x2565 &#9573; box drawings down double and horizontal single
" \x2566 &#9574; box drawings double down and horizontal
" \x2567 &#9575; box drawings up single and horizontal double
" \x2568 &#9576; box drawings up double and horizontal single
" \x2569 &#9577; box drawings double up and horizontal
" \x256a &#9578; box drawings vertical single and horizontal double
" \x256b &#9579; box drawings vertical double and horizontal single
" \x256c &#9580; box drawings double vertical and horizontal
" ...
" \x2580 &#9600; upper half block
" \x2581 &#9601; undefined
" \x2582 &#9602; undefined
" \x2583 &#9603; undefined
" \x2584 &#9604; lower half block
" \x2585 &#9605; undefined
" \x2586 &#9606; undefined
" \x2587 &#9607; undefined
" \x2588 &#9608; full block
" \x2589 &#9609; undefined
" \x258a &#9610; undefined
" \x258b &#9611; undefined
" \x258c &#9612; undefined
" \x258d &#9613; undefined
" \x258e &#9614; undefined
" \x258f &#9615; undefined
" \x2590 &#9616; undefined
" \x2591 &#9617; light shade
" \x2592 &#9618; medium shade
" \x2593 &#9619; dark shade
" \x2594 &#9620; undefined
" \x2595 &#9621; undefined
" \x2596 &#9622; undefined
" \x2597 &#9623; undefined
" \x2598 &#9624; undefined
" \x2599 &#9625; undefined
" \x259a &#9626; undefined
" \x259b &#9627; undefined
" \x259c &#9628; undefined
" \x259d &#9629; undefined
" \x259e &#9630; undefined
" \x259f &#9631; undefined
" \x25a0 &#9632; undefined
" \x25a1 &#9633; white square
" \x25a2 &#9634; undefined
" \x25a3 &#9635; undefined
" \x25a4 &#9636; undefined
" \x25a5 &#9637; undefined
" \x25a6 &#9638; undefined
" \x25a7 &#9639; undefined
" \x25a8 &#9640; undefined
" \x25a9 &#9641; undefined
" \x25aa &#9642; small black square
" \x25ab &#9643; undefined
" \x25ac &#9644; undefined
" \x25ad &#9645; white rectangle
" \x25ae &#9646; black vertical rectangle
" \x25af &#9647; undefined
" \x25b0 &#9648; undefined
" \x25b1 &#9649; undefined
" \x25b2 &#9650; undefined
" \x25b3 &#9651; white triangle pointing up
" \x25b4 &#9652; small black triangle pointing up
" \x25b5 &#9653; small white triangle pointing up
" \x25b6 &#9654; undefined
" \x25b7 &#9655; undefined
" \x25b8 &#9656; small black triangle pointing right
" \x25b9 &#9657; small white triangle pointing right
" \x25ba &#9658; undefined
" \x25bb &#9659; undefined
" \x25bc &#9660; undefined
" \x25bd &#9661; white triangle pointing down
" \x25be &#9662; small black triangle pointing down
" \x25bf &#9663; small white triangle pointing down
" \x25c0 &#9664; undefined
" \x25c1 &#9665; undefined
" \x25c2 &#9666; small black triangle pointing left
" \x25c3 &#9667; small white triangle pointing left
" \x25c4 &#9668; undefined
" \x25c5 &#9669; undefined
" \x25c6 &#9670; undefined
" \x25c7 &#9671; undefined
" \x25c8 &#9672; undefined
" \x25c9 &#9673; undefined
" \x25ca &#9674; lozenge
" \x25cb &#9675; white circle
" ...
" \x2605 &#9733; black star
" \x2606 &#9734; white star
" \x2607 &#9735; undefined
" \x2608 &#9736; undefined
" \x2609 &#9737; undefined
" \x260a &#9738; undefined
" \x260b &#9739; undefined
" \x260c &#9740; undefined
" \x260d &#9741; undefined
" \x260e &#9742; black telephone
" \x260f &#9743; undefined
" ...
" \x2640 &#9792; female sign
" \x2641 &#9793; undefined
" \x2642 &#9794; male sign
" ...
" \x2660 &#9824; black spade suit
" \x2661 &#9825; undefined
" \x2662 &#9826; undefined
" \x2663 &#9827; black club suit
" \x2664 &#9828; undefined
" \x2665 &#9829; black heart suit
" \x2666 &#9830; black diamond suit
" \x2667 &#9831; undefined
" \x2668 &#9832; undefined
" \x2669 &#9833; undefined
" \x266a &#9834; eigth note
" \x266b &#9835; undefined
" \x266c &#9836; undefined
" \x266d &#9837; music flat sign
" \x266e &#9838; music natural sign
" \x266f &#9839; music sharp sign
" ...
" \x2713 &#10003; check mark
" \x2714 &#10004; undefined
" \x2715 &#10005; undefined
" \x2716 &#10006; undefined
" \x2717 &#10007; ballot X
" \x2718 &#10008; undefined
" \x2719 &#10009; undefined
" \x271a &#10010; undefined
" \x271b &#10011; undefined
" \x271c &#10012; undefined
" \x271d &#10013; undefined
" \x271e &#10014; undefined
" \x271f &#10015; undefined
" \x2720 &#10016; Maltese cross
" \x2721 &#10017; undefined
" \x2722 &#10018; undefined
" \x2723 &#10019; undefined
" \x2724 &#10020; undefined
" \x2725 &#10021; undefined
" \x2726 &#10022; black 4-pointed star
" \x2727 &#10023; white 4-pointed star
" ...
" \x2736 &#10038; 6-pointed black star
" ...
" \xfb00 &#64256; Latin small ligature ff
" \xfb01 &#64257; Latin small ligature fi
" \xfb02 &#64258; Latin small ligature fl
" \xfb03 &#64259; Latin small ligature ffi
" \xfb04 &#64260; Latin small ligature ffl
" --------------------------------------------------------------------
" Release history:
" 1.0		Initial release.
"
" 1.01		Bugfix for Cyrillic capitals Be and Ve.
"
" 1.01pl1	Bugfix for 4 additional rarely-used Cyrillic capitals
" 		(Yo, Dje, Gje and Ukrainian Ie).
"
" 1.01pl2	Improvement: New mapping defined for non-breaking space
" 		(but disabled by default at the moment).
" 		Cosmetic improvement: Release history added.
" 
" 1.01pl3	Bugfix for circumflex-accented o and O
" 
" 1.01pl4   Added Euro-Sign (Currency) (line 295)
" --------------------------------------------------------------------
" Release history above (newest last)
" --------------------------------------------------------------------
