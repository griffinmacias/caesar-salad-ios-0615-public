//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here


-(NSString *)encodeWithMessage:(NSString *)message andOffset:(NSInteger)key
{
    
    NSArray *characterInPlainText = [self arrayWithCharactersOfString:message];
    
    NSMutableString *cipherText = [[NSMutableString alloc] init];
    
    for (NSString *character in characterInPlainText) {
        NSString *shiftedCharacter = [self shiftCharacter:character byOffset:key];
        
        [cipherText appendString:shiftedCharacter];
    }
    
    return cipherText;
}

- (NSString *)shiftCharacter:(NSString *)characterString
                    byOffset:(NSInteger)offset

{
    unichar asciiCode = [characterString characterAtIndex:0];
    
    
    NSInteger reducedOffset = offset % 26;
    
    BOOL isUppercase = asciiCode >= 65 && asciiCode <= 90;
    BOOL isLowercase = asciiCode >= 97 && asciiCode <= 122;
    
    if (isLowercase || isUppercase) {
        unichar shiftedAsciiCode = asciiCode + reducedOffset;
        
        if (isLowercase && shiftedAsciiCode > 122) {
            shiftedAsciiCode -= 26;
        } else if (isUppercase && shiftedAsciiCode > 90)
        {
            shiftedAsciiCode -= 26;
        }
        
        return [NSString stringWithFormat:@"%C", shiftedAsciiCode];
    }
    return characterString;
}

- (NSArray *)arrayWithCharactersOfString:(NSString *)string
{
    
    NSMutableArray *letters = [NSMutableArray array];
    for (NSUInteger i = 0; i < string.length; i++) {
        
        NSString *ithCharacter = [string substringWithRange:NSMakeRange(i, 1)];
        
        [letters addObject:ithCharacter];
}
    
    return letters;
}






- (NSString *)shiftCharactertoDecode:(NSString *)characterStringDecode
                    byOffset:(NSInteger)decodeOffset

{
    unichar asciiCode = [characterStringDecode characterAtIndex:0];
    
    
    NSInteger reducedOffset = decodeOffset % 26;
    
    BOOL isUppercase = asciiCode >= 65 && asciiCode <= 90;
    BOOL isLowercase = asciiCode >= 97 && asciiCode <= 122;
    
    if (isLowercase || isUppercase) {
        unichar shiftedAsciiCode = asciiCode - reducedOffset;
        
        if (isLowercase && shiftedAsciiCode <= 96) {
            shiftedAsciiCode += 26;
        }
        
        if (isLowercase && shiftedAsciiCode > 122) {
            shiftedAsciiCode += 26;
            
            
        } else if (isUppercase && shiftedAsciiCode > 90)
        {
            shiftedAsciiCode += 26;
        } else if (isUppercase && shiftedAsciiCode == 64)
        {
            shiftedAsciiCode += 26;
        }
        
        return [NSString stringWithFormat:@"%C", shiftedAsciiCode];
    }
    return characterStringDecode;
}













-(NSString *)decodeWithMessage:(NSString *)encodedMessage
                     andOffset:(NSInteger)key
{
    NSArray *characterInPlainText = [self arrayWithCharactersOfString:encodedMessage];
    
    NSMutableString *cipherText = [[NSMutableString alloc] init];
    
    for (NSString *character in characterInPlainText) {
        NSString *shiftedCharacter = [self shiftCharactertoDecode:character byOffset:key];
        
        [cipherText appendString:shiftedCharacter];
    }
    
    return cipherText;
}




















@end
