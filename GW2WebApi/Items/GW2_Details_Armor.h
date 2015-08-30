//
//  GW2_Details_Armor.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/10.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "JSONModel.h"

/*
 For armor, the details object contains the following properties:
 
 type (string) – The armor slot type.
    Boots – Feet slot
    Coat – Chest slot
    Gloves – Hands slot
    Helm – Helm slot
    HelmAquatic – Breathing apparatus slot
    Leggings – Legs slot
    Shoulders – Shoulders slot
 weight_class (string) – The weight class of the armor piece.
    Heavy – Heavy armor
    Medium – Medium armor
    Light – Light armor
    Clothing – Town clothing
 defense (number) – The defense value of the armor piece.
 infusion_slots (array of objects) – Infusion slots of the armor piece (see below).
 infix_upgrade (object, optional)  – The infix upgrade object (see below).
 suffix_item_id (number, optional) – The suffix item id. This is usually a rune.
 secondary_suffix_item_id (string) – The secondary suffix item id. Equals to an empty string for all currently discovered items.
 */

#pragma mark - Armor
@interface GW2_Details_Armor : JSONModel

/** Boots , Coat , Gloves , Helm , HelmAquatic , Legging , Shoulders */
@property (nonatomic , strong) NSString *type;
/** Heavy , Medium , Light , Clothing */
@property (nonatomic , strong) NSString *weight_class;
/** The defense value of the armor piece */
@property (nonatomic) NSInteger defense;
/** Infusion slots of the armor piece */
@property (nonatomic , strong) NSArray *infusion_slots;
@property (nonatomic , strong) NSString *infix_upgrade;
@property (nonatomic , strong) NSNumber *suffix_item_id;
@property (nonatomic , strong) NSString *secondary_suffix_item_id;

/*
 例子：
 
 {
 "name":"Feathered Boots",
 "description":"",
 "type":"Armor",
 "level":80,
 "rarity":"Masterwork",
 "vendor_value":80,
 "default_skin":164,
 "game_types":["Activity",
               "Dungeon",
               "Pve",
               "Wvw"],
 "flags":["AccountBound",
          "SoulBindOnUse"],
 "restrictions":[],
 "id":11111,
 "icon":"https://render.guildwars2.com/file/117D0308052D5F72F8C5EF9D69CFFF5B060CC2EC/61466.png",
 "details":{"type":"Boots",
            "weight_class":"Light",
            "defense":109,
            "infusion_slots":[],
            "secondary_suffix_item_id":""}
 }
 
 */

@end











