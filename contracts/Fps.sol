//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Fps {
    mapping(string => string[]) productMap;
    mapping(string => Product) product;
    mapping(string => string) barProductMap;
    mapping(string => string[]) companyProductMap;

    struct Product {
        string productId;
        string productName;
        string picture;
        string description;
    }

    //add product to the product list and also to the company map
    function createNewProduct(
        string memory id,
        string memory productName,
        string memory picture,
        string memory description,
        string memory companyName
    ) public {
        companyProductMap[companyName].push(productName);
        Product memory p;
        p.productId = id;
        p.productName = productName;
        p.picture = picture;
        p.description = description;
        product[id] = p;
    }

    function getProductByCompany(string memory companyName)
        public
        view
        returns (string[] memory)
    {
        return companyProductMap[companyName];
    }

    // creates instance of a product type
    function createProductItem(string memory barHash, string memory productId)
        public
    {
        barProductMap[barHash] = productId;
    }

    //verify the product hash exists in the barProductMap and return the id;
    function verifyProduct(string memory barCode)
        public
        view
        returns (Product memory)
    {
        return product[barProductMap[barCode]];
    }
}
