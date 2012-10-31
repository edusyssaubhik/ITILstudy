<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
#mainSearch_AllPages {
    border: 1px solid #AFCDDE;
    color: #104A71;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 11px;
    margin-right: 5px;
    padding: 2px 20px 2px 3px;
    width: 150px;
}
</style>
<title>Search Box</title>
</head>
<body>
<form action="/searchresults1.asp" id="cse-search-box" target="_blank">
 <div style="margin:12px 0 10px 500px">
    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />
    
     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="hidden" name="filter" value="0" />
    Search: &nbsp;    <input type="text" name="q" id="mainSearch_AllPages" style="background: url(/images/buttons/search.png) no-repeat scroll right center #FFFFFF;" />
<input type="submit" name="sa2" value="Go" id="submitbox"/>
  </div>
</form>
</body>
</html>