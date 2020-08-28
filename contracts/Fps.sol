//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
	
contract Fps{
    
    mapping(string => string[]) companyMap;
    mapping(string => string[]) productMap;
    mapping(string => Product) product;

    struct Product{
        string productId;
        string productName;
    }

    function createNewProduct(string memory companyName, string memory productName) public {
        companyMap[companyName].push(productName);
    }

    function getProductByCompany(string memory companyName) public view returns(string[] memory){
        return companyMap[companyName];
    }

}