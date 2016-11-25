(function() {

     
               function Image($rootScope) {

                                               var Image = { 
                                                            logo: "https://s3-us-west-2.amazonaws.com/pics120/migtech+store/main_categories/index/A-Many-CellPhones.jpg", 
                                                            logoN: "https://s3-us-west-2.amazonaws.com/pics120/migtech+store/main_categories/index/logot.png"
                                                           };
                                                   
                                                    return Image;
                                            }

                 angular.module('myapp').factory('Image', ['$rootScope',Image]);
    
            })(); 