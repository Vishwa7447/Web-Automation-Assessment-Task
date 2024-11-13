
*** Settings ***
Library    	SeleniumLibrary
Resource	../Downloads/Keywords.resource
*** Variables ***

${URL}				https://www.snapdeal.com/
${SearchIconLocator}		//input[@placeholder="Search products & brands"]
${SearchButtonClickLocator}	//button[@onclick="submitSearchForm('go_header');"]
${DummySearch}			ld345tsxslfer
${ExistingProductSearch}	laptop

${URL1}  https://www.amazon.in
${PRODUCT}  iPhone 13  					# You can change this to any product name you're interested in
${AmazonSearchBoxLoc}			//input[@id="twotabsearchtextbox"]	
${SelectProduct}			(//button[contains(text(),"Add to cart")])[1]
${AddToCartLocator}			(//span[contains(text(),"Cart")])[1]
${CartIconLocator}			(//span[contains(text(),"Cart")])[1]
${IncreaseCartQuantityLocator}		(//span[contains(text(),"Qty:")])
${CartCountLoc}				//a[@id="quantity_2"]
${DeletecartLocator}			//input[@value="Delete"]


*** Test Cases ***

Search for a non-existing product
    	[Documentation]    This test case verifies that a user can search for a non-existing product.
	[Tags]	TC_01    CommonTag
    	Open Browser    ${URL}		Chrome
	Maximize Browser Window
	Search for Dummy product		${DummySearch}				#Parameter passed to the keyword
	[Teardown]		Close All Browsers

Search for an existing product
	[Documentation]    This test case verifies that a user can Search for an existing product.
	[Tags]	TC_02	CommonTag
    	Open Browser    ${URL}		Chrome
	Maximize Browser Window
	Search for Existing product		${ExistingProductSearch}		#Parameter passed to the keyword
	[Teardown]		Close All Browsers
	
Add Product To Cart increase cart quantity by one and then delete the cart on Amazon website
	[Documentation]    This testcases validates adding one product to the cart then increases the cart count by one and then delete the whole cart.
	[Tags]	TC_03	CommonTag
    	Open Browser  ${URL1}  Chrome      				#This will open amazon url on chrome browser
    	Maximize Browser Window
    	Search For Product  ${PRODUCT}    				#Product passed as an parameter
    	Select First Product
    	Add Product To Cart
    	Verify Item Added To Cart
	Update Cart Count
	Remove Product From Cart
    	[Teardown]		Close Browser	


