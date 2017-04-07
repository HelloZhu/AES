# AES

[![LICENSE](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/dd2333/AES/blob/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/AES128.svg?style=flat)](http://cocoapods.org/?q=AES128)&nbsp;
[![SUPPORT](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://en.wikipedia.org/wiki/IOS_7)&nbsp;
[![BLOG](https://img.shields.io/badge/blog-www.dd2333.com-orange.svg?style=flat)](http://www.dd2333.com)&nbsp;

  AES 128 ECB PKCS7Padding.<br />

Usage
-----------------------------------

### Cocoapods import:
* AES is available on CocoaPods. Just add the following to your project Podfile:<br />

  ```pod 'AES128'```

* Use by including the following import:<br />
```#import <AESCrypt.h>```

### Manual import：
* Drag All files in the AESCrypt folder to project<br />
* Use by including the following import:<br />
```#import "AESCrypt.h"```

### Encrypt / Decrypt

    NSString *str = @"hello world";
    NSString *str = @"hello world";
    NSString *passwd = @"1234567890abcdef";

    NSString *ciphertext = [AESCrypt encrypt:str password:passwd];
    NSString *plaintext = [AESCrypt decrypt:ciphertext password:passwd];

Java source code
-----------------------------------
    import javax.crypto.Cipher;
    import javax.crypto.spec.SecretKeySpec;

    import org.apache.commons.codec.binary.Base64;

    public class AES {

        // 加密
        public static String Encrypt(String sSrc, String sKey) throws Exception {
            if (sKey == null) {
                System.out.print("Key为空null");
                return null;
            }
            // 判断Key是否为16位
            if (sKey.length() != 16) {
                System.out.print("Key长度不是16位");
                return null;
            }
            byte[] raw = sKey.getBytes("utf-8");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");//"算法/模式/补码方式"
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
            byte[] encrypted = cipher.doFinal(sSrc.getBytes("utf-8"));

            return new Base64().encodeToString(encrypted);
        }

        // 解密
        public static String Decrypt(String sSrc, String sKey) throws Exception {
            try {
                // 判断Key是否正确
                if (sKey == null) {
                    System.out.print("Key为空null");
                    return null;
                }
                // 判断Key是否为16位
                if (sKey.length() != 16) {
                    System.out.print("Key长度不是16位");
                    return null;
                }
                byte[] raw = sKey.getBytes("utf-8");
                SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
                Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
                cipher.init(Cipher.DECRYPT_MODE, skeySpec);
                byte[] encrypted1 = new Base64().decode(sSrc);
                try {
                    byte[] original = cipher.doFinal(encrypted1);
                    String originalString = new String(original,"utf-8");
                    return originalString;
                } catch (Exception e) {
                    System.out.println(e.toString());
                    return null;
                }
            } catch (Exception ex) {
                System.out.println(ex.toString());
                return null;
            }
        }
    }

