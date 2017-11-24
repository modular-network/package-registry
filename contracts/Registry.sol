pragma solidity ^0.4.19;

contract Registry {
  
  struct Package {
    string name;
    string version;
    string uri;
  }

  event NewPackagePublished(string name, string version, string uri);

  function Registry {}

  function getByVersion(string _version) {}
  
  function publish(string _name, string _version, string _uri) {
    
    NewPackagePublished(_name, _version, _uri)
  }
}