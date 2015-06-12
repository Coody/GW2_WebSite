//
//  GW2_WebApi_Items.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/10.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "WebApi.h"

#pragma mark - Result unit
@interface GW2_WebApi_Items_Result_Unit : NSObject

@property (nonatomic) NSInteger itemId;
@property (nonatomic , strong) NSString *name;
@property (nonatomic , strong) NSString *icon;
@property (nonatomic , strong) NSString *description;

/** 
 * @details - armor , back , bag , consumable , container , craftingMaterial , gathering , gizmo , miniPet , tool , trait , trinket , trophy , upgradeComponent , weapon
 */
@property (nonatomic , strong) NSString *type;

/**
 * @details - Junk , basic , fine , masterwork , rare , exotic , ascended , legendary
 */
@property (nonatomic , strong) NSString *rarity;

@property (nonatomic) NSInteger level;
@property (nonatomic) NSInteger vendor_value;
@property (nonatomic) NSInteger default_skin;

/** 
 * @details - AccountBindOnUse , AccountBound , HideSuffix , MonsterOnly , NoMysticForge , NoSalvage , NoSell , NotUpgradeable , NoUnderwater , SoulbindOnAcquire , SoulBindOnUse , Unique
 */
@property (nonatomic , strong) NSArray *flags;


/*
 For each requested item id, an object with the following properties is returned:
 
 id (number) – The item id.
 name (string) – The item name.
 icon (string) – The full icon URL.
 description (string, optional) – The item description.
 type (string) – The item type (see below). Possible values:
 rarity (string) – The item rarity. Possible values:
 level (number) – The required level.
 vendor_value (number) – The value in coins when selling to a vendor. (Can be non-zero even when the item has the NoSell flag.)
 default_skin (number, optional) – The default skin id.
 flags (array of strings) – Flags applying to the item. Possible values:
 game_types (array of strings) – The game types in which the item is usable. At least one game type is specified. Possible values:
    Activity – Usable in activities
    Dungeon – Usable in dungeons
    Pve – Usable in general PvE
    Pvp – Usable in PvP
    PvpLobby – Usable in the Heart of the Mists
    Wvw – Usable in World vs. World
 restrictions (array of strings) – Restrictions applied to the item. Possible values:
    Asura
    Charr
    Human
    Norn
    Sylvari
    Guardian
    Mesmer
    Ranger
    Warrior
 details (object, optional) – Additional item details if applicable, depending on the item type (see below).
 */

@end

#pragma mark - Result
@interface GW2_WebApi_Items_Result : NSObject

@property (nonatomic , strong) NSMutableDictionary *itemIdDic;

@end

@interface GW2_WebApi_Items : WebApi < WebApi_Policy >


@end
