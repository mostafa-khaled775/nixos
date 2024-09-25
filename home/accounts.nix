{ userName, ... }:
{
  accounts.email.accounts.main = {
    inherit userName;
    address = "mostafa.khaled.5422@gmail.com";
    primary = true;
  };
}
