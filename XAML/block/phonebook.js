// This block uses developer keys.  For security reasons it cannot be ripped and used in a mashup.

function LivePhonebookClass() 
{
    this.__search = [new LivePhonebookResult()];
};

LivePhonebookClass.prototype.search = function(query, count, longitude, latitude, radius) 
{
    // Returns phonebook results from search.live.com
    //
    //        query: The key word term for the search engine (default=Microsoft)
    //        count: The number of results returned from the search engine (default=10)
    //    longitude: The longitude of the location (default=-122.0)
    //     latitude: The latitude of the location (default=47.0)
    //       radius: The radius of the search area (default=50)

    var trimQuery = this.__trimParamValue(query); 
        
    if(isNaN(count) || count == 0)
        count = 20;
    else if (count == 0 || count > 50)
        count = 20;
        
    // build the SOAP request for phonebook
    var postData = this.__buildPhonebookSOAPrequest(trimQuery, "en-us", "Strict", 0, count, longitude, latitude, radius, "Title Description Url DisplayUrl Address Phone Location");

    var headers = null;
    var key = "livesearch";
    var SOAPresponse = environment.getXml("http://soap.search.msn.com:80/webservices.asmx", key, headers, postData); 

    if (SOAPresponse.length == 0)
    {
	    throw "Sorry, the Windows Live Phonebook block encountered a problem which it could not solve.";
    }
    else
    {
        if(!this.isValidResponse(SOAPresponse))
        {
            return;
        }      
	    var results = SOAPresponse.getElementsByTagName("Result");
	    var resultNodeCount = results.length;
	    var LivePhonebookResults = new Array(resultNodeCount);

	    for (var i = 0; i < resultNodeCount; i++)
	    {
		    var result = results[i];
		    var title = (!result.getElementsByTagName("Title")[0])? "" : result.getElementsByTagName("Title")[0].text;
		    var url = (!result.getElementsByTagName("Url")[0])? "" : result.getElementsByTagName("Url")[0].text;
		    var displayUrl = (!result.getElementsByTagName("DisplayUrl")[0])? "" : result.getElementsByTagName("DisplayUrl")[0].text;
		    var address = result.getElementsByTagName("Address")[0];
		    if(address)
		    {
		        var addressLine = (!address.getElementsByTagName("AddressLine")[0])? "" : address.getElementsByTagName("AddressLine")[0].text;
		        var city = (!address.getElementsByTagName("PrimaryCity")[0])? "" : address.getElementsByTagName("PrimaryCity")[0].text;
		        var state = (!address.getElementsByTagName("Subdivision")[0])? "" : address.getElementsByTagName("Subdivision")[0].text;
		        var postalCode = (!address.getElementsByTagName("PostalCode")[0])? "" : address.getElementsByTagName("PostalCode")[0].text;
		        var country = (!address.getElementsByTagName("CountryRegion")[0])? "" : address.getElementsByTagName("CountryRegion")[0].text;
		        var phone = (!result.getElementsByTagName("Phone")[0])? "" : result.getElementsByTagName("Phone")[0].text;
		        var location = (!result.getElementsByTagName("Location")[0])? "" : result.getElementsByTagName("Location")[0];
		        var latitude = (!location.getElementsByTagName("Latitude")[0])? "" : location.getElementsByTagName("Latitude")[0].text;
		        var longitude = (!location.getElementsByTagName("Longitude")[0])? "" : location.getElementsByTagName("Longitude")[0].text;

		        LivePhonebookResults[i] = new LivePhonebookResult(title, url, displayUrl, addressLine, city, state, postalCode, country, phone, latitude, longitude);
		    }
		    else
		    {
		        LivePhonebookResults[i] = new LivePhonebookResult(title, url, displayUrl, "", "", "", "", "", "", "", "");
		    }
        }

        return LivePhonebookResults;
     }
};

LivePhonebookClass.prototype.totalNumberOfResults = function(query, longitude, latitude, radius) 
{
    // Returns total number of contextual advertisment results from search.live.com for a given keyword
    //
    //        query: The key word term for the search engine (default=Microsoft)
    //    longitude: The longitude of the location (default=-122.0)
    //     latitude: The latitude of the location (default=47.0)
    //       radius: The radius of the search area (default=50)

    var trimQuery = this.__trimParamValue(query); 

    if (trimQuery == "")
        throw "You must provide a query term!";
        
    
    // build the SOAP request for phonebook
    var postData = this.__buildPhonebookSOAPrequest(trimQuery, "en-us", "Strict", 0, 20, longitude, latitude, radius, "Title");

    var headers = null;
    var key = "livesearch";
    var SOAPresponse = environment.getXml("http://soap.search.msn.com:80/webservices.asmx", key, headers, postData); 

    if (SOAPresponse.length == 0)
    {
	    throw "Sorry, the Windows Live Phonebook block encountered a problem which it could not solve.";
    }
    else
    {
        if(!this.isValidResponse(SOAPresponse))
        {
            return;
        } 
	    try
	    {
	        return SOAPresponse.getElementsByTagName("Total")[0].text;
	    }
	    catch(ex)
	    {
	        throw "Sorry, the Windows Live phonebook block encountered a problem which it could not solve.";    
	    }
    }
};

LivePhonebookClass.prototype.isValidResponse = function(SOAPresponse)
{
    var errNode = SOAPresponse.getElementsByTagName("faultstring");
    if(errNode && errNode[0])
    {
        var errDetailNode = SOAPresponse.getElementsByTagName("detail");
        if(!errDetailNode[0])
        {
            throw "Unable to continue, the phonebook service returned an unkown error.";
        }
        else if(errDetailNode[0].text == "Invalid value for AppID in request")
        {
            if(environment.previewTime)
            {
                throw "It looks like your key isn't valid, please click on the key link under the block and follow the instructions to get a new one.";
            }
            else
            {
                throw "It looks the developer of this mashup saved it without a valid key for the Phonebook block, sorry.";
            }
        }
    }  
    return true;
}

function LivePhonebookResult(title, url, displayUrl, addressLine, city, state, postalCode, country, phone, latitude, longitude)
{
    this.title = title;
    this.url = url;
    this.displayUrl = displayUrl;
    this.addressLine = addressLine;
    this.city = city;
    this.state = state;
    this.postalCode = postalCode;
    this.country = country;
    this.phone = phone;
    this.latitude = latitude;
    this.longitude = longitude;
    this.description = this.toString();
};

// function to trim parameters
LivePhonebookClass.prototype.__buildPhonebookSOAPrequest = function(query, lang, safeSearch, first, count, longitude, latitude, radius, resultFields)
{   
    var postData = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    postData += "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">";
    postData += "<soap:Body>";
    postData += "<Search xmlns=\"http://schemas.microsoft.com/MSNSearch/2005/09/fex\">";
    postData += "<Request>";
    postData += "<AppID>{{Key:AppID;http://soap.search.msn.com}}</AppID>";
    postData += "<Query>" + query + "</Query>";
    postData += "<CultureInfo>" + lang + "</CultureInfo>";
    postData += "<SafeSearch>" + safeSearch + "</SafeSearch>";
    postData += "<Flags>None</Flags>";
    if (longitude != 0 && latitude != 0 && radius > 0)
    {
	    postData += "<Location>";
	    postData += "<Latitude>" + latitude + "</Latitude>";
	    postData += "<Longitude>" + longitude + "</Longitude>";
	    postData += "<Radius>" + radius + "</Radius>";
	    postData += "</Location>";
    }
    postData += "<Requests>";
    postData += "<SourceRequest>";
    postData += "<Source>PhoneBook</Source>";
    postData += "<Offset>" + first + "</Offset>";
    postData += "<Count>" + count + "</Count>";
    postData += "<FileType />";
    postData += "<ResultFields>" + resultFields + "</ResultFields>";
    postData += "</SourceRequest>";
    postData += "</Requests>";
    postData += "</Request>";
    postData += "</Search>";
    postData += "</soap:Body>";
    postData += "</soap:Envelope>";

    return postData;
};

// function to trim parameters
LivePhonebookClass.prototype.__trimParamValue = function(paramValue)
{   
    if(!paramValue)
    {
        return "";
    }
    else if (!isNaN(paramValue))
    {
        return paramValue;
    }
    
    return paramValue.trim();
};


LivePhonebookResult.prototype.toString = function()
{
    var html = "<p><a href='" + environment.escapeQuotes(this.url) + "' target='_blank'>" + environment.escapeQuotes(this.title) + "</a></p>";
       html += "<p>" + environment.escapeQuotes(this.addressLine) + "<br/>"; 
       html += environment.escapeQuotes(this.city) + ", " + environment.escapeQuotes(this.state) + " " + environment.escapeQuotes(this.postalCode) + "<br/>";
       html += environment.escapeQuotes(this.country) + "<br/>";
       html += "<strong>" + environment.escapeQuotes(this.phone) + "</strong></p>";
       html += "<p>Lat/long: " + environment.escapeQuotes(this.latitude) + "," + environment.escapeQuotes(this.longitude) + "</p>";
   
    return html;
};