//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Fps {
    mapping(string => Product) product;
    mapping(string => string) barProductMap;
    mapping(string => string[]) companyProductMap;
    mapping(string => Company) company;

    struct Product {
        string id;
        string name;
        string picture;
        string description;
    }

    struct Company {
        string id;
        string name;
    }

    function createNewCompany(string memory id, string memory companyName)
        public
    {
        Company memory comp = Company(id, companyName);
        company[id] = comp;
    }

    function getCompanyDetail(string memory id)
        public
        view
        returns (Company memory)
    {
        return company[id];
    }

    //add product to the product list and also to the company map
    function createNewProduct(
        string memory id,
        string memory name,
        string memory picture,
        string memory description,
        string memory companyName
    ) public {
        companyProductMap[companyName].push(id);
        Product memory p;
        p.id = id;
        p.name = name;
        p.picture = picture;
        p.description = description;
        product[id] = p;
    }

    function getProductByCompany(string memory companyName)
        public
        view
        returns (Product[] memory)
    {
        string[] memory productList = companyProductMap[companyName];
        Product[] memory productArr = new Product[](productList.length);
        for (uint256 i = 0; i < productList.length; i++) {
            productArr[i] = product[productList[i]];
        }

        return productArr;
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
