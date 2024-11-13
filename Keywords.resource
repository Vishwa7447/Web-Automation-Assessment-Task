*** Keywords ***

# Scenario 1 Keyword

Search for Dummy product
    [Arguments]		${DummySearch}
    Input Text		${SearchIconLocator}		${DummySearch}			#Parameter passed to the keyword from testcase
    Click Element	${SearchButtonClickLocator}		
    Wait Until Page Contains		Oops! Looks like something went wrong, please try again in sometime.		10		#Validation of confirming output result
    Log to console		Product not found

# Scenario 2 Keyword

Search for Existing product
    [Arguments]		${ExistingProductSearch}
    Input Text		${SearchIconLocator}		${ExistingProductSearch}		#Parameter passed to the keyword from testcase
    Click Element	${SearchButtonClickLocator}		
    Wait Until Page Contains		laptop		10								#Validation of confirming output result
    Log to console		Existing laptop products appeared on page
	

# Scenario 3rd, 4th, 5th Keywords

Search For Product
    [Arguments]  ${PRODUCT}				
    Input Text  ${AmazonSearchBoxLoc}  		${PRODUCT}
    Press Keys  NONE		ENTER
    Sleep  2  													# Wait for search results to load

Select First Product
    Click Element  ${SelectProduct}
    Sleep  2  														# Wait for the product page to load

Add Product To Cart
    Click Element  ${AddToCartLocator}						  # Add the product to cart
    Sleep  2  												# Wait for the cart action to complete

Verify Item Added To Cart
    Click Element  ${CartIconLocator}  							# Click the cart icon to view the cart
    Sleep  2  															# Wait for the cart page to load
    Page Should Contain  ${PRODUCT}  							# Validate the product is in the cart
    log to console		Product added to cart and validated successfully

Update Cart Count
    Click Element	${IncreaseCartQuantityLocator}		# Select dropdown to increase count of product from cart
    Click Element	${CartCountLoc}						#Cart count selected to 2
    Sleep	3
    Log to console	Cart product quantity updated to 2
	
Remove Product From Cart
    Click Element	${DeletecartLocator}	#Click on delete will remove the products from cart
    Wait Until Page Contains 		Your Amazon Cart is empty.		#Validation Check
    Log to console		Cart Is Empty	
