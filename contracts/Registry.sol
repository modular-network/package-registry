pragma solidity ^0.4.18;

import './LinkedList.sol';

contract Registry {
    using LinkedListLib for LinkedListLib.LinkedList;

    LinkedListLib.LinkedList packageList;
    
    uint256 constant NULL = 0;
    uint256 constant HEAD = 0;
    bool constant PREV = false;
    bool constant NEXT = true;

    struct Package {
        string name;
        string version;
        string uri;
    }

    uint256 currentIndex;

    mapping(uint256 => Package) package;

    event NewPackagePublished(string name, string version, string uri);

    function getByVersion(string _name, string _version) public constant returns (string packageName, string packageVersion, string packageUri) {
        for(uint256 i = 0; i <= currentIndex; i++) {
            if(keccak256(package[i].name) == keccak256(_name) && keccak256(package[i].version) == keccak256(_version)){
                packageName = package[i].name;
                packageVersion = package[i].version;
                packageUri = package[i].uri;
            }
        }
        return (packageName, packageVersion, packageUri);
    }
    function publish(string _name, string _version, string _uri) public returns (uint256 packageIndex) {
        packageIndex = currentIndex++;
        package[packageIndex] = Package(_name, _version, _uri);
        packageList.insert(packageIndex, HEAD, NEXT);
        
        NewPackagePublished(_name, _version, _uri);
    }
    
}
