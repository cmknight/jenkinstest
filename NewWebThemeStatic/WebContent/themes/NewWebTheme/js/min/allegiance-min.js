var Allegiance=function(){var e=function(e,o,n,r){var t="https://canonusa.allegiancetech.com/cgi-bin/qwebcorporate.dll?",a=e,i=o,l=n,c=r,h="",s="";s=navigator.userAgent.search("Firefox")>=0?t+"&idx="+a+"&CIM="+i+"&PIM="+l+"&Model="+c+"&t="+h:t+"&idx="+a+"&CIM="+i+"&PIM="+l+"&Model="+c+"&t="+h+"','Survey Window','height=10','width=10'",window.open(s,"_blank","toolbar=no, scrollbars=yes, resizable=yes, top=50, left=300, width=900, height=750, menubar=no")};return{showSurvey:e}}();