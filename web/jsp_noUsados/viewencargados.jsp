<html>
    <head>
        <title>Table search: HTML - JavaScript</title>
    </head>
    <body>
        <script language="javascript">
            function doSearch() {
                var tableReg = document.getElementById('regTable');
                var searchText = document.getElementById('searchTerm').value.toLowerCase();
                for (var i = 1; i < tableReg.rows.length; i++) {
                    var cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
                    var found = false;
                    for (var j = 0; j < cellsOfRow.length && !found; j++) {
                        var compareWith = cellsOfRow[j].innerHTML.toLowerCase();
                        if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1)) {
                            found = true;
                        }
                    }
                    if (found) {
                        tableReg.rows[i].style.display = '';
                    } else {
                        tableReg.rows[i].style.display = 'none';
                    }
                }
            }
        </script>

        <input id="searchTerm" type="text" onkeyup="doSearch()" />
        <table id="regTable">
            <tr><td>Id</td><td>Name</td><td>Surname</td><td>Gender</td><td>Age</td></tr>
            <tr><td>1</td><td>John</td><td>Doe</td><td>M</td><td>30</td></tr>
            <tr><td>2</td><td>Jane</td><td>Doe</td><td>F</td><td>31</td></tr>
            <tr><td>3</td><td>Will</td><td>Smith</td><td>M</td><td>25</td></tr>
            <tr><td>4</td><td>Bill</td><td>Gates</td><td>M</td><td>56</td></tr>
        </table>
    </body>
</html>