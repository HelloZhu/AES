[![github](https://github.com/dd2333/DDPhotoAlbum/blob/master/dd2333.png "dd2333")](http://www.dd2333.com)

AES
===================================
  AES 128 ECB PKCS7Padding.<br />

Requirements
-----------------------------------
* ARC<br />

Usage
-----------------------------------

### Cocoapods import:
* Pop is available on CocoaPods. Just add the following to your project Podfile:<br />

  ```pod 'AES', '~> 1.0.0'```

* Use by including the following import:<br />
```#import <AESCrypt.h>```

### Manual import：
* Drag All files in the AESCrypt folder to project<br />
* Use by including the following import:<br />
```#import "AESCrypt.h"```

### Open the Album
    NSString *str = @"hello world";
    NSString *passwd = @"1234567890abcdef";
    
    NSString *ciphertext = [AESCrypt encrypt:str password:passwd];
    NSString *plaintext = [AESCrypt decrypt:ciphertext password:passwd];

License
-----------------------------------
  AES is released under the MIT license.<br />
