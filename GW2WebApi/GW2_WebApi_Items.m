//
//  GW2_WebApi_Items.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/10.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

/*
 send: https://api.guildwars2.com/v2/items/28445
 receive:
 {"name":"火焰强力软木长弓",
  "description":"",
  "type":"Weapon",
  "level":44,
  "rarity":"Masterwork",
  "vendor_value":120,
  "default_skin":3942,
  "game_types":["Activity",
                "Wvw",
                "Dungeon",
                "Pve"],
  "flags":["Activity",
           "Wvw",
           "Dungeon",
           "Pve",
           "SoulBindOnUse"],
  "restrictions":[],
  "id":28445,
  "icon":"https://render.guildwars2.com/file/C6110F52DF5AFE0F00A56F9E143E9732176DDDE9/65015.png",
  "details":{"type":"LongBow",
             "damage_type":"Physical",
             "min_power":385,
             "max_power":452,
             "defense":0,
             "infusion_slots":[],
             "infix_upgrade":{"attributes":[{"attribute":"Power",
                                             "modifier":85},
                                            {"attribute":"Precision",
                                             "modifier":61}]
                              },
             "suffix_item_id":24547,"secondary_suffix_item_id":""}}
 */

#import "GW2_WebApi_Items.h"


@implementation GW2_WebApi_Items_Result_Unit

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"itemId",
                                                       @"description": @"gw2_description"
                                                       }];
}

@end


@implementation GW2_WebApi_Items_Result

@end

/** 取得 itemID */
@implementation GW2_WebApi_Items

+(NSString *)uri{
    return @"items";
}

+(GW2_WebApi_Items_Result *)parserResponse:(id)responseData{
    GW2_WebApi_Items_Result *result = [[GW2_WebApi_Items_Result alloc] init];
    result.itemId = responseData;
    return result;
}

@end
