#include "player.h"

uint8_t player_noclip = 0;

uint8_t player_update(
    Player *p,
    uint8_t joy,
    const uint8_t *map,
    uint16_t map_w,
    uint16_t map_h
) NONBANKED {
    if (p->dead) return 1;

    // Apply gravity
    if (!p->on_ground) {
        p->vel_y += GRAVITY;
        if (p->vel_y > MAX_FALL_SPEED) p->vel_y = MAX_FALL_SPEED;
    }

    // Noclip handling
    if (player_noclip) {
        if (joy & J_A) p->vel_y = JUMP_FORCE;
        p->world_y += (int8_t)(p->vel_y >> 4);
        return 0;
    }

    // Normal Physics: Jump input
    if ((joy & J_A) && p->on_ground) {
        p->vel_y = JUMP_FORCE;
        p->on_ground = 0;
    }

    // Calculate vertical movement
    int8_t pixels = (int8_t)(p->vel_y >> 4);
    int16_t ny = p->world_y + pixels;
    p->on_ground = 0;

    // Vertical Collision
    if (pixels >= 0) { // Falling or standing
        uint8_t cl = col_at(p->world_x + 2, ny + PLAYER_SIZE, map, map_w, map_h);
        uint8_t cr = col_at(p->world_x + PLAYER_SIZE - 2, ny + PLAYER_SIZE, map, map_w, map_h);
        if (IS_SOLID(cl) || IS_SOLID(cr)) {
            p->world_y   = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
            p->vel_y     = 0;
            p->on_ground = 1;
        } else {
            p->world_y = ny;
            // Stick to ground logic: if 1px below is solid, stay on ground
            uint8_t gl = col_at(p->world_x + 2, ny + PLAYER_SIZE + 1, map, map_w, map_h);
            uint8_t gr = col_at(p->world_x + PLAYER_SIZE - 2, ny + PLAYER_SIZE + 1, map, map_w, map_h);
            if (IS_SOLID(gl) || IS_SOLID(gr)) {
                p->on_ground = 1;
                p->vel_y = 0;
            } else {
                p->on_ground = 0;
            }
        }
    } else { // Jumping (pixels < 0)
        uint8_t cl = col_at(p->world_x + 2, ny, map, map_w, map_h);
        uint8_t cr = col_at(p->world_x + PLAYER_SIZE - 2, ny, map, map_w, map_h);
        if (IS_SOLID(cl) || IS_SOLID(cr)) {
            p->world_y = ((ny >> 4) + 1) << 4;
            p->vel_y   = 0;
        } else {
            p->world_y = ny;
        }
        p->on_ground = 0;
    }

    // Combined Hazard & Frontal Wall Detection
    uint8_t head = col_at(p->world_x + PLAYER_SIZE, p->world_y + 4, map, map_w, map_h);
    uint8_t foot = col_at(p->world_x + PLAYER_SIZE, p->world_y + PLAYER_SIZE - 4, map, map_w, map_h);

    // Orbs and Pads logic: Yellow Pad triggers automatically, Yellow Orb triggers on A press
    uint8_t mid = col_at(p->world_x + 8, p->world_y + 8, map, map_w, map_h);
    if (IS_PAD(mid) || IS_PAD(head) || IS_PAD(foot)) {
        p->vel_y = PAD_JUMP_FORCE;
        p->on_ground = 0;
    } else if ((joy & J_A) && (IS_ORB(mid) || IS_ORB(head) || IS_ORB(foot))) {
        p->vel_y = JUMP_FORCE;
        p->on_ground = 0;
    }

    // Death logic: Check if the front is hitting a solid wall or a hazard
    if (IS_HAZARD(head) || IS_HAZARD(foot) || IS_SOLID(head) || IS_SOLID(foot)) {
        p->dead = 1;
        return 1;
    }

    // Animation: Rotate while in air (cycle 24 frames, 2 frames per step)
    if (p->on_ground) {
        p->anim_timer = 0;
        p->anim_frame = 0;
    } else {
        p->anim_timer++;
        p->anim_frame = (p->anim_timer >> 1) % 24;
    }

    // Out of bounds (falling off screen)
    if (p->world_y > (int16_t)((uint16_t)map_h << 4)) {
        p->dead = 1;
        return 1;
    }

    return 0;
}
