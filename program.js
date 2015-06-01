var request = require("request");

if(process.argv[2] != null)
{
	request("http://www.omdbapi.com/?S=" + process.argv[2], function(err, head, body)
	{
		var json = JSON.parse(body);
		try
		{
			console.log("Title: " + json.Search[0].Title);
			console.log("Year: " + json.Search[0].Year);
		}
		catch(e)
		{
			console.log(json.Error);
		}
	});
}
else
{
	console.log("Error");
}
