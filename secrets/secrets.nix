/*
  This should not be imported into the NixOS configuration.
*/

let
  # TODO: add MPI, IST, and Github PKs ?

  dsa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFlwjNfSabemz2ykeqDTwhgvV3Zw55NXSclZQb5K6Rga";
  users = [ dsa ];

  shanonSys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPJDyIr/FSz1cJdcoW69R+NrWzwGK/+3gJpqD1t8L2zE";
  liskovSys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKzxQgondgEYcLpcPdJLrTdNgZ2gznOHCAxMdaceTUT1";
  brouwerSys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAxV1yYlH1U/MuSyc+jeXD3VDAZlTmVwJOsqL3LKOvFT";

  systems = [ shanonSys liskovSys brouwerSys ];
in
{
  # NOTE: the convention followed is to encrypt with the user that edits and the systems that deploys

  "docker-registry".publicKeys = [ dsa ];

  "freshrssPwd.age".publicKeys = [ brouwerSys dsa ];
  "freshrssDbPwd.age".publicKeys = [ brouwerSys dsa ];
}

