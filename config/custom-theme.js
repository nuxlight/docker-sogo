(function() {
  'use strict';
  angular.module('SOGo.Common')
    .config(configure)

  configure.$inject = ['$mdThemingProvider'];
  function configure($mdThemingProvider) {
    var greyMap = $mdThemingProvider.extendPalette('grey', {
      '200': '616161',
      '300': '424242',
      '1000': '212121'
    });
    var greenCow = $mdThemingProvider.extendPalette('green', {
      '600': 'E5E5E5'
    });
    $mdThemingProvider.definePalette('frost-grey', greyMap);
    $mdThemingProvider.definePalette('green-cow', greenCow);
    $mdThemingProvider.theme('default')
    .primaryPalette('blue-grey', {
      'default': '700',
      'hue-1': '600',
      'hue-2': '500',
      'hue-3': '400'
    })
    .accentPalette('amber', {
      'default': '500',
      'hue-1': '300',
      'hue-2': '400',
      'hue-3': '500'
    })
    .backgroundPalette('grey');
    $mdThemingProvider.generateThemesOnDemand(false);
  }
})();