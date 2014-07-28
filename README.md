cffedexshipper
==============

Coldfusion component for calculating shipping rates and for submitting shipping and pickup requests to FedEx.

This component has only been tested with Coldfusion 9. 

Before You Begin:
-----------------

You will need a set of developer account number, meter number, key and password. Visit the following link for more info:

http://www.fedex.com/us/developer/solutions.html

The FedEx documentation is not very good, but I highly recommend at least downloading the WSDL or XML definitions in order to understand all the parameters that can be passed to the Fedex Web Services. This is BY FAR the best way to learn about the web services implementation and to be able to customize the FedexShipper component to fit your needs.

Supported FedexMethods:
------------------

- Rates (getRates)
- Create Shipment (processShipmentRequest)
- Pickup (createPickupRequest)
- Cancel Pickup (cancelPickupRequest)

---------------
Example Usage:
---------------
	
	<cfset fedexShipper = new FedexShipper(
		key = "AUTHENTICATION_KEY",
		password = "AUTHENTICATION_PASSWORD",
		accountNo = "ACCOUNT_NUMBER",
		meterNo = "METER_NUMBER",
		sandbox = true
	) />

	<cfset result = fedexShipper.getRates(
		shipperZip = "75201",
		shipperState = "TX",
		shipperCountry = "US",
		shipToZip = "75301",
		shipToState = "TX",
		shipToCountry = "US",
		pkgWeight = "1",
		pkgValue = "10",
		shipToResidential = true
	) />

------------------
Result Handling
------------------

This component returns a coldfusion struct. 

result.success (boolean indicating whether the request completed successfully or not)

result.response (array containing a struct)  
	result.response[1].msg		(string)  
	result.response[1].status	(string)  
	... 

The response array will containt messages indicating error or warning conditions if the request is not successfull or simply a success message if the request was completed with no errors. 

result.rates (array containing a struct) returned when calling the GetRates function.  
	result.rate[1].type 							(string)  
	result.rate[1].totalBaseCharge		(integer)  
	result.rate[1].totalNetFreight		(integer)  
	result.rate[1].totalSurcharges		(integer)  
	result.rate[1].totalTaxes					(integer)  
	result.rate[1].totalRebates				(integer)  
	result.rate[1].totalNetCharge			(integer)  
	...  

This is the array of shipping rates.

Example:

	<cfif result.success>
		<ul>
			<cfloop from="1" to="#arraylen(result.rates)#" index="n">
				<cfoutput>
					<li>#result.rates[n].type# - #DollarFormat(result.rates[n].totalNetCharge)#</li>
				</cfoutput>
			</cfloop>
		</ul>
	</cfif>