#include "player.h"

uint8_t player_update(
    Player *p,
    uint8_t joy,
    const uint8_t *map,
    uint16_t map_w,
    uint16_t map_h
) NONBANKED {
    if (p->dead) return 1;

    if (!p->on_ground) {
        p->vel_y += GRAVITY;
        if (p->vel_y > MAX_FALL_SPEED) p->vel_y = MAX_FALL_SPEED;
    }

    if ((joy & J_A) && p->on_ground) {
        p->vel_y = JUMP_FORCE;
        p->on_ground = 0;
    }

    int8_t pixels = (int8_t)(p->vel_y >> 4);
    int8_t step   = (pixels >= 0) ? 1 : -1;
    int8_t steps  = (pixels >= 0) ? pixels : -pixels;
    if (steps > 16) steps = 16;

    p->on_ground = 0;

    for (int8_t i = 0; i < steps; i++) {
        int16_t ny = p->world_y + step;

        if (step > 0) {
            uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
            uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
            if (IS_SOLID(cl) || IS_SOLID(cr)) {
                p->world_y   = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
                p->vel_y     = 0;
                p->on_ground = 1;
                break;
            }
        } else {
            uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
            uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny, map, map_w, map_h);
            if (IS_SOLID(cl) || IS_SOLID(cr)) {
                p->world_y = ((ny >> 4) + 1) << 4;
                p->vel_y   = 0;
                break;
            }
        }

        p->world_y = ny;
    }

    {
        uint16_t hx1 = p->world_x + PLAYER_HBOX;
        uint16_t hx2 = p->world_x + PLAYER_SIZE - PLAYER_HBOX;
        int16_t  hy1 = p->world_y + PLAYER_HBOX;
        int16_t  hy2 = p->world_y + PLAYER_SIZE - PLAYER_HBOX;

        if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
            IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
            IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
            IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
            p->dead = 1;
            return 1;
        }
    }

    {
        uint8_t cm_l = col_point(p->world_x,              p->world_y + 7, map, map_w, map_h);
        uint8_t cm_r = col_point(p->world_x + PLAYER_SIZE, p->world_y + 7, map, map_w, map_h);
        if (IS_SOLID(cm_l) || IS_SOLID(cm_r)) {
            p->dead = 1;
            return 1;
        }
    }

    if (p->world_y > (int16_t)((uint16_t)map_h << 4)) {
        p->dead = 1;
        return 1;
    }

    return 0;
}
