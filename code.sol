pragma solidity ^0.8.0;

contract fakeProdDetector {
    mapping(bytes32 => Product) public productList;

    struct Product {
        bytes32 product_id;
        string product_name;
        uint product_price;
        bool isFake;
        
    }

    
//     function toBytes(address x) returns (bytes b) {
//     b = new bytes(20);
//     for (uint i = 0; i < 20; i++)
//         b[i] =byte(uint8(uint(x) / (2**(8*(19 - i)))));

//     // return b;
// }

    function uploadProduct(bytes32 id, string memory name, uint price) public {

        require(productList[id].product_id != 0, "Product found and already Exists");
            productList[id] = Product({
            product_id: id,
            product_name: name,
            product_price: price,
            isFake: false
        });


    }

    function reportFakeProduct(bytes32 productId) public {
        require(productList[productId].product_id == 0, "Product not found");
        productList[productId].isFake = true;
    }

    function isFakeProduct(bytes32 productId) public view returns (bool) {
        return productList[productId].isFake;
    }

}


// This is Demo Code
// For full Project Code please reach out to us 
// Mail : vatshayan007@gmail.com
